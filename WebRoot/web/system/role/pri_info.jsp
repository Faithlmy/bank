<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html;charset=utf-8" />
<title>权限管理</title>
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

														<form action="privilege.do?opt=queryAll" method="post">
															<img src="web/images/tb.gif" width="14" height="14" /> <span
																class="STYLE1">权限信息 </span>&nbsp;&nbsp; <input
																type="text" id="search" name="search" class="STYLE21"
																value="权限名称或权限链接" /> <input type="submit" value="查询"
																class="STYLE21" style="height: 25px" />
														</form>
													</div></td>
											</tr>
										</table></td>
									<td><div align="right">
											<span class="STYLE1"> 
												&nbsp;&nbsp;<img src="web/images/add.gif" width="10"
												height="10" /> <a href="web/system/role/pri_add.jsp"><span
													class="STYLE23">添加权限</span> </a>&nbsp;&nbsp; </span>
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
						<td width="10%" height="25" bgcolor="d3eaef" class="STYLE6"><div
								align="center">
								<span class="STYLE10">权限编号</span>
							</div></td>
						<td width="10%" height="25" bgcolor="d3eaef" class="STYLE6"><div
								align="center">
								<span class="STYLE10">权限名称</span>
							</div></td>
						<td width="25%" height="25" bgcolor="d3eaef" class="STYLE6"><div
								align="center">
								<span class="STYLE10">权限链接</span>
							</div>
						</td>
						<td width="10%" height="25" bgcolor="d3eaef" class="STYLE6"><div
								align="center">
								<span class="STYLE10">跳转目标</span>
							</div>
						</td>
						<td width="10%" height="25" bgcolor="d3eaef" class="STYLE6"><div
								align="center">
								<span class="STYLE10">上级权限</span>
							</div>
						</td>
						<td width="10%" height="25" bgcolor="d3eaef" class="STYLE6"><div
								align="center">
								<span class="STYLE10">权限位置</span>
							</div>
						</td>
						<td width="16%" height="25" bgcolor="d3eaef"><div
								align="center">
								<span class="STYLE21">操作</span>
							</div>
						</td>
					</tr>
					<c:forEach  items="${list }" var="privilegeinfo">
					<tr>
						<td height="20" bgcolor="#FFFFFF"><div align="center">
								
							</div>
						</td>
						<td height="20" bgcolor="#FFFFFF" class="STYLE19"><div
								align="center">${privilegeinfo.pri_id}</div>
						</td>
						<td height="20" bgcolor="#FFFFFF" class="STYLE19"><div
								align="center">${privilegeinfo.pri_name}</div>
						</td>
						<td height="20" bgcolor="#FFFFFF" class="STYLE19"><div
								align="center">${privilegeinfo.pri_url}</div>
						</td>
						<td height="20" bgcolor="#FFFFFF" class="STYLE19"><div
								align="center">${privilegeinfo.pri_target}</div>
						</td>
						<td height="20" bgcolor="#FFFFFF" class="STYLE19"><div
								align="center">${privilegeinfo.parent_id}</div>
						</td>
						<td height="20" bgcolor="#FFFFFF" class="STYLE19"><div
								align="center">${privilegeinfo.pri_address}</div>
						</td>
							<td height="20" bgcolor="#FFFFFF"><div align="center"
									class="STYLE21">
									<img src="web/images/pic12.gif" height="14" width="14" alt="删除" />
									<a href="privilege.do?opt=delPri&pri_id=${privilegeinfo.pri_id}"
										onclick="return delOne()"><span class="STYLE21">删除</span>&nbsp; </a>
									<img src="web/images/pencil.png" height="14" width="14" /><a
										href="privilege.do?opt=toUpdPri&pri_id=${privilegeinfo.pri_id}"><span
										class="STYLE21">修改</span> &nbsp;</a>
								</div></td>
						</tr>
					</c:forEach>

				</table></td>
		</tr>
		
	</table>
	
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
											<a href="privilege.do?opt=showAll&method=first"> <img
												src="web/images/main_54.gif" width="40" height="15" /> </a>
										</div></td>
									<td width="49"><div align="center">
											<a href="privilege.do?opt=showAll&method=previous"><img
												src="web/images/main_56.gif" width="45" height="15" /> </a>
										</div></td>
									<td width="49"><div align="center">
											<a href="privilege.do?opt=showAll&method=next"><img
												src="web/images/main_58.gif" width="45" height="15" /> </a>
										</div></td>
									<td width="49"><div align="center">
											<a href="privilege.do?opt=showAll&method=last"><img
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
