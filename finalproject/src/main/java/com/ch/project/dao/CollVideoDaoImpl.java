package com.ch.project.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ch.project.model.CollVideo;

@Repository
public class CollVideoDaoImpl implements CollVideoDao{
	@Autowired
	private SqlSessionTemplate sst;

	@Override
	public List<CollVideo> CollVideoList(int collNum) {
		return sst.selectList("collvideons.CollVideoList", collNum);
	}
}
