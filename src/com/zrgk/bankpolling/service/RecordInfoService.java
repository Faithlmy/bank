/**
 * 
 */
package com.zrgk.bankpolling.service;

import java.util.List;
import java.util.Vector;

import com.zrgk.bankpolling.bean.RecordInfo;

/**
 * 
 * 
 * <p>
 * Title:RecordInfoService
 * </p>
 * <p>
 * Description: com.zrgk.bankpolling.service.UserService.java
 * </p>
 * <p>
 * Copyright: Copyright (c) 2015
 * </p>
 * <p>
 */
public interface RecordInfoService {
	/**
	 * 业务1：添加记录信息
	 * @param recordInfo
	 * @return
	 */
	public boolean addRecord(RecordInfo recordInfo);
	/**
	 * 
	 * 业务2：删除记录信息
	 * @param record_id
	 * @return
	 */
	public boolean delRecord(String record_id);
	/**
	 * 业务3：模糊查询所有信息
	 * @param string
	 * @return
	 */
	public Vector[] queryAll(String string,String record_type);
	
	/**
	 * 业务4：查看单个记录信息
	 * @param record_id
	 * @return
	 */
	public Vector[] findById(String record_id);
	/**
	 * 业务5：显示所有信息
	 * @param record_type
	 * @return
	 */
	public Vector[] showAll(String record_type);
	/**
	 * 业务6：修改记录信息
	 * @param recordInfo
	 * @return
	 */
	public boolean updRecord(RecordInfo recordInfo);
	/**
	 * 业务7：删除本表的外键
	 */
	public void delFK(String column,String id);
	/**
	 * 业务8：查询多条记录（根据外键）
	 */
	public List<RecordInfo> queryFK(String column,String id);
	/**
	 * 业务9：更改记录状态信息
	 * @return
	 */
	public boolean updRecordState(RecordInfo recordInfo);
	/**
	 * 业务10：根据用户ID查看该员工的所有工作记录
	 * @param user_id
	 * @return
	 */
	public Vector[] showUserRecord(String user_id);
	
	
}
