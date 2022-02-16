package com.spring.pjt.persistence;

import java.util.List;

import com.spring.pjt.domain.Movie;

public interface MovieDao {

	public List<Movie> read();
	Movie read(int movie_no);
	List<Movie> read(int type, String keyword);
}
