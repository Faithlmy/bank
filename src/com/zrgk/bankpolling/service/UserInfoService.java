/**
 * 
 */
package com.zrgk.bankpolling.service;

import java.util.List;
import java.util.Vector;

import com.zrgk.bankpolling.bean.RecordInfo;
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
 * <p>
 */
public interface UserInfoService {
	/**
	 * 业务1：登录验证，返回查找到的对象数组
	 * @param user_id
	 * @param user_pwd
	 * @return
	 */
	public List<UserInfo> confirm(String user_id,String user_pwd);
	
	/**
	 * 业务4：添加用户信息
	 * @param userInfo
	 * @return
	 */
	public boolean addUser(UserInfo userInfo);
	/**
	 * 业务3：删除用户信息
	 * @param user_id
	 * @return
	 */
	public boolean delUser(String user_id);
	/**
	 * 业务4：模糊查找所有用户(包括模糊查询),返回Vector向量
	 * @param string
	 * @return
	 */
	public Vector[] queryAll(String string);
	/**
	 * 业务5：查询单个用户信息返回userinfo对象
	 * @param string
	 * @return
	 */
	public UserInfo findById(String user_id);
	/**
	 * 业务6：显示所有用户信息，返回Vector向量
	 * @return
	 */
	public Vector[] showAll();
	/**
	 * 业务7：修改用户表的【非主键信息】
	 * @param userInfo
	 * @return
	 */
	public boolean updUser(UserInfo userInfo);
	/**
	 * 业务16：修改用户表的【外键信息】
	 * @param column
	 * @param id
	 * @return
	 */
	public boolean updFK(String column,String value,String id);
	/**
	 * 业务8：显示所有员工岗位信息，返回Vector向量
	 */
	public Vector[] showAllEmployee();
	/**
	 * 业务9：模糊查询某种角色类型的岗位信息
	 * @param role_type
	 * @return
	 */
	public Vector[] queryAllEmployee(String string);
	/**
	 * 业务10：修改员工任务数量
	 */
	public boolean updTaskCount(UserInfo userInfo);
	/**
	 * 业务11：显示当前用户信息
	 * @param user_name
	 * @return
	 */
	public Vector[] showOneUser(String user_name);
	/**
	 * 业务12：修改用户密码
	 * @param user_pwd
	 * @return
	 */
	public boolean updPwd(String user_id,String pwd1,String new_pwd);
	/**
	 * 业务13：查询多条记录（根据外键）
	 */
	public List<UserInfo> queryFK(String column,String id);	
	/**
	 * 业务14：删除本表外键
	 */
	public void delFK(String column,String id);
	/**
	 * 业务15：分配角色时加载所有用户名
	 * @return
	 */
	public List<UserInfo> findAllUser();
	/**
	 * 业务17：异步刷新时，查找到对应的编号
	 * @param user_name
	 * @return
	 */
	public UserInfo findByName(String user_name);
	/**
	 * 业务18：删除部门成员（或组员）时将单个用户的depart_id（或group_id）置空
	 * @param column
	 * @param id
	 */
	void delFK2(String column, String id);
	
}
