/**
 * 
 */
package com.zrgk.bankpolling.service;

import java.util.List;
import java.util.Vector;

import com.zrgk.bankpolling.bean.PriRoleInfo;
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
public interface PriRoleInfoService {
	/**
	 * 业务1:增加权限-角色信息
	 * @param priRoleInfo
	 * @return
	 */
	public boolean addPriRole(PriRoleInfo priRoleInfo);
	/**
	 * 业务2:删除权限-角色信息
	 * @param priRoleInfo
	 * @return
	 */
	public boolean delPriRole(String column,String string);
	/**
	 * 业务3:模糊查询权限-角色信息
	 * @param string
	 * @return
	 */
	public List<PriRoleInfo> queryAll(String string);
	/**
	 * 业务4:根据role_id查询单个权限-角色信息
	 * @param role_id
	 * @return
	 */
	public PriRoleInfo findById(String role_id);
	/**
	 * 业务5:修改权限-角色信息
	 * @param priRoleInfo
	 * @return
	 */
	public boolean updPriRole(PriRoleInfo priRoleInfo);

}
