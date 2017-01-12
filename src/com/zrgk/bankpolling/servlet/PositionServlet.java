package com.zrgk.bankpolling.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.Vector;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.zrgk.bankpolling.bean.UserInfo;
import com.zrgk.bankpolling.service.UserInfoService;
import com.zrgk.bankpolling.serviceimpl.UserInfoServiceImpl;
import com.zrgk.bankpolling.util.Page;
import com.zrgk.bankpolling.util.PageService;

public class PositionServlet extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		String opt = request.getParameter("opt");
		SimpleDateFormat dateFormat1 = new SimpleDateFormat("yyyyMMddHHmmss");// 设置日期格式
		SimpleDateFormat dateFormat2 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

		boolean flag = false;
		// 关联所有需要用到的业务
		UserInfoService userService = new UserInfoServiceImpl();
		Page page = new Page();
		PageService pageService = new PageService();
		
		/**
		 * 显示所有用户信息
		 */
		if ("showAll".equals(opt)) {
			// 获取页面处理方式（首页，尾页，上一页，下一页）
			String method = request.getParameter("method");
			// 调用userService查询所有用户信息
			System.out.println(method);
			Vector[] vectors = userService.showAll();
			System.out.println(vectors[1]);
			// 获取当前页面
			page = pageService.getPage(page.getCurrentPage(), method,
					vectors[1].size());
			request.getSession().setAttribute("page", page);
			// 创建页面列表pageList，将list中的记录都方法到pageList中用于分页
			List pagelist = new ArrayList<UserInfo>();
			/**
			 * 获取到list.size就可以进行分页
			 */
			for (int i = page.getStartRow(); i < page.getStartRow()
					+ page.getPageSize()
					&& i < vectors[1].size(); i++) {
				pagelist.add(vectors[1].get(i));
				System.out.println("ss"+pagelist.get(i));
			}
			
			request.setAttribute("list", pagelist);
			request.getRequestDispatcher("web/system/position/position_info.jsp")
					.forward(request, response);
			return;
		}
		/**
		 * 模糊查询所有用户
		 */
		if ("queryAll".equals(opt)) {
			String string = new String(request.getParameter("search").getBytes(
					"ISO-8859-1"), "utf-8");
			Vector[] vectors = userService.queryAll(string);
			request.setAttribute("list", vectors[1]);
			request.getRequestDispatcher("web/system/position/position_info.jsp")
					.forward(request, response);
			return;
		}
	}

}
