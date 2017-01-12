/**
 * 
 */
package com.zrgk.bankpolling.serviceimpl;

import java.util.List;

import com.zrgk.bankpolling.bean.PriRoleInfo;
import com.zrgk.bankpolling.bean.RoleInfo;
import com.zrgk.bankpolling.bean.UserInfo;
import com.zrgk.bankpolling.dao.RoleInfoDao;
import com.zrgk.bankpolling.dao.UserInfoDao;
import com.zrgk.bankpolling.service.RoleInfoService;

/**
 * 
 * <p>
 * Title:UserService
 * </p>
 * <p>
 * Description: com.zrgk.bankpolling.service.UserService.java
  
 */
public class RoleInfoServiceImpl implements RoleInfoService {

	RoleInfoDao roledao = new RoleInfoDao();
	UserInfoDao userdao = new UserInfoDao();
	UserInfoServiceImpl userInfoServiceImpl = new UserInfoServiceImpl();
	PriRoleInfoServiceImpl priRoleServiceImpl = new PriRoleInfoServiceImpl();
	/**
	 * 添加角色
	 */
	@Override
	public boolean addRole(RoleInfo roleInfo,String pri_id) {
		//1、给角色表中添加角色
		String sql ="insert into RoleInfo values('"+roleInfo.getRole_id()+"','"+roleInfo.getRole_type()+"','"+roleInfo.getRole_describe()+"','"+roleInfo.getRole_privilege()+"')";
		boolean flag=roledao.update(sql);
		//2、给角色-权限表添加对应权限
		if(flag&&pri_id!=null&&!pri_id.equals("")){
			String p_id[] = pri_id.split(",");
			//3、在角色-权限中添加对pri_id
			for (int i = 0; i < p_id.length; i++) {
				if (!p_id[i].equals("")&&p_id[i]!=null) {
					PriRoleInfo priRoleInfo = new PriRoleInfo(roleInfo.getRole_id(), p_id[i]);
					priRoleServiceImpl.addPriRole(priRoleInfo);
					System.out.println("中间表插入成功！");
				}
			}
		}
		return flag;
	}

	/**
	 * 删除角色
	 */
	@Override
	public boolean delRole(String role_id) {
		//1、删除中间表PriRoleInfo中的信息
		priRoleServiceImpl.delPriRole("role_id", role_id);
		System.out.println("删除中间表的role_id完成");
		//2、删除UserInfo中的role_id
		List<UserInfo> list = userInfoServiceImpl.queryFK("role_id", role_id);
		if(list.size()!=0){
			userInfoServiceImpl.delFK("role_id", role_id);
		}
		//3、删除RoleInfo表的角色
		String sql = "delete from RoleInfo where role_id='"+role_id+"'";
		boolean flag=roledao.update(sql);
		System.out.println("删除角色表完成！");
		return flag;
	}
    /**
	 * 查询单个角色
	 */
	@Override
	public RoleInfo findById(String role_id) {
		String sql = "select * from RoleInfo where role_id='"+role_id+"'";
		RoleInfo roleInfo = (RoleInfo)roledao.findById(sql);
		return roleInfo;
	}
	/**
	 * 显示所有角色
	 */
	@Override
	public List<RoleInfo> showAll() {
		String sql = "select * from RoleInfo ";
		List<RoleInfo> list=roledao.query(sql);
		return list;
	}
	/**
	 * 修改角色
	 */
	@Override
	public boolean updRole(RoleInfo roleInfo) {
		String sql = "update RoleInfo set role_type='"+roleInfo.getRole_type()+"',role_describe='"+roleInfo.getRole_describe()+"',role_privilege='"+roleInfo.getRole_privilege()+"' where role_id='"+roleInfo.getRole_id()+"'";
		boolean flag=roledao.update(sql);
		return flag;
	}
	/**
	 * 给用户分配角色
	 */
	@Override
	public boolean role2user(String role_id,String user_id) {
		// TODO Auto-generated method stub
		String sql = "update userinfo set role_id='"+role_id+"' where user_id='"+user_id+"'";
		System.out.println("-->sql:"+sql);
		boolean flag= userdao.update(sql);
		return flag;
	}
	/**
	 * 依据role_name找打role_name
	 */
	@Override
	public RoleInfo findByName(String role_type) {
		// TODO Auto-generated method stub
		String sql = "select * from roleinfo where role_type='"+role_type+"'";
		RoleInfo roleInfo = (RoleInfo) roledao.findById(sql);
		return roleInfo;
	}
	
}
