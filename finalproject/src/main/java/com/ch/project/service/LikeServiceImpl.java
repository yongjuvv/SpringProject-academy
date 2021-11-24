package com.ch.project.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ch.project.dao.LikeDao;
import com.ch.project.model.Like;

@Service
public class LikeServiceImpl implements LikeService {

	@Autowired
	private LikeDao ld;

	@Override
	public Like select(int reviewNum, String email) {
		return ld.select(reviewNum, email);
	}

	@Override
	public int like(int reviewNum, String email) {
		return ld.like(reviewNum, email);
	}

	@Override
	public int cancle(int reviewNum, String email) {
		return ld.cancle(reviewNum, email);
	}

	@Override
	public int insertData(int reviewNum, String email) {
		return ld.insertData(reviewNum, email);
	}
	
	@Override
	public int insertLike(int reviewNum, String email) {
		return ld.insertLike(reviewNum, email);
	}

	@Override
	public int countLikeChk(int reviewNum, String email) {
		return ld.countLikeChk(reviewNum, email);
	}

	@Override
	public int deleteLike(int reviewNum, String email) {
		return ld.deleteLike(reviewNum, email);
	}

}
