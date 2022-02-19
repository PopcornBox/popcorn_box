package com.spring.pjt.domain;

public class PageCriteria {
	private int PageNum;  // 현재 페이지 넘버
	private int Contents;  // 전체 게시글 수
//	----- ↑계산에 필요한 내용 -----
	
	public PageCriteria() {
		this(1, 10);
	}
	
	public PageCriteria(int crnPageNum, int totalContents) {
		this.PageNum = PageNum;
		this.Contents = Contents;
	}

	public int getPageNum() {
		return PageNum;
	}

	public void setPageNum(int pageNum) {
		PageNum = pageNum;
	}

	public int getContents() {
		return Contents;
	}

	public void setContents(int contents) {
		Contents = contents;
	}
	
	@Override
	public String toString() {
		return String.format("PageCriteria {PageNum:%d, Contents:%d}", this.PageNum, this.Contents);
	}

}
