/**
 * 
 */
package com.zrgk.bankpolling.bean;

/**
 * 
 * <p>
 * Title:分组表
 * </p>
 * <p>
 * Description: com.zrgk.bankpolling.bean.GroupInfo.java
 * </p>
 * <p>
 * Copyright: Copyright (c) 2015
 * </p>
 * <p>
 * </p>
 * 
 * @author 
 */
public class GroupInfo {
	
	/**
	 * 分组属性
	 */
	private String group_id;//组编号
	private String group_name;//组名
	
	/**
	 * get/set方法
	 */
	/**
	 * @return the group_id
	 */
	public String getGroup_id() {
		return group_id;
	}
	/**
	 * @param group_id the group_id to set
	 */
	public void setGroup_id(String group_id) {
		this.group_id = group_id;
	}
	/**
	 * @return the group_name
	 */
	public String getGroup_name() {
		return group_name;
	}
	/**
	 * @param group_name the group_name to set
	 */
	public void setGroup_name(String group_name) {
		this.group_name = group_name;
	}
	/**
	 * 无参构造方法
	 */
	public GroupInfo() {
		super();
		// TODO Auto-generated constructor stub
	}
	/**
	 * 全参构造方法
	 * @param group_id
	 * @param group_name
	 */
	public GroupInfo(String group_id, String group_name) {
		super();
		this.group_id = group_id;
		this.group_name = group_name;
	}
	/**
	 * 重写toString方法
	 */
	@Override
	public String toString() {
		return "GroupInfo [group_id=" + group_id + ", group_name=" + group_name
				+ "]";
	}
	
	
	

}
