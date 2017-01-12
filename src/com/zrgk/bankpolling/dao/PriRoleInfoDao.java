/**
 * 
 */
package com.zrgk.bankpolling.dao;

import java.sql.SQLException;
import java.util.List;

import com.zrgk.bankpolling.bean.PriRoleInfo;
import com.zrgk.bankpolling.bean.PrivilegeInfo;
import com.zrgk.bankpolling.util.DBUtil;

/**
 * 
 * <p>
 * Title:
 * </p>
 * <p>
 * Description: com.zrgk.bankpolling.dao.PriRoleInfoDao.java
 * </p>
 * <p>
 * Copyright: Copyright (c) 2015
 * </p>
 * </p>
 * 
 * @author 
 */
public class PriRoleInfoDao extends DBUtil{

	/* (non-Javadoc)
	 * @see com.zrgk.bankpolling.util.DBUtil#rs2list(java.util.List)
	 */
	@Override
	protected void rs2list(List list) {
		// TODO Auto-generated method stub
		try {
			while(rs.next()){
				PriRoleInfo priroleinfo = new PriRoleInfo(rs.getString("role_id"),rs.getString("pri_id"));
				list.add(priroleinfo);
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
		Object object = null;
		// TODO Auto-generated method stub
		try {
			if(rs.next()){
				object=new PriRoleInfo(rs.getString("role_id"),rs.getString("pri_id"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return object;
	}

}
