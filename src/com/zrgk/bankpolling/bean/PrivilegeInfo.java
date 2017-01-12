/**
 * 
 */
package com.zrgk.bankpolling.bean;

/**
 * 
 * <p>
 * Title:权限表
 * </p>
 * <p>
 * Description: com.zrgk.bankpolling.bean.PrivilegeInfo.java
 * </p>
 * <p>
 * Copyright: Copyright (c) 2015
 * </p>
 * <p>
 * </p>
 * 
 * @author 
 */
public class PrivilegeInfo {
	/**
	 * 权限表属性
	 */
	private String pri_id;//权限编号
	private String pri_name;//权限名称
	private String pri_url;//权限链接
	private String pri_target;//跳转目标
	private String parent_id;//上级权限
	private String pri_address;//权限地址
	
	/**
	 * get/set方法
	 */
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
	 * @return the pri_name
	 */
	public String getPri_name() {
		return pri_name;
	}
	/**
	 * @param pri_name the pri_name to set
	 */
	public void setPri_name(String pri_name) {
		this.pri_name = pri_name;
	}
	/**
	 * @return the pri_url
	 */
	public String getPri_url() {
		return pri_url;
	}
	/**
	 * @param pri_url the pri_url to set
	 */
	public void setPri_url(String pri_url) {
		this.pri_url = pri_url;
	}
	/**
	 * @return the pri_target
	 */
	public String getPri_target() {
		return pri_target;
	}
	/**
	 * @param pri_target the pri_target to set
	 */
	public void setPri_target(String pri_target) {
		this.pri_target = pri_target;
	}
	/**
	 * @return the parent_id
	 */
	public String getParent_id() {
		return parent_id;
	}
	/**
	 * @param parent_id the parent_id to set
	 */
	public void setParent_id(String parent_id) {
		this.parent_id = parent_id;
	}
	/**
	 * @return the pri_address
	 */
	public String getPri_address() {
		return pri_address;
	}
	/**
	 * @param pri_address the pri_address to set
	 */
	public void setPri_address(String pri_address) {
		this.pri_address = pri_address;
	}
	/**
	 * 无参构造方法
	 */
	public PrivilegeInfo() {
		super();
		// TODO Auto-generated constructor stub
	}
	/**
	 * 全参构造方法
	 * @param pri_id
	 * @param pri_name
	 * @param pri_url
	 * @param pri_target
	 * @param parent_id
	 * @param pri_address
	 */
	public PrivilegeInfo(String pri_id, String pri_name, String pri_url,
			String pri_target, String parent_id, String pri_address) {
		super();
		this.pri_id = pri_id;
		this.pri_name = pri_name;
		this.pri_url = pri_url;
		this.pri_target = pri_target;
		this.parent_id = parent_id;
		this.pri_address = pri_address;
	}
	/**
	 * 重写toString方法
	 */
	@Override
	public String toString() {
		return "PrivilegeInfo [pri_id=" + pri_id + ", pri_name=" + pri_name
				+ ", pri_url=" + pri_url + ", pri_target=" + pri_target
				+ ", parent_id=" + parent_id + ", pri_address=" + pri_address
				+ "]";
	}
	
	
	

}
