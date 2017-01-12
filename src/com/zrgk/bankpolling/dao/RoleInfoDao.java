/**
 * 
 */
package com.zrgk.bankpolling.dao;

import java.sql.SQLException;
import java.util.List;

import com.zrgk.bankpolling.bean.RoleInfo;
import com.zrgk.bankpolling.util.DBUtil;

/**
 * 
 * <p>
 * Title:
 * </p>
 * <p>
 * Description: com.zrgk.bankpolling.dao.RoleInfoDao.java
 * </p>
 * <p>
 * Copyright: Copyright (c) 2015
 * </p>
 * <p>
 * </p>
 * 
 * @author 
 */
public class RoleInfoDao extends DBUtil {

	/* (non-Javadoc)
	 * @see com.zrgk.bankpolling.util.DBUtil#rs2list(java.util.List)
	 */
	@Override
	protected void rs2list(List list) {
		// TODO Auto-generated method stub
		try {
			while(rs.next()){
				RoleInfo roleInfo = new RoleInfo(rs.getString("role_id"), rs.getString("role_type"), rs.getString("role_describe"), rs.getString("role_privilege"));
				list.add(roleInfo);
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
			object	= new RoleInfo(rs.getString("role_id"), rs.getString("role_type"), rs.getString("role_describe"), rs.getString("role_privilege"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return object;
	}

}
