package com.ch.project.service;

import java.util.Collection;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ch.project.dao.OrderDao;
import com.ch.project.model.Order;

@Service
public class OrderServiceImpl implements OrderService{
	@Autowired
	private OrderDao od;

	public int insert(Order order) {
		return od.insert(order);
	}

	public Order select(long orNumber) {
		return od.select(orNumber);
	}

	public int getTotal(Order order) {
		return od.getTotal(order);
	}

	public Collection<Order> list(Order order) {
		return od.list(order);
	}

	public Order select(String id) {
		return od.select(id);
	}

}
