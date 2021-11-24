package com.loginpro.dao;

import com.loginpro.model.Member;

public interface LoginDao {
	Member select(String id);
	
	int insert(Member member);
}
