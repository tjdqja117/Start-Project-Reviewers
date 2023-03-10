package com.spring.view.board;


import java.io.File;
import java.io.IOException;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.JSONArray;
import org.json.JSONException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;

import com.spring.biz.CntHistory.CntHistoryVO;
import com.spring.biz.board.BoardService;

import com.spring.biz.board.MovieBoardVO;
import com.spring.biz.board.PageDTO;
import com.spring.biz.board.SearchCriteria;
import com.spring.biz.hashTag.HashTagService;
import com.spring.biz.hashTag.HashTagVO;
import com.spring.biz.movieGeners.MovieGenersService;
import com.spring.biz.movieGeners.MovieGenersVO;
import com.spring.biz.user.UserVO;
import com.spring.biz.userInfo.UserInfoVO;
import com.spring.biz.util.getContentInfo;
import com.spring.biz.util.getMovie_geners;



@Controller
@SessionAttributes({"User","UserInfo","board"})
public class BoardController {
	
	@Autowired
	private BoardService boardService;
	@Autowired
	private HashTagService hashtagService;
	@Autowired
	private MovieGenersService MovieGenersService;
	
	
	
	@RequestMapping(value="insertBoard.do")
	public String insertBoard(MovieGenersVO Gvo,MovieBoardVO vo,String basic,HashTagVO Hvo,@RequestParam(value="SC") String code, int moviecode	,
			@RequestParam(value="uploadFile") MultipartFile file, HttpSession session) throws IOException {			
		getMovie_geners getGeners = new getMovie_geners();
	
		int seq = boardService.getSeq();
		int num;
		if(code.equals("movie")) {
			num=1;
		}else if(code.equals("tv")){
			num=2;
		}else if(code.equals("webtoon")) {
			num=3;
		}else {
			num=4;
		}
		vo.setBoardnum(num);
		vo.setBseq(seq);
		Hvo.setBseq(seq);
		vo.setContentType(code);
		System.out.println(basic);
		try {
			if(basic != null) {
			JSONArray arr = new JSONArray(basic);
			String[] list = null;
			int len = arr.length();
			if(arr!=null) {
				list = new String[len];
				for(int i = 0;i<len;i++) {
					list[i] = arr.getJSONObject(i).getString("value");
					System.out.println(list[i]);
					Hvo.setTags(list[i]);
					hashtagService.insertHashTag(Hvo);
				}	
			}
			System.out.println(list);
			}
			
			
		} catch (JSONException e) {
			 e.printStackTrace();
			
		}
		
		List<String> list = getGeners.get_geners(code,moviecode);
		for(int i = 0;i<list.size();i++) {
			Gvo.setMovieGeners(list.get(i));
			if(MovieGenersService.validMovieGeners(Gvo) == null) {
				MovieGenersService.insertGeners(Gvo);
			}else {
				MovieGenersService.updateGeners(Gvo);
			}
		}

		System.out.println(file.isEmpty());
		System.out.println("??????");
		System.out.println(vo.getBseq());
		System.out.println(vo.getBoardnum());
		System.out.println(vo.getContent());
		System.out.println(vo.getTitle());
		System.out.println(vo.getNickname());
		System.out.println(vo.getUserId());
		System.out.println(vo.getContentType());
		System.out.println(vo.getMoviecode());
		
		// ????????? ?????????
		if(file.isEmpty() == false) {
			try {
				System.out.println(file);
				String filename = fileUpload(file, session);
				vo.setFilename(filename);
				System.out.println(vo.getFilename());
				
			} catch (Exception e) {
				e.printStackTrace();
				System.out.println("?????? ????????? ??????");
			}
		}else {
			vo.setFilename("2");
		}

		
		boardService.insertBoard(vo);
		return "redirect:getBoardList.do?boardnum=" + num;
	}
	
	// ????????? ?????? ?????????
	public String fileUpload(MultipartFile file, HttpSession session) throws Exception {


	    String originalFilename = file.getOriginalFilename();
	    UUID uuid = UUID.randomUUID();
	    String uploadFileName = uuid.toString() + "_" + originalFilename;

	    String basePath = "C:\\upload\\thumbnail";

	    File dir = new File(basePath);
	    if (!dir.exists()) {
	        dir.mkdirs();
	    }

	    String uploadPath = basePath + "/"+ uploadFileName;

	    File dest = new File(uploadPath);
	    System.out.println(uploadPath);
	    file.transferTo(dest);

	    return uploadFileName;
	}
			
	

	// ??? ??????
		@RequestMapping(value="updateBoard.do")
		public String updateBoard( MovieBoardVO vo,	@RequestParam(value="SC") String code,String basic,HashTagVO Hvo,SearchCriteria cri) {
			int num;
			if(code.equals("movie")) {
				num=1;
			}else if(code.equals("tv")){
				num=2;
			}else if(code.equals("webtoon")) {
				num=3;
			}else {
				num=4;
			}
			System.out.println(code);
			System.out.println(num);
			vo.setContentType(code);
			vo.setBoardnum(num);
			System.out.println(vo.getBseq());
			System.out.println("??? ?????? ??????");
//			logger.debug("[LOG] ??? ?????? ??????");
			if(basic != null) {
				try {
					Hvo.setBseq(vo.getBseq());
					System.out.println(vo.getBseq());
					JSONArray arr = new JSONArray(basic);
					String[] list = null;
					int len = arr.length();
					if(arr!=null) {
						list = new String[len];
						for(int i = 0;i<len;i++) {
							list[i] = arr.getJSONObject(i).getString("value");
							System.out.println(list[i]);
							Hvo.setTags(list[i]);
							hashtagService.updateHashTag(Hvo);
							System.out.println(1);
							hashtagService.insertHashTag(Hvo);
						}
					}
					System.out.println(list);
					}
				 catch (JSONException e) {
					 e.printStackTrace();
					
				}
				
				}
			
			
			boardService.updateBoard(vo);

//			System.out.println("query : " + cri.makeQuery());
			return "redirect:getBoardList.do?boardnum=" + num;
		}
	
	@RequestMapping(value="/getUpdate.do")
	public String getUpdate(MovieBoardVO vo, Model model,HashTagVO Hvo) throws ParseException {

		System.out.println("??? ???????????? ??????");
//		logger.debug("[LOG] ??? ?????? ?????? ??????");
		System.out.println(vo.getBseq());
		MovieBoardVO result = boardService.getBoard(vo);
		getContentInfo info = new getContentInfo();
		if(result.getMoviecode()!=0) {
			model.addAttribute("info",info.getjsonObjectInfo(result.getContentType(), result.getMoviecode()));	
		}
		List<String> hash = new ArrayList<String>();
		if(hashtagService.getHashTag(Hvo)!=null) {
			List<HashTagVO> list = hashtagService.getHashTag(Hvo);
			for(int i = 0;i<list.size();i++) {
				String str = list.get(i).getTags();
				
				hash.add(str);
			}
		}
		
		// ?????? ????????? ????????? ???????????? ?????? ???????????? ????????????.
		Hvo.setBseq(vo.getBseq());
		model.addAttribute("board",result );
		model.addAttribute("hashTag",hash);
		return "updateReview";
	}
	

	// ??? ??????
	@RequestMapping(value="deleteBoard.do")
	public String deleteBoard(MovieBoardVO vo, @RequestParam(value="deletenum") int num, Model model) {
		
		
		System.out.println("??? ?????? ??????");
		System.out.println(num);
//		logger.debug("[LOG] ??? ??????  ??????");
		boardService.deleteBoard(vo);
		
		
		return "redirect:getBoardList.do?boardnum=" + num;
	}
	
	// ?????? ?????? ?????? ??????
		@ModelAttribute("conditionMap")
		public Map<String, String> searchConditionMap() {
			Map<String, String> conditionMap = new HashMap<String, String>();
			conditionMap.put("??????", "TITLE");
			conditionMap.put("??????", "CONTENT");
			return conditionMap;
		}
	
		@RequestMapping("/insertboardgo.do")
		public String insertboardgo() {
			
			return "insertBoard";
		}


	// ??? ?????? ??????
	@RequestMapping(value="/getBoard.do")
	public String getBoard(MovieBoardVO vo, Model model, UserVO uvo,HttpServletRequest request, CntHistoryVO cvo,HashTagVO Hvo) {
		System.out.println("??? ?????? ?????? ??????");
		HttpSession session = request.getSession();
		MovieBoardVO result = boardService.getBoard(vo);
		getContentInfo info = new getContentInfo();
		if(result.getMoviecode()!=0) {
			model.addAttribute("info",info.getjsonObjectInfo(result.getContentType(), result.getMoviecode()));	
		}
		
		if((UserVO) session.getAttribute("User") != null) {			
			uvo = (UserVO) session.getAttribute("User");
			System.out.println(uvo.getUserId());
			System.out.println(cvo.getBseq());
			
			cvo.setUserId(uvo.getUserId());
			if(boardService.getCntBoard(cvo) == null) {
				boardService.insertCntHistory(cvo);
				boardService.updateCnt(vo);
			}
		}
		

	
		
//		logger.debug("[LOG] ??? ?????? ?????? ??????");
		
		// NULL Check
				if (vo.getSearchCondition() == null) {
					vo.setSearchCondition("TITLE");
				}
				if (vo.getSearchKeyword() == null) {
					vo.setSearchKeyword("");
				}
		
	
		// ?????? ????????? ????????? ???????????? ?????? ???????????? ????????????.
		Hvo.setBseq(vo.getBseq());
		model.addAttribute("hashTag", hashtagService.getHashTag(Hvo));
		model.addAttribute("board", boardService.getBoard(vo));
		
		
		return "getBoard";
	}

	// ??? ?????? ??????
	@RequestMapping(value="getBoardList.do")
	public String getBoardList(Model model,@RequestParam(value="boardnum") int num, MovieBoardVO vo, HashTagVO Hvo) {
		vo.setBoardnum(num);
		System.out.println(num);
		
		getContentInfo info = new getContentInfo();
		
		// NULL Check
				if (vo.getSearchCondition() == null) {
					vo.setSearchCondition("TITLE");
				}
				if (vo.getSearchKeyword() == null) {
					vo.setSearchKeyword("");
				}
				
				
				
				// Model ?????? ??????
				PageDTO pageMaker = new PageDTO(vo, boardService.getTotalPages(vo));
				
				List<MovieBoardVO> result = boardService.getBoardList(vo);
				
				for(int i = 0;i<result.size();i++) {
					Hvo.setBseq(result.get(i).getBseq());
					if(hashtagService.getHashTag(Hvo)!=null) {
						System.out.println(Hvo.getBseq());
					List<HashTagVO> hashList = hashtagService.getHashTag(Hvo);
					List<String> tempList = new ArrayList<String>();
					for(int x = 0;x<hashList.size();x++) {
						
						String temp = hashList.get(x).getTags();
						tempList.add(temp);
					}
					result.get(i).setTags(tempList);
					}
					
					if(result.get(i).getReviewPic() == null || num!=4) {
						int code = result.get(i).getMoviecode();
						System.out.println(code);
						String contentType= result.get(i).getContentType();
						System.out.println(contentType);
						String temp = info.getjsonObjectInfo(contentType, code).getPoster_path();
						System.out.println(temp);
						result.get(i).setReviewPic(temp);
						System.out.println(result.get(i).getReviewPic());
					}
					
				}
				model.addAttribute("pageMaker", pageMaker);	// Model ?????? ??????
				model.addAttribute("boardList", result);	// Model ?????? ??????
				model.addAttribute("boardnum", vo.getBoardnum());
				if(num == 4) {
					return "community";
				}else {
					return "movieReview";
					}
				
			}
	
	@RequestMapping(value="cs.do")
	public String faq() {
		return "faq-write-form";
	}
	
	
	
	
	
	@RequestMapping("/upload_ok.do")
	   public String upload(@RequestParam("file") MultipartFile file ,MovieBoardVO Ivo) {
	      String fileRealName = file.getOriginalFilename(); //???????????? ????????? ??? ?????? ?????????!
	      long size = file.getSize(); //?????? ?????????
	      
	      System.out.println("????????? : "  + fileRealName);
	      System.out.println("????????????(byte) : " + size);
	      //????????? ????????? ???????????? fileextension?????? .jsp????????????  ????????? ?????? ??????
	      String fileExtension = fileRealName.substring(fileRealName.lastIndexOf("."),fileRealName.length());
	      String uploadFolder = "D:\\Devspace\\SpringSpace\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\Reviewers3-1\\resources\\images";
	      
	      
	      /*
	        ?????? ???????????? ???????????? ????????? ????????? ?????? ????????? ?????? ?????? ???????????? 
	        ????????? ?????? ???????????? ?????? ????????? ????????? ???????????? ??? ????????????. 
	        ???????????? ???????????? ?????? ??????????????? ?????? ????????? ?????? ????????????.(???????????? ???????????? ??????)
	        ????????? ?????? ????????? ?????? db??? ????????? ????????? ???????????? ????????? ????????? ??????.
	       */
	      
	      UUID uuid = UUID.randomUUID();
	      System.out.println(uuid.toString());
	      String[] uuids = uuid.toString().split("-");
	      
	      String uniqueName = uuids[0];
	      System.out.println("????????? ???????????????" + uniqueName);
	      System.out.println("????????????" + fileExtension);
	      System.out.println(uniqueName+fileExtension);
	      
	      
	      // File saveFile = new File(uploadFolder+"\\"+fileRealName); uuid ?????? ???
	      
	      File saveFile = new File(uploadFolder+"\\"+uniqueName + fileExtension);  // ?????? ???
	      try {
	         file.transferTo(saveFile); // ?????? ?????? ???????????????(filewriter ????????? ????????? ????????? ???????????????.)
	      } catch (IllegalStateException e) {
	         e.printStackTrace();
	      } catch (IOException e) {
	         e.printStackTrace();
	      }
	      return "fileupload/upload_ok";
	   }
	}


