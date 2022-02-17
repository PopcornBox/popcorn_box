package com.spring.pjt.service;

import java.util.List;

import com.spring.pjt.domain.EventReply;

public interface EventReplyService {

	int insert(EventReply eventReply);

	EventReply checkEventReplyExist(EventReply eventReply);

	List<EventReply> readAllEventReplies(Integer event_no);
	
	List<EventReply> readTenEventReplies(Integer event_no, Integer viewpage);

	int delete(Integer event_reply_no);
	
	int deleteAllOnEvent(int event_no);

	int update(EventReply eventReply);
}