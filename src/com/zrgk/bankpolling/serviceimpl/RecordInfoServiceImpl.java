/**
 * 
 */
package com.zrgk.bankpolling.serviceimpl;

import java.util.List;
import java.util.Vector;


import com.zrgk.bankpolling.bean.RecordInfo;
import com.zrgk.bankpolling.dao.RecordInfoDao;
import com.zrgk.bankpolling.service.RecordInfoService;

/**
 * 
 * <p>
 * Title:
 * </p>
 * <p>
 * Description: com.zrgk.bankpolling.serviceimpl.RecordInfoImpl.java
 * 
 */
public class RecordInfoServiceImpl implements RecordInfoService {

	RecordInfoDao dao = new RecordInfoDao();
	/**
	 * 删除外键
	 */
	@Override
	public void delFK(String column, String id) {
		// TODO Auto-generated method stub
		String sql = "update  RecordInfo set "+column+"=null where "+column+" = '"+id+"'";
		System.out.println("删除外键：-->"+sql);
		dao.update(sql);
		
	}
	/**
	 * 添加记录
	 */
	@Override
	public boolean addRecord(RecordInfo recordInfo) {
		// TODO Auto-generated method stub
		String sql = "insert into RecordInfo values('"+recordInfo.getRecord_id()+"','"+recordInfo.getDevice_id()+"','"+recordInfo.getUser_id()+"','"+recordInfo.getRecord_details()+"','"+recordInfo.getRecord_time()+"','"+recordInfo.getRecord_state()+"','"+recordInfo.getRecord_confirm()+"','"+recordInfo.getRecord_type()+"');";
		boolean flag =dao.update(sql);
		return flag;
	}

	/**
	 * 删除记录
	 */
	@Override
	public boolean delRecord(String record_id) {
		// TODO Auto-generated method stub
		String sql = "delete from RecordInfo where record_id='"+record_id+"'";
		boolean flag = dao.update(sql);
		System.out.println(sql);
		return flag;
	}

	/**
	 * 模糊查询
	 */
	@Override
	public Vector[]  queryAll(String string,String record_type) {
		// TODO Auto-generated method stub
		String sql = "select * from( select * from (select record_id,userinfo.user_id,user_name,user_tel,recordinfo.device_id,device_name,record_type,record_time,record_state,record_confirm from( RecordInfo left join UserInfo on RecordInfo.user_id = UserInfo.user_id ) left join DeviceInfo on RecordInfo.device_id = DeviceInfo.device_id)a where a.record_type = '"+record_type+"') b where b.record_time like '%"+string+"%' or  b.record_id like '%"+string+"%'" ;
		System.out.println(sql);
		Vector[] vectors =dao.query2Str(sql);	
		return vectors;
	}

	/**
	 * 查询单个记录
	 */
	@Override
	public Vector[] findById(String record_id) {
		// TODO Auto-generated method stub
		String sql = "select * from (select  record_id,userinfo.user_id,user_name,user_tel,recordinfo.device_id,device_name,record_type,record_time,record_state,record_confirm ,record_details from( RecordInfo left join UserInfo on RecordInfo.user_id = UserInfo.user_id ) left join DeviceInfo on RecordInfo.device_id = DeviceInfo.device_id)a where a.record_id = '"+record_id+"'";
		System.out.println(sql);
		Vector[] vectors =  dao.query2Str(sql);
		return vectors;
	}
	/**
	 * 查询所有记录
	 */
	@Override
	public Vector[] showAll(String record_type) {
		// TODO Auto-generated method stub
		String  sql = "select * from( select record_id,userinfo.user_id,user_name,user_tel,recordinfo.device_id,device_name,record_type,record_time,record_state,record_confirm from( RecordInfo left join UserInfo on RecordInfo.user_id = UserInfo.user_id ) left join DeviceInfo on RecordInfo.device_id =DeviceInfo.device_id) a where a.record_type='"+record_type+"'";
		System.out.println(sql);
		Vector[] vec = dao.query2Str(sql);
		return vec;
	}
	/**
	 * 更新记录
	 */
	@Override
	public boolean updRecord(RecordInfo recordInfo) {
		String sql  = "update RecordInfo set device_id ='"+recordInfo.getDevice_id()+"', user_id='"+recordInfo.getUser_id()+"'," +
				"record_details='"+recordInfo.getRecord_time()+"',record_state='"+recordInfo.getRecord_state()+"',record_confirm = '"+recordInfo.getRecord_confirm()+"' where record_id='"+recordInfo.getRecord_id()+"';";
		System.out.println(sql);
		boolean flag =dao.update(sql);
		return flag;
	}
	/**
	 * 根据外键查询多个记录
	 */
	@Override
	public List<RecordInfo> queryFK(String column,String id) {
		String sql = "select * from RecordInfo where "+column+"='"+id+"'";
		System.out.println(sql);
		List<RecordInfo> list=dao.query(sql);
		return list;
	}
	/**
	 * 更新设备状态
	 */
	@Override
	public boolean updRecordState(RecordInfo recordInfo) {
		// TODO Auto-generated method stub
		String sql = "update RecordInfo set record_state='"+recordInfo.getRecord_state()+"',record_confirm='"+recordInfo.getRecord_confirm()+"' where record_id='"+recordInfo.getRecord_id()+"'";
		boolean flag=dao.update(sql);
		System.out.println(sql);
		return flag;
	}
	@Override
	public Vector[] showUserRecord(String user_id) {
		// TODO Auto-generated method stub
		String  sql = "select * from( select record_id,userinfo.user_id,user_name,user_tel,recordinfo.device_id,device_name,record_type,record_time,record_state,record_confirm from( RecordInfo left join UserInfo on RecordInfo.user_id = UserInfo.user_id ) left join DeviceInfo on RecordInfo.device_id =DeviceInfo.device_id) a where a.user_id='"+user_id+"'";
		System.out.println(sql);
		Vector[] vec = dao.query2Str(sql);
		return vec;
	}
	



}
