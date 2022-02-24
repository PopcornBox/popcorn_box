package com.spring.pjt.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.spring.pjt.domain.Event;

@Mapper
public interface EventMapper {
	
	// 이벤트 리스트 불러오기
	String READ_ALL_EVENT =
							"SELECT * FROM ${TABLE_EVENTS} order by ${COL_EVENT_START_TIME} desc";
	
	@Select(READ_ALL_EVENT)
	List<Event> selectAllEvent();
	
	
	
	// 이벤트 번호로 특정 이벤트만 불러오기
	String READ_EVENT = 
						"SELECT * FROM ${TABLE_EVENTS} WHERE ${COL_EVENT_NO} = #{event_no}";
	
	@Select(READ_EVENT)
	Event selectEventByNo(int event_no);

	// 이벤트 등록하기
	String INSERT_EVENT = 
						"INSERT INTO ${TABLE_EVENTS} (${COL_EVENT_TITLE}, ${COL_EVENT_THUMB}, ${COL_EVENT_CONTENT}, ${COL_EVENT_START_TIME}, ${COL_EVENT_LAST_TIME})"
					   + " VALUES (#{event_title}, #{event_thumb}, #{event_content}, #{event_start_time}, #{event_last_time})";
	
	@Insert(INSERT_EVENT)
	int registerEvent(Event event);
	
	// 이벤트 수정하기
	String UPDATE_EVENT =
			"UPDATE ${TABLE_EVENTS} SET ${COL_EVENT_TITLE} = #{event_title}, ${COL_EVENT_THUMB} = #{event_thumb}, ${COL_EVENT_CONTENT} = #{event_content}, ${COL_EVENT_START_TIME} = #{event_start_time}, ${COL_EVENT_LAST_TIME} = #{event_last_time}"
			+ " WHERE ${COL_EVENT_NO} = #{event_no}";
	
	@Update(UPDATE_EVENT)
	int updateEvent(Event event);
	
	// 이벤트 삭제하기
	String DELETE_EVENT =
			"DELETE FROM ${TABLE_EVENTS} WHERE ${COL_EVENT_NO} = #{event_no}";
	
	@Delete(DELETE_EVENT)
	int deleteEvent(int event_no);
	
	
	// 중복된 이벤트가 존재하는지 검사하기(썸네일)
	String CHECK_EVENT_BY_THUMB = 
					"SELECT * FROM ${TABLE_EVENTS} WHERE ${COL_EVENT_THUMB} = #{event_thumb}";
		
	@Select(CHECK_EVENT_BY_THUMB)
	Event selectEventByThumb(Event event);
	
	// 중복된 이벤트가 존재하는지 검사하기(내용)
	String CHECK_EVENT_BY_CONTENT = 
						"SELECT * FROM ${TABLE_EVENTS} WHERE ${COL_EVENT_CONTENT} = #{event_content}";
			
	@Select(CHECK_EVENT_BY_CONTENT)
	Event selectEventByContent(Event event);

}
