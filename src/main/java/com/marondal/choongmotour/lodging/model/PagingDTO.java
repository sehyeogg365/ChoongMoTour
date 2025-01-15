package com.marondal.choongmotour.lodging.model;

public class PagingDTO {
	private int currPage;//현재페이지
	
	private int totalPage;//총페이지
	
	private int firstPage;//첫페이지
	
	private int lastPage;//마지막페이지
	
	private int totalData;//전체 게시물 수 
	/**
	    * 페이징 계산
	    * @param currPage 현재페이지
	    * @param totalPage 총페이지
	    * @param firstPage 첫페이지
	    * @param lastPage 마지막페이지
	    * @param totalData 총 DATA
	    */

	public PagingDTO() {}
	
	public PagingDTO(int currPage, int totalPage, int firstPage, int lastPage, int totalData) {
		super();
		this.currPage = currPage;
		this.totalPage = totalPage;
		this.firstPage = firstPage;
		this.lastPage = lastPage;
		this.totalData = totalData;
		
	}
	
	public int getCurrPage() {
		return currPage;
	}

	public void setCurrPage(int currPage) {
		this.currPage = currPage;
	}

	public int getTotalPage() {
		return totalPage;
	}

	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}

	public int getFirstPage() {
		return firstPage;
	}

	public void setFirstPage(int firstPage) {
		this.firstPage = firstPage;
	}

	public int getLastPage() {
		return lastPage;
	}

	public void setLastPage(int lastPage) {
		this.lastPage = lastPage;
	}

	public int getTotalData() {
		return totalData;
	}

	public void setTotalData(int totalData) {
		this.totalData = totalData;
	}
}
