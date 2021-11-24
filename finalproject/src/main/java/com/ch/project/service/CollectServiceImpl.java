package com.ch.project.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ch.project.dao.CollectDao;
import com.ch.project.model.Cart;
import com.ch.project.model.CollVideo;
import com.ch.project.model.Collect;

@Service
public class CollectServiceImpl implements CollectService{
	@Autowired
	private CollectDao cd;

	@Override
	public int insertCollect(int movNum, int tvNum,String email) {
		return cd.insertCollect(movNum, tvNum, email);
	}

	@Override
	public int insert(String email) {
		return cd.insert(email);
	}

	@Override
	public List<Cart> cartList(String email) {
		return cd.cartList(email);
	}

	@Override
	public int insertCollectToCollection(Collect collect) {
		return cd.insertCollectToCollection(collect);
	}

	@Override
	public int insertCollVid(String email, int collNum) {
		return cd.insertCollVid(email, collNum);
	}

	@Override
	public int deleteCart(String email) {
		return cd.deleteCart(email);
		
	}

	@Override
	public List<Collect> collectList(String email, int startRow, int endRow) {
		return cd.collectList(email, startRow, endRow);
	}

	@Override
	public Collect selectCollect(int collNum) {
		return cd.selectCollect(collNum);
	}
}
