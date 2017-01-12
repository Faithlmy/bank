package com.zrgk.bankpolling.serviceimpl;

import java.util.List;
import java.util.Vector;

import com.zrgk.bankpolling.bean.DeviceInfo;
import com.zrgk.bankpolling.bean.LogInfo;
import com.zrgk.bankpolling.dao.LogInfoDao;
import com.zrgk.bankpolling.service.LogInfoService;

/**
 * 
 * <p>
 * Title:
 * </p>
 * <p>
 * Description: com.zrgk.bankpolling.serviceimpl.LogInfoserviceimpl.java
  
 */
public class LogInfoserviceimpl implements LogInfoService {
	LogInfoDao dao = new LogInfoDao();
 	
	/**
	 * 删除日志
	 */
	@Override
	public boolean delLog(String log_id) {
		String sql = "delete from LogInfo where log_id='"+log_id+"' ";
		boolean flag = dao.update(sql);
		return flag;
	}
	/**
	 * 输出所有日志
	 */
	@Override
	public Vector[] showAll() {
		String sql = "select  log_id,userInfo.user_id,user_name,role_type,login_time,logoff_time from ( userInfo left join logInfo on userinfo.user_id = LogInfo.user_id) left join Roleinfo  on userInfo.role_id = roleInfo.role_id  ";
		System.out.println(sql);
		Vector[] vec = dao.query2Str(sql);
		return vec;
	}
	/**
	 * 模糊查询
	 */
	@Override
	public Vector[] queryAll(String string) {
		String sql =" select * from (select  log_id,userInfo.user_id,user_name,role_type,login_time,logoff_time from ( userInfo inner join logInfo on userinfo.user_id = LogInfo.user_id) inner join Roleinfo  on userInfo.role_id = roleInfo.role_id) a where a.user_name like '%"+string+"%' or a.login_time like '%"+string+"%'";
		System.out.println(sql);
		Vector[] vec = dao.query2Str(sql);
		return vec;
	}
	/**
	 * 添加日志
	 */
	@Override
	public boolean addLog(LogInfo logInfo) {
		String sql = "insert into LogInfo(log_id,user_id,login_time,logoff_time) values('"+logInfo.getLog_id()+"','"+logInfo.getUser_id()+"','"+logInfo.getLogin_time()+"','"+logInfo.getLogoff_time()+"') ";
		System.out.println(sql);
		boolean flag = dao.update(sql);
		return flag;
	}
	/**
	 * 更新日志
	 */
	@Override
	public boolean updLog(LogInfo logInfo) {
		String sql = "update LogInfo set logoff_time ='"+logInfo.getLogoff_time()+"' where log_id ='"+logInfo.getLog_id()+"' ";
		System.out.println(sql);
		boolean flag = dao.update(sql);
		return flag;
	}
	/**
	 * 删除本表外键
	 */
	@Override
	public void delFk(String column, String id) {
		String sql = "update  LogInfo set "+column+"=null where "+column+" = '"+id+"'";
		System.out.println("-->删除外键："+sql);
		dao.update(sql);
	}
	/**
	 * 根据外键查询多条记录
	 */
	@Override
	public List<LogInfo> queryFK(String column, String id) {
		String sql = "select * from LogInfo where "+column+"='"+id+"'";
		System.out.println(sql);
		List<LogInfo> list=dao.query(sql);
		return list;
	}
	/**
	 * showOne
	 */
	@Override
	public Vector[] showOne(String log_id) {
		String sql = "select * from loginfo where log_id='"+log_id+"'";
		Vector[] vectors=dao.query2Str(sql);
		return vectors;
	}
}
