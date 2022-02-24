package com.spring.pjt.service;

import java.util.List;

import com.spring.pjt.domain.Event;

public interface EventService {
	
	List<Event> selectAll();
	Event selectByNo(int event_no);
	int registerEvent(Event event);
	int updateEvent(Event event);
	int deleteEvent(int event_no);

}
