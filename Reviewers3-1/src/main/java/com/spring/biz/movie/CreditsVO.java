package com.spring.biz.movie;

public class CreditsVO {
	private String name; // 제작진 이름
	private String profile_path; // 제작진 사진

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getProfile_path() {
		return profile_path;
	}

	public void setProfile_path(String profile_path) {
		this.profile_path = profile_path;
	}
}
