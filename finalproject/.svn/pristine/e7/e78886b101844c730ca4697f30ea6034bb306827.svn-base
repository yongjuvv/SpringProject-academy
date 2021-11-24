package com.ch.project.dao;

import java.util.Collection;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ch.project.model.BankList;

@Repository
public class BankListDaoImpl implements BankListDao{
	@Autowired
	private SqlSessionTemplate sst;

	@Override
	public Collection<BankList> list() {
		return sst.selectList("banklistns.list");
	}
	
}
