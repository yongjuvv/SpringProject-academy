package com.ch.project.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ch.project.dao.ProductBoardDao;
import com.ch.project.dao.ProductDao;
import com.ch.project.model.Product;

@Service
public class ProductServiceImpl implements ProductService{
	@Autowired
	private ProductDao pd;

	public Product select(int p_Number) {
		return pd.select(p_Number);
	}

	public int insert(Product product) {
		return pd.insert(product);
	}

}
