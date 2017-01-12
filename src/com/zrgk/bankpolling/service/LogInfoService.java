/**
 * 
 */
package com.zrgk.bankpolling.service;

import java.util.List;
import java.util.Vector;

import com.zrgk.bankpolling.bean.DeviceInfo;
import com.zrgk.bankpolling.bean.LogInfo;

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
public interface LogInfoService {
	/**
	 * 业务1：根据日志id删除日志
	 * @param string
	 * @return
	 */
	public boolean delLog(String log_id);
	/**
	 * 业务2：输出所有日志信息
	 * @return
	 */
	public Vector[] showAll();
	/**
	 * 业务3：模糊查询所有日志
	 */
	public Vector[] queryAll(String string);
	
	/**
	 * 业务4：添加日志信息(添加登陆时间到日志)
	 * @param logInfo
	 * @return
	 */
	public boolean addLog(LogInfo logInfo);
	/**
	 * 业务5：更新日志信息(添加退出时间到日志)
	 */
	public boolean updLog(LogInfo logInfo);
	/**
	 * 业务6：删除本表外键
	 */
	public void delFk(String column ,String id);
	/**
	 * 业务7：查询多条记录（根据外键）
	 */
	public List<LogInfo> queryFK(String column,String id);	
	/**
	 * 业务8：showOne
	 */
	public Vector[] showOne(String log_id);
}
