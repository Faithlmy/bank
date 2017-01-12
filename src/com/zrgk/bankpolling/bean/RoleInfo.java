/**
 * 
 */
package com.zrgk.bankpolling.bean;

/**
 * 
 * <p>
 * Title:角色表
 * </p>
 * <p>
 * Description: com.zrgk.bankpolling.bean.RoleInfo.java
 * </p>
 * <p>
 * Copyright: Copyright (c) 2015
 * </p>
 * <p>
 * </p>
 * 
 * @author 
 */
public class RoleInfo {

	/**
	 *权限表属性 
	 */
	private String role_id;//角色编号
	private String role_type;//角色类型
	private String role_describe;//角色描述
	private String role_privilege;//角色权限
	
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
	 * @return the role_type
	 */
	public String getRole_type() {
		return role_type;
	}
	/**
	 * @param role_type the role_type to set
	 */
	public void setRole_type(String role_type) {
		this.role_type = role_type;
	}
	/**
	 * @return the role_describle
	 */
	public String getRole_describe() {
		return role_describe;
	}
	/**
	 * @param role_describle the role_describle to set
	 */
	public void setRole_describe(String role_describe) {
		this.role_describe = role_describe;
	}
	/**
	 * @return the role_privilege
	 */
	public String getRole_privilege() {
		return role_privilege;
	}
	/**
	 * @param role_privilege the role_privilege to set
	 */
	public void setRole_privilege(String role_privilege) {
		this.role_privilege = role_privilege;
	}
	
	/**
	 * 无参构造方法
	 */
	public RoleInfo() {
		super();
	}
	/**
	 * 全参构造方法
	 * @param role_id
	 * @param role_type
	 * @param role_describe
	 * @param role_privilege
	 */
	public RoleInfo(String role_id, String role_type, String role_describe,
			String role_privilege) {
		super();
		this.role_id = role_id;
		this.role_type = role_type;
		this.role_describe = role_describe;
		this.role_privilege = role_privilege;
	}
	/**
	 * 重写toString方法
	 */
	@Override
	public String toString() {
		return "RoleInfo [role_id=" + role_id + ", role_type=" + role_type
				+ ", role_describe=" + role_describe + ", role_privilege="
				+ role_privilege + "]";
	}
	
	
	
}
