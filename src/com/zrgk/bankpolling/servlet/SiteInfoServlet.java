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


import com.zrgk.bankpolling.bean.SiteInfo;
import com.zrgk.bankpolling.service.SiteInfoService;
import com.zrgk.bankpolling.serviceimpl.SiteInfoServiceImpl;
import com.zrgk.bankpolling.util.Page;
import com.zrgk.bankpolling.util.PageService;


import com.zrgk.bankpolling.service.PrivilegeInfoService;
import com.zrgk.bankpolling.service.SiteInfoService;
import com.zrgk.bankpolling.serviceimpl.PrivilegeInfoserviceimpl;
import com.zrgk.bankpolling.serviceimpl.SiteInfoServiceImpl;
import com.zrgk.bankpolling.util.Page;
import com.zrgk.bankpolling.util.PageService;


public class SiteInfoServlet extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		//设置页面格式
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		//获取操作
		String opt = request.getParameter("opt");

		System.out.println(opt);
		boolean flag = false;
		//关联业务
		SiteInfoService siteInfoService = new SiteInfoServiceImpl();
		Page page = new Page();
		PageService pageService = new PageService();

		/**
		 * 添加网点信息
		 */
		if("addSite".equals(opt)){
			String site_id = request.getParameter("site_id").trim();		
			String site_name = new String(request.getParameter("site_name").trim().getBytes("iso-8859-1"),"utf-8");
			String site_address = new String(request.getParameter("site_address").trim().getBytes("iso-8859-1"),"utf-8");
			String site_tel = request.getParameter("site_tel").trim();
			String site_ip = request.getParameter("site_ip").trim();
			//生成siteInfo对象，关联siteService业务
			SiteInfo siteInfo = new SiteInfo(site_id, site_name, site_address, site_tel, site_ip);
			flag = siteInfoService.addSite(siteInfo);
			response.sendRedirect("site.do?opt=showAll");
			return;
		}
		if("showAll".equals(opt)){
			//获取页面处理方式（首页，尾页，上一页，下一页）
			String method=request.getParameter("method");
			//调用userService查询所有用户信息
			Vector[] vectors = siteInfoService.showAll();
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
			System.out.println(pagelist);
			request.setAttribute("list", pagelist);
			request.getRequestDispatcher("web/site/site_info.jsp").forward(request, response);
			return; 
		}
		if("queryAll".equals(opt)){
			String string = new String(request.getParameter("search").getBytes("ISO-8859-1"),"utf-8");
			Vector[] vectors= siteInfoService.queryAll(string);
			request.setAttribute("list", vectors[1]);
			request.getRequestDispatcher("web/site/site_info.jsp").forward(request, response);
			return;
		}
		if("delSite".equals(opt)){
			String site_id = request.getParameter("site_id").trim();
		    flag = siteInfoService.delSite(site_id);
			response.sendRedirect("site.do?opt=showAll");
			return;
		}
		if("toUpdSite".equals(opt)){
			String site_id = request.getParameter("site_id").trim();
			SiteInfo siteInfo = siteInfoService.findById(site_id);
			//转发单个对象信息到修改页面
			request.setAttribute("siteinfo", siteInfo);
			System.out.println("siteinfo"+siteInfo);
		    request.getRequestDispatcher("web/site/site_edit.jsp").forward(request, response);
			return;  
		}
		if("updSite".equals(opt)){
			String site_id = request.getParameter("site_id").trim();
			String site_name = new String(request.getParameter("site_name").trim().getBytes("iso-8859-1"),"utf-8");
			String site_address = new String(request.getParameter("site_address").trim().getBytes("iso-8859-1"),"utf-8");
			String site_tel = request.getParameter("site_tel").trim();
			String site_ip = request.getParameter("site_ip").trim();
			//创建SiteInfo对象，关联siteService业务
			SiteInfo siteInfo = new SiteInfo(site_id, site_name, site_address, site_tel, site_ip);
			flag = siteInfoService.updSite(siteInfo);
			response.sendRedirect("site.do?opt=showAll");
			return;  
		}
		/**
		 * 异步加载设备信息
		 */
		if ("showAsync".equals(opt)) {
			String site_id = request.getParameter("site_id");
			SiteInfo siteInfo = siteInfoService.findById(site_id);
			String str = "{'site_id':'"+siteInfo.getSite_id()+"','site_name':'"+siteInfo.getSite_name()+"','site_address':'"+siteInfo.getSite_address()+"','site_tel':'"+siteInfo.getSite_tel()+"','site_ip':'"+siteInfo.getSite_ip()+"'}";
			System.out.println(str);
			out.print(str);		
			return;
		}
	}

}
