package com.spring.pjt.domain;

public class PageCriteria {
	private int pageNum;  // 현재 페이지 넘버
	private int contents;  // 페이지 당 게시글 숫자
//	----- ↑계산에 필요한 내용 -----
	
	// 기본 세팅(현재 페이지 : 1 , 페이지 당 게시글 15개)
	public PageCriteria() {
		this(1, 15);
	}
	
	public PageCriteria(int pageNum, int contents) {
		this.pageNum = pageNum;
		this.contents = contents;
	}

	public int getPageNum() {
		return pageNum;
	}

	public void setPageNum(int pageNum) {
		this.pageNum = pageNum;
	}

	public int getContents() {
		return contents;
	}

	public void setContents(int contents) {
		this.contents = contents;
	}
	
	@Override
	public String toString() {
		return "Criteria [pageNum = " + pageNum + ", contents = " + contents + "]";
	}

}
