package com.ch.project.service;

import java.util.List;

import com.ch.project.model.Tv;

public interface TvService {

	Tv select(int tvNum);

	List<Tv> tvList(Tv tv);

	List<Tv> recomTvList(Tv tv);

	List<Tv> searchTvList(String searchCollect);
}
