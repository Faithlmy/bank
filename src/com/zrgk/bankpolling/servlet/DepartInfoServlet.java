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

import com.zrgk.bankpolling.bean.DepartInfo;
import com.zrgk.bankpolling.bean.GroupInfo;
import com.zrgk.bankpolling.bean.UserInfo;
import com.zrgk.bankpolling.service.DepartInfoService;
import com.zrgk.bankpolling.service.DeviceInfoService;
import com.zrgk.bankpolling.serviceimpl.DepartInfoServiceImpl;
import com.zrgk.bankpolling.serviceimpl.DeviceInfoServiceImpl;
import com.zrgk.bankpolling.serviceimpl.UserInfoServiceImpl;
import com.zrgk.bankpolling.util.Page;
import com.zrgk.bankpolling.util.PageService;

public class DepartInfoServlet extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		String opt = request.getParameter("opt");

		// 关联服务
		DepartInfoService departInfoService = new DepartInfoServiceImpl();
		UserInfoServiceImpl userserviceImpl = new UserInfoServiceImpl();
		// 关联分页业务
		Page page = new Page();
		PageService pageService = new PageService();

		/**
		 * 显示所有部门信息
		 */
		if ("showAll".equals(opt)) {
			// 获取页面处理方式（首页，尾页，上一页，下一页）
			String method = request.getParameter("method");
			// 调用userService查询所有用户信息
			Vector[] vectors = departInfoService.showAll();
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
			request.getRequestDispatcher("web/system/depart/depart_info.jsp")
					.forward(request, response);
			return;
		}
		/**
		 * 增加部门信息
		 */
		if ("addDepart".equals(opt)) {
			// 获取页面信息
			String depart_id = request.getParameter("depart_id").trim();
			String depart_name = new String(request.getParameter("depart_name")
					.trim().getBytes("iso-8859-1"), "utf-8");
			String user_id = request.getParameter("user_id").trim();
			// 创建DepartInfo对象，关联DepartService业务
			DepartInfo departInfo = new DepartInfo(depart_id, depart_name);
			boolean flag = departInfoService.addDepart(departInfo);
			// 同时关联用户和部门之间的外键关系
			UserInfo userInfo = new UserInfo(user_id, depart_id);
			boolean flag2= userserviceImpl.updFK("depart_id", depart_id, user_id);
			response.sendRedirect("depart.do?opt=showAll");
			return;
		}

		/**
		 * 模糊查询部门信息
		 */
		if ("queryAll".equals(opt)) {
			String string = new String(request.getParameter("search").getBytes(
					"ISO-8859-1"), "utf-8");
			Vector[] vectors = departInfoService.queryAll(string);
			request.setAttribute("list", vectors[1]);
			request.getRequestDispatcher("web/system/depart/depart_info.jsp")
					.forward(request, response);
			return;

		}

		/**
		 * 将当前行对象传递到修改信息页面
		 */
		if ("toupdDepart".equals(opt)) {
			// 获取当前对象
			String depart_name = new String (request.getParameter("depart_name").getBytes("ISO-8859-1"),"UTF-8");
			if(!depart_name.equals("0")){
				DepartInfo departinfo = departInfoService.findByName(depart_name);
				// 转发单个对象信息到修改页面
				request.setAttribute("departinfo", departinfo);
				request.getRequestDispatcher("web/system/depart/depart_edit.jsp")
				.forward(request, response);
			}else{
				String str = "~~~~(>_<)~~~~ ！出错啦！ 请返回【部门管理】，选择部门。";
				out.print(str);
			}		
			return;
		}
		/**
		 * 修改部门信息
		 */
		if ("updDepart".equals(opt)) {
			// 获取页面信息
			String depart_id = request.getParameter("depart_id");
			String depart_name = new String(request.getParameter("depart_name")
					.trim().getBytes("ISO-8859-1"), "UTF-8");
			DepartInfo departinfo = new DepartInfo(depart_id, depart_name);
			boolean flag = departInfoService.updDepart(departinfo);
			// 去显示所有部门信息页面
			response.sendRedirect("depart.do?opt=showAll");
			return;
		}
		/**
		 * 删除部门信息
		 * 
		 */
		if ("delDepart".equals(opt)) {
			//获取下拉菜单选中的部门名称
			String depart_name = new String (request.getParameter("depart_name").trim().getBytes("ISO-8859-1"),"UTF-8");
			if(!depart_name.equals("0")){
				DepartInfo departInfo =departInfoService.findByName(depart_name);
				String depart_id = departInfo.getDepart_id();
				boolean flag = departInfoService.delDepart(depart_id);
				response.sendRedirect("depart.do?opt=showAll");
			}
			else{
				String str = "~~~~(>_<)~~~~ ！出错啦！ 请返回【部门管理】，选择部门。";
				out.print(str);
			}	
			
			return;
		}
		/**
		 * 显示单个部门详细信息
		 */
		if ("showOne".equals(opt)) {
			String depart_id = request.getParameter("depart_id");
			DepartInfo departinfo = departInfoService.findById(depart_id);
			request.setAttribute("departinfo", departinfo);
			System.out.println(departinfo);
			request.getRequestDispatcher("web/system/depart/depart_details.jsp")
					.forward(request, response);
			return;
		}
		/**
		 * 添加用户信息页面显示所有部门信息
		 */
		if("showAllDepart".equals(opt)){
			//创建json数组 
			JSONArray  array = new JSONArray();
			//查询所有部门信息
			List<DepartInfo> list = departInfoService.showAllDepart();			
			for (DepartInfo departinfo : list) {
				JSONObject obj = new JSONObject().fromObject(departinfo);
				array.add(obj);
			}
			System.out.println("depart-->"+array.toString());
			out.print(array);
			return;
		}
		/**
		 * 根据部门名称显示对应信息
		 */
		if("showByName".equals(opt)){
			
			// 获取页面处理方式（首页，尾页，上一页，下一页）
			String method = request.getParameter("method");
			String depart_name = new String(request.getParameter("depart_name").trim().getBytes("iso-8859-1"),"utf-8");
			// 调用userService查询所有用户信息
			Vector[] vectors = departInfoService.showByName(depart_name);
			// 获取当前页面
			page = pageService.getPage(page.getCurrentPage(), method,
					vectors[1].size());
			request.getSession().setAttribute("page", page);
			// 创建页面列表pageList，将list中的记录方法到pageList中用于分页
			List pagelist = new ArrayList();
			/**
			 * 获取到list.size就可以进行分页
			 */
			for (int i = page.getStartRow(); i < page.getStartRow()
					+ page.getPageSize()
					&& i < vectors[1].size(); i++) {
				pagelist.add(vectors[1].get(i));
			}
			System.out.println("ss" + pagelist);
			request.setAttribute("list", pagelist);
			request.getRequestDispatcher("web/system/depart/depart_info.jsp")
					.forward(request, response);
			return;
		}
		/**
		 * 从部门中删除成员
		 */
		if("removeEmployee".equals(opt)){
			//获取用户ID，并在UserInfo中删除对应user_id的depart_id
			String user_id=request.getParameter("user_id");
			userserviceImpl.delFK2("depart_id", user_id);
			response.sendRedirect("depart.do?opt=showAll");
			return ;
		}
	}
}
