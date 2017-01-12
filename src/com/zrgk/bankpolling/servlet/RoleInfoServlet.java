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

import com.zrgk.bankpolling.bean.RoleInfo;

import com.zrgk.bankpolling.service.PrivilegeInfoService;
import com.zrgk.bankpolling.service.RoleInfoService;
import com.zrgk.bankpolling.serviceimpl.PrivilegeInfoserviceimpl;
import com.zrgk.bankpolling.serviceimpl.RoleInfoServiceImpl;
import com.zrgk.bankpolling.util.Page;
import com.zrgk.bankpolling.util.PageService;

public class RoleInfoServlet extends HttpServlet {

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
		RoleInfoService roleInfoService = new RoleInfoServiceImpl();
		Page page = new Page();
		PageService pageService = new PageService();
		/**
		 * 添加角色
		 */
		if ("addRole".equals(opt)) {
			// 获取页面信息
			System.out.println("-----addRole-----");
			String role_id = request.getParameter("role_id").trim();
			String role_type = new String(request.getParameter("role_type")
					.trim().getBytes("iso-8859-1"), "utf-8");
			String role_describe = new String(request
					.getParameter("role_describe").trim()
					.getBytes("iso-8859-1"), "utf-8");
			String role_privilege = new String(request
					.getParameter("p_name").trim()
					.getBytes("iso-8859-1"), "utf-8");
			RoleInfo roleInfo = new RoleInfo(role_id, role_type, role_describe,
					role_privilege);
			String pri_id = request.getParameter("pri_id").trim();
			System.out.println("O(∩_∩)O哈哈哈~"+pri_id);
			
			boolean flag = roleInfoService.addRole(roleInfo,pri_id);
			response.sendRedirect("role.do?opt=showAll");
			return;
		}
		/**
		 * 输出所有角色
		 */
		if ("showAll".equals(opt)) {
			System.out.println("-----showAll-----");

			// 获取页面处理方式（首页，尾页，上一页，下一页）
			String method = request.getParameter("method");
			// 调用userService查询所有用户信息
			System.out.println(method);
			List<RoleInfo> list = roleInfoService.showAll();
			System.out.println("sdsdsdsdsdsdsds"+list);
			page = pageService.getPage(page.getCurrentPage(), method,
					list.size());
			request.getSession().setAttribute("page", page);
			List<RoleInfo> pagelist = new ArrayList<RoleInfo>();
			for(int i = page.getStartRow(); i < page.getStartRow()+page.getPageSize() && i < list.size(); i++){
				pagelist.add(list.get(i));
			}
			request.setAttribute("list", pagelist);
			request.getRequestDispatcher("web/system/role/role_info.jsp").forward(request, response);
			return;
		}
		/**
		 * 查找所有已有角色
		 */
		if ("findAllRole".equals(opt)) {
			System.out.println("-----findAllRole-----");
			JSONArray array = new JSONArray();
			List<RoleInfo> list = roleInfoService.showAll();
			for (RoleInfo roleInfo : list) {
				JSONObject obj = new JSONObject().fromObject(roleInfo);
				array.add(obj);
			}
			System.out.println("role---" + array.toString());
			out.print(array);
			return;
		}
		/**
		 * 传递当前角色到修改页面
		 */
		if("toUpdRole".equals(opt)){
			System.out.println("-----toUpdRole-----");
			String role_id = request.getParameter("role_id").trim();
			RoleInfo roleInfo =roleInfoService.findById(role_id);
			request.setAttribute("roleInfo", roleInfo);
			request.getRequestDispatcher("web/system/role/role_edit.jsp").forward(request, response);
			return;
		}
		/**
		 * 修改角色信息
		 */
		if("updRole".equals(opt)){
			System.out.println("-----updRole-----");
			String role_id = request.getParameter("role_id").trim();
			String role_type = new String (request.getParameter("role_type").trim().getBytes("ISO-8859-1"),"UTF-8");
			String role_describe = new String (request.getParameter("role_describe").trim().getBytes("ISO-8859-1"),"UTF-8");
			String role_privilege = new String(request
					.getParameter("p_name").trim()
					.getBytes("iso-8859-1"), "utf-8");
			RoleInfo roleInfo = new RoleInfo(role_id, role_type, role_describe,
					role_privilege);
			System.out.println("/-/-*//-/-/"+roleInfo);
			boolean flag = roleInfoService.updRole(roleInfo);
			response.sendRedirect("role.do?opt=showAll");
		}
		/**
		 * 删除角色信息
		 */
		if("delRole".equals(opt)){
			System.out.println("-----delRole-----");
			String role_id = request.getParameter("role_id").trim();
			boolean flag = roleInfoService.delRole(role_id);
			response.sendRedirect("role.do?opt=showAll");
			
		}

	}

}
