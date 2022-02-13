package com.spring.pjt.persistence;

import java.util.List;

import com.spring.pjt.domain.Board;

public interface BoardDao {

	List<Board> read();
	Board read(int board_no);
}
