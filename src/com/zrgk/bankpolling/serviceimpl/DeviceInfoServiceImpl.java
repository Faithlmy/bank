/**
 * 
 */
package com.zrgk.bankpolling.serviceimpl;

import java.util.List;
import java.util.Vector;


import com.zrgk.bankpolling.bean.DeviceInfo;
import com.zrgk.bankpolling.bean.RecordInfo;
import com.zrgk.bankpolling.bean.SiteInfo;
import com.zrgk.bankpolling.dao.DeviceInfoDao;
import com.zrgk.bankpolling.dao.RecordInfoDao;
import com.zrgk.bankpolling.service.DeviceInfoService;

/**
 * 
 * <p>
 * Title:UserService
 * </p>
 * <p>
 * Description: com.zrgk.bankpolling.service.UserService.java
 *  
 */
public class DeviceInfoServiceImpl implements DeviceInfoService {
	DeviceInfoDao dao = new DeviceInfoDao();
	RecordInfoServiceImpl recordservice = new RecordInfoServiceImpl();
	/**
	 * 删除本表在其他表中的外键
	 */
	@Override
	public void delFk(String column, String id) {
		String sql = "update DeviceInfo set "+column+"=null where "+column+"='"+id+"'";
		System.out.println("-->删除外键："+sql);
		dao.update(sql);
	}
	/**
	 * 添加设备信息
	 */
	@Override
	public boolean addDevice(DeviceInfo deviceInfo) {
		String sql = "insert into DeviceInfo values('"+deviceInfo.getDevice_id()+"','"+deviceInfo.getSite_id()+"','"+deviceInfo.getDevice_name()+"','"+deviceInfo.getDevice_state()+"','"+deviceInfo.getTask_state()+"')";
		System.out.println(sql);
		boolean flag = dao.update(sql);
		return flag;
	}
	/**
	 * 删除设备信息
	 */
	@Override
	public boolean delDevice(String device_id) {
		boolean flag = false;
		String sql = "delete from deviceInfo where device_id= '"+device_id+"' ";		
		List<RecordInfo> list =recordservice.queryFK("device_id", device_id);
		if(list.size() != 0){						
			recordservice.delFK("device_id", device_id);		
		}
		System.out.println(sql);
		flag = dao.update(sql);
		return flag;
	}
	/**
	 * 模糊查询
	 */
	@Override
	public Vector[] queryAll(String string) {
		String sql = "select * from (select device_id,device_name,device_state,deviceInfo.site_id,site_name,task_state from deviceInfo,siteInfo where deviceInfo.site_id= siteInfo.site_id) a where a.site_id like '%" + string
				+ "%' or a.device_name like '%"+string+"%' or a.device_id like '%" + string + "%' ";
		System.out.println(sql);
		Vector[] vec = dao.query2Str(sql);
		return vec;
	}

	/**
	 * 查询单个记录
	 */
	@Override
	public DeviceInfo findById(String device_id) {
		String sql = "select * from deviceInfo where device_id= '"+device_id+"'";
		System.out.println(sql);
		DeviceInfo deviceInfo = (DeviceInfo) dao.findById(sql);
		System.out.println("最秘密的"+deviceInfo);
		return deviceInfo;
	}
	/**
	 * 查询所有信息
	 */
	@Override
	public Vector[] showAll() {
		String sql = "select device_id,device_name,device_state,deviceInfo.site_id,site_name,task_state from deviceInfo,siteInfo where deviceInfo.site_id= siteInfo.site_id";
		System.out.println(sql);
		Vector[] vec = dao.query2Str(sql);
		return vec;
	}

	/**
	 * 去更改设备信息（获得当前设备信息）
	 */
	@Override
	public DeviceInfo toUpdDevice(String device_id) {
		String sql = "select * from SiteInfo where device_id='"+device_id+"'";
		DeviceInfo deviceInfo = (DeviceInfo) dao.findById(sql);
		return deviceInfo;
	}

	/**
	 * 更新设备信息
	 */
	@Override
	public boolean updDevice(DeviceInfo deviceInfo) {
		String sql = "update deviceInfo set device_name ='"+deviceInfo.getDevice_name()+"',device_state = '"+deviceInfo.getDevice_state()+"',site_id = '"+deviceInfo.getSite_id()+"',task_state = '"+deviceInfo.getTask_state()+"' where device_id = '"+deviceInfo.getDevice_id()+"' ";
		System.out.println(sql);
		boolean flag = dao.update(sql);
		return flag;
	}

	/**
	 * 更改设备任务状态信息
	 */
	@Override
	public boolean updTaskState(DeviceInfo deviceInfo) {
		String sql = "update DeviceInfo set task_state ='"+deviceInfo.getTask_state()+"' where device_id='"+deviceInfo.getDevice_id()+"'";
		System.out.println(sql);
		boolean flag = dao.update(sql);
		return flag;
	}
	/**
	 * 更改设备确认状态
	 */
	@Override
	public boolean updDeviceState(DeviceInfo deviceInfo) {
		// TODO Auto-generated method stub
		String sql ="update DeviceInfo set device_state ='"+deviceInfo.getDevice_state()+"' where device_id='"+deviceInfo.getDevice_id()+"'";
		System.out.println(sql);
		boolean flag = dao.update(sql);
		return flag;
	}	
	/**
	 * 根据外键查询多条记录
	 */
	@Override
	public List<DeviceInfo> queryFK(String column, String id) {
		String sql = "select * from DeviceInfo where "+column+"='"+id+"'";
		System.out.println(sql);
		List<DeviceInfo> list=dao.query(sql);
		return list;
	}
	/**
	 * showOne
	 */
	@Override
	public Vector[] showOne(String device_id) {
		String sql = "select device_id,deviceinfo.site_id,site_name,device_name,device_state,task_state from deviceInfo,siteinfo where deviceinfo.site_id =siteinfo.site_id  and device_id= '"+device_id+"'";
		System.out.println(sql);
		Vector[] vectors =dao.query2Str(sql);
		return vectors;
	}

}
