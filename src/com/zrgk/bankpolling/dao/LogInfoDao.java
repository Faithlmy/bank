/**
 * 
 */
package com.zrgk.bankpolling.dao;

import java.sql.SQLException;
import java.util.List;

import com.zrgk.bankpolling.bean.LogInfo;
import com.zrgk.bankpolling.util.DBUtil;

/**
 * 
 * <p>
 * Title:
 * </p>
 * <p>
 * Description: com.zrgk.bankpolling.dao.LogInfoDao.java
 * </p>
 * <p>
 * Copyright: Copyright (c) 2015
 * </p>
 * <p>
 * </p>
 * 
 * @author 
 */
public class LogInfoDao extends DBUtil {

	/* (non-Javadoc)
	 * @see com.zrgk.bankpolling.util.DBUtil#rs2list(java.util.List)
	 */
	@Override
	protected void rs2list(List list) {
		// TODO Auto-generated method stub
		try {
			while(rs.next()){
				LogInfo logInfo = new LogInfo(rs.getString("log_id"), rs.getString("user_id"), rs.getString("login_time"), rs.getString("logoff_time"));
				list.add(logInfo);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	

	}

	/* (non-Javadoc)
	 * @see com.zrgk.bankpolling.util.DBUtil#rs2obj()
	 */
	@Override
	protected Object rs2obj() {
		// TODO Auto-generated method stub
		Object object = null;
		try {
			if(rs.next()){
				object = new LogInfo(rs.getString("log_id"), rs.getString("user_id"), rs.getString("login_time"), rs.getString("logoff_time"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return object;
	}

}
