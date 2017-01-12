/**
 * 
 */
package com.zrgk.bankpolling.bean;

/**
 * 
 * <p>
 * Title:角色-权限表
 * </p>
 * <p>
 * Description: com.zrgk.bankpolling.bean.PriRoleInfo.java
 * </p>
 * <p>
 * Copyright: Copyright (c) 2015
 * </p>
 * <p>
 * </p>
 * 
 * @author 
 */
public class PriRoleInfo {
	
	/**
	 * 角色-权限属性
	 */
	private String role_id;//角色标号
	private String pri_id;//权限编号
	/**
	 * get/set方法
	 */
	/**
	 * @return the role_id
	 */
	public String getRole_id() {
		return role_id;
	}
	/**
	 * @param role_id the role_id to set
	 */
	public void setRole_id(String role_id) {
		this.role_id = role_id;
	}
	/**
	 * @return the pri_id
	 */
	public String getPri_id() {
		return pri_id;
	}
	/**
	 * @param pri_id the pri_id to set
	 */
	public void setPri_id(String pri_id) {
		this.pri_id = pri_id;
	}
	/**
	 * 无参数构造方法
	 *
	 */
	public PriRoleInfo() {
		super();
		// TODO Auto-generated constructor stub
	}
	/**
	 * 一参数构造方法
	 * @param pri_id
	 */
	public PriRoleInfo(String pri_id) {
		super();
		this.pri_id = pri_id;
	}
	/**
	 * 全参构造方法
	 * @param role_id
	 * @param pri_id
	 */
	public PriRoleInfo(String role_id, String pri_id) {
		super();
		this.role_id = role_id;
		this.pri_id = pri_id;
	}
	/**
	 * 重写toString方法
	 */
	@Override
	public String toString() {
		return "PriRoleInfo [role_id=" + role_id + ", pri_id=" + pri_id + "]";
	}
	
	
	
}
