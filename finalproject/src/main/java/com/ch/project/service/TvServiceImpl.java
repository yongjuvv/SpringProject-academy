package com.ch.project.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ch.project.dao.TvDao;
import com.ch.project.model.Tv;

@Service
public class TvServiceImpl implements TvService {
	@Autowired
	private TvDao td;

	public Tv select(int tvNum) {
		return td.select(tvNum);
	}

	@Override
	public List<Tv> tvList(Tv tv) {
		return td.tvList(tv);
	}

	@Override
	public List<Tv> recomTvList(Tv tv) {
		return td.recomTvList(tv);
	}

	@Override
	public List<Tv> searchTvList(String searchCollect) {
		return td.searchTvList(searchCollect);
	}
}
