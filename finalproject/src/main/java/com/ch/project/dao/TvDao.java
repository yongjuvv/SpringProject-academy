package com.ch.project.dao;

import java.util.List;

import com.ch.project.model.Tv;

public interface TvDao {

	Tv select(int tvNum);

	List<Tv> tvList(Tv tv);

	List<Tv> recomTvList(Tv tv);

	List<Tv> searchTvList(String searchCollect);

}
