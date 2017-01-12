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
import javax.servlet.http.HttpSession;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import com.zrgk.bankpolling.bean.PrivilegeInfo;
import com.zrgk.bankpolling.bean.UserInfo;
import com.zrgk.bankpolling.service.PriRoleInfoService;
import com.zrgk.bankpolling.service.PrivilegeInfoService;
import com.zrgk.bankpolling.serviceimpl.PriRoleInfoServiceImpl;
import com.zrgk.bankpolling.serviceimpl.PrivilegeInfoserviceimpl;
import com.zrgk.bankpolling.util.Page;
import com.zrgk.bankpolling.util.PageService;

public class PrivilegeInfoServlet extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		String opt = request.getParameter("opt");
		System.out.println("操作类型："+opt);
		
		//关联服务
		PrivilegeInfoService privilegeInfoService = new PrivilegeInfoserviceimpl();
	    Page page = new Page();
		PageService pageService = new PageService();
        
		/**
		 * 查询登录用户的所有权限，加载对应功能模块
		 */
		if("show".equals(opt)){
			System.out.println("-------show-------");
			HttpSession session = request.getSession();
			String user_name = (String) session.getAttribute("user_name");
			PrivilegeInfoserviceimpl priv = new PrivilegeInfoserviceimpl();
			List<PrivilegeInfo> list = priv.showP(user_name);//从服务层获得查询结果
			System.out.println(list);
			request.setAttribute("pri", list);
			//session.setAttribute("pri", list);//将该用户的所有权限存入pri中
			request.getRequestDispatcher("web/left22.jsp").forward(request, response);
			return;
		}
		
		/**
		 * 增加权限
		 */
		if("addPri".equals(opt)){
			//获取页面信息
			String pri_id = request.getParameter("pri_id").trim();
			String pri_name = new String(request.getParameter("pri_name").trim().getBytes("iso-8859-1"),"utf-8");
			String pri_url = new String(request.getParameter("pri_url").trim().getBytes("iso-8859-1"),"utf-8");
			String pri_target = new String(request.getParameter("pri_target").trim().getBytes("iso-8859-1"),"utf-8");
			String parent_id = request.getParameter("parent_id").trim();
			String pri_address = new String(request.getParameter("pri_address").trim().getBytes("iso-8859-1"),"utf-8");
			PrivilegeInfo privilegeInfo= new PrivilegeInfo(pri_id, pri_name, pri_url, pri_target, parent_id, pri_address);
			//调取添加权限业务
			privilegeInfoService.addPri(privilegeInfo);
			response.sendRedirect("privilege.do?opt=showAll");
			return;
		}
		if("showAll".equals(opt)){
			// 获取页面处理方式（首页，尾页，上一页，下一页）
			String method = request.getParameter("method");
			System.out.println("method:"+method);
			//调取输出所有权限业务
			List<PrivilegeInfo> list = privilegeInfoService.showAll();
			// 获取当前页面
			page = pageService.getPage(page.getCurrentPage(), method,
					list.size());
			request.getSession().setAttribute("page", page);
			// 创建页面列表pageList，将list中的记录都方法到pageList中用于分页
			List pagelist = new ArrayList();
			/**
			 * 获取到list.size就可以进行分页
			 */
			for (int i = page.getStartRow(); i < page.getStartRow()
					+ page.getPageSize()
					&& i < list.size(); i++) {
				pagelist.add(list.get(i));
				System.out.println("ss" + pagelist.get(i));
			}

			request.setAttribute("list", pagelist);
			request.getRequestDispatcher("web/system/role/pri_info.jsp")
					.forward(request, response);
			return;
			
		}
		/**
		 * 删除权限
		 */
		if("delPri".equals(opt)){
			String pri_id=request.getParameter("pri_id");
			boolean flag =privilegeInfoService.delPri(pri_id);
			response.sendRedirect("privilege.do?opt=showAll");
			return;
			
		}
		/**
		 * 传递当前记录到权限修改页面
		 */
		if("toUpdPri".equals(opt)){
			String pri_id=request.getParameter("pri_id");
			PrivilegeInfo privilegeInfo = privilegeInfoService.findById(pri_id);
			request.setAttribute("privilegeinfo", privilegeInfo);
			request.getRequestDispatcher("web/system/role/pri_edit.jsp").forward(request, response);
			return ;
		}
		/**
		 * 修改权限信息
		 */
		if("updPri".equals(opt)){
			String pri_id=request.getParameter("pri_id").trim();
			String pri_name = new String(request.getParameter("pri_name").trim().getBytes("ISO-8859-1"),"UTF-8");
			String pri_url=request.getParameter("pri_url").trim();
			String parent_id = request.getParameter("parent_id").trim();
			String pri_target= request.getParameter("pri_target").trim();
			String pri_address = request.getParameter("pri_address").trim();
			PrivilegeInfo privilegeInfo = new PrivilegeInfo(pri_id, pri_name, pri_url, pri_target, parent_id, pri_address);
			boolean flag = privilegeInfoService.updPri(privilegeInfo);
			response.sendRedirect("privilege.do?opt=showAll");
			return;
			
		}
		/**
		 * 模糊查询
		 */
		if("queryAll".equals(opt)){
			String search = new String(request.getParameter("search").trim().getBytes("ISO-8859-1"),"UTF-8");
			List<PrivilegeInfo> list = privilegeInfoService.queryAll(search);
			
			request.setAttribute("list", list);
			request.getRequestDispatcher("web/system/role/pri_info.jsp")
					.forward(request, response);
			return;
		}
		/**
		 * 分配角色的时候异步加载权限树
		 */
		if("tree".equals(opt)){
			JSONArray  array = new JSONArray();
			List<PrivilegeInfo> list = privilegeInfoService.showAll();
			for (PrivilegeInfo privilegeInfo : list) {
				JSONObject obj = new JSONObject().fromObject(privilegeInfo);
				array.add(obj);
			}
			System.out.println("user-->"+array.toString());
			out.print(array);
			return;
		}
	}

}
