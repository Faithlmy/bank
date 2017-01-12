package com.zrgk.bankpolling.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.zrgk.bankpolling.service.DeviceInfoService;
import com.zrgk.bankpolling.service.PriRoleInfoService;
import com.zrgk.bankpolling.serviceimpl.DeviceInfoServiceImpl;
import com.zrgk.bankpolling.serviceimpl.PriRoleInfoServiceImpl;
import com.zrgk.bankpolling.util.Page;
import com.zrgk.bankpolling.util.PageService;

public class PriRoleInfoServlet extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		String opt = request.getParameter("opt");
		 boolean flag = false;
			//关联服务
			PriRoleInfoService priRoleInfoService = new PriRoleInfoServiceImpl();
		    Page page = new Page();
			PageService pageService = new PageService();
			 //获取页面信息
			String role_id = request.getParameter("role_id").trim();
            String pri_id = request.getParameter("pri_id").trim();
	}
}
