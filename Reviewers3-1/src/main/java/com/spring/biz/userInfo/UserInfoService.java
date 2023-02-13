package com.spring.biz.userInfo;

public interface UserInfoService {
	UserInfoVO getNickname(UserInfoVO vo);
	public void insertUserInfo(UserInfoVO vo);
	UserInfoVO getUserInfo(UserInfoVO vo);
	void updateUserReportCount(UserInfoVO vo);
	void updateUserReportY(UserInfoVO vo);
	void updateUserReportN(UserInfoVO vo);
}
