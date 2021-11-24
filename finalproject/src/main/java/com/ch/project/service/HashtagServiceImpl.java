package com.ch.project.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ch.project.dao.HashtagDao;
import com.ch.project.model.Hashtag;

@Service
public class HashtagServiceImpl implements HashtagService {
	@Autowired
	private HashtagDao hd;

	// 메인 페이지에 뜨는 랜덤 해시태그
	@Override
	public List<Hashtag> list() {
		return hd.list();
	}

	// 해시태그 전체 목록
	@Override
	public List<Hashtag> allList() {
		return hd.allList();
	}

	// 해시태그 숫자로 이름 가져오기
	@Override
	public String getHashName(int hashNum) {
		return hd.getHashName(hashNum);
	}

	@Override
	public Hashtag select(int hashNum) {
		return hd.select(hashNum);
	}

	@Override
	public int count() {
		return hd.count();
	}

	// 영화 상세 페이지에 가장 많이 선택된 해시태그 순
	@Override
	public List<Hashtag> movHashtagList(int movNum) {
		return hd.movHashtagList(movNum);
	}

	// 영상 해시태그 상위 리스트
	@Override
	public List<Hashtag> tvHashtagList(int tvNum) {
		return hd.tvHashtagList(tvNum);
	}

	// hot 해시리스트
	@Override
	public void updateClickCount(int hashNum) {
		hd.updateClickCount(hashNum);
	}

	@Override
	public List<Hashtag> recomHashList() {
		return hd.recomHashList();
	}

	@Override
	public int sum(String email) {
		return hd.sum(email);
	}
}
