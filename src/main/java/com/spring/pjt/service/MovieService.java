package com.spring.pjt.service;

import java.util.List;

import com.spring.pjt.domain.Movie;

public interface MovieService {
	
	List<Movie> select();
	Movie select(int movie_no);
	List<Movie> select(int searchType, String searchKeyword);
}
