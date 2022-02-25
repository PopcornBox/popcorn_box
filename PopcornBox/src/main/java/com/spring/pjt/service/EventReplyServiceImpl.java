package com.spring.pjt.service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.pjt.domain.EventReply;
import com.spring.pjt.persistence.EventReplyDao;

@Service
public class EventReplyServiceImpl implements EventReplyService {

	private static final Logger log = LoggerFactory.getLogger(EventReplyServiceImpl.class);
	@Autowired EventReplyDao eventReplyDao;
	
	@Override
	public int insert(EventReply eventReply) {
		log.info("insert(eventReply:{}) 호출", eventReply);
		
		return eventReplyDao.insert(eventReply);
	}
	
	@Override
	public EventReply checkEventReplyExist(EventReply eventReply) {
		log.info("checkEventReplyExist(eventReply:{}) 호출", eventReply);
		return eventReplyDao.existEventReply(eventReply);
	}
	
	@Override
	public List<EventReply> readAllEventReplies(Integer event_no) {
		log.info("readAllEventReplies(event_no:{}) 호출", event_no);
		return eventReplyDao.readAllEventReplies(event_no);
	}
	
	@Override
	public List<EventReply> readTenEventReplies(Integer event_no, Integer viewpage) {
		log.info("readTenEventReplies(event_no:{}, viewpage:{}) 호출", event_no, viewpage);
		return eventReplyDao.readTenEventReplies(event_no, viewpage);
	}
	
	@Override
	public int delete(Integer event_reply_no) {
		log.info("delete(event_reply_no:{}) 호출", event_reply_no);
		return eventReplyDao.delete(event_reply_no);
	}
	
	@Override
	public int deleteAllOnEvent(int event_no) {
		log.info("deleteAllOnEvent(event_no:{}) 호출", event_no);
		return eventReplyDao.deleteAllOnEvent(event_no);
	}
	
	@Override
	public int update(EventReply eventReply) {
		log.info("update(eventReply:{}) 호출", eventReply);
		return eventReplyDao.update(eventReply);
	}
	
	@Override
	public List<String> chooseWinner(int event_no, int winner_number) {
		log.info("chooseWinner(event_no:{}, winner_number:{}) 호출", event_no, winner_number);
		return eventReplyDao.chooseWinner(event_no, winner_number);
	}

}

