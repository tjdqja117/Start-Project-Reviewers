package com.spring.biz.movieGeners.Impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.biz.movieGeners.MovieGenersService;
import com.spring.biz.movieGeners.MovieGenersVO;
@Service("MovieGenersService")
public class MovieBoardServiceImpl implements MovieGenersService{
	@Autowired
	MovieGenersDAO movieGenersDAO;
	@Override
	public void insertGeners(MovieGenersVO vo) {
		// TODO Auto-generated method stub
		movieGenersDAO.insertGeners(vo);
	}

	@Override
	public List<MovieGenersVO> getMovieGeners(MovieGenersVO vo) {
		// TODO Auto-generated method stub
		return movieGenersDAO.getGeners(vo);
	}

	@Override
	public void updateGeners(MovieGenersVO vo) {
		// TODO Auto-generated method stub
		movieGenersDAO.updateGeners(vo);
	}

	@Override
	public MovieGenersVO validMovieGeners(MovieGenersVO vo) {
		// TODO Auto-generated method stub
		return movieGenersDAO.getValiedGeners(vo);
	}
	
}
