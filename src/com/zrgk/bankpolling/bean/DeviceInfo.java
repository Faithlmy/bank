/**
 * 
 */
package com.zrgk.bankpolling.bean;

/**
 * 
 * <p>
 * Title:设备表
 * </p>
 * <p>
 * Description: com.zrgk.bankpolling.bean.DeviceInfo.java
 * </p>
 * <p>
 * Copyright: Copyright (c) 2015
 * </p>
 * <p>
 * </p>
 * 
 * @author 
 */
public class DeviceInfo {
	
	/**
	 * 设备属性
	 */
	private String device_id;//设备编号
	private String site_id;//网点编号
	private String device_name;//设备名称
	private String device_state;//设备状态
	private String task_state;//任务状态
	/**
	 * get/set方法
	 */
	/**
	 * @return the device_id
	 */
	public String getDevice_id() {
		return device_id;
	}
	/**
	 * @param device_id the device_id to set
	 */
	public void setDevice_id(String device_id) {
		this.device_id = device_id;
	}
	/**
	 * @return the site_id
	 */
	public String getSite_id() {
		return site_id;
	}
	/**
	 * @param site_id the site_id to set
	 */
	public void setSite_id(String site_id) {
		this.site_id = site_id;
	}
	/**
	 * @return the device_name
	 */
	public String getDevice_name() {
		return device_name;
	}
	/**
	 * @param device_name the device_name to set
	 */
	public void setDevice_name(String device_name) {
		this.device_name = device_name;
	}
	/**
	 * @return the device_state
	 */
	public String getDevice_state() {
		return device_state;
	}
	/**
	 * @param device_state the device_state to set
	 */
	public void setDevice_state(String device_state) {
		this.device_state = device_state;
	}
	public String getTask_state() {
		return task_state;
	}
	public void setTask_state(String task_state) {
		this.task_state = task_state;
	}
	/**
	 * 无参构造方法
	 */
	public DeviceInfo() {
		super();
		// TODO Auto-generated constructor stub
	}
	/**
	 * 2参构造方法
	 * @param device_id
	 * @param task_state
	 */
	public DeviceInfo(String device_id, String task_state) {
		super();
		this.device_id = device_id;
		this.task_state = task_state;
	}
	/**
	 * 3参构造方法
	 * @param device_id
	 * @param device_name
	 * @param device_state
	 */
	public DeviceInfo(String device_id, String device_name, String device_state) {
		super();
		this.device_id = device_id;
		this.device_name = device_name;
		this.device_state = device_state;
	}
	/**
	 * 5参构造方法
	 * @param device_id
	 * @param site_id
	 * @param device_name
	 * @param device_state
	 * @param task_state
	 */
	public DeviceInfo(String device_id, String site_id, String device_name,
			String device_state, String task_state) {
		super();
		this.device_id = device_id;
		this.site_id = site_id;
		this.device_name = device_name;
		this.device_state = device_state;
		this.task_state = task_state;
	}
	/**
	 * 重写toString方法
	 */
	@Override
	public String toString() {
		return "DeviceInfo [device_id=" + device_id + ", site_id=" + site_id
				+ ", device_name=" + device_name + ", device_state="
				+ device_state + ", task_state=" + task_state + "]";
	}
	
	
	

}
