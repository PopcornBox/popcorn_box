package com.spring.pjt.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.pjt.domain.EventReply;
import com.spring.pjt.mapper.EventReplyMapper;

@Repository
public class EventReplyDaoImpl implements EventReplyDao {

	private static final Logger log = LoggerFactory.getLogger(EventReplyDaoImpl.class);
	@Autowired private EventReplyMapper mapper;
	
	@Override
	public int insert(EventReply eventReply) {
		log.info("insert(eventReply:{})", eventReply);
		return mapper.insertEventReply(eventReply);
	}
	
	@Override
	public EventReply existEventReply(EventReply eventReply) {
		log.info("existEventReply(eventReply:{})", eventReply);
		return mapper.checkEventReply(eventReply);
	}
	
	@Override
	public List<EventReply> readAllEventReplies(Integer event_no) {
		log.info("readAllEventReplies(event_no:{})", event_no);
		
		return mapper.readAllEventReplies(event_no);
	}
	
	@Override
	public List<EventReply> readTenEventReplies(Integer event_no, Integer viewpage) {
		int startpage = (viewpage * 10) - 9;
		int lastpage = (viewpage * 10);
		log.info("readATenEventReplies(event_no:{}, startpage:{}, lastpage:{})", event_no, startpage, lastpage);
		
		Map<String, Object> map = new HashMap<>();
		map.put("event_no", event_no);
		map.put("startpage", startpage);
		map.put("lastpage", lastpage);
		
		if (viewpage > 1) {
			return mapper.readTenEventReplies2(map);
		} else {
			return mapper.readTenEventReplies1(map);
		}
	}
	
	@Override
	public int delete(Integer event_reply_no) {
		log.info("delete(event_reply_no:{})", event_reply_no);
		return mapper.deleteEventReply(event_reply_no);
	}
	
	@Override
	public int deleteAllOnEvent(int event_no) {
		log.info("deleteAllOnEvent(event_no:{})", event_no);
		return mapper.deleteAllEventReply(event_no);

	}
	
	@Override
	public int update(EventReply eventReply) {
		log.info("update(eventReply:{})", eventReply);
		return mapper.updateEventReply(eventReply);
	}
	
}
