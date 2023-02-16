package com.spring.view.hashTag;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.biz.board.BoardService;
import com.spring.biz.board.MovieBoardVO;
import com.spring.biz.hashTag.HashTagService;
import com.spring.biz.hashTag.HashTagVO;
import com.spring.view.board.MovieController.SortByLike;

@Controller
public class HashTableContoller {
	@Autowired
	private HashTagService hashtagService;
	@Autowired
	private BoardService boardService;
	@RequestMapping(value = "HashTagSearch.do")
	public String HashTagSearch(HashTagVO vo,Model model,MovieBoardVO Mvo) {
		List<Integer> list = hashtagService.SearchHashTag(vo);
		list = list.stream().distinct().collect(Collectors.toList());
		List<MovieBoardVO> result = new ArrayList<MovieBoardVO>();
		for(int i = 0;i<list.size();i++) {
			Mvo.setBseq(list.get(i));
			result.add(boardService.getBoard(Mvo));
		}
		
    	model.addAttribute("result", result);
    	return "searchReviewTest";
	}
}
