/**
 * 
 */
package com.zrgk.bankpolling.service;

import java.util.List;
import java.util.Vector;

import com.zrgk.bankpolling.bean.RecordInfo;
import com.zrgk.bankpolling.bean.SiteInfo;

/**
 * 
 * 
 * <p>
 * Title:UserService
 * </p>
 * <p>
 * Description: com.zrgk.bankpolling.service.UserService.java
 * </p>
 * <p>
 * Copyright: Copyright (c) 2015
 * </p>
 * <p>
 */
public interface SiteInfoService {
	/**
	 * 业务1：增加网点信息
	 * @param siteInfo
	 * @return
	 */
	public boolean addSite(SiteInfo siteInfo);
	/**
	 * 业务2：删除网点信息
	 * @param site_id
	 * @return
	 */
	public boolean delSite(String site_id);
	/**
	 * 业务3：模糊查询所有网点信息
	 * @param string
	 * @return
	 */
	public Vector[] queryAll(String string);
	/**
	 * 业务4：根据单个ID查询网点信息
	 * @param site_id
	 * @return
	 */
	public SiteInfo findById(String site_id);
	/**
	 * 业务5：显示所有网点信息
	 * @return
	 */
	public Vector[] showAll();
	/**
	 * 业务6：修改网点信息
	 * @param siteInfo
	 * @return
	 */
	public boolean updSite(SiteInfo siteInfo);
	
	/**
	 * 业务7：删除本表在其他表的外键
	 */
	public void delFK(String column,String id);
	/**
	 * 业务8：showOne
	 */
	public Vector[] showOne(String site_id);
	
}
