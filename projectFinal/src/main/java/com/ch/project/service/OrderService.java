package com.ch.project.service;

import java.util.Collection;

import com.ch.project.model.Order;

public interface OrderService {

	int insert(Order order);

	Order select(long orNumber);

	int getTotal(Order order);

	Collection<Order> list(Order order);

	Order select(String id);




}
