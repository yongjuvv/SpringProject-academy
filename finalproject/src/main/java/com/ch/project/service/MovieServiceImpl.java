package com.ch.project.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ch.project.dao.MovieDao;
import com.ch.project.model.Movie;

@Service
public class MovieServiceImpl implements MovieService {
	@Autowired
	private MovieDao md;

	public Movie select(int movNum) {
		return md.select(movNum);
	}

	@Override
	public List<Movie> movieList(Movie movie) {
		return md.movieList(movie);
	}

	@Override
	public List<Movie> listAll() {
		return md.listAll();
	}

	@Override
	public List<Movie> recomMovList(Movie movie) {
		return md.recomMovList(movie);
	}

	@Override
	public List<Movie> searchMovieList(String searchCollect) {
		return md.searchMovieList(searchCollect);
	}

	@Override
	public List<Movie> preAct(String email) {
		return md.preAct(email);
	}

	@Override
	public List<Movie> preDic(String email) {
		return md.preDic(email);
	}

	@Override
	public List<Movie> timeSum(String email) {
		return md.timeSum(email);
	}
}
