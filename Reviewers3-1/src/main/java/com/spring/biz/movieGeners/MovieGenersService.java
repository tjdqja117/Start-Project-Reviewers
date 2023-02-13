package com.spring.biz.movieGeners;

import java.util.List;

public interface MovieGenersService {
	
	void insertGeners(MovieGenersVO vo);
	List<MovieGenersVO> getMovieGeners(MovieGenersVO vo);
	void updateGeners(MovieGenersVO vo);
	MovieGenersVO validMovieGeners(MovieGenersVO vo);

}
