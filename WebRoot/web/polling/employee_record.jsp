<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>无标题文档</title>
<link rel="stylesheet" type="text/css"  href="web/css/web/table.css" />
<script type="text/javascript" src="web/js/line.js"></script>
</head>

<body>

	<table width="100%" border="0" align="center" cellpadding="0"
		cellspacing="0">
		<tr>
			<td height="30"><table width="100%" border="0" cellspacing="0"
					cellpadding="0">
					<tr>
						<td height="24" bgcolor="#353c44"><table width="100%"
								border="0" cellspacing="0" cellpadding="0">
								<tr>
									<td><table width="100%" border="0" cellspacing="0"
											cellpadding="0">
											<tr>
												<td width="6%" height="19" valign="bottom"><div
														align="left">&nbsp; 
														<img src="web/images/tb.gif" width="14" height="14" />
												
											
												<span class="STYLE1">
														巡检中心员工</span>
															</div>
												</td>
											</tr>
										</table>
									</td>
									<td><br /></td>
								</tr>
							</table>
						</td>
					</tr>
				</table>
			</td>
		</tr>
		<tr>
			<td><table width="100%" border="0" cellpadding="0"
					cellspacing="1" bgcolor="#a8c7ce" onmouseover="changeto()"
					onmouseout="changeback()">
					<tr>
						<td width="4%" height="25" bgcolor="d3eaef" class="STYLE10"><div
								align="center">
						
							</div>
						</td>
						<td width="12%" height="25" bgcolor="d3eaef" class="STYLE6"><div
								align="center">
								<span class="STYLE10">用户编号</span>
							</div>
						</td>
						<td width="16%" height="25" bgcolor="d3eaef" class="STYLE6"><div
								align="center">
								<span class="STYLE10">用户名</span>
							</div>
						</td>
						
						<td width="16%" height="25" bgcolor="d3eaef" class="STYLE6"><div
								align="center">
								<span class="STYLE10">联系方式</span>
							</div>
						</td>
						<td width="16%" height="25" bgcolor="d3eaef" class="STYLE6"><div
								align="center">
								<span class="STYLE10">任务数量</span>
							</div>
						</td>
						<td width="16%" height="25" bgcolor="d3eaef" class="STYLE6"><div
								align="center">
								<span class="STYLE10">所属组</span>
							</div>
						</td>
						<td height="25"  bgcolor="d3eaef"><div align="center">
								<span class="STYLE21">操作</span>
							</div>
						</td>
					</tr>
					<!-- 使用C标签循环输出列表项 -->
					<c:forEach items="${list}" var="employeerecord">
					<tr>
						<td height="20" bgcolor="#FFFFFF"><div align="center">
								
							</div>
						</td>
						<td height="20" bgcolor="#FFFFFF" class="STYLE19"><div
								align="center">${employeerecord.get(0)}</div>
						</td>
						<td height="20" bgcolor="#FFFFFF" class="STYLE19"><div
								align="center">${employeerecord.get(1)}</div>
						</td>
						
						<td height="20" bgcolor="#FFFFFF" class="STYLE19"><div
								align="center">${employeerecord.get(2)}</div>
						</td>
						<td height="20" bgcolor="#FFFFFF" class="STYLE19"><div
								align="center">${employeerecord.get(3) }</div>
						</td>
						<td height="20" bgcolor="#FFFFFF" class="STYLE19"><div
								align="center">${employeerecord.get(4)}</div>
						</td>
						<td height="20" bgcolor="#FFFFFF"><div align="center"
								class="STYLE21">
								<img src="web/images/search.png" height="14" width="14"/>
								<a href="record.do?opt=showUserRecord&user_id=${employeerecord.get(0)}"><span class="STYLE21">查看工作记录</span></a>
								
							</div>
						</td>
					</tr>
				</c:forEach>
			
				
					
				</table>
			</td>
		</tr>
		<tr>
			<td height="30"><table width="100%" border="0" cellspacing="0"
					cellpadding="0">
					<tr>
						<td width="33%"><div align="left">
								<span class="STYLE22">&nbsp;&nbsp;&nbsp;&nbsp;共有<strong> ${page.totalRows}
								</strong> 条记录，当前第<strong> ${page.currentPage}</strong> 页，共 <strong>${page.totalPages}</strong> 页 </span>
							</div>
						</td>
							<td width="67%"><table width="312" border="0" align="right"
								cellpadding="0" cellspacing="0">
								<tr>
									<td width="49"><div align="center">
											<a href="user.do?opt=showAllEmployee&method=first"> <img
												src="web/images/main_54.gif" width="40" height="15" /> </a>
										</div>
									</td>
									<td width="49"><div align="center">
											<a href="user.do?opt=showAllEmployee&method=previous"><img
												src="web/images/main_56.gif" width="45" height="15" /> </a>
										</div>
									</td>
									<td width="49"><div align="center">
											<a href="user.do?opt=showAllEmployee&method=next"><img
												src="web/images/main_58.gif" width="45" height="15" /> </a>
										</div>
									</td>
									<td width="49"><div align="center">
											<a href="user.do?opt=showAllEmployee&method=last"><img
												src="web/images/main_60.gif" width="40" height="15" /> </a>
										</div>
									</td>
									<td width="37" class="STYLE22"><div align="center">转到</div>
									</td>
									<td width="22"><div align="center">
											<input type="text" name="textfield" id="textfield"
												style="width: 20px; height: 12px; font-size: 12px; border: solid 1px #7aaebd;" />
										</div>
									</td>
									<td width="22" class="STYLE22"><div align="center">页</div>
									</td>
									<td width="35"><img src="web/images/main_62.gif"
										width="26" height="15" />
									</td>
								</tr>
							</table>
						</td>
					</tr>
				</table>
			</td>
		</tr>
		
	</table>

</body>
</html>
