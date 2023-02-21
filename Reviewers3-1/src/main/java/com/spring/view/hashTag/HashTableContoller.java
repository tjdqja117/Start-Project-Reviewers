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
import com.spring.biz.util.getContentInfo;
import com.spring.view.board.MovieController.SortByLike;

@Controller
public class HashTableContoller {
	@Autowired
	private HashTagService hashtagService;
	@Autowired
	private BoardService boardService;
	@RequestMapping(value = "HashTagSearch.do")
	public String HashTagSearch(HashTagVO Hvo,Model model,MovieBoardVO vo) {
		getContentInfo info = new getContentInfo();
		
		List<Integer> list = hashtagService.SearchHashTag(Hvo);
		list = list.stream().distinct().collect(Collectors.toList());
		List<MovieBoardVO> result = new ArrayList<MovieBoardVO>();
		for(int i = 0;i<list.size();i++) {
			vo.setBseq(list.get(i));
			MovieBoardVO temp = boardService.getBoard(vo);
			if(temp.getReviewPic() == null || temp.getBoardnum() != 4) {
				int code = temp.getMoviecode();
				System.out.println(code);
				String contentType= temp.getContentType();
				System.out.println(contentType);
				String temp2 = info.getjsonObjectInfo(contentType, code).getPoster_path();
				System.out.println(temp);
				temp.setReviewPic(temp2);
				System.out.println(temp.getReviewPic());
			}
			result.add(temp);
			
		}
		
    	model.addAttribute("result", result);
    	return "tagSearch";
	}
}
