package com.spring.view.board;


import java.io.File;
import java.io.IOException;
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
import com.spring.biz.user.UserVO;
import com.spring.biz.userInfo.UserInfoVO;



@Controller
@SessionAttributes({"User","UserInfo"})
public class BoardController {
	
	@Autowired
	private BoardService boardService;
	@Autowired
	private HashTagService hashtagService;
	
	
	// 글 등록
		@RequestMapping(value="insertBoard.do")
		public String insertBoard(MovieBoardVO vo,String basic,HashTagVO Hvo,@RequestParam(value="SC") String code) throws IOException {
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
						Hvo.setHashtag(list[i]);
						hashtagService.insertHashTag(Hvo);
					}
				}
				System.out.println(list);
				}
			} catch (JSONException e) {
				 e.printStackTrace();
				
			}
			System.out.println(vo.getBseq());
			System.out.println(vo.getBoardnum());
			System.out.println(vo.getContent());
			System.out.println(vo.getTitle());
			System.out.println(vo.getNickname());
			System.out.println(vo.getUserId());

			
			boardService.insertBoard(vo);
			return "index";
		}

	// 글 수정
	@RequestMapping(value="updateBoard.do")
	public String updateBoard(@ModelAttribute("board") MovieBoardVO vo, 
			@ModelAttribute("cri") SearchCriteria cri) {

		System.out.println("글 수정 처리");
//		logger.debug("[LOG] 글 수정 처리");

		boardService.updateBoard(vo);

//		System.out.println("query : " + cri.makeQuery());
		return "redirect:getBoardList.do"+ cri.makeQuery();
	}

	// 글 삭제
	@RequestMapping(value="deleteBoard.do")
	public String deleteBoard(@ModelAttribute("board") MovieBoardVO vo, 
			@ModelAttribute("cri") SearchCriteria cri) {

		System.out.println("글 삭제 처리");
//		logger.debug("[LOG] 글 삭제  처리");
		boardService.deleteBoard(vo);
		
		return "redirect:getBoardList.do"+ cri.makeQuery();
	}
	
	// 검색 조건 목록 설정
		@ModelAttribute("conditionMap")
		public Map<String, String> searchConditionMap() {
			Map<String, String> conditionMap = new HashMap<String, String>();
			conditionMap.put("제목", "TITLE");
			conditionMap.put("내용", "CONTENT");
			return conditionMap;
		}
	
		@RequestMapping("/insertboardgo.do")
		public String insertboardgo() {
			
			return "insertBoard";
		}


	// 글 상세 조회
	@RequestMapping(value="/getBoard.do")
	public String getBoard(MovieBoardVO vo, Model model, UserVO uvo,HttpServletRequest request, CntHistoryVO cvo) {
		System.out.println("글 상세 조회 처리");
		HttpSession session = request.getSession();
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

	
		
//		logger.debug("[LOG] 글 상세 조회 처리");
		
		// NULL Check
				if (vo.getSearchCondition() == null) {
					vo.setSearchCondition("TITLE");
				}
				if (vo.getSearchKeyword() == null) {
					vo.setSearchKeyword("");
				}
		
	
		// 검색 결과를 세션에 저장하고 목록 화면으로 이동한다.
		model.addAttribute("board", boardService.getBoard(vo));
		
		
		return "getBoard";
	}

	// 글 목록 검색
	@RequestMapping(value="getBoardList.do")
	public String getBoardList(Model model,@RequestParam(value="boardnum") int num, MovieBoardVO vo) {
		vo.setBoardnum(num);
		System.out.println(num);
		
		
		// NULL Check
				if (vo.getSearchCondition() == null) {
					vo.setSearchCondition("TITLE");
				}
				if (vo.getSearchKeyword() == null) {
					vo.setSearchKeyword("");
				}
				
				// Model 정보 저장
				PageDTO pageMaker = new PageDTO(vo, boardService.getTotalPages(vo));
				
				model.addAttribute("pageMaker", pageMaker);	// Model 정보 저장
				model.addAttribute("boardList", boardService.getBoardList(vo));	// Model 정보 저장
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
	      String fileRealName = file.getOriginalFilename(); //파일명을 얻어낼 수 있는 메서드!
	      long size = file.getSize(); //파일 사이즈
	      
	      System.out.println("파일명 : "  + fileRealName);
	      System.out.println("용량크기(byte) : " + size);
	      //서버에 저장할 파일이름 fileextension으로 .jsp이런식의  확장자 명을 구함
	      String fileExtension = fileRealName.substring(fileRealName.lastIndexOf("."),fileRealName.length());
	      String uploadFolder = "D:\\Devspace\\SpringSpace\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\Reviewers3-1\\resources\\images";
	      
	      
	      /*
	        파일 업로드시 파일명이 동일한 파일이 이미 존재할 수도 있고 사용자가 
	        업로드 하는 파일명이 언어 이외의 언어로 되어있을 수 있습니다. 
	        타인어를 지원하지 않는 환경에서는 정산 동작이 되지 않습니다.(리눅스가 대표적인 예시)
	        고유한 랜던 문자를 통해 db와 서버에 저장할 파일명을 새롭게 만들어 준다.
	       */
	      
	      UUID uuid = UUID.randomUUID();
	      System.out.println(uuid.toString());
	      String[] uuids = uuid.toString().split("-");
	      
	      String uniqueName = uuids[0];
	      System.out.println("생성된 고유문자열" + uniqueName);
	      System.out.println("확장자명" + fileExtension);
	      System.out.println(uniqueName+fileExtension);
	      
	      
	      // File saveFile = new File(uploadFolder+"\\"+fileRealName); uuid 적용 전
	      
	      File saveFile = new File(uploadFolder+"\\"+uniqueName + fileExtension);  // 적용 후
	      try {
	         file.transferTo(saveFile); // 실제 파일 저장메서드(filewriter 작업을 손쉽게 한방에 처리해준다.)
	      } catch (IllegalStateException e) {
	         e.printStackTrace();
	      } catch (IOException e) {
	         e.printStackTrace();
	      }
	      return "fileupload/upload_ok";
	   }
	}


