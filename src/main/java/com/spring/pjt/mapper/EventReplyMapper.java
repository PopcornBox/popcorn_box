package com.spring.pjt.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.spring.pjt.domain.EventReply;
import com.spring.pjt.domain.User;

@Mapper
public interface EventReplyMapper {
	 
	// 이벤트 댓글 등록
	String INSERT_EVENT_REPLY =
	    "INSERT INTO ${TABLE_EVENT_REPLIES} (${COL_EVENT_REPLY_CONTENT}, ${COL_USER_NICKNAME}, ${COL_EVENT_NO})"
	   + " VALUES (#{event_reply_content}, #{user_nickname}, #{event_no})";
	 
	 @Insert(INSERT_EVENT_REPLY)
	 int insertEventReply(EventReply eventReply);
	 
	 // 이벤트 댓글 리스트 불러오기
	 String SELECT_ALL_EVENT_REPLY = 
			 "SELECT * FROM ${TABLE_EVENT_REPLIES} WHERE ${COL_EVENT_NO} = #{event_no}"
			 + " ORDER BY ${COL_EVENT_REPLY_NO} DESC";		 
	 
	 @Select(SELECT_ALL_EVENT_REPLY)
	 List<EventReply> readAllEventReplies(Integer event_no);
	 
	 
	 String SELECT_TEN_EVENT_REPLY_1 = 
			 "SELECT a.${COL_EVENT_REPLY_NO}, a.${COL_EVENT_REPLY_CONTENT}, a.${COL_USER_NICKNAME}, a.${COL_EVENT_REPLY_UPDATE_TIME} "
			 + "FROM (SELECT * FROM ${TABLE_EVENT_REPLIES} WHERE ${COL_EVENT_NO} = #{event_no}"
			 + " ORDER BY ${COL_EVENT_REPLY_NO} DESC) a WHERE ROWNUM >= #{startpage} and ROWNUM <= #{lastpage}";		 
	 
	 @Select(SELECT_TEN_EVENT_REPLY_1)
	 List<EventReply> readTenEventReplies1(Map<String, Object> map);
	 
	 
	 String SELECT_TEN_EVENT_REPLY_2 = 
			 "SELECT * FROM (SELECT a.${COL_EVENT_REPLY_NO}, a.${COL_EVENT_REPLY_CONTENT}, a.${COL_USER_NICKNAME}, a.${COL_EVENT_REPLY_UPDATE_TIME}, ROWNUM rnum "
			 + "FROM (SELECT * FROM ${TABLE_EVENT_REPLIES} WHERE ${COL_EVENT_NO} = #{event_no}"
			 + " ORDER BY ${COL_EVENT_REPLY_NO} DESC) a WHERE ROWNUM <= #{lastpage}) WHERE rnum >= #{startpage}";		 
	 
	 @Select(SELECT_TEN_EVENT_REPLY_2)
	 List<EventReply> readTenEventReplies2(Map<String, Object> map);
	 
	 
	 // user_nickname과 event_no로 댓글 찾기
	 String CHECK_EVENT_REPLY = 
			 "SELECT * FROM ${TABLE_EVENT_REPLIES} WHERE ${COL_EVENT_NO} = #{event_no}"
			 + " and ${COL_USER_NICKNAME} = #{user_nickname}";
	 
	 @Select(CHECK_EVENT_REPLY)
	 EventReply checkEventReply(EventReply eventReply);

	 
	String DELETE_EVENT_REPLY =
			"DELETE FROM ${TABLE_EVENT_REPLIES} WHERE ${COL_EVENT_REPLY_NO} = #{event_reply_no}";
	 
	@Delete(DELETE_EVENT_REPLY)
	int deleteEventReply(Integer event_reply_no);

	
	String DELETE_ALL_EVENT_REPLY =
			"DELETE FROM ${TABLE_EVENT_REPLIES} WHERE ${COL_EVENT_NO} = #{event_no}";
	 
	@Delete(DELETE_ALL_EVENT_REPLY)
	int deleteAllEventReply(Integer event_no);
	
	
	
	String UPDATE_EVENT_REPLY =
			"UPDATE ${TABLE_EVENT_REPLIES} SET ${COL_EVENT_REPLY_CONTENT} = #{event_reply_content}, ${COL_EVENT_REPLY_UPDATE_TIME} = sysdate"
			+ " WHERE ${COL_EVENT_REPLY_NO} = #{event_reply_no}";
	@Update(UPDATE_EVENT_REPLY)
	int updateEventReply(EventReply eventReply);
	
	
	String UPDATE_USER_NICKNAME =
			"UPDATE ${TABLE_EVENT_REPLIES} SET ${COL_USER_NICKNAME} = #{user_nickname}"
			+ " WHERE ${COL_EVENT_REPLY_NO} = #{event_reply_no}";
	@Update(UPDATE_USER_NICKNAME)
	int updateNickname(Map<String, Object> map);
	 
	
	 String FIND_EVENT_REPLY_NO = 
			 "SELECT ${COL_EVENT_REPLY_NO} FROM ${TABLE_EVENT_REPLIES} WHERE ${COL_USER_NICKNAME} = #{user_nickname}";	 
	 
	 @Select(FIND_EVENT_REPLY_NO)
	 int[] findEventReplyNo(User user);   
	
	 String CHOOSE_WINNER = 
			 "SELECT * FROM (SELECT ${COL_USER_NICKNAME} from ${TABLE_EVENT_REPLIES} WHERE ${COL_EVENT_NO} = #{event_no})"
			 + " WHERE ROWNUM <= #{winner_number}";		 
	 @Select(CHOOSE_WINNER)
	 List<String> chooseWinner(Map<String, Object> map);
	    
}
