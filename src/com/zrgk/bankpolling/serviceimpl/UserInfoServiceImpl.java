/**
 * 
 */
package com.zrgk.bankpolling.serviceimpl;

import java.util.List;
import java.util.Vector;
import com.zrgk.bankpolling.bean.LogInfo;
import com.zrgk.bankpolling.bean.RecordInfo;
import com.zrgk.bankpolling.bean.UserInfo;
import com.zrgk.bankpolling.dao.UserInfoDao;
import com.zrgk.bankpolling.service.UserInfoService;

/**
 * 
 * <p>
 * Title:UserService
 * </p>
 * <p>
 * Description: com.zrgk.bankpolling.service.UserService.java
  
 */
public class UserInfoServiceImpl implements UserInfoService {
	
	UserInfoDao dao = new UserInfoDao();
	LogInfoserviceimpl LogInfoserviceimpl = new LogInfoserviceimpl();
	RecordInfoServiceImpl recordInfoServiceImpl = new RecordInfoServiceImpl();

	
	/**
	 * 登陆验证
	 */
	@Override
	public List<UserInfo> confirm(String user_id, String user_pwd) {
		String sql = "select * from UserInfo where user_id='" + user_id
				+ "' and user_pwd='" + user_pwd + "' ";
		List<UserInfo> list = dao.query(sql);
		return list;
	}

	/**
	 * 添加用户信息
	 */
	@Override
	public boolean addUser(UserInfo userInfo) {
		String sql = "insert into UserInfo(user_id,depart_id,group_id,user_name,user_sex,user_pwd,user_tel,user_email,user_taskcount) " +
				"values('"+userInfo.getUser_id()+"','"+userInfo.getDepart_id()+"','"+userInfo.getGroup_id()+"','"+userInfo.getUser_name()+"','"+userInfo.getUser_sex()+"','"+userInfo.getUser_pwd()+"'," +
				"'"+userInfo.getUser_tel()+"','"+userInfo.getUser_email()+"','"+userInfo.getUser_taskcount()+"') ";
		boolean flag = dao.update(sql);
		return flag;
	}
	/**
	 * 删除用户信息
	 */
	@Override
	public boolean delUser(String user_id) {
		
		//删除LogInfo中的user_id
		List<LogInfo> loglist=LogInfoserviceimpl.queryFK("user_id", user_id);
		if(loglist.size()!=0){
			LogInfoserviceimpl.delFk("user_id", user_id);
		}
		//删除RecordInfo中的user_id
		List<RecordInfo> recordlist= recordInfoServiceImpl.queryFK("user_id", user_id);
		if(recordlist.size()!=0){
			recordInfoServiceImpl.delFK("user_id", user_id);
		}
		String sql = "delete from UserInfo where user_id = '"+user_id+"' ";
		boolean flag=dao.update(sql);
		return flag;
	}
	/**
	 * 模糊查询用户信息
	 */
	@Override
	public Vector[] queryAll(String string) {
		System.out.println("------模糊查询----------"+string);
		String sql = "select * from (select UserInfo.user_id ,user_name,user_sex,user_tel,user_email, role_type,depart_name from (UserInfo left join RoleInfo on UserInfo.role_id = RoleInfo.role_id ) left join departinfo on UserInfo.depart_id = DepartInfo.depart_id) a where a.user_name like '%"+string+"%' or a.depart_name like '%"+string+"%'";
		System.out.println(sql);
		Vector[] vec = dao.query2Str(sql);
		return vec;
	}
	/**
	 * 查询单个用户，返回UserInfo对象
	 */
	@Override
	public UserInfo findById(String user_id) {
		String sql = "select * from userInfo where user_id = '"+user_id+"' ";
		System.out.println(sql);
		UserInfo userInfo = (UserInfo) dao.findById(sql);		
		return userInfo;
	}
	/**
	 * 显示所有用户，返回Vector向量
	 */
	@Override
	public Vector[] showAll() {
		String sql = "select UserInfo.user_id ,user_name,user_sex,user_tel,user_email, role_type,depart_name from (UserInfo left join RoleInfo on UserInfo.role_id = RoleInfo.role_id ) left join departinfo on UserInfo.depart_id = DepartInfo.depart_id ";
		System.out.println(sql);
		Vector[] vectors = dao.query2Str(sql);
		return vectors;
	}
	/**
	 * 更新用户表的【非外键信息】
	 */
	@Override
	public boolean updUser(UserInfo userInfo) {
		String sql = "update UserInfo set user_name='"+userInfo.getUser_name()+"',user_sex='"+userInfo.getUser_sex()+
				"',user_tel='"+userInfo.getUser_tel()+"',user_email='"+userInfo.getUser_email()+"',depart_id='"+userInfo.getDepart_id()+"'  where user_id ='"+userInfo.getUser_id()+"' ";
		boolean flag = dao.update(sql);
		return flag;
	}
	/**
	 * 修改用户表的【外键信息】
	 */
	@Override
	public boolean updFK(String column, String value,String id) {
		String sql = "update userinfo set "+column+"='"+value+"' where user_id = '"+id+"'";
		System.out.println("-->更新外键"+sql);
		boolean flag = dao.update(sql);
		return false;
	}
	/**
	 * 删除本表外键
	 */
	@Override
	public void delFK(String column, String id) {
		String sql = "update UserInfo set "+column+"=null where "+column+" = '"+id+"'";
		System.out.println("-->删除外键："+sql);
		dao.update(sql);
		
	}
	/**
	 * 删除本表外键2
	 */
	@Override
	public void delFK2(String column, String id) {
		String sql = "update UserInfo set "+column+"=null where user_id = '"+id+"'";
		System.out.println("-->删除外键："+sql);
		dao.update(sql);
		
	}
	/**
	 * 显示所有【巡检中心员工{维修工，巡检工}】记录
	 */
	@Override
	public Vector[] showAllEmployee() {
		String sql = "select user_id,user_name,user_tel,user_taskcount,group_name from userInfo,groupInfo where groupInfo.group_id = userInfo.group_id ";		
		System.out.println(sql);
		Vector[] vec = dao.query2Str(sql);
		return vec;
	}
	/**
	 * 模糊查询某种角色类型的岗位信息
	 */
	@Override
	public Vector[] queryAllEmployee(String string) {
		
		String sql = "select * from (select user_id,user_name,user_tel,depart_name,role_type from userInfo,departInfo,roleInfo where departInfo.depart_id = userInfo.depart_id and userInfo.role_id = roleInfo.role_id) a where  a.role_type like '%"+string+"%' or a.user_name like '%"+string+"%' ";		
		System.out.println(sql);
		Vector[] vec = dao.query2Str(sql);
		return vec;
	}

	/**
	 * 更新用户任务数量
	 */
	@Override
	public boolean updTaskCount(UserInfo userInfo) {
		String sqls = "select * from UserInfo where user_id ='"
				+ userInfo.getUser_id() + "' ";
		UserInfo info = (UserInfo) dao.findById(sqls);
		int taskcount = info.getUser_taskcount() + 1;
		System.out.println(taskcount);
		String sql = "update UserInfo set user_taskcount=" + taskcount
				+ "where user_id='" + userInfo.getUser_id() + "';";
		boolean flag = dao.update(sql);
		return flag;
	}
	/**
	 * 显示单个用户信息，返回Vector向量
	 */
	@Override
	public Vector[] showOneUser(String user_id) {
		String sql = "select * from (select user_id,user_name,user_sex,user_tel,user_email,depart_name,role_type from UserInfo, DepartInfo,RoleInfo where userinfo.depart_id=departInfo.depart_id and userinfo.role_id = roleinfo.role_id) a where a.user_id = '"+user_id+"' ";
		System.out.println(sql);
		Vector[] vectors = dao.query2Str(sql);
		return vectors;
	}
	/**
	 * 修改用户密码
	 */
	@Override
	public boolean updPwd(String user_id, String pwd1, String new_pwd) {
		
		return false;
	}
	
	/**
	 * 根据外键查询多条记录
	 */
	@Override
	public List<UserInfo> queryFK(String column, String id) {
		String sql = "select * from UserInfo where "+column+"='"+id+"'";
		System.out.println(sql);
		List<UserInfo> list=dao.query(sql);
		return list;
		
	}
	/**
	 * 分配角色时候查找所有用户
	 */
	@Override
	public List<UserInfo> findAllUser() {
		String sql = "select * from UserInfo ";
		System.out.println(sql);
		List<UserInfo> list=dao.query(sql);
		return list;
	}

	@Override
	public UserInfo findByName(String user_name) {
		// TODO Auto-generated method stub
		String sql = "select * from userInfo where user_name = '"+user_name+"' ";
		UserInfo userInfo = (UserInfo) dao.findById(sql);
		return userInfo;
	}
	
}
