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

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import com.zrgk.bankpolling.bean.GroupInfo;
import com.zrgk.bankpolling.bean.UserInfo;
import com.zrgk.bankpolling.service.DeviceInfoService;
import com.zrgk.bankpolling.service.GroupInfoService;
import com.zrgk.bankpolling.serviceimpl.DeviceInfoServiceImpl;
import com.zrgk.bankpolling.serviceimpl.GroupInfoserviceimpl;
import com.zrgk.bankpolling.util.Page;
import com.zrgk.bankpolling.util.PageService;

public class GroupInfoServlet extends HttpServlet {

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
		GroupInfoService groupInfoService = new GroupInfoserviceimpl();
		Page page = new Page();
		PageService pageService = new PageService();

		/**
		 * 增加组信息
		 */
		if ("addGroup".equals(opt)) {
			/**
			 * 获取页面信息
			 */
			String group_id = request.getParameter("group_id").trim();
			String group_name = new String(request.getParameter("group_name")
					.trim().getBytes("iso-8859-1"), "utf-8");
			// 创建GroupInfo对象，关联GroupService业务
			GroupInfo groupInfo = new GroupInfo(group_id, group_name);
			flag = groupInfoService.addGroup(groupInfo);
			response.sendRedirect("group.do?opt=showAll");
			return;
		}
		/**
		 * 删除组信息
		 */
		if ("delGroup".equals(opt)) {
			String group_name = new String(request.getParameter("group_name").trim().getBytes("iso-8859-1"),"utf-8");
			System.out.println(!group_name.equals("0"));
			if(!group_name.equals("0")){
				GroupInfo groupInfo = groupInfoService.findByName(group_name);
				String group_id = groupInfo.getGroup_id();
				flag = groupInfoService.delGroup(group_id);
				response.sendRedirect("group.do?opt=showAll");
			}else{
				String str = "--！ 请返回分组管理，选择分组。";
				out.print(str);
			}
			return;
		}
		/**
		 * 显示所有组信息
		 */
		if ("showAll".equals(opt)) {
			// 获取页面处理方式（首页，尾页，上一页，下一页）
			String method = request.getParameter("method");
			// 调用userService查询所有用户信息
			Vector[] vectors = groupInfoService.showAll();
			// 获取当前页面
			page = pageService.getPage(page.getCurrentPage(), method,
					vectors[1].size());
			request.getSession().setAttribute("page", page);
			// 创建页面列表pageList，将list中的记录都方法到pageList中用于分页
			List pagelist = new ArrayList();
			/**
			 * 获取到list.size就可以进行分页
			 */
			for (int i = page.getStartRow(); i < page.getStartRow()
					+ page.getPageSize()
					&& i < vectors[1].size(); i++) {
				pagelist.add(vectors[1].get(i));
			}
			request.setAttribute("list", pagelist);
			request.getRequestDispatcher("web/polling/group_info.jsp").forward(
					request, response);
			return;
		}
		/**
		 * 查看某个组的详细信息（如：组成员）
		 */
		if ("showOne".equals(opt)) {
			// 获取页面信息
			String group_id = request.getParameter("group_id").trim();
			GroupInfo groupinfo = groupInfoService.findById(group_id);
			request.setAttribute("groupinfo", groupinfo);
			request.getRequestDispatcher("web/polling/group_details.jsp")
					.forward(request, response);
		}
		/**
		 * 模糊查询组信息（模糊查询，通过组编号）
		 */
		if ("queryAll".equals(opt)) {
			// 获取页面信息
			String string = new String(request.getParameter("search").trim()
					.getBytes("iso-8859-1"), "utf-8");
			Vector[] vectors = groupInfoService.queryAll(string);
			request.setAttribute("list", vectors[1]);
			request.getRequestDispatcher("web/polling/group_info.jsp").forward(
					request, response);
			return;
		}
		/**
		 * 将当前行对象传递到修改信息页面
		 */
		if ("toUpdGroup".equals(opt)) {
			// 获取页面信息
			String group_name = new String(request.getParameter("group_name").trim().getBytes("iso-8859-1"),"utf-8");
			if(!group_name.equals("0")){
				GroupInfo groupinfo = groupInfoService.findByName(group_name);
				//String group_id = groupinfo.getGroup_id();
				// 转发单个对象信息到修改页面
				request.setAttribute("groupinfo", groupinfo);
				request.getRequestDispatcher("web/polling/group_edit.jsp").forward(
					request, response);				
			}else{
				String str = "--！ 请返回分组管理，选择分组。";
				out.print(str);
			}
			return;
		}
		/**
		 * 修改组信息
		 */
		if ("updGroup".equals(opt)) {
			// 获取页面信息
			String group_id = request.getParameter("group_id").trim();
			String group_name = new String(request.getParameter("group_name")
					.trim().getBytes("iso-8859-1"), "utf-8");
			GroupInfo groupInfo = new GroupInfo(group_id, group_name);
			flag = groupInfoService.updGroup(groupInfo);
			response.sendRedirect("group.do?opt=showAll");
			return;
		}
		/**
		 * 录入员工记录的时候异步加载所有组名
		 */
		if ("findAllGroup".equals(opt)) {
			System.out.println("-----1-----");
			JSONArray array = new JSONArray();
			List<GroupInfo> list = groupInfoService.findAllGroup();
			for (GroupInfo groupinfo : list) {
				JSONObject obj = new JSONObject().fromObject(groupinfo);
				array.add(obj);
			}
			System.out.println("group-->" + array.toString());
			out.print(array);
			return;
		}
		/**
		 * 根据组名显示对应的组信息
		 */
		if ("showByName".equals(opt)) {
			// 获取页面处理方式（首页，尾页，上一页，下一页）
			String method = request.getParameter("method");
			String group_name = new String(request.getParameter("group_name").trim().getBytes("iso-8859-1"),"utf-8");
			// 调用userService查询所有用户信息
			Vector[] vectors = groupInfoService.showByName(group_name);
			// 获取当前页面
			page = pageService.getPage(page.getCurrentPage(), method,
					vectors[1].size());
			request.getSession().setAttribute("page", page);
			// 创建页面列表pageList，将list中的记录都方法到pageList中用于分页
			List pagelist = new ArrayList();
			/**
			 * 获取到list.size就可以进行分页
			 */
			for (int i = page.getStartRow(); i < page.getStartRow()
					+ page.getPageSize()
					&& i < vectors[1].size(); i++) {
				pagelist.add(vectors[1].get(i));
			}
			request.setAttribute("list", pagelist);
			request.getRequestDispatcher("web/polling/group_info.jsp").forward(
					request, response);
			
			return;
		}
	}

}
