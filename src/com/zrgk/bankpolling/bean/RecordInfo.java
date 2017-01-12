package com.zrgk.bankpolling.bean;

/**
 * 
 * <p>
 * Title:
 * </p>
 * <p>
 * Description: com.zrgk.bankpolling.bean.RecordInfo.java
 * </p>
 * <p>
 * Copyright: Copyright (c) 2015
 * </p>
 * <p>
 * </p>
 * 
 * @author 
 */
public class RecordInfo {
	/**
	 * 记录属性
	 */
  private String record_id;//记录编号
  private String device_id;//设备编号
  private String user_id;//用户编号
  private String record_details;//记录细则
  private String record_time;//记录时间
  private String record_state;//记录状态
  private String record_confirm;//确认信息
  private String record_type;//记录类型
  /**
   * get set 方法
   * @return
   */
public String getRecord_id() {
	return record_id;
}
public void setRecord_id(String record_id) {
	this.record_id = record_id;
}
public String getDevice_id() {
	return device_id;
}
public void setDevice_id(String device_id) {
	this.device_id = device_id;
}
public String getUser_id() {
	return user_id;
}
public void setUser_id(String user_id) {
	this.user_id = user_id;
}
public String getRecord_details() {
	return record_details;
}
public void setRecord_details(String record_details) {
	this.record_details = record_details;
}
public String getRecord_time() {
	return record_time;
}
public void setRecord_time(String record_time) {
	this.record_time = record_time;
}
public String getRecord_state() {
	return record_state;
}
public void setRecord_state(String record_state) {
	this.record_state = record_state;
}
public String getRecord_confirm() {
	return record_confirm;
}
public void setRecord_confirm(String record_confirm) {
	this.record_confirm = record_confirm;
}
public String getRecord_type() {
	return record_type;
}
public void setRecord_type(String record_type) {
	this.record_type = record_type;
}
/**
 * 3参构造方法
 * @param record_id
 * @param record_state
 * @param record_confirm
 */
public RecordInfo(String record_id, String record_state, String record_confirm) {
	super();
	this.record_id = record_id;
	this.record_state = record_state;
	this.record_confirm = record_confirm;
}
/**
 * 带7个参数的构造方法
 * @param record_id
 * @param device_id
 * @param user_id
 * @param record_details
 * @param record_time
 * @param record_state
 * @param record_type
 */
public RecordInfo(String record_id, String device_id, String user_id,
		String record_details, String record_time, String record_state,
		String record_type) {
	super();
	this.record_id = record_id;
	this.device_id = device_id;
	this.user_id = user_id;
	this.record_details = record_details;
	this.record_time = record_time;
	this.record_state = record_state;
	this.record_type = record_type;
}
/**
 * 带8个参数的构造方法
 * @param record_id
 * @param device_id
 * @param user_id
 * @param record_details
 * @param record_time
 * @param record_state
 * @param record_confirm
 * @param record_type
 */
public RecordInfo(String record_id, String device_id, String user_id,
		String record_details, String record_time, String record_state,
		String record_confirm, String record_type) {
	super();
	this.record_id = record_id;
	this.device_id = device_id;
	this.user_id = user_id;
	this.record_details = record_details;
	this.record_time = record_time;
	this.record_state = record_state;
	this.record_confirm = record_confirm;
	this.record_type = record_type;
}
/**
 * 无参的构造方法
 */
public RecordInfo() {
	super();
	// TODO Auto-generated constructor stub
}
@Override
public String toString() {
	return "RecordInfo [record_id=" + record_id + ", device_id=" + device_id
			+ ", user_id=" + user_id + ", record_details=" + record_details
			+ ", record_time=" + record_time + ", record_state=" + record_state
			+ ", record_confirm=" + record_confirm + ", record_type="
			+ record_type + "]";
}	 
}
