package com.zrgk.bankpolling.util;



import com.zrgk.bankpolling.util.Page;

/**
 * 
 *<p>Title:分页服务类
 *</p>
 *<p>Description:com.it.service.PageService.java
 *</p>
 * 
 */
public class PageService {
	/**
	 * 获取当前页
	 * @param currentPage
	 * @param pagerMethod
	 * @param totalRows
	 * @return
	 */
	public Page getPage(int currentPage, String pageMethod, int totalRows) {
		Page pager = new Page(currentPage ,totalRows);
		if (pageMethod != null) {
			if (pageMethod.equals("first")) {
				pager.first();
			} else if (pageMethod.equals("previous")) {
				pager.previous();
			} else if (pageMethod.equals("next")) {
				pager.next();
			} else if (pageMethod.equals("last")) {
				pager.last();
			}
		}
		return pager;
	}
}