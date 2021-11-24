package com.ch.project.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ch.project.dao.CollVideoDao;
import com.ch.project.model.CollVideo;

@Service
public class CollVideoServiceImpl implements CollVideoService{
	@Autowired
	private CollVideoDao cvd;

	@Override
	public List<CollVideo> CollVideoList(int collNum) {
		return cvd.CollVideoList(collNum);
	}
}
