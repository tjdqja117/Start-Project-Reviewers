package com.spring.view.admin;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.biz.UserBlackList.UserBlackListService;
import com.spring.biz.UserBlackList.UserBlackListVO;
import com.spring.biz.board.BoardService;
import com.spring.biz.board.MovieBoardVO;
import com.spring.biz.reportComment.reportCommentService;
import com.spring.biz.reportComment.reportCommentVO;
import com.spring.biz.reportReview.ReportReviewService;
import com.spring.biz.reportReview.ReportReviewVO;


import com.spring.biz.tableNum.tableNumService;
import com.spring.biz.tableNum.tableNumVO;
import com.spring.biz.userInfo.UserInfoService;
import com.spring.biz.userInfo.UserInfoVO;
import com.spring.biz.util.PageDTO;
import com.spring.biz.util.SearchCriteria;

@Controller
public class adminControler {
	@Autowired
	private ReportReviewService reviewService;
	@Autowired
	private tableNumService tableNumService;
	@Autowired
	private reportCommentService commentService;
	@Autowired
	private UserInfoService userInfoService;
	@Autowired
	private UserBlackListService userBlackListService;
	@Autowired
	private BoardService boardService;
	
	@RequestMapping(value = "/getReviewReport.do")
	public String getReviewReport(Model model,SearchCriteria cri) {
		// Model 정보 저장
				PageDTO pageMaker = new PageDTO(cri, reviewService.getTotalPages(cri));
				System.out.println("TotalPage : " + pageMaker.getTotalPage());
				System.out.println("StartPage : " + pageMaker.getStartPage());
				System.out.println("EndPage : " + pageMaker.getEndPage());
				
				model.addAttribute("pageMaker", pageMaker);	// Model 정보 저장
				System.out.println("error1");
				model.addAttribute("boardList", reviewService.getBoardListWithDynamicPaging(cri));	// Model 정보 저장
				System.out.println("error2");
//				model.addAttribute("boardList", boardService.getBoardList(vo));	// Model 정보 저장
//				System.out.println(reviewService.getBoardListWithDynamicPaging(cri).get(0).getReportSeq());
		return "admin";
	}
	
	@RequestMapping(value = "/getCommentReport.do")
	public String getCommentReport(Model model,SearchCriteria cri) {
		PageDTO pageMaker = new PageDTO(cri, commentService.getTotalPages(cri));
		System.out.println("TotalPage : " + pageMaker.getTotalPage());
		System.out.println("StartPage : " + pageMaker.getStartPage());
		System.out.println("EndPage : " + pageMaker.getEndPage());
		System.out.println(commentService.getBoardListWithDynamicPaging(cri));
		System.out.println("error1");
		model.addAttribute("boardList", commentService.getBoardListWithDynamicPaging(cri));	// Model 정보 저장
		model.addAttribute("pageMaker", pageMaker);
		return "reportComment";
	}
	@RequestMapping(value = "/getReportDetail.do")
	public String getReportDetail(Model model ,ReportReviewVO vo) {
		List<ReportReviewVO> list = reviewService.getReportReviewDetail(vo);
		System.out.println(list);
		model.addAttribute("reportDetail",list);
		return "reportDetail";
	}
	@RequestMapping(value = "/getReportCommentDetail.do")
	public String getReportCommentDetail(Model model ,reportCommentVO vo) {
		List<reportCommentVO> list = commentService.getReportCommentDetail(vo);
		System.out.println(list);
		model.addAttribute("reportDetail",list);
		return "reportDetail";
	}
	@RequestMapping(value = "/insertReviewReport.do")
	public String insertReviewRepoer(ReportReviewVO vo,HttpServletResponse response) throws IOException {
		
		if(reviewService.getValid(vo)==0) {
			reviewService.insertReportReview(vo);
		System.out.println("error");
		response.setContentType("text/html; charset=UTF-8");
        PrintWriter out = response.getWriter();
        out.println("<script>alert('신고가 완료되었습니다'); window.open('about:blank','_self').close();</script>");
        out.flush();
		}else {
			response.setContentType("text/html; charset=UTF-8");
	        PrintWriter out = response.getWriter();
	        out.println("<script>alert('이미 신고한 게시물입니다');  history.go(-1);</script>");
	        out.flush();
		}
		return "index";
	}
	@RequestMapping(value = "/insertCommentReport.do")
	public String insertCommentReport(reportCommentVO vo,HttpServletResponse response) throws IOException {
		if(commentService.getValid(vo)==0) {
			commentService.intsertRePortComment(vo);
		System.out.println("error");
		response.setContentType("text/html; charset=UTF-8");
        PrintWriter out = response.getWriter();
        out.println("<script>alert('신고가 완료되었습니다'); window.open('about:blank','_self').close();</script>");
        out.flush();
		}else {
			response.setContentType("text/html; charset=UTF-8");
	        PrintWriter out = response.getWriter();
	        out.println("<script>alert('이미 신고한 게시물입니다');  history.go(-1);</script>");
	        out.flush();
		}
		return "index";
	}
	@RequestMapping(value = "/updateReportReview.do")
	public String updateReportReview(ReportReviewVO vo,HttpServletResponse response,UserInfoVO Ivo,UserBlackListVO Bvo,MovieBoardVO Mvo) {
//		System.out.println("error1");
//		reviewService.updateReportReview(vo);
//		System.out.println("error2");
//		reviewService.deleteReportReview(vo);
		System.out.println(vo.getTargetID());
		Ivo.setUserId(vo.getTargetID());
		Mvo.setBseq(vo.getSeq());
		boardService.reportUpdateReviewY(Mvo);
		System.out.println(Ivo.getUserId());
		System.out.println(userInfoService.getUserInfo(Ivo));
		userInfoService.updateUserReportCount(Ivo);
		int count = userInfoService.getUserInfo(Ivo).getReportCount();
		Bvo.setUserId(Ivo.getUserId());
		switch (count) {
		case 3: Bvo.setDate(3);
		if(userBlackListService.getUser(Bvo)!=null) {
			userBlackListService.updateReportUser(Bvo);
			userInfoService.updateUserReportY(Ivo);
		}else {
			userBlackListService.insertReportUser(Bvo);
			userInfoService.updateUserReportY(Ivo);
		}
				break;

		case 6: Bvo.setDate(5);
		if(userBlackListService.getUser(Bvo)!=null) {
			userBlackListService.updateReportUser(Bvo);
			userInfoService.updateUserReportY(Ivo);
		}else {
			userBlackListService.insertReportUser(Bvo);
			userInfoService.updateUserReportY(Ivo);
		}
				break;

		case 9: Bvo.setDate(10);
		if(userBlackListService.getUser(Bvo)!=null) {
			userBlackListService.updateReportUser(Bvo);
			userInfoService.updateUserReportY(Ivo);
		}else {
			userBlackListService.insertReportUser(Bvo);
			userInfoService.updateUserReportY(Ivo);
		}
				break;

		case 12: Bvo.setDate(20);
		if(userBlackListService.getUser(Bvo)!=null) {
			userBlackListService.updateReportUser(Bvo);
			userInfoService.updateUserReportY(Ivo);
		}else {
			userBlackListService.insertReportUser(Bvo);
			userInfoService.updateUserReportY(Ivo);
		}
				break;

		case 24: Bvo.setDate(50);
		if(userBlackListService.getUser(Bvo)!=null) {
			userBlackListService.updateReportUser(Bvo);
			userInfoService.updateUserReportY(Ivo);
		}else {
			userBlackListService.insertReportUser(Bvo);
			userInfoService.updateUserReportY(Ivo);
		}
				break;
			
		}
		
		return "redirect:getReviewReport.do";
	}
	@RequestMapping(value = "/updateReportComment.do")
	public String updateReportComment(reportCommentVO vo,HttpServletResponse response,UserInfoVO Ivo,UserBlackListVO Bvo,MovieBoardVO Mvo) {
		System.out.println("error1");
		commentService.updateReportComment(vo);
		System.out.println("error2");
		commentService.deleteReportComment(vo);
		System.out.println(vo.getTargetID());
		Ivo.setUserId(vo.getTargetID());
		Mvo.setBseq(vo.getSeq());
		boardService.reportUpdateReviewY(Mvo);
		System.out.println(Ivo.getUserId());
		System.out.println(userInfoService.getUserInfo(Ivo));
		userInfoService.updateUserReportCount(Ivo);
		int count = userInfoService.getUserInfo(Ivo).getReportCount();
		Bvo.setUserId(Ivo.getUserId());
		switch (count) {
		case 3: Bvo.setDate(3);
		if(userBlackListService.getUser(Bvo)!=null) {
			userBlackListService.updateReportUser(Bvo);
			userInfoService.updateUserReportY(Ivo);
		}else {
			userBlackListService.insertReportUser(Bvo);
			userInfoService.updateUserReportY(Ivo);
		}
				break;

		case 6: Bvo.setDate(5);
		if(userBlackListService.getUser(Bvo)!=null) {
			userBlackListService.updateReportUser(Bvo);
			userInfoService.updateUserReportY(Ivo);
		}else {
			userBlackListService.insertReportUser(Bvo);
			userInfoService.updateUserReportY(Ivo);
		}
				break;

		case 9: Bvo.setDate(10);
		if(userBlackListService.getUser(Bvo)!=null) {
			userBlackListService.updateReportUser(Bvo);
			userInfoService.updateUserReportY(Ivo);
		}else {
			userBlackListService.insertReportUser(Bvo);
			userInfoService.updateUserReportY(Ivo);
		}
				break;

		case 12: Bvo.setDate(20);
		if(userBlackListService.getUser(Bvo)!=null) {
			userBlackListService.updateReportUser(Bvo);
			userInfoService.updateUserReportY(Ivo);
		}else {
			userBlackListService.insertReportUser(Bvo);
			userInfoService.updateUserReportY(Ivo);
		}
				break;

		case 24: Bvo.setDate(50);
		if(userBlackListService.getUser(Bvo)!=null) {
			userBlackListService.updateReportUser(Bvo);
			userInfoService.updateUserReportY(Ivo);
		}else {
			userBlackListService.insertReportUser(Bvo);
			userInfoService.updateUserReportY(Ivo);
		}
				break;
			
		}
	
		return "redirect:reportComment.do";
	}
	
	@RequestMapping(value ="/testReport.do")
	public String InsertReport() {
		
		return "testInsertReport";
	}
	
}
