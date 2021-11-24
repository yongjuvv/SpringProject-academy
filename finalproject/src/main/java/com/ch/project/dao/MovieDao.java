package com.ch.project.dao;

import java.util.List;

import com.ch.project.model.Movie;

public interface MovieDao {

	Movie select(int movNum);

	List<Movie> movieList(Movie movie);

	List<Movie> listAll();

	List<Movie> recomMovList(Movie movie);

	List<Movie> searchMovieList(String searchCollect);

	List<Movie> preAct(String email);

	List<Movie> preDic(String email);

	List<Movie> timeSum(String email);

}
