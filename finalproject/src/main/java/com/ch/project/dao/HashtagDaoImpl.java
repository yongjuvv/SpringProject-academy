package com.ch.project.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ch.project.model.Hashtag;

@Repository
public class HashtagDaoImpl implements HashtagDao {
	@Autowired
	private SqlSessionTemplate sst;

	@Override
	public List<Hashtag> list() {
		return sst.selectList("hashtagns.list");
	}

	// 해시태그 전체 목록
	@Override
	public List<Hashtag> allList() {
		return sst.selectList("hashtagns.allList");
	}

	// 해시태그 숫자로 이름 가져오기
	@Override
	public String getHashName(int hashNum) {
		return sst.selectOne("hashtagns.getHashName", hashNum);
	}

	@Override
	public Hashtag select(int hashNum) {
		return sst.selectOne("hashtagns.select", hashNum);
	}

	@Override
	public int count() {
		return sst.selectOne("hashtagns.count");
	}

	// 영상 해시태그 상위리스트
	@Override
	public List<Hashtag> tvHashtagList(int tvNum) {
		return sst.selectList("hashtagns.tvHashtagList", tvNum);
	}

	// 가장 많이 선택된 해시태그 순
	@Override
	public List<Hashtag> movHashtagList(int movNum) {
		return sst.selectList("hashtagns.movHashtagList", movNum);
	}

	// hot 해시리스트
	@Override
	public void updateClickCount(int hashNum) {
		sst.update("hashtagns.updateClickCount", hashNum);
	}

	@Override
	public List<Hashtag> recomHashList() {
		return sst.selectList("hashtagns.recomHashList");
	}

	@Override
	public int sum(String email) {
		return sst.selectOne("hashtagns.sum", email);
	}
}
