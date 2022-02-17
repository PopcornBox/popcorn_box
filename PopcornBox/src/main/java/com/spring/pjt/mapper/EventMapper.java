package com.spring.pjt.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

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

}
