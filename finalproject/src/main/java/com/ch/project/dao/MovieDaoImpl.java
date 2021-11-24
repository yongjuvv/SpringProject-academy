package com.ch.project.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ch.project.model.Movie;

@Repository
public class MovieDaoImpl implements MovieDao {
	@Autowired
	private SqlSessionTemplate sst;

	@Override
	public Movie select(int movNum) {
		return sst.selectOne("moviens.select", movNum);
	}

	@Override
	public List<Movie> movieList(Movie movie) {
		return sst.selectList("moviens.movieList", movie);
	}

	@Override
	public List<Movie> listAll() {
		return sst.selectList("moviens.listAll");
	}

	@Override
	public List<Movie> recomMovList(Movie movie) {
		return sst.selectList("moviens.recomMovList", movie);
	}

	@Override
	public List<Movie> searchMovieList(String searchCollect) {
		return sst.selectList("moviens.searchMovieList", searchCollect);
	}

	@Override
	public List<Movie> preAct(String email) {
		return sst.selectList("moviens.preAct", email);
	}

	@Override
	public List<Movie> timeSum(String email) {
		return sst.selectList("moviens.timeSum", email);
	}

	@Override
	public List<Movie> preDic(String email) {
		return sst.selectList("moviens.preDic", email);
	}
}
