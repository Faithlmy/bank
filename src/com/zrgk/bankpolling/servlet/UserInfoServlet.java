package com.zrgk.bankpolling.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.InetAddress;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Vector;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

 
import com.zrgk.bankpolling.bean.DepartInfo;
import com.zrgk.bankpolling.bean.GroupInfo;
import com.zrgk.bankpolling.bean.LogInfo;
import com.zrgk.bankpolling.bean.RoleInfo;
 
import com.zrgk.bankpolling.bean.UserInfo;

import com.zrgk.bankpolling.service.GroupInfoService;
import com.zrgk.bankpolling.service.LogInfoService;
import com.zrgk.bankpolling.service.RoleInfoService;
import com.zrgk.bankpolling.service.UserInfoService;
import com.zrgk.bankpolling.serviceimpl.DepartInfoServiceImpl;
import com.zrgk.bankpolling.serviceimpl.GroupInfoserviceimpl;
import com.zrgk.bankpolling.serviceimpl.LogInfoserviceimpl;
import com.zrgk.bankpolling.serviceimpl.RoleInfoServiceImpl;
import com.zrgk.bankpolling.serviceimpl.SiteInfoServiceImpl;
import com.zrgk.bankpolling.serviceimpl.UserInfoServiceImpl;
import com.zrgk.bankpolling.util.Page;
import com.zrgk.bankpolling.util.PageService;



public class UserInfoServlet extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response); 
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		String opt = request.getParameter("opt");
		System.out.println(opt);
		SimpleDateFormat dateFormat1 = new SimpleDateFormat("yyyyMMddHHmmss");// 设置日期格式
		SimpleDateFormat dateFormat2 = new SimpleDateFormat(
				"yyyy-MM-dd HH:mm:ss");

		// 关联所有需要用到的业务
		UserInfoService userService = new UserInfoServiceImpl();
		DepartInfoServiceImpl departservice = new DepartInfoServiceImpl();
		SiteInfoServiceImpl siteservice = new SiteInfoServiceImpl();
		LogInfoService logInfoService = new LogInfoserviceimpl();
		RoleInfoService roleInfoService = new RoleInfoServiceImpl();
		GroupInfoService groupservice = new GroupInfoserviceimpl();
		
		
		
		Page page = new Page();
		PageService pageService = new PageService();

		/**
		 * 用户登录验证
		 */
		if ("login".equals(opt)) {
			// 获取页面信息
			String user_id = request.getParameter("user_id").trim();
			String user_pwd = request.getParameter("user_pwd").trim();
			String incode = request.getParameter("checkcode").trim();
			String ccode = request.getSession().getAttribute("ccode").toString().trim();
			String flags = "";
			System.out.println(user_id+user_pwd);
			if (incode.equals(ccode)) {
				// 调用服务并接收查找到的对象数组
				List<UserInfo> list = userService.confirm(user_id, user_pwd);
				// System.out.println(list.size());

				if (list.size() > 0) {
					flags = "0";
				} else {
					flags = "1";
				}
			} else {
				flags = "-1";
			}
			out.print(flags);
			return;
		}
		/**
		 * 去主页面
		 */
		if ("toMain".equals(opt)) {
			// 获取页面信息
			String user_id = request.getParameter("user_id").trim();
			//获取本机IP地址
			InetAddress addr = InetAddress.getLocalHost();
			String site_ip = addr.getHostAddress().toString();//获得本机IP
			//String site_ip = getIpAddress();
			// 调用服务并接收查找到的对象数组
			UserInfo userInfo = userService.findById(user_id);
			String user_name = userInfo.getUser_name();
			String role_id = userInfo.getRole_id();
			RoleInfo roleInfo = roleInfoService.findById(role_id);
			String user_type = roleInfo.getRole_type();
			// 设置session
			HttpSession session = request.getSession();
			session.setAttribute("user_id", user_id);
			session.setAttribute("user_name", user_name);
			session.setAttribute("user_type", user_type);
			session.setAttribute("site_ip", site_ip);
			// 拼接访问时间 ,添加日志记录到日志表	
			Date now = new Date();
			String log_id = "RZ" + dateFormat1.format(now);
			session.setAttribute("log_id", log_id);
			String login_time = dateFormat2.format(now);
			LogInfo logInfo = new LogInfo(log_id, user_id,login_time);
			System.out.println("session中的" + session.getAttribute("log_id"));
			boolean flag2 = logInfoService.addLog(logInfo);
			// 跳转到首页
			response.sendRedirect("web/main.html");
			return;
		}
		/**
		 * 退出系统
		 */
		if ("logout".equals(opt)) {
			HttpSession session = request.getSession();
			String log_id = (String) session.getAttribute("log_id");
			Date now = new Date();
			String logoff_time = dateFormat2.format(now);
			LogInfo logInfo = new LogInfo(log_id, logoff_time);
			boolean flag = logInfoService.updLog(logInfo);
			// 退出系统后，清空session
			session.invalidate();
			return;
		}
		/**
		 * 添加用户信息
		 */
		if ("addUser".equals(opt)) {
			// 获取页面表单信息

			String user_id = "SU" + dateFormat1.format(new Date());
			String user_name = new String(request.getParameter("user_name")
					.trim().getBytes("ISO-8859-1"), "UTF-8");
			String user_sex = new String(request.getParameter("user_sex")
					.trim().getBytes("ISO-8859-1"), "UTF-8");
			String depart_name  = new String(request.getParameter("depart_name").trim().getBytes("iso-8859-1"),"utf-8");
			//获取部门编号
			DepartInfo departInfo = departservice.findByName(depart_name);
			String depart_id = departInfo.getDepart_id().trim();
			String user_pwd = request.getParameter("user_pwd").trim();
			String user_tel = request.getParameter("user_tel").trim();
			String user_email = request.getParameter("user_email").trim();			
			//获取组编号
			String group_name = new String(request.getParameter("group_name").trim().getBytes("iso-8859-1"),"utf-8");								
			GroupInfo groupInfo = groupservice.findByName(group_name);
			String group_id = groupInfo.getGroup_id();
			//将任务数量获取后并转换成为int类型
			String count = request.getParameter("user_taskcount").trim();
			int user_taskcount = 0;
			if (count != null && !count.equals("")) {
				user_taskcount = Integer.parseInt(count);
			}		
			// 创建userInfo对象，关联UserService业务
			UserInfo userInfo = new UserInfo(user_id, depart_id,group_id,user_name, user_sex,
					user_pwd, user_tel, user_email, user_taskcount);
			boolean flag = userService.addUser(userInfo);
			response.sendRedirect("user.do?opt=showAll");
			return;
		}
		/**
		 * 显示所有用户信息
		 */
		if ("showAll".equals(opt)) {
			// 获取页面处理方式（首页，尾页，上一页，下一页）
			String method = request.getParameter("method");
			// 调用userService查询所有用户信息
			System.out.println(method);
			Vector[] vectors  = userService.showAll();
			//System.out.println(vectors[1]);
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
			}
			
			request.setAttribute("list", pagelist);
			request.getRequestDispatcher("web/system/user/user_info.jsp").forward(request, response);
			return;
		}
		
		/**
		 * 模糊查询所有用户
		 */
		if ("queryAll".equals(opt)) {
			String search = new String(request.getParameter("search").getBytes(
					"ISO-8859-1"), "utf-8");
			Vector[] vectors = userService.queryAll(search);
			System.out.println(vectors[1]);
			request.setAttribute("list", vectors[1]);
			request.getRequestDispatcher("web/system/user/user_info.jsp")
					.forward(request, response);
			return;
		}
		/**
		 * 删除单个用户信息
		 */
		if ("delUser".equals(opt)) {
			String user_id = request.getParameter("user_id");
			boolean flag = userService.delUser(user_id);
			response.sendRedirect("user.do?opt=showAll");
			return;
		}
		/**
		 * 将当前行对象传递到修改信息页面
		 */
		if ("toupdUser".equals(opt)) {
			String user_id = request.getParameter("user_id");
			Vector[] vectors =userService.showOneUser(user_id);
			// 转发单个对象信息到修改页面
			request.setAttribute("userinfo", vectors[1]);
			request.getRequestDispatcher("web/system/user/user_edit.jsp")
					.forward(request, response);
			return;
		}
		/**
		 * 修改单个用户信息
		 */
		if ("updUser".equals(opt)) {
			// 获取页面信息
			String user_id = request.getParameter("user_id").trim();
			String user_name = new String(request.getParameter("user_name")
					.trim().getBytes("iso-8859-1"), "utf-8");
			String user_sex = new String(request.getParameter("user_sex")
					.trim().getBytes("iso-8859-1"), "utf-8");
			String user_tel = request.getParameter("user_tel").trim();
			String user_email = request.getParameter("user_email").trim();
			String depart_name =  new String(request.getParameter("user_depart")
					.trim().getBytes("iso-8859-1"), "utf-8");
			//获取depart_name对应的depart_id
			System.out.println("部门名字"+depart_name);
			String depart_id=departservice.findByName(depart_name).getDepart_id();
			
			UserInfo userinfo = new UserInfo(user_id, user_name, user_sex,
					user_tel, user_email,depart_id);
			boolean flag = userService.updUser(userinfo);
			response.sendRedirect("user.do?opt=showAll");
			return;
		}
		/**
		 * 显示所有工作记录信息
		 */
		 if ("showAllEmployee".equals(opt)) { // 获取页面处理方式（首页，尾页，上一页，下一页）
		 String method = request.getParameter("method"); 
		 //调用userService查询所有用户信息 
		 Vector[] vectors = userService.showAllEmployee(); 
		 // 获取当前页面 
		 page = pageService.getPage(page.getCurrentPage(), method, vectors[1].size());
		 request.getSession().setAttribute("page", page); 
		 //创建页面列表pageList，将list中的记录都方法到pageList中用于分页
		 List pagelist = new ArrayList();
		 /**
		 * 获取到list.size就可以进行分页
		 */	
		 for (int i = page.getStartRow(); i < page.getStartRow() +
		 page.getPageSize() && i < vectors[1].size(); i++) {
		 pagelist.add(vectors[1].get(i));
		 }
		 request.setAttribute("list", pagelist);
		 request.getRequestDispatcher("web/polling/employee_record.jsp")
		 .forward(request, response); return; }
		 
		/**
		 * 查看登陆用户信息
		 */
		if ("showOne".equals(opt)) {
			String user_id = request.getParameter("user_id").trim();
			Vector[] vectors = userService.showOneUser(user_id);
			request.setAttribute("userinfo", vectors[1]);
			request.getRequestDispatcher("web/login/login_details.jsp").forward(
					request, response);
		}
		/**
		 * 异步加载用户信息
		 */

		if ("showAsync".equals(opt)) {
			String user_id = request.getParameter("user_id");
			UserInfo userinfo = userService.findById(user_id);
			String str = "{'user_name':'" + userinfo.getUser_name()
					+ "','user_sex':'" + userinfo.getUser_sex()
					+ "','user_tel':'" + userinfo.getUser_tel()
					+ "','user_email':'" + userinfo.getUser_email()
					+ "','user_taskcount':'" + userinfo.getUser_taskcount()
					+ "'}";
			out.print(str);
			return;
		}
		/**
		 * 修改密码
		 */
		
		if ("updPwd".equals(opt)) {
			String pwd1 = request.getParameter("pwd1");
			String new_pwd = request.getParameter("new_pwd");
			UserInfo userInfo = new UserInfo("user_id");
			request.getRequestDispatcher("web/system/user/pwd_edit.jsp")
					.forward(request, response);
		}
		/**
		 * 给用户分配角色
		 */
		if("addRoleUser".equals(opt)){
			String role_type = new String(request.getParameter("role_type").trim().getBytes("iso-8859-1"),"utf-8");
			String user_id = request.getParameter("user_id").trim();
			//依据role_name找到role_id
			String role_id = roleInfoService.findByName(role_type).getRole_id();
			System.out.println(role_type+role_id+user_id);
			boolean flag = roleInfoService.role2user(role_id, user_id);
			response.sendRedirect("position.do?opt=showAll");
			return;
		}
		/**
		 * 分配角色时异步刷新出用户编号和角色
		 */
		if("showAsyncRole".equals(opt)){
			System.out.println("------showAsyncRole-------");
			String user_name = request.getParameter("user_name")
					.trim();
			UserInfo userInfo = userService.findByName(user_name);
			String user_id = userInfo.getUser_id();
			String role_id = userInfo.getRole_id();
			RoleInfo roleInfo = roleInfoService.findById(role_id);
			String role_type = roleInfo.getRole_type();
			String str = "{'user_id':'" + user_id+ "','role_type':'" + role_type+ "'}";
			System.out.println("usertoRole------>"+str.toString());
			out.print(str);
			return;
		}
		/**
		 * 分配角色时，异步加载所有用户名
		 */
		if("findAllUser".equals(opt)){
			JSONArray  array = new JSONArray();
			List<UserInfo> list = userService.findAllUser();			
			for (UserInfo userinfo : list) {
				JSONObject obj = new JSONObject().fromObject(userinfo);
				array.add(obj);
			}
			System.out.println("user-->"+array.toString());
			out.print(array);
			return;
		}

	}

}
