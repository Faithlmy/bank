package com.zrgk.bankpolling.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.Vector;

/**
 * 
 * 
 * <p>
 * Title:DBUtil
 * Description: com.hrgj.bankpolling.util.DBUtil.java
 * </p>
 * <p>
 * Copyright: Copyright (c) 2015
 * </p>
 * <p>
 */

public abstract class DBUtil {
	private static final String DRIVER = "com.mysql.jdbc.Driver";
	private static final String URL = "jdbc:mysql://localhost/bankpolling";
	private static final String USERNAME= "root";
	private static final String PWD= "123";
	private Connection conn = null;
	private Statement state = null;
	protected ResultSet rs = null;
	
	/**
	 *加载驱动
	 */
	static{
		try {
			Class.forName(DRIVER);
			System.out.println("-->驱动加载成功！");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	/**
	 * 获取链接
	 */
	private void getConnection(){
		try {
			conn = DriverManager.getConnection(URL,USERNAME,PWD);
			if (!conn.isClosed()) {
				System.out.println("-->获取链接成功!");
			} else {
				System.out.println("-->获取链接失败!");
			}
		
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	/**
	 * 通用增删改封装
	 * @param sql
	 * @return
	 */
	public boolean update(String sql){
		//1获取链接
		getConnection();
		boolean flag = false;
		//2打印sql
		System.out.println("sql-->"+sql);
		//3执行sql
		try {
			state = conn.createStatement();
			int lines = state.executeUpdate(sql);
			if(lines>0){
				System.out.println("-->sql:"+sql.substring(0, sql.indexOf(" "))+" 执行成功!");
				flag = true;
			}else {
				System.out.println("-->sql:"+sql.substring(0, sql.indexOf(" "))+" 执行失败 !");
				flag = false;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			close();
		}
		return flag;
		
	}
	/**
	 * 通用查询：查询多条记录
	 * @param sql
	 * @return
	 */
	public List query(String sql){
		List  list = new ArrayList();
		//1获取链接
		getConnection();
		//2打印sql
		System.out.println("-->sql:"+sql);
		//3 执行sql
		try {
			state = conn.createStatement();
			rs = state.executeQuery(sql);
			rs2list(list);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			close();
		}
		
		return list;
		
	}
	/**
	 * 抽象方法rs2list(List list)
	 * @param list
	 */
	protected abstract void rs2list(List list) ;
	/**
	 * 通用查询：查询单条记录
	 * @param sql
	 * @return
	 */
	public Object findById(String sql){
		Object obj = null;
		//1获取链接
		getConnection();
		//2 打印sql
		System.out.println("-->sql:"+sql);
		//3 执行sql
				try {
					state = conn.createStatement();
					rs = state.executeQuery(sql);
					obj = rs2obj();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}finally{
					close();
				}
				
		return obj;
	}
	
	/**
	 * 通用多表查询
	 * 
	 * @param sql
	 * @return
	 */
	public Vector[] query2Str(String sql) {
		getConnection();
		Vector[] v = new Vector[2];
		v[0] = new Vector();
		v[1] = new Vector();
		System.out.println("-->sql:" + sql);
		try {
			state = conn.createStatement();
			rs = state.executeQuery(sql);
			ResultSetMetaData header = rs.getMetaData();
			int count = header.getColumnCount();
			for (int i = 1; i <= count; i++) {
				v[0].add(header.getColumnName(i));
			}
			while (rs.next()) {
				Vector vRow = new Vector();
				for (int i = 1; i <= count; i++) {
					vRow.add(rs.getString(i));
				}
				v[1].add(vRow);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return v;
	}

	/**
	 * 抽象方法rs2obj();
	 * @return
	 */
	protected abstract Object rs2obj() ;
	/**
	 * 关闭链接
	 */
	private void close(){
		if(rs!=null){
			try {
				rs.close();
				rs = null;
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		if(state!=null){
			try {
				state.close();
				state = null;
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		if(conn!=null){
			try {
				conn.close();
				conn = null;
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		System.out.println("-->关闭链接！");
		
	}
}
