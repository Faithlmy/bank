/**
 * 
 */
package com.zrgk.bankpolling.dao;

import java.sql.SQLException;
import java.util.List;

import com.zrgk.bankpolling.bean.SiteInfo;
import com.zrgk.bankpolling.util.DBUtil;

/**
 * 
 * <p>
 * Title:
 * </p>
 * <p>
 * Description: com.zrgk.bankpolling.dao.SiteInfoDao.java
 * </p>
 * <p>
 * Copyright: Copyright (c) 2015
 * </p>
 * <p>
 * </p>
 * 
 * @author 
 */
public class SiteInfoDao extends DBUtil {

	/* (non-Javadoc)
	 * @see com.zrgk.bankpolling.util.DBUtil#rs2list(java.util.List)
	 */
	@Override
	protected void rs2list(List list) {
		// TODO Auto-generated method stub
		try {
			while(rs.next()){
				SiteInfo siteInfo = new SiteInfo(rs.getString("site_id"), rs.getString("site_name"), rs.getString("site_address"), rs.getString("site_tel"), rs.getString("site_ip"));
				list.add(siteInfo);
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
				object =  new SiteInfo(rs.getString("site_id"), rs.getString("site_name"), rs.getString("site_address"), rs.getString("site_tel"), rs.getString("site_ip"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return object;
	}

}
