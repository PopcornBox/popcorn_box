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

import com.spring.pjt.domain.BoardReply;
import com.spring.pjt.service.BoardReplyService;

@RestController // REST 서비스를 지원하는 컨트롤러 
//RestController 클래스의 모든 메서드들이 리턴하는 값은 view(JSP)를 찾기 위한 문자열이 아니라 
//응답(response)으로 클라이언트에게 전달되는 데이터.

@RequestMapping(value = "/board_replies")
public class BoardReplyRestController {
	
	private static final Logger log = LoggerFactory.getLogger(BoardReplyRestController.class);
	
	@Autowired	
	private BoardReplyService boardReplyService;
	
	@RequestMapping(value = "/all/{board_no}", method = RequestMethod.GET)
	public ResponseEntity<List<BoardReply>> readAllBoardReplies(@PathVariable(name ="board_no") Integer board_no) {
		
		log.info("readAllReplies(board_no={})", board_no);
		List<BoardReply> boardReplyList = boardReplyService.slelct(board_no);
//		log.info(boardReplyList.toString());
		
		ResponseEntity<List<BoardReply>> entity = new ResponseEntity<List<BoardReply>>(boardReplyList, HttpStatus.OK);
		
		return entity;
	}
	
	
	@RequestMapping(method = RequestMethod.POST)
	public ResponseEntity<Integer> createBoardReply(@RequestBody BoardReply boardReply) {
		log.info("createBoardReply({})", boardReply);
		
		int result = boardReplyService.insert(boardReply);
		ResponseEntity<Integer> entity = new ResponseEntity<Integer>(result, HttpStatus.OK);
		
		return entity;
	}
	
		
	@RequestMapping(value="/{board_reply_no}", method = RequestMethod.PUT)
	public ResponseEntity<Integer> updateBoardReply(
			@PathVariable(name="board_reply_no") Integer board_reply_no,
			@RequestBody BoardReply boardReply) {
		log.info("updateBoardReply(board_reply_no={}, boardReply={})", board_reply_no, boardReply);
		boardReply.setBoard_reply_no(board_reply_no);
		
		int result = boardReplyService.update(boardReply);
		
		ResponseEntity<Integer> entity = new ResponseEntity<Integer>(result, HttpStatus.OK);
		
		return entity;
	}
			
	@RequestMapping(value="/{board_reply_no}", method = RequestMethod.DELETE)
	public ResponseEntity<Integer> deleteBoardReply(@PathVariable(name="board_reply_no") Integer board_reply_no){
		log.info("deleteBoardReply(board_reply_no={})", board_reply_no);
		
		int result = boardReplyService.delete(board_reply_no);
		
		ResponseEntity<Integer> entity = new ResponseEntity<Integer>(result, HttpStatus.OK);
		
		return entity;
		
	}

}