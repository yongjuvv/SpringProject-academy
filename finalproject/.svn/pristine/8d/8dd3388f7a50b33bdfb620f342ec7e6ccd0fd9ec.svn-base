package com.ch.project.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ch.project.model.PProduct;
@Repository
public class PProductDaoImpl implements PProductDao{
@Autowired
private SqlSessionTemplate sst;

@Override
public PProduct select(int pProductNum) {
	return sst.selectOne("pproductns.select",pProductNum);
}
}
