package com.loginpro.service;

import com.loginpro.model.Member;

public interface LoginService {
	Member select(String id);
	
	int insert(Member member);
}
