/**
 * 
 */
package com.zrgk.bankpolling.dao;

import java.sql.SQLException;
import java.util.List;

import com.zrgk.bankpolling.bean.PrivilegeInfo;
import com.zrgk.bankpolling.util.DBUtil;

/**
 * 
 * <p>
 * Title:
 * </p>
 * <p>
 * Description: com.zrgk.bankpolling.dao.PrivilegeInfoDao.java
 * </p>
 * <p>
 * Copyright: Copyright (c) 2015
 * </p>
 * <p>
 * </p>
 * 
 * @author 
 */
public class PrivilegeInfoDao extends DBUtil {

	/* (non-Javadoc)
	 * @see com.zrgk.bankpolling.util.DBUtil#rs2list(java.util.List)
	 */
	@Override
	protected void rs2list(List list) {
		// TODO Auto-generated method stub
		try {
			while(rs.next()){
				PrivilegeInfo privilegeInfo = new PrivilegeInfo(rs.getString("pri_id"), rs.getString("pri_name"), rs.getString("pri_url"), rs.getString("pri_target"), rs.getString("parent_id"), rs.getString("pri_address"));
				list.add(privilegeInfo);
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
		Object object= null;
		try {
			if(rs.next()){
				object=new PrivilegeInfo(rs.getString("pri_id"), rs.getString("pri_name"), rs.getString("pri_url"), rs.getString("pri_target"), rs.getString("parent_id"), rs.getString("pri_address"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return object;
	}

}
