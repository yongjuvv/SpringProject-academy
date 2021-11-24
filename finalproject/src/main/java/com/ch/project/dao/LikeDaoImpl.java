package com.ch.project.dao;

import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ch.project.model.Like;

@Repository
public class LikeDaoImpl implements LikeDao {

	@Autowired
	private SqlSessionTemplate sst;

	@Override
	public Like select(int reviewNum, String email) {
		HashMap<String, Object> hm = new HashMap<String, Object>();
		hm.put("reviewNum", reviewNum);
		hm.put("email", email);
		return sst.selectOne("likens.select", hm);
	}

	@Override
	public int like(int reviewNum, String email) {
		HashMap<String, Object> hm = new HashMap<String, Object>();
		hm.put("reviewNum", reviewNum);
		hm.put("email", email);
		return sst.update("likens.like", hm);
	}

	@Override
	public int cancle(int reviewNum, String email) {
		HashMap<String, Object> hm = new HashMap<String, Object>();
		hm.put("reviewNum", reviewNum);
		hm.put("email", email);
		return sst.update("likens.cancle", hm);
	}

	@Override
	public int insertData(int reviewNum, String email) {
		HashMap<String, Object> hm = new HashMap<String, Object>();
		hm.put("reviewNum", reviewNum);
		hm.put("email", email);
		return sst.insert("likens.insertData", hm);
	}
	
	@Override
	public int insertLike(int reviewNum, String email) {
		HashMap<String, Object> hm = new HashMap<String, Object>();
		hm.put("reviewNum", reviewNum);
		hm.put("email", email);
		return sst.update("likens.insertLike", hm);
	}

	@Override
	public int countLikeChk(int reviewNum, String email) {
		HashMap<String, Object> hm = new HashMap<String, Object>();
		hm.put("reviewNum", reviewNum);
		hm.put("email", email);
		return sst.selectOne("likens.countLikeChk", hm);
	}

	@Override
	public int deleteLike(int reviewNum, String email) {
		HashMap<String, Object> hm = new HashMap<String, Object>();
		hm.put("reviewNum", reviewNum);
		hm.put("email", email);
		return sst.delete("likens.deleteLike", hm);
	}

}
