package com.spring.pjt.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.spring.pjt.domain.Board;
import com.spring.pjt.service.BoardService;

@Controller
@RequestMapping(value = "/board")
public class BoardController {
	
	private static final Logger log = LoggerFactory.getLogger(BoardController.class);
	
	@Autowired private BoardService boardService;
	
	@RequestMapping(value="/main", method=RequestMethod.GET)
	public void main(Model model) {
		log.info("main() 호출");
		
		List<Board> list = boardService.select();
		
		model.addAttribute("boardList", list);
		
	}
	
	@RequestMapping(value = "/insert", method = RequestMethod.GET)
	public void insert() {
		log.info("insert() GET 호출");
	}
	
	@RequestMapping(value="/insert", method = RequestMethod.POST)
	public String insert(Board board) {
		log.info("insert({}) POST 호출", board);
		
		boardService.insert(board);
		
		return "redirect:/board/main";
	}
	
	
	@RequestMapping(value = "/detail", method=RequestMethod.GET)
	public void detail (int board_no, Model model) {
		Board board = boardService.select(board_no);
		model.addAttribute("board", board);
	}
	
	@RequestMapping(value="/update", method = RequestMethod.GET)
	public void update(int board_no, Model model) {
		log.info("update(board_no={}) GET 호출", board_no);
		
		Board board = boardService.select(board_no);
		model.addAttribute("board", board);
	}
	
	@RequestMapping
	public String update(Board board) {
		log.info("update(board_no={}) POST호출", board);
		
		boardService.update(board);
		
		return "redirect:/board/main";
		
	}
	
	@RequestMapping(value = "/delete", method = RequestMethod.GET)
	public String delete(int board_no) { // 
		log.info("delete(bno={}) 호출", board_no);
		
		boardService.delete(board_no);
		
		return "redirect:/board/main";
	}
	
}
