package com.spring.pjt.persistence;

import java.util.List;

import com.spring.pjt.domain.Event;

public interface EventDao {
	List<Event> selectAllEvent();
	Event selectEventByNo(int event_no);
	int registerEvent(Event event);
	int updateEvent(Event event);
	int deleteEvent(int event_no);
	Event selectEventByThumb(Event event);
	Event selectEventByContent(Event event);
}

