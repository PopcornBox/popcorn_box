package com.spring.pjt.service;

import java.util.List;

import com.spring.pjt.domain.Board;
import com.spring.pjt.domain.PageCriteria;

public interface BoardService {

	List<Board> select();
	Board select(int board_no);
	int insert(Board board);
	int update(Board board);
	int delete(int board_no);
	int boardListCnt();
	List<Board> select(int serachType, String searchKeyword);
	List<Board> getList(PageCriteria pcri);
	int getTotal();
}
