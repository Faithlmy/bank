/**
 * 
 */
package com.zrgk.bankpolling.dao;

import java.sql.SQLException;
import java.util.List;

 
import com.zrgk.bankpolling.bean.DepartInfo;
import com.zrgk.bankpolling.util.DBUtil;

/**
 * 
 * <p>
 * Title:
 * </p>
 * <p>
 * Description: com.zrgk.bankpolling.dao.DepartInfoDao.java
 * </p>
 * <p>
 * Copyright: Copyright (c) 2015
 * </p>
 * <p>
 * </p>
 * 
 * @author 
 */
public class DepartInfoDao extends DBUtil {

	/* (non-Javadoc)
	 * @see com.zrgk.bankpolling.util.DBUtil#rs2list(java.util.List)
	 */
	@Override
	protected void rs2list(List list) {
		// TODO Auto-generated method stub
		try {
			while(rs.next()){
				DepartInfo departinfo = new DepartInfo(rs.getString("depart_id"), rs.getString("depart_name"));
				list.add(departinfo);
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
		Object object= null;
		// TODO Auto-generated method stub
		try {
			if(rs.next()){
			 object	=new DepartInfo(rs.getString("depart_id"), rs.getString("depart_name"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return object;
	}

}
