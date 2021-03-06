package com.ch.project.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ch.project.dao.PersonDao;

@Service
public class PersonServiceImpl implements PersonService {
	@Autowired
	private PersonDao pd;

	@Override
	public String getMovDirName(int movDirNum) {
		return pd.getMovDirName(movDirNum);
	}

	@Override
	public String getTvDirName(int tvDirNum) {
		return pd.getTvDirName(tvDirNum);
	}

	@Override
	public String getActName(int actNum1) {
		return pd.getActName(actNum1);
	}

	@Override
	public String getActPic(int actNum1) {
		return pd.getActPic(actNum1);
	}
	
}
