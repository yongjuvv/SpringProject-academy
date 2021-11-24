package com.ch.project.dao;

import com.ch.project.model.Product;

public interface ProductDao {

	int insert(Product product);

	Product select(int p_Number);

}
