package com.ch.project.service;

import java.util.List;

import com.ch.project.model.Cart;
import com.ch.project.model.CollVideo;
import com.ch.project.model.Collect;

public interface CollectService {

	int insertCollect(int movNum, int tvNum, String email);

	int insert(String email);

	List<Cart> cartList(String email);

	int insertCollectToCollection(Collect collect);

	int insertCollVid(String email, int collNum);

	int deleteCart(String email);

	List<Collect> collectList(String email, int startRow, int endRow);

	Collect selectCollect(int collNum);

}
