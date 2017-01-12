package com.zrgk.bankpolling.dao;

import java.sql.SQLException;
import java.util.List;

import com.zrgk.bankpolling.bean.RecordInfo;
import com.zrgk.bankpolling.util.DBUtil;

/**
 * 
 * <p>
 * Title:
 * </p>
 * <p>
 * Description: com.zrgk.bankpolling.dao.RecordInfoDao.java
 * </p>
 * <p>
 * Copyright: Copyright (c) 2015
 * </p>
 * <p>
 * </p>
 * 
 * @author 
 */
public class RecordInfoDao extends DBUtil {

	/* (non-Javadoc)
	 * @see com.zrgk.bankpolling.util.DBUtil#rs2list(java.util.List)
	 */
	@Override
	protected void rs2list(List list) {
		// TODO Auto-generated method stub
		try {
			while(rs.next()){
				RecordInfo recordInfo = new RecordInfo(rs.getString("record_id"),rs.getString("device_id"),rs.getString("user_id"),rs.getString("record_details"),rs.getString("record_time"),rs.getString("record_state"),rs.getString("record_confirm"),rs.getString("record_type"));
				list.add(recordInfo);
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
				object = new RecordInfo(rs.getString("record_id"),rs.getString("device_id"),rs.getString("user_id"),rs.getString("record_details"),rs.getString("record_time"),rs.getString("record_state"),rs.getString("record_confirm"),rs.getString("record_type"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return object;
	}

}
