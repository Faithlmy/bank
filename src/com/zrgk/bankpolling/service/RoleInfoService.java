/**
 * 
 */
package com.zrgk.bankpolling.service;

import java.util.List;
import java.util.Vector;

import com.zrgk.bankpolling.bean.RoleInfo;

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
public interface RoleInfoService {
	/**
	 * 业务1：增加角色信息
	 * @param roleInfo
	 * @return
	 */
	public boolean addRole(RoleInfo roleInfo,String pri_id);
	/**
	 * 业务2：删除角色信息
	 * @param role_id
	 * @return
	 */
	public boolean delRole(String role_id);
	
	/**
	 * 业务4：通过id查询某个角色的信息
	 * @param role_id
	 * @return
	 */
	public RoleInfo findById(String role_id); 
	/**
	 * 业务5：显示所有角色信息
	 * @return
	 */
	public List<RoleInfo> showAll();
	/**
	 * 业务6：更新角色信息
	 * @param roleInfo
	 * @return
	 */
	public boolean updRole(RoleInfo roleInfo);
	/**
	 * 业务7：给用户分配角色
	 * @return
	 */
	public boolean  role2user(String role_id,String user_id);
	/**
	 * 业务8：依据role_id找到role_type
	 * @param role_type
	 * @return
	 */
	public RoleInfo findByName(String role_type);

}
