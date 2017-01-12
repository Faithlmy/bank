package com.zrgk.bankpolling.serviceimpl;

import java.util.List;
import java.util.Vector;

import javax.swing.text.DefaultEditorKit.InsertBreakAction;


import com.zrgk.bankpolling.bean.GroupInfo;
import com.zrgk.bankpolling.bean.UserInfo;
import com.zrgk.bankpolling.dao.GroupInfoDao;
import com.zrgk.bankpolling.service.GroupInfoService;

/**
 * 
 * <p>
 * Title:
 * </p>
 * <p>
 * Description: com.zrgk.bankpolling.serviceimpl.GroupInfoserviceimpl.java
  
 */
public class GroupInfoserviceimpl implements GroupInfoService {
          GroupInfoDao dao = new GroupInfoDao();
          UserInfoServiceImpl userInfoServiceImpl= new UserInfoServiceImpl();
	/**
	 * 添加分组
	 */
	@Override
	public boolean addGroup(GroupInfo groupInfo) {
		String sql = "insert into GroupInfo values('"+groupInfo.getGroup_id()+"','"+groupInfo.getGroup_name()+"') ";
        System.out.println(sql);
		boolean flag = dao.update(sql);
		return flag;
	}

	/**
	 * 删除分组
	 */
	@Override
	public boolean delGroup(String group_id) {
		String sql = "delete from GroupInfo where group_id='"+group_id+"' ";
		//删除UserInfo中的group_id
		List<UserInfo> list=userInfoServiceImpl.queryFK("group_id", group_id);
		if(list.size()!=0){
			userInfoServiceImpl.delFK("group_id", group_id);
		}
		System.out.println(sql);
		boolean flag = dao.update(sql);
		return flag;
	}
	/**
	 * 模糊查询
	 */
	@Override
	public Vector[] queryAll(String string) {
		String sql = "select * from (select distinct userInfo.group_id,user_id,group_name,user_name,user_tel from groupInfo,userInfo where groupInfo.group_id = userInfo.group_id) a where a.group_id like '%"+string+"%' or a.user_name like '%"+string+"%'";
		System.out.println(sql);
		Vector[] vec = dao.query2Str(sql);
		return vec;
	}
	/**
	 * 查询单个分组
	 */
	@Override
	public GroupInfo findById(String group_id) {
		String sql ="select * from GroupInfo where group_id = '"+group_id+"'";
		System.out.println(sql);
		GroupInfo groupInfo = (GroupInfo) dao.findById(sql);
		return groupInfo;
	}
	/**
	 * 显示所有分组信息
	 */
	@Override
	public Vector[] showAll() {
		String sql = "select userInfo.group_id,user_id,group_name,user_name,user_tel from groupInfo,userInfo where groupInfo.group_id = userInfo.group_id";
		System.out.println(sql);
		Vector[] vec = dao.query2Str(sql);
		return vec;
	}
	/**
	 * 更新分组信息
	 */
	@Override
	public boolean updGroup(GroupInfo groupInfo) {
		String sql = "update GroupInfo set group_name ='"+groupInfo.getGroup_name()+"' where group_id='"+groupInfo.getGroup_id()+"' ";
		System.out.println(sql);
		boolean flag = dao.update(sql);
		return flag;
	}
	/**
	 * showOne
	 */
	@Override
	public Vector[] showOne(String group_id) {
		String sql ="select * from GroupInfo where group_id = '"+group_id+"'";
		System.out.println(sql);
		Vector[] vectors = dao.query2Str(sql);
		return vectors;
	}

	@Override
	public GroupInfo findByName(String group_name) {
		// TODO Auto-generated method stub
		String sql ="select * from GroupInfo where group_name = '"+group_name+"'";
		System.out.println(sql);
		GroupInfo groupInfo = (GroupInfo) dao.findById(sql);
		return groupInfo;
	}

	@Override
	public List<GroupInfo> findAllGroup() {
		// TODO Auto-generated method stub
		String sql = "select * from GroupInfo ";
		System.out.println(sql);
		List<GroupInfo> list = dao.query(sql);
		return list;
	}

	@Override
	public Vector[] showByName(String group_name) {
		// TODO Auto-generated method stub
		String sql = "select * from (select userInfo.group_id,user_id,group_name,user_name,user_tel from groupInfo,userInfo where groupInfo.group_id = userInfo.group_id)a where a.group_name = '"+group_name+"'";
		System.out.println(sql);
		Vector[] vec = dao.query2Str(sql);
		return vec;
	}

	@Override
	public boolean delGroupMember(String user_id) {
		// TODO Auto-generated method stub
		return false;
	}

}
