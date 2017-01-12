/**
 * 
 */
package com.zrgk.bankpolling.service;

import java.util.List;
import java.util.Vector;

import com.zrgk.bankpolling.bean.GroupInfo;

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
public interface GroupInfoService {
	/**
	 * 业务1：添加组信息
	 * @param groupInfo
	 * @return
	 */
	public boolean addGroup(GroupInfo groupInfo);
	/**
	 * 业务2：删除组信息
	 * @param group_id
	 * @return
	 */
	public boolean delGroup(String group_id);
	/**
	 * 业务3：查询所有(模糊查询)
	 * @param string
	 * @return
	 */
	public Vector[] queryAll(String string);
	/**
	 * 业务4：根据单个id查询组信息
	 * @param group_id
	 * @return
	 */
	public GroupInfo findById(String group_id);
	/**
	 * 业务5：显示所有组信息
	 * @return
	 */
	public Vector[] showAll();
	/**
	 * 业务6：编辑/修改组信息
	 * @param groupInfo
	 * @return
	 */
	public boolean updGroup(GroupInfo groupInfo);
	/**
	 * 业务7：showOne
	 */
	public Vector[] showOne(String group_id);
	/**
	 * 业务8：显示组的信息
	 * @param group_name
	 * @return
	 */
	public GroupInfo findByName(String group_name);
	/**
	 * 业务9：异步查询所有组
	 * @return
	 */
	public List<GroupInfo> findAllGroup();
	/**
	 * 业务10：根据组名称显示对应信息
	 * @param group_name
	 * @return
	 */
	public Vector[] showByName(String group_name);
	/**
	 * 业务11：根据员工编号删除组成员（将该用户所属组置空）
	 * @param user_id
	 * @return
	 */
	public boolean delGroupMember(String user_id);
	
}
