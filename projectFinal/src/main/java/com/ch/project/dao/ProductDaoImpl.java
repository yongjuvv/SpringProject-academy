package com.ch.project.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ch.project.model.Product;

@Repository
public class ProductDaoImpl implements ProductDao{
	
	@Autowired
	private SqlSessionTemplate sst;

	public Product select(int p_Number) {
		return sst.selectOne("productns.select",p_Number);
	}

	public int insert(Product product) {
		return sst.insert("productns.insert",product);
	}
}
