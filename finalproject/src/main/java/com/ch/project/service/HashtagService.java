package com.ch.project.service;

import java.util.List;

import com.ch.project.model.Hashtag;

public interface HashtagService {

	Hashtag select(int hashNum);

	List<Hashtag> list();

	// 해시태그 전체 목록
	List<Hashtag> allList();

	String getHashName(int hashNum);

	int count();

	// 가장 많이 선택된 해시태그 순
	List<Hashtag> movHashtagList(int movNum);

	List<Hashtag> tvHashtagList(int tvNum);

	void updateClickCount(int hasNum);

	List<Hashtag> recomHashList();

	int sum(String email);
}
