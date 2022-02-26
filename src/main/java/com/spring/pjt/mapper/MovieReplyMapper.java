package com.spring.pjt.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.spring.pjt.domain.MovieReply;
import com.spring.pjt.domain.User;

@Mapper
public interface MovieReplyMapper {

	// 영화 댓글 등록
	String INSERT_MOVIE_REPLY =
	    "INSERT INTO ${TABLE_MOVIE_REPLIES} (${COL_MOVIE_REPLY_CONTENT}, ${COL_USER_NICKNAME}, ${COL_MOVIE_NO})"
	   + " VALUES (#{movie_reply_content}, #{user_nickname}, #{movie_no})";
	 
	 @Insert(INSERT_MOVIE_REPLY)
	 int insertMovieReply(MovieReply movieReply);
	 
	 // 영화 댓글 리스트 불러오기
	 String SELECT_ALL_MOVIE_REPLY = 
			 "SELECT * FROM ${TABLE_MOVIE_REPLIES} WHERE ${COL_MOVIE_NO} = #{movie_no}"
			 + " ORDER BY ${COL_MOVIE_REPLY_NO} DESC";		 
	 
	 @Select(SELECT_ALL_MOVIE_REPLY)
	 List<MovieReply> readAllMovieReplies(Integer movie_no);
	 
	 
	 String SELECT_TEN_MOVIE_REPLY_1 = 
			 "SELECT a.${COL_MOVIE_REPLY_NO}, a.${COL_MOVIE_REPLY_CONTENT}, a.${COL_USER_NICKNAME}, a.${COL_MOVIE_REPLY_UPDATE_TIME} "
			 + "FROM (SELECT * FROM ${TABLE_MOVIE_REPLIES} WHERE ${COL_MOVIE_NO} = #{movie_no}"
			 + " ORDER BY ${COL_MOVIE_REPLY_NO} DESC) a WHERE ROWNUM >= #{startpage} and ROWNUM <= #{lastpage}";		 
	 
	 @Select(SELECT_TEN_MOVIE_REPLY_1)
	 List<MovieReply> readTenMovieReplies1(Map<String, Object> map);
	 
	 
	 String SELECT_TEN_MOVIE_REPLY_2 = 
			 "SELECT * FROM (SELECT a.${COL_MOVIE_REPLY_NO}, a.${COL_MOVIE_REPLY_CONTENT}, a.${COL_USER_NICKNAME}, a.${COL_MOVIE_REPLY_UPDATE_TIME}, ROWNUM rnum "
			 + "FROM (SELECT * FROM ${TABLE_MOVIE_REPLIES} WHERE ${COL_MOVIE_NO} = #{movie_no}"
			 + " ORDER BY ${COL_MOVIE_REPLY_NO} DESC) a WHERE ROWNUM <= #{lastpage}) WHERE rnum >= #{startpage}";		 
	 
	 @Select(SELECT_TEN_MOVIE_REPLY_2)
	 List<MovieReply> readTenMovieReplies2(Map<String, Object> map);
	 
	 
	 // user_nickname과 movie_no로 댓글 찾기
	 String CHECK_MOVIE_REPLY = 
			 "SELECT * FROM ${TABLE_MOVIE_REPLIES} WHERE ${COL_MOVIE_NO} = #{movie_no}"
			 + " and ${COL_USER_NICKNAME} = #{user_nickname}";
	 
	 @Select(CHECK_MOVIE_REPLY)
	 MovieReply checkMovieReply(MovieReply movieReply);

	 
	String DELETE_MOVIE_REPLY =
			"DELETE FROM ${TABLE_MOVIE_REPLIES} WHERE ${COL_MOVIE_REPLY_NO} = #{movie_reply_no}";
	 
	@Delete(DELETE_MOVIE_REPLY)
	int deleteMovieReply(Integer movie_reply_no);

	
	String DELETE_ALL_MOVIE_REPLY =
			"DELETE FROM ${TABLE_MOVIE_REPLIES} WHERE ${COL_MOVIE_NO} = #{movie_no}";
	 
	@Delete(DELETE_ALL_MOVIE_REPLY)
	int deleteAllMovieReply(Integer movie_no);
	
	
	
	String UPDATE_MOVIE_REPLY =
			"UPDATE ${TABLE_MOVIE_REPLIES} SET ${COL_MOVIE_REPLY_CONTENT} = #{movie_reply_content}, ${COL_MOVIE_REPLY_UPDATE_TIME} = sysdate"
			+ " WHERE ${COL_MOVIE_REPLY_NO} = #{movie_reply_no}";
	@Update(UPDATE_MOVIE_REPLY)
	int updateMovieReply(MovieReply movieReply);	
	
	
	String UPDATE_USER_NICKNAME =
			"UPDATE ${TABLE_MOVIE_REPLIES} SET ${COL_USER_NICKNAME} = #{user_nickname}"
			+ " WHERE ${COL_MOVIE_REPLY_NO} = #{movie_reply_no}";
	@Update(UPDATE_USER_NICKNAME)
	int updateNickname(Map<String, Object> map);
	
	
	String FIND_MOVIE_REPLY_NO = 
			 "SELECT ${COL_MOVIE_REPLY_NO} FROM ${TABLE_MOVIE_REPLIES} WHERE ${COL_USER_NICKNAME} = #{user_nickname}";
	 @Select(FIND_MOVIE_REPLY_NO)
	 int[] findMovieReplyNo(User user);
	
}
