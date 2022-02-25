package com.spring.pjt.domain;

import org.springframework.web.util.UriComponents;
import org.springframework.web.util.UriComponentsBuilder;

public class PagingView {
	private int startPage;  // 시작 페이지
	private int endPage;  // 끝 페이지
	private boolean prev, next;  // 이전 페이지, 다음 페이지 확인
	private int totalContents;  // 전체 게시물 수
	private PageCriteria pcri;  // 현재 페이지, 페이지당 게시물 수 정보
	
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
	
	public PagingView(PageCriteria pcri, int totalContents) {
		this.pcri = pcri;
		this.totalContents = totalContents;
		
		// 끝 페이지
		this.endPage = (int) (Math.ceil(pcri.getPageNum() / 10.0)) * 10;
		
		// 시작 페이지
		this.startPage = this.endPage - 9;
		
		// 전체 마지막 페이지 계산(10단위로 안 끊어지는 경우 감안)
		int endCal = (int)(Math.ceil((totalContents * 1.0) / pcri.getContents()));
		
		if (endCal < this.endPage) {
			this.endPage = endCal;
		}
		
		// 시작 페이지값이 1보다 큰 경우 true 반환 위한 내용
		this.prev = this.startPage > 1;
		
		// 마지막 페이지값이 1보다 큰 경우 true 반환 위한 내용
		this.next = this.endPage < endCal;
	}
	
	public String makeQuery(int page) {
		UriComponents uriComponents = UriComponentsBuilder.newInstance()
														.queryParam("pageNum", page)
														.queryParam("contents", pcri.getContents())
														.build();
		
		return uriComponents.toUriString();
	}
	
	@Override
	public String toString() {
		return "PagingView [startPage=" + startPage + ", endPage=" + endPage + ", prev=" + prev + ", next=" + next
				+ ", total=" + totalContents + ", pcri=" + pcri + "]";
	}

}
