package com.spring.pjt.persistence;

import java.util.List;

import com.spring.pjt.domain.EventReply;

public interface EventReplyDao {
	int insert(EventReply eventReply);

	EventReply existEventReply(EventReply eventReply);

	List<EventReply> readAllEventReplies(Integer event_no);

	int delete(Integer event_reply_no);
	
	int deleteAllOnEvent(int event_no);

	int update(EventReply eventReply);

	List<EventReply> readTenEventReplies(Integer event_no, Integer viewpage);

}