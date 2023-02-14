package com.spring.biz.movieGeners.Impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.biz.board.MovieBoardVO;
import com.spring.biz.movieGeners.MovieGenersVO;

@Repository
public class MovieGenersDAO {
	@Autowired
	SqlSessionTemplate mybatis;
	
	public void insertGeners(MovieGenersVO vo) {
		mybatis.insert("MovieGenersDAO.insertGeners",vo);
	}
	public void updateGeners(MovieGenersVO vo) {
		mybatis.update("MovieGenersDAO.updateGeners",vo);
	}
	public List<MovieGenersVO> getGeners(MovieGenersVO vo){
		return mybatis.selectList("MovieGenersDAO.getGenersChart",vo);
	}
	public MovieGenersVO getValiedGeners(MovieGenersVO vo) {
		return mybatis.selectOne("MovieGenersDAO.getGensers", vo);
	}
}
