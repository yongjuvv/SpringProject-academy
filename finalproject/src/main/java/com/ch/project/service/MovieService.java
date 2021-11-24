package com.ch.project.service;

import java.util.List;

import com.ch.project.model.Movie;

public interface MovieService {

	Movie select(int movNum);

	List<Movie> movieList(Movie movie);

	List<Movie> listAll();

	List<Movie> recomMovList(Movie movie);

	List<Movie> searchMovieList(String searchCollect);

	List<Movie> preAct(String email);

	List<Movie> preDic(String email);

	List<Movie> timeSum(String email);
}
