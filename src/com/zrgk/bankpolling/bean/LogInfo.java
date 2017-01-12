/**
 * 
 */
package com.zrgk.bankpolling.bean;

/**
 * 
 * <p>
 * Title:日志表
 * </p>
 * <p>
 * Description: com.zrgk.bankpolling.bean.LogInfo.java
 * </p>
 * <p>
 * Copyright: Copyright (c) 2015
 * </p>
 * <p>
 * </p>
 * 
 * @author 
 */
public class LogInfo {
	
	/**
	 * 日志表属性
	 */
	private String log_id;//日志编号
	private String user_id;//用户编号
	private String login_time;//登陆时间
	private String logoff_time;//注销时间
	
	/**
	 * get/set方法
	 */
	/**
	 * @return the log_id
	 */
	public String getLog_id() {
		return log_id;
	}
	/**
	 * @param log_id the log_id to set
	 */
	public void setLog_id(String log_id) {
		this.log_id = log_id;
	}
	/**
	 * @return the user_id
	 */
	public String getUser_id() {
		return user_id;
	}
	/**
	 * @param user_id the user_id to set
	 */
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	/**
	 * @return the login_time
	 */
	public String getLogin_time() {
		return login_time;
	}
	/**
	 * @param login_time the login_time to set
	 */
	public void setLogin_time(String login_time) {
		this.login_time = login_time;
	}
	/**
	 * @return the logoff_time
	 */
	public String getLogoff_time() {
		return logoff_time;
	}
	/**
	 * @param logoff_time the logoff_time to set
	 */
	public void setLogoff_time(String logoff_time) {
		this.logoff_time = logoff_time;
	}
	
	/**
	 * 无参构造方法
	 */
	public LogInfo() {
		super();
		// TODO Auto-generated constructor stub
	}
	/**
	 * 2参的构造方法
	 * @param log_id
	 * @param logoff_time
	 */
	
	public LogInfo(String log_id, String logoff_time) {
		super();
		this.log_id = log_id;
		this.logoff_time = logoff_time;
	}
	/**
	 * 3参构造方法
	 * @param log_id
	 * @param user_id
	 * @param login_time
	 */
	public LogInfo(String log_id, String user_id, String login_time) {
		super();
		this.log_id = log_id;
		this.user_id = user_id;
		this.login_time = login_time;
	}
	/**
	 * 全参构造方法
	 * @param log_id
	 * @param user_id
	 * @param login_time
	 * @param logoff_time
	 */
	public LogInfo(String log_id, String user_id, String login_time,
			String logoff_time) {
		super();
		this.log_id = log_id;
		this.user_id = user_id;
		this.login_time = login_time;
		this.logoff_time = logoff_time;
	}
	/**
	 * 重写toString方法
	 */
	@Override
	public String toString() {
		return "LogInfo [log_id=" + log_id + ", user_id=" + user_id
				+ ", login_time=" + login_time + ", logoff_time=" + logoff_time
				+ "]";
	}
	
	
	
	

}
