package com.spring.pjt.service;

import java.util.List;

import com.spring.pjt.domain.Board;

public interface BoardService {

	List<Board> select();
	Board select(int board_no);
	int insert(Board board);
}
