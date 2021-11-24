package com.ch.project.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ch.project.model.Cart;
import com.ch.project.model.CollVideo;
import com.ch.project.model.Collect;

@Repository
public class CollectDaoImpl implements CollectDao{
	@Autowired
	private SqlSessionTemplate sst;

	@Override
	public int insertCollect(int movNum, int tvNum, String email) {
		HashMap<String, Object> hm = new HashMap<String, Object>();
		hm.put("movNum", movNum);
		hm.put("tvNum", tvNum);
		hm.put("email", email);
		return sst.insert("collectns.insertCollect", hm);
	}

	@Override
	public int insert(String email) {
		HashMap<String, Object> hm = new HashMap<String, Object>();
		hm.put("email", email);
		return sst.insert("collectns.insert", hm);
	}

	@Override
	public List<Cart> cartList(String email) {
		return sst.selectList("collectns.cartList", email);
	}

	@Override
	public int insertCollectToCollection(Collect collect) {
		return sst.insert("collectns.insertCollectToCollection", collect);
	}

	@Override
	public int insertCollVid(String email, int collNum) {
		HashMap<String, Object> hm = new HashMap<String, Object>();
		hm.put("email", email);
		hm.put("collNum", collNum);
		return sst.insert("collectns.insertCollVid", hm);
	}

	@Override
	public int deleteCart(String email) {
		return sst.delete("collectns.deleteCart", email);
	}

	@Override
	public List<Collect> collectList(String email, int startRow, int endRow) {
		HashMap<String, Object> hm = new HashMap<String, Object>();
		hm.put("email", email);
		hm.put("startRow", startRow);
		hm.put("endRow", endRow);
		return sst.selectList("collectns.collectList", hm);
	}

	@Override
	public Collect selectCollect(int collNum) {
		return sst.selectOne("collectns.selectCollect", collNum);
	}
}
