package com.ch.project.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class PersonDaoImpl implements PersonDao {
	@Autowired
	private SqlSessionTemplate sst;

	@Override
	public String getMovDirName(int movDirNum) {
		return sst.selectOne("personns.getMovDirName", movDirNum);
	}

	@Override
	public String getTvDirName(int tvDirNum) {
		return sst.selectOne("personns.getTvDirName", tvDirNum);
	}

	@Override
	public String getActName(int actNum1) {
		return sst.selectOne("personns.getActName", actNum1);
	}

	@Override
	public String getActPic(int actNum1) {
		return sst.selectOne("personns.getActPic", actNum1);
	}
	
}
