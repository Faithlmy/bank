package com.zrgk.bankpolling.util;

import java.io.Serializable;

/**
 * 
 * @Title:分页实体类
 *
 * @Description:com.it.util.Pager.java
 *
 * 
 *
 * 
 */
public class Page implements Serializable {
	private int totalRows; // 总记录条数
	private int pageSize = 20; // 每页显示记录数
	private int currentPage; //当前页
	private int totalPages; //总页数
	private int startRow; //每页起始行
	/**
	 * 无参构造方法
	 */
	public Page() {
		currentPage = 1;
	}
	/**
	 * 5参构造方法
	 * @param totalRows
	 * @param pageSize
	 * @param currentPage
	 * @param totalPages
	 * @param startRow
	 */
	public Page(int totalRows, int pageSize, int currentPage, int totalPages,
			int startRow) {
		super();
		this.totalRows = totalRows;
		this.pageSize = pageSize;
		this.currentPage = currentPage;
		this.totalPages = totalPages;
		this.startRow = startRow;
	}

	/**
	 * 
	 * @param currentPage
	 */
	public Page(int currentPage) {
		this.currentPage = currentPage;
	}
	/**
	 * 两参构造方法
	 * @param currentPage
	 * @param _totalRows
	 */
	public Page(int currentPage,int _totalRows) {
		
		totalRows = _totalRows;
		totalPages = totalRows / pageSize;
		if(currentPage>totalPages){
			this.currentPage = totalPages;
		}else if(currentPage<1){
			this.currentPage = 1;
		}else{
			this.currentPage = currentPage;
		}
		int mod = totalRows % pageSize;
		if (mod > 0) {
			totalPages++;
		}
		startRow = 0;
	}

	/**
	 * get/set方法
	 * @return
	 */
	/**
	 * @return the totalRows
	 */
	public int getTotalRows() {
		return totalRows;
	}

	/**
	 * @param totalRows the totalRows to set
	 */
	public void setTotalRows(int totalRows) {
		this.totalRows = totalRows;
	}

	/**
	 * @return the pageSize
	 */
	public  int getPageSize() {
		return pageSize;
	}

	/**
	 * @param pageSize the pageSize to set
	 */
	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	/**
	 * @return the currentPage
	 */
	public  int getCurrentPage() {
		return currentPage;
	}

	/**
	 * @param currentPage the currentPage to set
	 */
	public  void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}

	/**
	 * @return the totalPages
	 */
	public int getTotalPages() {
		return totalPages;
	}

	/**
	 * @param totalPages the totalPages to set
	 */
	public void setTotalPages(int totalPages) {
		this.totalPages = totalPages;
	}

	/**
	 * @return the startRow
	 */
	public int getStartRow() {
		return startRow;
	}

	/**
	 * @param startRow the startRow to set
	 */
	public void setStartRow(int startRow) {
		this.startRow = startRow;
	}
	

	/**
	 * 首页
	 */
	public void first() {
		currentPage = 1;
		startRow = 0;
	}



	/**
	 * 上一页
	 */
	public void previous() {
		if (currentPage == 1) {
			return;
		}else{
		currentPage--;
		}
		startRow = (currentPage - 1) * pageSize;
	}

	/**
	 * 下一页
	 */
	public void next() {
		if (currentPage < totalPages) {
			currentPage++;
		}
		startRow = (currentPage - 1) * pageSize;
	}

	/**
	 * 尾页
	 */
	public void last() {
		currentPage = totalPages;
		startRow = (currentPage - 1) * pageSize;
	}
	/**
	 * 刷新
	 * @param _currentPage
	 */
	public void refresh(int _currentPage) {
		currentPage = _currentPage;
		if (currentPage > totalPages) {
			last();
		}
	}
	public void go(int a){
		if(a>totalPages){
			this.currentPage = totalPages;
		} else if(a<1){
			this.currentPage = 1;
		} else {
			currentPage = a;
		}
		
		startRow=(currentPage-1 )*pageSize;
	}
}
