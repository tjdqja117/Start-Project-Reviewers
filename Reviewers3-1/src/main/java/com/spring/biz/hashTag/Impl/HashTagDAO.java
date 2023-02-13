package com.spring.biz.hashTag.Impl;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.biz.hashTag.HashTagVO;

@Repository
public class HashTagDAO {
	@Autowired
	private SqlSessionTemplate mybatis;
	
	public void insertHashTag(HashTagVO vo) {
		mybatis.insert("HashTagDAO.insertHashTag",vo);
	}
}
