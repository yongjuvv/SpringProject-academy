package com.ch.project.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ch.project.dao.ProductBoardDao;
import com.ch.project.model.ProductBoard;

@Service
public class ProductBoardServiceImpl implements ProductBoardService{
	@Autowired
	private ProductBoardDao pbd;

	public int insert(ProductBoard pboard) {
		return pbd.insert(pboard);
	}
}
