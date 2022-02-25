package com.spring.pjt.persistence;

import java.util.List;

public interface MovieLikeDao {
	List<Object> readAllLIKE(int user_no);
	
	Object readLike(int user_no, int movie_no);

	int insertLike(int movie_no, int user_no);

	int deleteLike(int movie_no, int user_no);
	
	List<Object> readAllUsers(int movie_no);
}
