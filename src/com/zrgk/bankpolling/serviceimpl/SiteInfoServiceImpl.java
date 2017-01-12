/**
 * 
 */
package com.zrgk.bankpolling.serviceimpl;

import java.util.List;
import java.util.Vector;

 


import com.zrgk.bankpolling.bean.DeviceInfo;
import com.zrgk.bankpolling.bean.RecordInfo;
import com.zrgk.bankpolling.bean.SiteInfo;
import com.zrgk.bankpolling.bean.UserInfo;
import com.zrgk.bankpolling.dao.SiteInfoDao;
import com.zrgk.bankpolling.service.SiteInfoService;

/**
 * 
 * <p>
 * Title:
 * </p>
 * <p>
 * Description: com.zrgk.bankpolling.serviceimpl.SiteInfoImpl.java
 * 
 */
public class SiteInfoServiceImpl implements SiteInfoService {

	SiteInfoDao dao = new SiteInfoDao();
	DeviceInfoServiceImpl deviceInfoServiceImpl = new DeviceInfoServiceImpl(); 
	UserInfoServiceImpl userInfoServiceImpl = new UserInfoServiceImpl();
	/**
	 * 删除本表在其他表中的外键
	 */
	@Override
	public void delFK(String column, String id) {
		String sql = "update DiviceInfo set "+column+"=null where "+column+"='"+id+"'";
		System.out.println("-->删除外键："+sql);
		dao.update(sql);
		
	}
	/**
	 * 添加网点信息
	 */
	@Override
	public boolean addSite(SiteInfo siteInfo) {
		String sql ="insert into SiteInfo values('"+siteInfo.getSite_id()+"','"+siteInfo.getSite_name()+"','"+siteInfo.getSite_address()+"','"+siteInfo.getSite_tel()+"','"+siteInfo.getSite_ip()+"')";
		System.out.println(sql);
		boolean flag = dao.update(sql);
		return flag;
	}

	/**
	 * 删除网点信息
	 */
	@Override
	public boolean delSite(String site_id) {
		String sql = "delete from SiteInfo where site_id='"+site_id+"'";
		System.out.println(sql);
		//删除DeviceInfo中的外键site_id
		List<DeviceInfo> devicelist =deviceInfoServiceImpl.queryFK("site_id", site_id);
		if(devicelist.size() != 0){						
			deviceInfoServiceImpl.delFk("site_id", site_id);	
		}
		//删除UserInfo中的外键site_id
		List<UserInfo> userlist=userInfoServiceImpl.queryFK("site_id", site_id);
		if(userlist.size()!=0){
			userInfoServiceImpl.delFK("site_id", site_id);
		}
		boolean flag = dao.update(sql);
		return flag;
	}
	/**
	 * 模糊查询
	 */
	@Override
	public Vector[] queryAll(String string) {
		String sql = "select * from siteinfo  where site_name like '%"+string+"%' or site_ip like '%"+string+"%'";
		System.out.println(sql);
		Vector[] vectors = dao.query2Str(sql);
		return vectors;
	}
	/**
	 * 查询单个网点
	 */
	@Override
	public SiteInfo findById(String site_id) {
		String sql = "select * from SiteInfo where site_id='"+site_id+"'";
		System.out.println(sql);
		SiteInfo siteInfo= (SiteInfo) dao.findById(sql);
		return siteInfo;
	}

	/**
	 * 查询所有信息
	 */
	@Override
	public Vector[] showAll() {
		String sql = "select *  from siteinfo ";
		System.out.println(sql);
		Vector[] vectors = dao.query2Str(sql);
		return vectors;
	
	}
	/**
	 * 更新网点信息
	 */
	@Override
	public boolean updSite(SiteInfo siteInfo) {
		String sql="update SiteInfo set site_name ='"+siteInfo.getSite_name()+"',site_address='"+siteInfo.getSite_address()+"',site_tel='"+siteInfo.getSite_tel()+"',site_ip='"+siteInfo.getSite_ip()+"' where site_id='"+siteInfo.getSite_id()+"'";
		boolean flag = dao.update(sql);
		return flag;
	}
	/**
	 * showOne
	 */
	@Override
	public Vector[] showOne(String site_id) {
		String sql = "select * from SiteInfo where site_id='"+site_id+"'";
		System.out.println(sql);
		Vector[]  vectors =dao.query2Str(sql);
		return vectors;
	}

	

	

}
