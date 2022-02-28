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
import com.spring.pjt.domain.PageCriteria;
import com.spring.pjt.domain.PagingView;
import com.spring.pjt.service.BoardReplyService;
import com.spring.pjt.service.BoardService;

@Controller
@RequestMapping(value = "/board")
public class BoardController {
	
	private static final Logger log = LoggerFactory.getLogger(BoardController.class);
	
	@Autowired private BoardService boardService;
	@Autowired private BoardReplyService boardReplyService;
	
	@RequestMapping(value="/main", method=RequestMethod.GET)
	public void main(Model model, PageCriteria pcri) {
		log.info("main() + pcri :{} 호출",pcri);
	
		List<Board> list = boardService.pagingList(pcri);
		model.addAttribute("boardList", list);
		
		int totalContents = boardService.getTotalContents();
		PagingView pagingView = new PagingView(pcri, totalContents);
		
		model.addAttribute("pagingView",pagingView);
		
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
	
	@RequestMapping(value = "/notice", method = RequestMethod.GET)
	public void notice() {
		log.info("notice() GET 호출");
	}
	
	@RequestMapping(value = "/notice", method = RequestMethod.POST)
	public void notice(Board board) {
		log.info("notice() POST 호출");
		board.getBoard_mode();
		boardService.insert(board);
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
	
	@RequestMapping(value="/update", method = RequestMethod.POST)
	public String update(Board board) {
		log.info("update(board_no={}) POST호출", board);
		
		boardService.update(board);
		
		return "redirect:/board/main";
		
	}
	
	@RequestMapping(value = "/delete", method = RequestMethod.GET)
	public String delete(int board_no) { // 
		log.info("delete(board_no={}) 호출", board_no);
		boardReplyService.boardNoDelete(board_no);
		boardService.delete(board_no);

		return "redirect:/board/main";
		
	}
	
	@RequestMapping(value = "/search", method = RequestMethod.GET)
	public String search(int type, String keyword, Model model) {
		log.info("search(type={}, keyword={})", type, keyword);
		
		List<Board> list = boardService.select(type, keyword);
		model.addAttribute("boardList", list);
		
		return "board/main";
		
	}
	
}
