package com.spring.pjt.service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.pjt.domain.Event;
import com.spring.pjt.persistence.EventDao;

@Service
public class EventServiceImpl implements EventService {
	
	private static final Logger log = LoggerFactory.getLogger(EventServiceImpl.class);
	
	@Autowired private EventDao eventDao;

	@Override
	public List<Event> selectAll() {
		log.info("selectAll() 호출");
		
		return eventDao.selectAllEvent();
	}
	
	@Override
	public Event selectByNo(int event_no) {
		log.info("selectByNo(event_no:{}) 호출", event_no);
		return eventDao.selectEventByNo(event_no);
	}
	
	@Override
	public int registerEvent(Event event) {
		log.info("registerEvent(event:{}) 호출", event);
		// 중복 체크
		Event event1 = eventDao.selectEventByThumb(event);
		Event event2 = eventDao.selectEventByContent(event);
		
		if (event1 != null || event2 != null) {
			return 0;
		}
		
		return eventDao.registerEvent(event);
	}
	
	@Override
	public int updateEvent(Event event) {
		log.info("updateEvent(event:{}) 호출", event);
		// 중복 체크
		Event event1 = eventDao.selectEventByThumb(event);
		Event event2 = eventDao.selectEventByContent(event);
		
		if (event1 != null) {
			if (event1.getEvent_no() != event.getEvent_no()) {
				return 0;
			} else {
				if (event2.getEvent_no() != event.getEvent_no()) {
					return 0;
				} else {
					return eventDao.updateEvent(event);
				}
			}
		} else {
			if (event2.getEvent_no() != event.getEvent_no()) {
				return 0;
			} else {
				return eventDao.updateEvent(event);
			}
		}
	}
	
	@Override
	public int deleteEvent(int event_no) {
		log.info("deleteEvent(event_no:{}) 호출", event_no);
		return eventDao.deleteEvent(event_no);
	}
}

