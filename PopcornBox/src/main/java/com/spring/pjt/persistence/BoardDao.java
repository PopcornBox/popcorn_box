package com.spring.pjt.persistence;

import java.util.List;

import com.spring.pjt.domain.Board;
import com.spring.pjt.domain.PageCriteria;

public interface BoardDao {

	List<Board> read();
	Board read(int board_no);
	int create(Board board);
	int update(Board board);
	int UpdateViewCnt(int board_no);

	int delete(int board_no);
	List<Board> read(int type, String keyword);
	int updateBoardReplyCnt(int board_no, int increase);
	
}
