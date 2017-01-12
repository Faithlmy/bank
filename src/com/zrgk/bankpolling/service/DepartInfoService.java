/**
 * 
 */
package com.zrgk.bankpolling.service;

import java.util.List;
import java.util.Vector;

import com.zrgk.bankpolling.bean.DepartInfo;

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
public interface DepartInfoService {
	/**
	 * 业务1：添加部门信息
	 * @param departInfo
	 * @return
	 */
	public boolean addDepart(DepartInfo departInfo);
	/**
	 * 业务2：删除部门信息
	 * @param depart_id
	 * @return
	 */
	public boolean delDepart(String depart_id);
	/**
	 * 业务3：修改部门信息
	 * @param departInfo
	 * @return
	 */
	public boolean updDepart(DepartInfo departInfo);
	/**
	 * 业务4：模糊查询部门信息
	 * @param depart_name
	 * @return
	 */
	public Vector[] queryAll(String string);
	/**
	 * 业务5：显示所有部门信息
	 * @return
	 */
	public Vector[] showAll();
	/**
	 * 业务6：显示单个部门的详细信息
	 * @param depart_id
	 * @return
	 */
	public DepartInfo findById(String depart_id);
	/**
	 * 业务7：删除本表在其他表的外键
	 */
	public void delFK(String column,String id);
	/**
	 * 业务8：显示单个部门信息
	 */
	public Vector[] showOne(String depart_id);
	/**
	 * 业务9:显示单个部门信息
	 * @param depart_name
	 * @return
	 */
	public DepartInfo findByName(String depart_name);
	/**
	 * 业务10：异步刷新所有部门信息
	 * @return
	 */
	public List<DepartInfo> showAllDepart();
	/**
	 * 业务11：根据部门名称显示对应信息
	 * @return
	 */
	public Vector[] showByName(String depart_name);
	/**
	 * 业务12：从部门中移除成员
	 *//*
	public boolean removeEmployee(String user_id);*/
}
