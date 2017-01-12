package com.zrgk.bankpolling.servlet;

import java.io.IOException;
import java.io.PrintWriter;
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

import org.apache.taglibs.standard.tag.common.fmt.RequestEncodingSupport;

import com.zrgk.bankpolling.bean.DeviceInfo;
import com.zrgk.bankpolling.bean.RecordInfo;
import com.zrgk.bankpolling.bean.SiteInfo;
import com.zrgk.bankpolling.bean.UserInfo;
import com.zrgk.bankpolling.service.DeviceInfoService;
import com.zrgk.bankpolling.service.RecordInfoService;
import com.zrgk.bankpolling.service.UserInfoService;
import com.zrgk.bankpolling.serviceimpl.DeviceInfoServiceImpl;
import com.zrgk.bankpolling.serviceimpl.RecordInfoServiceImpl;
import com.zrgk.bankpolling.serviceimpl.SiteInfoServiceImpl;
import com.zrgk.bankpolling.serviceimpl.UserInfoServiceImpl;
import com.zrgk.bankpolling.util.Page;
import com.zrgk.bankpolling.util.PageService;

public class RecordInfoServlet extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		//获取操作类型
		String opt = request.getParameter("opt");
		
		// 关联所需的业务
		RecordInfoService recordService = new RecordInfoServiceImpl();
		UserInfoService userService = new UserInfoServiceImpl();
		DeviceInfoService deviceService = new DeviceInfoServiceImpl();
		SiteInfoServiceImpl siteServiceImpl = new SiteInfoServiceImpl();
		Page page = new Page();
		PageService pageService = new PageService();
		SimpleDateFormat df = new SimpleDateFormat("yyyyMMddHHmmss");//设置日期格式
		HttpSession session = request.getSession();
		
		/**
		 * 添加对应记录信息
		 */
		if("addRecord".equals(opt)){
			// 获取表单信息
			String record_id  = "JL"+df.format(new Date());	
			String record_type = new String(request.getParameter("record_type")
								.trim().getBytes("ISO-8859-1"), "UTF-8");
			String type = null;
				if ("维修记录".equals(record_type)) {
					type ="fix" ;
				} else if ("巡检记录".equals(record_type)) {
					type ="poll" ;
				} else if ("报修申请".equals(record_type)) {
					type ="report";
				}						
			String device_id = request.getParameter("device_id");
			String user_id = request.getParameter("user_id");
			String record_details = new String(request.getParameter("record_details").trim()
					.getBytes("ISO-8859-1"), "UTF-8");
			String record_time = request.getParameter("record_time").trim();
			String record_state = new String(request.getParameter("record_state").trim()
										.getBytes("ISO-8859-1"), "UTF-8");
			String record_confirm = "待确认";
			// 创建RecordInfo对象，关联RecordService业务
			RecordInfo recordInfo = new RecordInfo(record_id, device_id,
								user_id, record_details, record_time, record_state,
								record_confirm, record_type);
			//添加记录到数据库
			boolean flag = recordService.addRecord(recordInfo);
			//更新员工信息表中的任务数量
			UserInfo userInfo = new UserInfo(user_id);
			boolean flag2 = userService.updTaskCount(userInfo);
			response.sendRedirect("record.do?opt=showAll&record_type="+type);
			return;
		}
		/**
		 * 删除单个记录
		 */
		if("delRecord".equals(opt)){
			String record_id = request.getParameter("record_id");
			String type = new String (request.getParameter("record_type").getBytes("ISO-8859-1"),"UTF-8");
			String record_type = null;
			if ("维修记录".equals(type)) {
				record_type ="fix" ;
			} else if ("巡检记录".equals(type)) {
				record_type ="poll" ;
			} else if ("报修申请".equals(type)) {
				record_type = "report";
			}
			boolean flag = recordService.delRecord(record_id);
			response.sendRedirect("record.do?opt=showAll&record_type="+record_type);
			return;
		}
		/**
		 * 显示所有记录信息
		 */
		if("showAll".equals(opt)){
			// 获取页面处理方式（首页，尾页，上一页，下一页）
			String method = request.getParameter("method");
			// 获取记录类型，并作出判断
			String type = request.getParameter("record_type");
			String record_type = null;
			if ("fix".equals(type)) {
					record_type = "维修记录";
			} else if ("poll".equals(type)) {
					record_type = "巡检记录";
			} else if ("report".equals(type)) {
					record_type = "报修申请";
			}
			
			session.setAttribute("record_type", record_type);
			// 调用recordService查询所有记录	
			Vector[] vectors = recordService.showAll(record_type);		
			// 获取当前页面
			page = pageService.getPage(page.getCurrentPage(), method,vectors[1].size());
			request.getSession().setAttribute("page", page);
			// 创建页面列表pageList，将list中的记录都方法到pageList中用于分页
			List pagelist = new ArrayList();
			/**
			 * 获取到list.size就可以进行分页
			 */
			for (int i = page.getStartRow(); i < page.getStartRow()
					+ page.getPageSize()&& i < vectors[1].size(); i++) {
					pagelist.add(vectors[1].get(i));
					}
			request.setAttribute("list", pagelist);
			System.out.println(pagelist);
			request.getRequestDispatcher("web/polling/record_info.jsp")
			.forward(request, response);
			return;	
		}
		/**
		 * 模糊查询所有记录
		 */
		if("queryAll".equals(opt)){
			
			String search = new String(request.getParameter("search").trim().getBytes(
					"ISO-8859-1"), "UTF-8");
			// 获取记录类型，并作出判断
			String type=(String)session.getAttribute("record_type");
			Vector[] recordinfo = recordService.queryAll(search,type);
			request.setAttribute("list", recordinfo[1]);
			request.getRequestDispatcher("web/polling/record_info.jsp").forward(request, response);
			return;
		}
		/**
		 * 查看单条记录信息
		 */
		if("showOne".equals(opt)){
			String record_id = request.getParameter("record_id");
			Vector[] vectors = recordService.findById(record_id);		
    		request.setAttribute("recordinfo", vectors[1]);
			request.getRequestDispatcher("web/polling/record_details.jsp")
					.forward(request, response);
			return;
		}
		/**
		 * 将当前单条记录传递到修改页面
		 */
		if ("toUpdRecord".equals(opt)) {
			String record_id = request.getParameter("record_id");
			Vector[] vectors = recordService.findById(record_id);
			request.setAttribute("recordinfo", vectors[1]);
			System.out.println("找到的recordinfo:"+vectors[1]);
			request.getRequestDispatcher("web/polling/record_edit.jsp")
					.forward(request, response);
			return;
		}
		/**
		 * 修改记录信息
		 */
		if ("updRecord".equals(opt)) {
			String record_id = request.getParameter("record_id").trim();
			String user_id= request.getParameter("user_id").trim();
			String device_id = request.getParameter("device_id").trim();
			String record_time = request.getParameter("record_time").trim();
			String record_state =new String(request.getParameter("record_type").trim().getBytes("ISO-8859-1"),"UTF-8");
			String record_details = new String(request.getParameter("record_details").getBytes("ISO-8859-1"),"UTF-8");
			String record_confirm = new String(request.getParameter("record_confrim").trim().getBytes("ISO-8859-1"), "UTF-8");
			String record_type = new String(request.getParameter("record_type").trim().getBytes("ISO-8859-1"), "UTF-8");
			/**
			 * if,else模块转换用于解决页面跳转的do问题
			 */
			String type = null;
			if ("维修记录".equals(record_type)) {
				type ="fix" ;
			} else if ("巡检记录".equals(record_type)) {
				type ="poll" ;
			} else if ("报修申请".equals(record_type)) {
				type ="report";
			}
			// 创建RecordInfo对象，关联RecordService业务
			RecordInfo recordInfo = new RecordInfo(record_id, device_id,
					user_id, record_details, record_time, record_state,record_confirm,
					record_type);
			boolean flag = recordService.updRecord(recordInfo);
			
			response.sendRedirect("record.do?opt=showAll&record_type="+type);
			return;
		}
		
		/**
		 * 核心业务一：修改当前记录状态信息
		 * 1、巡检工提交巡检记录---》巡检中心管理员确认
		 * 2、网点值班人提交报修申请---》巡检中心管理员确认---》将对应设备状态置异常
		 * 4、维修工对待维修的报修记录确认操作，将待维修改为正在进行
		 * 5、维修工提交维修记录--》巡检中心管理员确认---》将对应设备状态置正常
		 */
		if("updRecordState".equals(opt)){
			String record_id = request.getParameter("record_id").trim();
			String type = new String(request.getParameter("record_type").trim().getBytes("ISO-8859-1"),"UTF-8");
			String state = new String(request.getParameter("record_state").trim().getBytes("ISO-8859-1"),"UTF-8");
			String device_id = request.getParameter("device_id").trim();
			
			System.out.println("获得的id和type,device_id是："+record_id+"   "+type+" "+device_id);
			String record_state=null;
			String record_confirm=null;
			String record_type=null;
			String device_state=null;
			if("巡检记录".equals(type)){
				record_type="poll";
				record_state="已巡检";
				device_state="正常";
			}else if("报修申请".equals(type)){
				record_state="已报修";
				record_type="report";
				device_state="异常";
			}else if("维修记录".equals(type)){
				if("待维修".equals(state)){
					record_state="正在进行";
					device_state="异常";
				}
				else{
					record_state="已维修";
					device_state="正常";
				}
				record_type="fix";
			}
			record_confirm="已确认";
			//找到需要更新状态的设备
			DeviceInfoService deviceInfoService = new DeviceInfoServiceImpl();
			DeviceInfo deviceInfos = deviceInfoService.findById(device_id);
			System.out.println(deviceInfos);
			
			DeviceInfo deviceInfo = new DeviceInfo(device_id,deviceInfos.getDevice_name(),device_state);
			System.out.println(deviceInfo);
			RecordInfo recordInfo  = new RecordInfo(record_id,record_state,record_confirm);
			boolean flag = recordService.updRecordState(recordInfo);
			boolean flag2 = (new DeviceInfoServiceImpl()).updDeviceState(deviceInfo);
			response.sendRedirect("record.do?opt=showAll&record_type="+record_type);
			return;
		}
        /**
         * 核心业务二  
         * 3、巡检中心管理员对异常设备分配维修工---》重新生成对应设备编号的报修记录，且状态置为待维修
         * 
         */
		if("fixadd".equals(opt)){
			String record_id  = df.format(new Date());	
			String device_id = request.getParameter("device_id");
			String site_id = request.getParameter("site_id").trim();		
			String user_id = request.getParameter("user_id").trim();
			String record_type ="维修记录";
			String record_time = request.getParameter("record_time").trim();
			String record_state = "待维修";
			String record_confirm = "待确认";
			String record_details = new String (request.getParameter("record_details").trim().getBytes("ISO-8859-1"),"UTF-8");
			RecordInfo recordInfo = new RecordInfo(record_id, device_id,
					user_id, record_details, record_time, record_state,
					record_confirm, record_type);
			
			//添加记录到数据库
			boolean flag = recordService.addRecord(recordInfo);
			//更新设备的任务状态信息
			String task_state="已分配维修";
			DeviceInfo deviceInfo = new DeviceInfo(device_id, task_state);
			boolean flag2 =deviceService.updTaskState(deviceInfo);
			response.sendRedirect("device.do?opt=showAll");
			return;
		}
		if("showUserRecord".equals(opt)){
			// 获取页面处理方式（首页，尾页，上一页，下一页）
			String method = request.getParameter("method");
			String user_id = request.getParameter("user_id");
			// 调用recordService查询所有记录
			Vector[] vectors = recordService.showUserRecord(user_id);
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
			System.out.println(pagelist);
			request.getRequestDispatcher("web/polling/record_info.jsp")
					.forward(request, response);
			return;
		}
	}

}
