<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html;charset=utf-8" />
<title>角色管理</title>
<link rel="stylesheet" type="text/css" href="web/css/web/table.css" />
<script type="text/javascript" src="web/js/line.js"></script>
<script type="text/javascript" src="web/js/info.js"></script>
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
														align="left">
														<img src="web/images/tb.gif" width="14" height="14" /><span
															class="STYLE1"> 角色管理</span>
													</div></td>
											</tr>
										</table></td>
									<td><div align="right">
											<span class="STYLE1"><img src="web/images/add.gif" width="10"
												height="10" /> <a href="web/system/role/role_add.jsp"><span
													class="STYLE23">添加角色</span> </a> &nbsp; <img
												src="web/images/edit.gif" width="10" height="10" /><a
												href="web/system/role/role_user.jsp"><span class="STYLE23">给用户分配角色
												</span> </a> &nbsp;</span><span class="STYLE1"> &nbsp;</span>
										</div></td>
									<td></td>
								</tr>
							</table></td>
					</tr>
				</table></td>
		</tr>
		<tr>
			<td><table width="100%" border="0" cellpadding="0"
					cellspacing="1" bgcolor="#a8c7ce" onmouseover="changeto()"
					onmouseout="changeback()">
					<tr>
						<td width="4%" height="25" bgcolor="d3eaef" class="STYLE10"><div
								align="center">
								
							</div></td>
						<td width="6%" height="25" bgcolor="d3eaef" class="STYLE6"><div
								align="center">
								<span class="STYLE10">角色编号</span>
							</div></td>
						<td width="10%" height="25" bgcolor="d3eaef" class="STYLE6"><div
								align="center">
								<span class="STYLE10">角色类型</span>
							</div></td>
						<td width="15%" height="25" bgcolor="d3eaef" class="STYLE6"><div
								align="center">
								<span class="STYLE10">角色描述</span>
							</div></td>	
						<td width="45%" height="25" bgcolor="d3eaef" class="STYLE6"><div
								align="center">
								<span class="STYLE10">角色权限</span>
							</div></td>
						<td width="15%" height="25" bgcolor="d3eaef"><div
								align="center">
								<span class="STYLE21">操作</span>
							</div></td>
					</tr>
					<c:forEach items="${list}" var="roleinfo">
					<tr>
						<td height="20" bgcolor="#FFFFFF"><div align="center">
						
							</div></td>
						<td height="20" bgcolor="#FFFFFF" class="STYLE19"><div
								align="center">${roleinfo.role_id }</div></td>
						<td height="20" bgcolor="#FFFFFF" class="STYLE19"><div
								align="center">${roleinfo.role_type }</div></td>
						<td height="20" bgcolor="#FFFFFF" class="STYLE19"><div
								align="center">
								${roleinfo.role_describe}
							</div></td>
						<td height="20" bgcolor="#FFFFFF" class="STYLE19"><div
								align="left">
								${roleinfo.role_privilege}
							</div></td>
							<td height="20" bgcolor="#FFFFFF"><div align="center"
									class="STYLE21">
									<img src="web/images/pic12.gif" height="14" width="14" alt="删除" />
									<a href="role.do?opt=delRole&role_id=${roleinfo.role_id }"
										onclick="return delOne()"><span class="STYLE21">删除角色</span>&nbsp;
									</a> <img src="web/images/pencil.png" height="14" width="14" /><a
										href="role.do?opt=toUpdRole&role_id=${roleinfo.role_id }"><span
										class="STYLE21">修改信息</span> &nbsp;</a>
								</div>
							</td>
						</tr>
					</c:forEach>
					
				</table></td>
		</tr>
	
	
		<tr>
			<td height="30"><table width="100%" border="0" cellspacing="0"
					cellpadding="0">
					<tr>
						<td width="33%"><div align="left">
								<span class="STYLE22">&nbsp;&nbsp;&nbsp;&nbsp;共有<strong>
										${page.totalRows} </strong> 条记录，当前第<strong>
										${page.currentPage}</strong> 页，共 <strong>${page.totalPages}</strong> 页
								</span>
							</div></td>
						<td width="67%"><table width="312" border="0" align="right"
								cellpadding="0" cellspacing="0">
								<tr>
									<td width="49"><div align="center">
											<a href="role.do?opt=showAll&method=first"> <img
												src="web/images/main_54.gif" width="40" height="15" /> </a>
										</div></td>
									<td width="49"><div align="center">
											<a href="role.do?opt=showAll&method=previous"><img
												src="web/images/main_56.gif" width="45" height="15" /> </a>
										</div></td>
									<td width="49"><div align="center">
											<a href="role.do?opt=showAll&method=next"><img
												src="web/images/main_58.gif" width="45" height="15" /> </a>
										</div></td>
									<td width="49"><div align="center">
											<a href="role.do?opt=showAll&method=last"><img
												src="web/images/main_60.gif" width="40" height="15" /> </a>
										</div></td>
									<td width="37" class="STYLE22"><div align="center">
											转到第 </div></td>
											<td width="22"><div align="center">
											<input name="go" class="input2" id="go" type="text" size="4"
												style="height:12px; width:20px; font-size:12px; border:1px solid #7aaebd;" />
												</div></td>
												<td width="22" class="STYLE22"><div align="center">页 </div></td>
									<td width="35"><a onclick="tz();"><img
											src="web/images/main_62.gif" width="26" height="15" class="go" />
									</a></td>

								</tr>
							</table></td>
					</tr>
				</table></td>
		</tr>
						
	</table>
</body>
</html>
