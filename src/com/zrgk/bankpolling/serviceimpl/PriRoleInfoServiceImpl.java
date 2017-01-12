/**
 * 
 */
package com.zrgk.bankpolling.serviceimpl;

import java.util.List;
import java.util.Vector;

import com.zrgk.bankpolling.bean.PriRoleInfo;
import com.zrgk.bankpolling.bean.UserInfo;
import com.zrgk.bankpolling.dao.PriRoleInfoDao;
import com.zrgk.bankpolling.dao.PrivilegeInfoDao;
import com.zrgk.bankpolling.service.PriRoleInfoService;

/**
 * 
 * <p>
 * Title:UserService
 * </p>
 * <p>
 * Description: com.zrgk.bankpolling.service.UserService.java
 * 
 */
public class PriRoleInfoServiceImpl implements PriRoleInfoService {
	
	PriRoleInfoDao dao = new PriRoleInfoDao();

	/**
	 * 添加权限
	 */
	@Override
	public boolean addPriRole(PriRoleInfo priRoleInfo) {
		// TODO Auto-generated method stub
		String sql = "insert into priRoleInfo(role_id,pri_id) values('"+priRoleInfo.getRole_id()+"','"+priRoleInfo.getPri_id()+"') ";
		boolean flag = dao.update(sql);
		return flag;
	}
	/**
	 * 删除权限
	 */
	@Override
	public boolean delPriRole(String column,String  string) {
		// TODO Auto-generated method stub
		String sql = "delete from PriRoleInfo where "+column+" = '"+string+"' ";
		boolean flag = dao.update(sql);
		return flag;
	}
	/**
	 * 模糊查询
	 */
	@Override
	public List<PriRoleInfo> queryAll(String string) {
		// TODO Auto-generated method stub
		String sql = "select * from priRoleInfo where role_id like '%"+string+"%' or pri_id like '"+string+"' ";
		List<PriRoleInfo> list = dao.query(sql);
		return list;
	}
	/**
	 * 查询单个权限
	 */
	@Override
	public PriRoleInfo findById(String role_id) {
		// TODO Auto-generated method stub
		String sql = "select * from priRoleInfo where role_id = '"+role_id+"' ";
		PriRoleInfo priRoleInfo = (PriRoleInfo) dao.findById(sql);
		return priRoleInfo;
	}
	/**
	 * 修改权限
	 */
	@Override
	public boolean updPriRole(PriRoleInfo priRoleInfo) {
		// TODO Auto-generated method stub
		String sql = "update priRoleInfo set pri_id = '"+priRoleInfo.getPri_id()+"' where role_id ='"+priRoleInfo.getRole_id()+"' ";
		boolean flag = dao.update(sql);
		return flag;
	}
	
	
}
