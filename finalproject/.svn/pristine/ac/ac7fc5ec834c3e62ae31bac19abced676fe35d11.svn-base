package com.ch.project.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ch.project.dao.PProductDao;
import com.ch.project.model.PProduct;
@Service
public class PProductServiceImpl implements PProductService{
@Autowired
private PProductDao pdd;

@Override
public PProduct select(int pProductNum) {
	return pdd.select(pProductNum);
}

}
