package com.spring.view.board;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.spring.biz.board.BoardService;
import com.spring.biz.board.MovieBoardVO;
import com.spring.biz.board.PageDTO;
import com.spring.biz.board.SearchCriteria;
import com.spring.biz.movie.ContentsDetailVO;
import com.spring.biz.movie.ContentsVO;
import com.spring.biz.movie.SearchVO;
import com.spring.biz.util.getContentInfo;
import com.spring.biz.util.getInfoUtil;
import com.spring.biz.util.getSearchUtil;


@Controller
public class MovieController {
	
	@Autowired
	private BoardService boardService;
	
	
	public class SortByDate implements Comparator<ContentsVO> {
		@Override
		public int compare(ContentsVO o1, ContentsVO o2) {
			Date first = o1.getRelease_date();
			Date second = o2.getRelease_date();
			return second.compareTo(first);
		}
	}
	
	public class SortByLike implements Comparator<MovieBoardVO> {
		@Override
		public int compare(MovieBoardVO l1, MovieBoardVO l2) {
			Integer first = l1.getLike_num();
			Integer second = l2.getLike_num();
			return second.compareTo(first);
		}
	}
	
	public class SortByVote implements Comparator<SearchVO> {
		@Override
		public int compare(SearchVO o1, SearchVO o2) {
			Float first = o1.getPopularity();
			Float second = o2.getPopularity();
			return second.compareTo(first);
		}
	}
	
	@RequestMapping({"/", "testMovie.do"})
	public String main(@RequestParam(value = "type", defaultValue = "movie") String contents_type, Model model, SearchCriteria cri) {

		// 영화 정보를 불러오는 클래스 (이전 글에서 설명한 데이터 파싱 전용 클래스)
		getInfoUtil util = new getInfoUtil();
        
		List<ContentsVO> release_date = util.getInfoList(contents_type);
 
		// List에 담긴 ContentsVO를 날짜 내림차순으로 정렬
//		Collections.sort(release_date,new SortByDate());

		
		model.addAttribute("release_date", release_date); // 최신 공개 순
		model.addAttribute("type", contents_type);
		
		
		
		if (cri.getSearchCondition() == null) {
			cri.setSearchCondition("TITLE");
		}
		if (cri.getSearchKeyword() == null) {
			cri.setSearchKeyword("");
		}
		
//		System.out.println("TotalPage : " + pageMaker.getTotalPage());
//		System.out.println("StartPage : " + pageMaker.getStartPage());
//		System.out.println("EndPage : " + pageMaker.getEndPage());
		
		model.addAttribute("boardList", boardService.getBoardListMain(cri));	// Model 정보 저장
//		model.addAttribute("boardList", boardService.getBoardList(vo));	// Model 정보 저장
		
		return "index";
	}
	
	@RequestMapping(value = "ContentsDetail.do")
	public String Detail(@RequestParam(value = "type") String contents_type,Model mode,@RequestParam(value = "id") int contents_num) {
		getContentInfo info = new getContentInfo();
		
		ContentsDetailVO contents = info.getInfoDetail(contents_type, contents_num);
		List<ContentsDetailVO> reco = new ArrayList<ContentsDetailVO>();
		
		// 임시로 사용할 List 생성
				List<ContentsDetailVO> temp = new ArrayList<ContentsDetailVO>();
				// 일단 모든 컨텐츠를 불러와서 저장
				temp = info.getInfoList(contents_type);

				for (int i = 0; i < temp.size(); i++) {
					List<Integer> list1 = new ArrayList<Integer>(temp.get(i).getGenress()); // 모든 컨텐츠들의 장르를 for문을 돌면서 계속 바꿔주면서 넣어줌
					List<Integer> list2 = new ArrayList<Integer>(contents.getGenress()); // 상세 페이지에 출력할 컨텐츠의 장르

					/* 즉, 하나의 컨텐츠의 장르와 여러개의 컨텐츠의 장르를 루프를 통해 매번 서로 비교하는것 */

					// 등록되어 있는 장르가 1개일 경우
					if (list2.size() == 1) {
						list1.retainAll(list2);
						if (list1.size() == 1) {
							ContentsDetailVO vo = new ContentsDetailVO();
							vo = temp.get(i);
							reco.add(vo);
						}
						// 등록되어 있는 장르가 2개일 경우
					} else if (list2.size() == 2) {
						list1.retainAll(list2);
						if (list1.size() == 2) {
							ContentsDetailVO vo = new ContentsDetailVO();
							vo = temp.get(i);
							reco.add(vo);
						}
					} else {
						list1.retainAll(list2);
						// 적어도 겹치는 장르가 세개 이상인 경우만 출력
						if (list1.size() >= 3) {
							ContentsDetailVO vo = new ContentsDetailVO();
							vo = temp.get(i);
							reco.add(vo);
						}
					}
				}
		
		mode.addAttribute("reco", reco);
		mode.addAttribute("image",info.getImages(contents_type, contents_num));
		mode.addAttribute("cast",info.getCredits(contents_type, contents_num, "cast"));
		mode.addAttribute("crew",info.getCredits(contents_type, contents_num, "crew"));
		mode.addAttribute("info",info.getjsonObjectInfo(contents_type, contents_num));
		return "testDetail";
	}
	
	@RequestMapping(value = "search.do")
	   public String searsch(@RequestParam(value = "SC")String searchCondition,Model model,String searchKeyword, MovieBoardVO vo) {
	    if(searchCondition.equals("review"))  {
	    	
	    	List<MovieBoardVO> result = boardService.getSearchReview(vo);
	    	Collections.sort(result, new SortByLike());
	    	model.addAttribute("result", result);
	    	return "searchReviewTest";
	    	
	    }else {
	    	
		getSearchUtil search = new getSearchUtil();
	         List<SearchVO> result = search.getInfoList(searchCondition, searchKeyword);
	         Collections.sort(result, new SortByVote());
	         model.addAttribute("result", result);
	    }
	      return "searchTest";
	   }
	
	
	
	
	
	public JSONArray autoSearch(String searchCondition,String searchKeyword, MovieBoardVO vo) throws IOException {
	      
	      int size=0;
	       
	       JSONArray arrayObj = new JSONArray();
	       JSONObject jsonObj = null; 
	       ArrayList<String> resultlist = new ArrayList<String>();
	       HashMap<String, Integer> resulthash = new HashMap<String, Integer>();
	       System.out.println(searchCondition);
	       System.out.println(searchKeyword);
	    
	       
	       if(searchCondition.equals("movie") || searchCondition.equals("tv")) {
	      getSearchUtil search = new getSearchUtil();
	        List<SearchVO> result = search.getInfoList(searchCondition ,searchKeyword);
	       
	        Collections.sort(result, new SortByVote());
	        
	        if(result.size()>=10) {
	           size = 10;
	           
	        }else {
	           size=result.size();
	        }
	        
	       for(int i=0;i<size;i++) { 
	           String str = result.get(i).getTitle();
	           int num = result.get(i).getContents_num();
	           resulthash.put(str,num); 
	       } 
	       
	       Iterator<HashMap.Entry<String, Integer>> itr = resulthash.entrySet().iterator();
	       while(itr.hasNext()) {
	          
	          Map.Entry<String, Integer> entry = itr.next();
	          jsonObj = new JSONObject();
	           jsonObj.put("data", entry.getKey());
	           jsonObj.put("value", entry.getValue());      
	           arrayObj.add(jsonObj); 
	       }
	       //뽑은 후 json파싱 
//	       for(String str : resulthash.) {
//	           jsonObj = new JSONObject();
//	           jsonObj.put("data", str);
//	           arrayObj.add(jsonObj); 
//	           
//	       } 
	        
	       }else {
	       List<MovieBoardVO> result =   boardService.getSearchReview(vo);   
	       Collections.sort(result, new SortByLike());
	       
	        if(result.size()>=10) {
	           size = 10;
	           
	        }else {
	           size=result.size();
	        }
	        
	       for(int i=0;i<size;i++) { 
	           String str = result.get(i).getTitle();
	           resultlist.add(str); 
	       } 
	       //뽑은 후 json파싱 
	       for(String str : resultlist) {
	           jsonObj = new JSONObject();
	           jsonObj.put("data", str);
	           arrayObj.add(jsonObj); 
	           
	       } 
	       }
	    
	        
	     
	   

	       System.out.println(arrayObj);
	       return arrayObj;
	    
	   }
	
	
		@ResponseBody
		@RequestMapping(value = "autoSearch.do", method= {RequestMethod.GET},	produces = "application/json; charset=utf8")
		public void autoSearch(Model model,HttpServletRequest request, HttpServletResponse response, @RequestParam(value = "SC")String searchCondition,String searchKeyword, MovieBoardVO vo) throws IOException {
		                   
		String searchValue = request.getParameter("searchKeyword"); 
		String searchCondtion = request.getParameter("SC");
		JSONArray arrayObj = MovieController.this.autoSearch(searchCondtion, searchValue, vo);	
		System.out.println(arrayObj);
		response.setCharacterEncoding("UTF-8");
		PrintWriter pw = response.getWriter(); 
		pw.print(arrayObj); 
		pw.flush(); 
		pw.close();
}
	

		
		
		
}
