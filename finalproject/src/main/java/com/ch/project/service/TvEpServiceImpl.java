package com.ch.project.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ch.project.dao.TvEpDao;
import com.ch.project.model.TvEp;

@Service
public class TvEpServiceImpl implements TvEpService {
	@Autowired
	private TvEpDao ted;

	@Override
	public List<TvEp> tvEpList(int tvNum) {
		return ted.tvEpList(tvNum);
	}

	@Override
	public TvEp select(int tvNum, int tvEpNum) {
		return ted.select(tvNum, tvEpNum);
	}

}
