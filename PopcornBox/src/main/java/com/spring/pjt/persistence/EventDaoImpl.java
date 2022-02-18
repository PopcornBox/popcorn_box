package com.spring.pjt.persistence;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.pjt.domain.Event;
import com.spring.pjt.mapper.EventMapper;

@Repository
public class EventDaoImpl implements EventDao {
	
	private static final Logger log = LoggerFactory.getLogger(EventDaoImpl.class);
	@Autowired private EventMapper mapper;
	
	@Override
	public List<Event> selectAllEvent() {
		log.info("selectAllEvent() 호출");
		return mapper.selectAllEvent();
	}
	
	@Override
	public Event selectEventByNo(int event_no) {
		log.info("selectEventByNo(event_no: {}) 호출", event_no);
		return mapper.selectEventByNo(event_no);
	}

	@Override
	public int registerEvent(Event event) {
		log.info("registerEvent(event: {}) 호출", event);
		return mapper.registerEvent(event);
	}
	
	@Override
	public int updateEvent(Event event) {
		log.info("updateEvent(event: {}) 호출", event);
		return mapper.updateEvent(event);
	}
	
	@Override
	public int deleteEvent(int event_no) {
		log.info("deleteEvent(event_no: {}) 호출", event_no);
		return mapper.deleteEvent(event_no);
	}
	
	@Override
	public Event selectEventByThumb(Event event) {
		log.info("selectEventByThumb(event: {}) 호출", event);
		return mapper.selectEventByThumb(event);
	}
	
	@Override
	public Event selectEventByContent(Event event) {
		log.info("selectEventByContent(event: {}) 호출", event);
		return mapper.selectEventByContent(event);
	}
}
