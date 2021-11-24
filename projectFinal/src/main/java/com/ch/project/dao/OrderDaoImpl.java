package com.ch.project.dao;

import java.util.Collection;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ch.project.model.Order;

@Repository
public class OrderDaoImpl implements OrderDao{
	@Autowired
	private SqlSessionTemplate sst;

	public Order select(long orNumber) {
		return sst.selectOne("orderns.select",orNumber);
	}

	public int insert(Order order) {
		return sst.insert("orderns.insert",order);
	}

	public int getTotal(Order order) {
		return sst.selectOne("orderns.getTotal", order);
	}

	public Collection<Order> list(Order order) {
		return sst.selectList("orderns.list",order);
	}

	public Order select(String id) {
		return sst.selectOne("orderns.selectid", id);
	}


	
}
