package com.spring.biz.hashTag;

import java.util.List;

public interface HashTagService {
	
	void insertHashTag(HashTagVO vo);
	
	List<HashTagVO> getHashTag(HashTagVO vo);

	List<Integer> SearchHashTag(HashTagVO vo);
	
	void updateHashTag(HashTagVO vo);
}
