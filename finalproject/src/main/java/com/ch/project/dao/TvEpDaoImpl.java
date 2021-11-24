package com.ch.project.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ch.project.model.TvEp;

@Repository
public class TvEpDaoImpl implements TvEpDao {
	@Autowired
	private SqlSessionTemplate sst;

	@Override
	public List<TvEp> tvEpList(int tvNum) {
		return sst.selectList("tvepns.tvEpList", tvNum);
	}

	@Override
	public TvEp select(int tvNum, int tvEpNum) {
		HashMap<String, Object> hm = new HashMap<String, Object>();
		hm.put("tvNum", tvNum);
		hm.put("tvEpNum", tvEpNum);
		return sst.selectOne("tvepns.select", hm);
	}

}
