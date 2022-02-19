package com.spring.pjt.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.spring.pjt.domain.Board;
import com.spring.pjt.domain.PageCriteria;

@Mapper
public interface BoardMapper {
	List<Board> getList();
	List<Board>	pagingList(PageCriteria pcri);
	int getTotalList();  // 전체 게시글 확인 용도
}
