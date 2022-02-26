package com.spring.pjt.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.spring.pjt.domain.EventReply;
import com.spring.pjt.service.EventReplyService;

@RestController // REST 서비스를 지원하는 콘트롤러 
//RestController 클래스의 모든 메서드들이 리턴하는 값은 view(JSP)를 찾기 위한 문자열이 아니라 
//응답(response)으로 클라이언트에게 전달되는 데이터.

@RequestMapping(value = "/event_replies")
public class EventReplyRestController {
	
	private static final Logger log = LoggerFactory.getLogger(EventReplyRestController.class);
	
	@Autowired private EventReplyService eventReplyService;
	
	@RequestMapping(value = "/all/{event_no}", method = RequestMethod.GET)
	public ResponseEntity<List<EventReply>> readAllEventReplies(@PathVariable(name = "event_no") Integer event_no) {
			log.info("readAllEventReplies(event_no:{})", event_no);
			
			List<EventReply> eventReplyList = eventReplyService.readAllEventReplies(event_no);
			
			ResponseEntity<List<EventReply>> entity = new ResponseEntity<>(eventReplyList, HttpStatus.OK);
			
			return entity;
	}
	
	@RequestMapping(value = "/all/{event_no}/{viewpage}", method = RequestMethod.GET)
	public ResponseEntity<List<EventReply>> readTenEventReplies(@PathVariable(name = "event_no") Integer event_no, @PathVariable(name = "viewpage") Integer viewpage) {
			log.info("readTenEventReplies(event_no:{}, viewpage:{})", event_no, viewpage);
			
			List<EventReply> eventReplyList = eventReplyService.readTenEventReplies(event_no, viewpage);
			
			ResponseEntity<List<EventReply>> entity = new ResponseEntity<>(eventReplyList, HttpStatus.OK);
			
			return entity;
	}

	
	
		
	@RequestMapping(method = RequestMethod.POST)
	public ResponseEntity<Integer> createEventReply(@RequestBody EventReply eventReply) {
		// @RequestBody: 클라이언트가 보내는 데이터가 요청 패킷 본문(body)에 포함되어 있다고 선언하는 어노테이션.
	    // 요청 시 보내는 데이터가 query string에 포함되어 있지 않고, form data도 아닌 경우에 사용.
		log.info("createEventReply(eventReply:{})", eventReply);
		
		// 이미 해당 이벤트에 댓글을 작성했는 지 검사
	    EventReply eventReplyFromDb = eventReplyService.checkEventReplyExist(eventReply);
		
	    int result = 0;
	    
	    if (eventReplyFromDb == null) {
	    	result = eventReplyService.insert(eventReply);
	    }
		
        ResponseEntity<Integer> entity = new ResponseEntity<>(result, HttpStatus.OK);
		
		return entity;
	}

	@RequestMapping(value = "/{event_reply_no}", method = RequestMethod.DELETE)
	public ResponseEntity<Integer> deleteEventReply(@PathVariable(name = "event_reply_no") Integer event_reply_no) {
		log.info("deleteEventReply(event_reply_no={})", event_reply_no);
		
		int result = eventReplyService.delete(event_reply_no);
		
		ResponseEntity<Integer> entity = new ResponseEntity<>(result, HttpStatus.OK);
		
		return entity;
	}
	
	@RequestMapping(value = "/{event_reply_no}", method = RequestMethod.PUT)
	public ResponseEntity<Integer> updateEventReply(
			@PathVariable(name = "event_reply_no") Integer event_reply_no,
			@RequestBody EventReply eventReply) {
		log.info("updateEventReply(event_reply_no={}, event_reply_content={})", event_reply_no, eventReply.getEvent_reply_content());
		
		eventReply.setEvent_reply_no(event_reply_no); // PathVariable 값으로 Reply 인스턴스의 rno 값(수정할 댓글 번호)를 설정.
		
		int result = eventReplyService.update(eventReply);
		
		ResponseEntity<Integer> entity = new ResponseEntity<>(result, HttpStatus.OK);
		
		return entity;
	}
	
	@RequestMapping(value = "/choose/{winner_number}/{event_no}", method = RequestMethod.GET)
	public ResponseEntity<List<String>> chooseWinners(@PathVariable(name = "winner_number") Integer winner_number, @PathVariable(name = "event_no") Integer event_no) {
			log.info("chooseWinners(winner_no:{}, event_no:{})", winner_number, event_no);
			
			List<String> winnerList = eventReplyService.chooseWinner(event_no, winner_number);
			
			ResponseEntity<List<String>> entity = new ResponseEntity<>(winnerList, HttpStatus.OK);
			
			return entity;
	}
}

