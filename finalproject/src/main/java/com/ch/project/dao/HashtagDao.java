package com.ch.project.dao;

import java.util.List;

import com.ch.project.model.Hashtag;

public interface HashtagDao {

	Hashtag select(int hashNum);

	List<Hashtag> list();

	List<Hashtag> allList();

	String getHashName(int hashNum);

	int count();

	List<Hashtag> movHashtagList(int movNum);

	List<Hashtag> tvHashtagList(int tvNum);

	void updateClickCount(int hashNum);

	List<Hashtag> recomHashList();

	int sum(String email);
	
}
