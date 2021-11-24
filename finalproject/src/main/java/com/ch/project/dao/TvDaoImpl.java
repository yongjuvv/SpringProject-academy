package com.ch.project.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ch.project.model.Tv;

@Repository
public class TvDaoImpl implements TvDao {
	@Autowired
	private SqlSessionTemplate sst;

	public Tv select(int tvNum) {
		return sst.selectOne("tvns.select", tvNum);
	}

	@Override
	public List<Tv> tvList(Tv tv) {
		return sst.selectList("tvns.tvList", tv);
	}

	@Override
	public List<Tv> recomTvList(Tv tv) {
		return sst.selectList("tvns.recomTvList", tv);
	}

	@Override
	public List<Tv> searchTvList(String searchCollect) {
		return sst.selectList("tvns.searchTvList", searchCollect);
	}

}
