package com.ch.project.dao;

import java.util.List;

import com.ch.project.model.TvEp;

public interface TvEpDao {

	List<TvEp> tvEpList(int tvNum);

	TvEp select(int tvNum, int tvEpNum);

}
