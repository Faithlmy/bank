/**
 * 
 */
package com.zrgk.bankpolling.serviceimpl;

import java.util.List;
import java.util.Vector;


import com.zrgk.bankpolling.bean.DepartInfo;
import com.zrgk.bankpolling.bean.UserInfo;
import com.zrgk.bankpolling.dao.DepartInfoDao;
import com.zrgk.bankpolling.service.DepartInfoService;

/**
 * 
 * <p>
 * Title:UserService
 * </p>
 * <p>
 * Description: com.zrgk.bankpolling.service.UserService.java
 * </p>
 * 
 */
public class DepartInfoServiceImpl implements DepartInfoService {
	DepartInfoDao dao = new DepartInfoDao();
	UserInfoServiceImpl userInfoServiceImpl = new UserInfoServiceImpl();
	/**
	 * 删除外键业务
	 * @param column
	 * @param id
	 */
	public void delFK(String column, String id) {
		String sql = "update  DepartInfo set "+column+"=null where "+column+" = '"+id+"'";
		System.out.println("-->sql:"+sql);
		dao.update(sql);
	}
	/**
	 * 增加部门信息
	 */
	public boolean addDepart(DepartInfo departInfo) {
		// TODO Auto-generated method stub
		String sql = "insert into departInfo values('"+departInfo.getDepart_id()+"','"+departInfo.getDepart_name()+"')";
		System.out.println("-->sql:"+sql);
		boolean flag = dao.update(sql);
		return flag;
	}

	/**
	 * 删除部门信息
	 */
	public boolean delDepart(String depart_id) {
		String sql = "delete from departInfo where depart_id='"+depart_id+"'";
		System.out.println("-->sql:"+sql);
		//删除UserInfo中的depart_id;
		List<UserInfo> list=userInfoServiceImpl.queryFK("depart_id", depart_id);
		if(list.size()!=0){
			userInfoServiceImpl.delFK("depart_id", depart_id);
		}
		boolean flag = dao.update(sql);
		return flag;
	}

	/**
	 * 修改部门信息
	 */
	public boolean updDepart(DepartInfo departInfo) {
		// TODO Auto-generated method stub
		String sql = "update departInfo set depart_name = '"+departInfo.getDepart_name()+"' where depart_id='"+departInfo.getDepart_id()+"'";
		System.out.println("-->sql:"+sql);
		boolean flag = dao.update(sql);
		return flag;
	}

	/**
	 * 根据部门名模糊查询部门信息
	 */
	public Vector[] queryAll(String string) {
		// TODO Auto-generated method stub
		String sql = "select * from (select DepartInfo.depart_id ,depart_name,user_id,user_name,user_sex,user_tel from DepartInfo left join UserInfo on DepartInfo.depart_id = UserInfo.depart_id) a where a.user_name like '%"+string+"%'";
		System.out.println("-->sql:"+sql);
		Vector[] vectors = dao.query2Str(sql);
		return vectors;
	}

	/**
	 * 显示所有部门信息
	 */
	public Vector[] showAll() {
		// TODO Auto-generated method stub
		String sql = "select DepartInfo.depart_id ,depart_name,user_id,user_name,user_sex,user_tel from DepartInfo left join UserInfo on DepartInfo.depart_id = UserInfo.depart_id";
		System.out.println("-->sql:"+sql);
		Vector[] vectors= dao.query2Str(sql);
		return vectors;
	}

	/**
	 * 根据id查询部门信息
	 */
	public DepartInfo findById(String depart_id) {
		// TODO Auto-generated method stub
		String sql = "select * from departInfo where depart_id='"+depart_id+"'";
		System.out.println("-->sql:"+sql);
		DepartInfo departInfo = (DepartInfo) dao.findById(sql);
		return departInfo;
	}
	@Override
	public Vector[] showOne(String depart_id) {
		String sql = "select * from departInfo where depart_id='"+depart_id+"'";
		System.out.println("-->sql:"+sql);
		Vector[] vectors = dao.query2Str(sql);
		return vectors;
	}
	/**
	 * 根据name查询部门信息
	 */
	@Override
	public DepartInfo findByName(String depart_name) {
		// TODO Auto-generated method stub
		String sql = "select * from departInfo where depart_name='"+depart_name+"'";
		System.out.println("-->sql:"+sql);
		DepartInfo departInfo = (DepartInfo) dao.findById(sql);
		return departInfo;
	}

	/**
	 * 录入员工信息的时候，异步加载出所有部门名
	 */
	@Override
	public List<DepartInfo> showAllDepart() {
		// TODO Auto-generated method stub
		String sql = "select * from DepartInfo ";
		System.out.println("-->sql:"+sql);
		List<DepartInfo> list = dao.query(sql);
		return list;
	}
	/**
	 * 根据名称显示出对应部门信息
	 */
	@Override
	public Vector[] showByName(String depart_name) {
		// TODO Auto-generated method stub
		String sql = "select * from(select DepartInfo.depart_id ,depart_name,user_id,user_name,user_sex,user_tel from DepartInfo left join UserInfo on DepartInfo.depart_id = UserInfo.depart_id)a where a.depart_name='"+depart_name+"'";
		System.out.println("-->sql:"+sql);
		Vector[] vectors= dao.query2Str(sql);
		return vectors;
	}
	


}
