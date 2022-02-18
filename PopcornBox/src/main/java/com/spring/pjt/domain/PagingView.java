package com.spring.pjt.domain;

public class PagingView {
	private int startPage;
	private int endPage;
	private boolean prev, next;
	private int totalContents;
	private PageCriteria pcri;
	
//	----------- 계산에 이용하는 내용 ------------------
	
	public int getStartPage() {
		return startPage;
	}

	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}

	public int getEndPage() {
		return endPage;
	}

	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}

	public boolean isPrev() {
		return prev;
	}

	public void setPrev(boolean prev) {
		this.prev = prev;
	}

	public boolean isNext() {
		return next;
	}

	public void setNext(boolean next) {
		this.next = next;
	}

	public int getTotalContents() {
		return totalContents;
	}

	public void setTotalContents(int totalContents) {
		this.totalContents = totalContents;
	}

	public PageCriteria getPcri() {
		return pcri;
	}

	public void setPcri(PageCriteria pcri) {
		this.pcri = pcri;
	}
	
	public PagingView(PageCriteria p_criteria, int totalContents) {
		this.pcri = p_criteria;
		this.totalContents = totalContents;
		
		this.endPage = (int) (Math.ceil(p_criteria.getPageNum() / 10.0)) * 10;
		this.startPage = this.endPage - 9;
		
		int endCal = (int) (Math.ceil((totalContents * 1.0) / p_criteria.getContents()));
		
		if (endCal < this.endPage) {
			this.endPage = endCal;
		}
		this.prev = this.startPage > 1;
		this.next = this.endPage < endCal;
	}
	
	@Override
	public String toString() {
		return "PagingView [startPage=" + startPage + ", endPage=" + endPage + ", prev=" + prev + ", next=" + next
				+ ", total=" + totalContents + "]";
	}

}
