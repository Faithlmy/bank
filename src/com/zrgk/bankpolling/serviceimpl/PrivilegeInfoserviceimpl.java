package com.zrgk.bankpolling.serviceimpl;

import java.util.List;
import java.util.Vector;


import com.zrgk.bankpolling.bean.PriRoleInfo;
import com.zrgk.bankpolling.bean.PrivilegeInfo;
import com.zrgk.bankpolling.bean.UserInfo;
import com.zrgk.bankpolling.dao.PriRoleInfoDao;
import com.zrgk.bankpolling.dao.PrivilegeInfoDao;
import com.zrgk.bankpolling.service.PriRoleInfoService;
import com.zrgk.bankpolling.service.PrivilegeInfoService;

/**
 * 
 * <p>
 * Title:
 * </p>
 * <p>
 * Description: com.zrgk.bankpolling.serviceimpl.PrivilegeInfoserviceimpl.java
 * 
 */
public class PrivilegeInfoserviceimpl implements PrivilegeInfoService {
	PrivilegeInfoDao dao = new PrivilegeInfoDao();
	PriRoleInfoServiceImpl prirole = new PriRoleInfoServiceImpl();
	/**
	 * 模糊查询权限信息
	 */
	@Override
	public List<PrivilegeInfo> queryAll(String string) {
		// TODO Auto-generated method stub
		String sql = "select * from PrivilegeInfo where pri_name like'%"+string+"%' or pri_url like '%"+string+"%' ";
		List<PrivilegeInfo> list = dao.query(sql);
		return list;
	}
	/**
	 * 添加权限
	 */
	@Override
	public boolean addPri(PrivilegeInfo privilegeInfo) {
		// TODO Auto-generated method stub
		String sql = "insert into PrivilegeInfo(pri_id,pri_name,pri_url,pri_target,parent_id,pri_address) values('"+privilegeInfo.getPri_id()+"','"+privilegeInfo.getPri_name()+"','"+privilegeInfo.getPri_url()+"','"+privilegeInfo.getPri_target()+"','"+privilegeInfo.getParent_id()+"','"+privilegeInfo.getPri_address()+"') ";
		boolean flag = dao.update(sql);
		return flag;
	}
	/**
	 * 删除权限
	 */
	@Override
	public boolean delPri(String pri_id) {
		// TODO Auto-generated method stub
		String sql = "delete from PrivilegeInfo where pri_id='"+pri_id+"' ";
		//删除PriRoleInfo中的pri_id
		PriRoleInfoDao priRoleInfoDao = new PriRoleInfoDao();
		String sql2  = "delete from PriRoleInfo where pri_id='"+pri_id+"'";
		priRoleInfoDao.update(sql2);
		//再删除Privilege的pri_id
		boolean flag = dao.update(sql);	
		return flag;
	}
	/**
	 * 查询单个权限
	 */
	@Override
	public PrivilegeInfo findById(String pri_id) {
		// TODO Auto-generated method stub
		String sql = "select * from PrivilegeInfo where pri_id='"+pri_id+"' ";
		PrivilegeInfo privilegeInfo = (PrivilegeInfo) dao.findById(sql);
		return privilegeInfo;
	}
	/**
	 * 更新权限
	 */
	@Override
	public boolean updPri(PrivilegeInfo privilegeInfo) {
		// TODO Auto-generated method stub
		String sql = "update  PrivilegeInfo set pri_name='"+privilegeInfo.getPri_name()+"',pri_url='"+privilegeInfo.getPri_url()+"',pri_target='"+privilegeInfo.getPri_target()+"',parent_id='"+privilegeInfo.getParent_id()+"',pri_address='"+privilegeInfo.getPri_address()+"' where pri_id= '"+privilegeInfo.getPri_id()+"'";
			boolean flag = dao.update(sql);
		return flag;
	}
	/**
	 * 获取所有子权限
	 */
	@Override
	public List<PrivilegeInfo> getChildPri(String pri_id) {
		// TODO Auto-generated method stub
		String sql = "select * from PrivilegeInfo where parent_id='"+pri_id+"' ";
		List<PrivilegeInfo> list = dao.query(sql);
		return list;
	}

	/**
	 * 输出所有权限
	 * @return
	 */
	@Override
	public List<PrivilegeInfo> showAll() {

		String sql = "select * from PrivilegeInfo ";
		List<PrivilegeInfo> list = dao.query(sql);
		return list;
	}
	/**
	 * showOne
	 */
	@Override
	public PrivilegeInfo showOne(String pri_id) {
		// TODO Auto-generated method stub
		String sql = "select * from PrivilegeInfo where pri_id='" + pri_id
				+ "' ";
		PrivilegeInfo privilegeInfo = (PrivilegeInfo) dao.findById(sql);
		return privilegeInfo;
	}
	/**
	 * 查询登录用户的所有权限，加载对应功能模块
	 */
	@Override
	public List<PrivilegeInfo> showP(String user_name) {
		// TODO Auto-generated method stub
		String sql = "select * from privilegeinfo where pri_id in (select pri_id from PriRoleInfo where role_id in (select role_id from UserInfo where user_name='"+user_name+"')) ";
		List<PrivilegeInfo> list = dao.query(sql);
		return list;
	}

}
