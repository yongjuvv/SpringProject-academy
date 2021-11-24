package com.ch.project.service;

import com.ch.project.model.Product;

public interface ProductService {

	int insert(Product product);

	Product select(int p_Number);

}
