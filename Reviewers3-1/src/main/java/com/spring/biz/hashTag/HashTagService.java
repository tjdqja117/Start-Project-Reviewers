package com.spring.biz.hashTag;

import java.util.List;

public interface HashTagService {
	void insertHashTag(HashTagVO vo);
	List<HashTagVO> getHashTag(HashTagVO vo);
}
