package com.ch.project.service;

import java.util.Collection;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ch.project.dao.BankListDao;
import com.ch.project.model.BankList;

@Service
public class BankListServiceImpl implements BankListService{
	@Autowired
	private BankListDao bld;

	@Override
	public Collection<BankList> list() {
		return bld.list();
	}
}
