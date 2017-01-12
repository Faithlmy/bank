package com.zrgk.bankpolling.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import java.util.Vector;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.zrgk.bankpolling.bean.DeviceInfo;
import com.zrgk.bankpolling.bean.SiteInfo;
import com.zrgk.bankpolling.service.DeviceInfoService;
import com.zrgk.bankpolling.service.SiteInfoService;
import com.zrgk.bankpolling.serviceimpl.DeviceInfoServiceImpl;
import com.zrgk.bankpolling.serviceimpl.SiteInfoServiceImpl;
import com.zrgk.bankpolling.util.Page;
import com.zrgk.bankpolling.util.PageService;
/**
 * 
 * 
 * <p>
 * Title:
 * </p>
 * <p>
 * Description: com.zrgk.bankpolling.servlet.PositionInfoServlet.java
 * </p>
 * <p>
 * Copyright: Copyright (c) 2014
 * </p>
 * <p>
 * 

 */

public class DeviceInfoServlet extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		//设置编码格式
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		//获取操作类型
		String opt = request.getParameter("opt");
	    boolean flag = false;
	   //关联服务
	    DeviceInfoService deviceInfoService = new DeviceInfoServiceImpl();
	    SiteInfoService siteInfoService = new SiteInfoServiceImpl();
		Page page = new Page();
		PageService pageService = new PageService();
		/**
		 * 添加设备信息
		 */
	   if("addDevice".equals(opt)){
		   //获取保单信息
		   String device_id = request.getParameter("device_id").trim();
		   String site_id = request.getParameter("site_id").trim();
		   String device_name = new String(request.getParameter("device_name").trim().getBytes("iso-8859-1"),"utf-8");
		   String device_state = new String(request.getParameter("device_state").trim().getBytes("iso-8859-1"),"utf-8");
		   String task_state = new String(request.getParameter("task_state").trim().getBytes("iso-8859-1"),"utf-8");
		   //创建DeviceInfo对象，关联DeviceInfoService业务
		   DeviceInfo deviceInfo = new DeviceInfo(device_id,site_id,device_name,device_state,task_state);
		   System.out.println("呵呵"+deviceInfo);
		   flag = deviceInfoService.addDevice(deviceInfo);
		   response.sendRedirect("device.do?opt=showAll");
		   return;
	   }
		/**
		 * 删除设备信息
		 */
	   if("delDevice".equals(opt)){
		   String device_id = request.getParameter("device_id").trim();
		   flag = deviceInfoService.delDevice(device_id);
		   response.sendRedirect("device.do?opt=showAll");
		   return;
	   }
	   /**
	    * 获取当前设备信息
	    */
		if("toUpdState".equals(opt)){
			String device_id = request.getParameter("device_id").trim();
			Vector[] vectors =deviceInfoService.showOne(device_id);
			request.setAttribute("deviceinfo", vectors[1]);
			request.getRequestDispatcher("web/system/device/fix_add.jsp").forward(request, response);
			return;
		}
		/**
		 * 传递当前设备信息到修改页面
		 */
		if("toUpdDevice".equals(opt)){
			String device_id = request.getParameter("device_id").trim();
			Vector[] vectors =deviceInfoService.showOne(device_id);
			request.setAttribute("deviceinfo", vectors[1]);
			System.out.println(vectors[1]);
			request.getRequestDispatcher("web/system/device/device_edit.jsp").forward(request, response);
			return;
		}
	   /**
	    * 修改设备信息
	    */
	   if("updDevice".equals(opt)){
		   String device_id = request.getParameter("device_id").trim();
		   String site_id = request.getParameter("site_id").trim();
		   String device_name = new String(request.getParameter("device_name").trim().getBytes("iso-8859-1"),"utf-8");
		   String device_state = new String(request.getParameter("device_state").trim().getBytes("iso-8859-1"),"utf-8");
		   String task_state = new String(request.getParameter("task_state").trim().getBytes("iso-8859-1"),"utf-8");
		   //创建DeviceInfo对象，关联DeviceInfoService业务
		   DeviceInfo deviceInfo = new DeviceInfo(device_id,site_id,device_name,device_state,task_state);
		   
		   flag = deviceInfoService.updDevice(deviceInfo);
		   response.sendRedirect("device.do?opt=showAll");
		   return;
		   
	   }
	   /**
	    * 将当前对象传递到状态更改页面
	    */
	   if("toUpdState".equals(opt)){
		   String device_id = request.getParameter("device_id").trim();   
		  
		   //创建DeviceInfo对象，关联DeviceInfoService业务
		   Vector[] vectors=deviceInfoService.showOne(device_id);
		   System.out.println("sdasdasd"+vectors[1]);
		   request.setAttribute("list", vectors[1]);
		   request.getRequestDispatcher("web/system/device/fix_add.jsp").forward(request, response);
		   return;
	   }
	   /**
	    * 查询所有设备信息
	    */
		if("showAll".equals(opt)){
			//获取页面处理方式（首页，尾页，上一页，下一页）
			String method=request.getParameter("method");
			//调用userService查询所有用户信息
			Vector[] vectors = deviceInfoService.showAll();
			//获取当前页面
			page = pageService.getPage(page.getCurrentPage(), method, vectors[1].size());
			request.getSession().setAttribute("page", page);
			//创建页面列表pageList，将list中的记录都方法到pageList中用于分页
			List pagelist = new ArrayList();
			/**
			 * 获取到list.size就可以进行分页
			 */
			for(int i = page.getStartRow(); i < page.getStartRow()+page.getPageSize() && i < vectors[1].size(); i++){
				pagelist.add(vectors[1].get(i));
			}
			request.setAttribute("list", pagelist);
			System.out.println("ss"+pagelist);
			request.getRequestDispatcher("web/system/device/device_info.jsp").forward(request, response);
			return;
			
		}
	   /**
	    * 查询单个记录信息
	    */
	   if("findById".equals(opt)){
		   String device_id = request.getParameter("device_id").trim();
		   DeviceInfo deviceinfo=deviceInfoService.findById(device_id);
		   request.setAttribute("deviceinfo", deviceinfo);
		   request.getRequestDispatcher("web/system/device/device_details.jsp").forward(request, response); 
	   }
	   /**
	    * 模糊查询
	    */
	   if("queryAll".equals(opt)){
		   String string = new String(request.getParameter("search").getBytes("ISO-8859-1"),"utf-8");
		   Vector[] vectors = deviceInfoService.queryAll(string);
			request.setAttribute("list", vectors[1]);
			request.getRequestDispatcher("web/system/device/device_info.jsp").forward(request, response);
			return;
	   }
	   /**
		 * 异步加载设备信息
		 */
		if ("showAsync".equals(opt)) {
			String device_id = request.getParameter("device_id");
			DeviceInfo deviceInfo = deviceInfoService.findById(device_id);
			String site_id = deviceInfo.getSite_id();
			//查询deviceinfo对应的site_name
			SiteInfo siteInfo = siteInfoService.findById(site_id);			
			String str = "{'device_id':'"+deviceInfo.getDevice_id()+"','device_name':'"+deviceInfo.getDevice_name()+"','device_state':'"+deviceInfo.getDevice_state()+"','site_id':'"+deviceInfo.getSite_id()+"','task_state':'"+deviceInfo.getTask_state()+"','site_name':'"+siteInfo.getSite_name()+"'}";
			System.out.println(str);
			out.print(str);		
			return;
		}
	}

}
