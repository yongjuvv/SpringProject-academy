package com.ch.project.service;

import com.ch.project.model.Like;

public interface LikeService {

	Like select(int reviewNum, String email);
	
	int like(int reviewNum, String email);

	int cancle(int reviewNum, String email);

	int insertData(int reviewNum, String email);
	
	int insertLike(int reviewNum, String email);

	int countLikeChk(int reviewNum, String email);

	int deleteLike(int reviewNum, String email);


}
