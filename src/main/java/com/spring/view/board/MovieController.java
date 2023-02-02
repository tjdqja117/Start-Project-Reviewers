package com.spring.view.board;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.Date;
import java.util.List;
import java.util.Locale;

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
	public String Detail(@RequestParam(value = "type") String contents_type,Model mode,@RequestParam(value = "id") int contents_num,ContentsDetailVO vo) {
		getContentInfo info = new getContentInfo();
		
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
	        resultlist.add(str); 
	    } 
	    //뽑은 후 json파싱 
	    for(String str : resultlist) {
	        jsonObj = new JSONObject();
	        jsonObj.put("data", str);
	        arrayObj.add(jsonObj); 
	        
	    } 
        
	    }else {
    	List<MovieBoardVO> result =	boardService.getSearchReview(vo);	
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
