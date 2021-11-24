package com.ch.project.service;

import java.util.List;

import com.ch.project.model.TvEp;

public interface TvEpService {

	List<TvEp> tvEpList(int tvNum);

	TvEp select(int tvNum, int tvEpNum);

}
