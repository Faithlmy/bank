/**
 * 
 */
package com.zrgk.bankpolling.dao;

import java.sql.SQLException;
import java.util.List;

import com.zrgk.bankpolling.bean.UserInfo;
import com.zrgk.bankpolling.util.DBUtil;

/**
 * 
 * <p>
 * Title:
 * </p>
 * <p>
 * Description: com.zrgk.bankpolling.dao.UserIndoDao.java
 * </p>
 * <p>
 * Copyright: Copyright (c) 2015
 * </p>
 * <p>
 * </p>
 * 
 * @author 
 */
public class UserInfoDao extends DBUtil {

	/* (non-Javadoc)
	 * @see com.zrgk.bankpolling.util.DBUtil#rs2list(java.util.List)
	 */
	@Override
	protected void rs2list(List list) {
		// TODO Auto-generated method stub
		try {
			while(rs.next()){
				UserInfo userInfo = new UserInfo(rs.getString("user_id"), rs.getString("depart_id"), rs.getString("group_id"), rs.getString("role_id"), rs.getString("site_id"), rs.getString("user_name"), rs.getString("user_sex"), rs.getString("user_pwd"), rs.getString("user_tel"), rs.getString("user_email"), rs.getInt("user_taskcount"));
				list.add(userInfo);
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
		Object object  = null;
		try {
			if(rs.next()){
				object =  new UserInfo(rs.getString("user_id"), rs.getString("depart_id"), rs.getString("group_id"), rs.getString("role_id"), rs.getString("site_id"), rs.getString("user_name"), rs.getString("user_sex"), rs.getString("user_pwd"), rs.getString("user_tel"), rs.getString("user_email"), rs.getInt("user_taskcount"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return object;
	}

}
