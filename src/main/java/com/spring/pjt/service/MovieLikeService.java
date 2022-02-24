package com.spring.pjt.service;

import java.util.List;

public interface MovieLikeService {

	List<Object> readLike(int user_no);
	
	Object readLike2(int user_no, int movie_no);

	int insertLike(int movie_no, int user_no);

	int deleteLike(int movie_no, int user_no);

}
