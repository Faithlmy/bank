/**
 * 
 */
package com.zrgk.bankpolling.service;

import java.util.List;
import java.util.Vector;

import com.zrgk.bankpolling.bean.PrivilegeInfo;
import com.zrgk.bankpolling.bean.UserInfo;

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
 */
public interface PrivilegeInfoService {
	/**
	 * 业务1：显示该系统所有的权限(模糊查询)
	 * @param pri_name
	 * @return
	 */
	public List<PrivilegeInfo> queryAll(String pri_name);		
	/**
	 * 业务2：添加权限
	 * @param privilegeInfo
	 * @return
	 */
	public boolean addPri(PrivilegeInfo privilegeInfo);
	/**
	 * 业务3：删除权限
	 * @param pri_id
	 * @return
	 */
	public boolean delPri(String pri_id);		
	/**
	 * 业务4：查询某个权限的所有信息
	 * @param p_id
	 * @return
	 */
	public PrivilegeInfo findById(String pri_id);
	/**
	 * 业务5：修改权限
	 * @param privilegeInfo
	 * @return
	 */
	public boolean updPri(PrivilegeInfo privilegeInfo);		
	/**
	 * 业务6：找出某个权限的所有下级权限
	 * @param p_id
	 * @return
	 */
	public List<PrivilegeInfo> getChildPri(String pri_id);
	/**
	 * 业务7：查询本系统的所有权限
	 * @return
	 */
	public List<PrivilegeInfo> showAll();
	/**
	 * 业务8：showOne
	 */
	public PrivilegeInfo showOne(String pri_id);
	/**
	 * 业务9：显示登录用户的权限
	 * @return
	 */
	public List<PrivilegeInfo> showP(String user_name);
	
}
