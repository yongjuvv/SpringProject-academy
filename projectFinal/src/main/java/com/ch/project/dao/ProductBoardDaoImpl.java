package com.ch.project.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ch.project.model.ProductBoard;

@Repository
public class ProductBoardDaoImpl implements ProductBoardDao{
	@Autowired
	private SqlSessionTemplate sst;

	public int insert(ProductBoard pboard) {
		return sst.insert("pdboardns", pboard);
	}
}
