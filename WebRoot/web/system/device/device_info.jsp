<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>银行设备管理</title>
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
												<td width="6%" height="24" valign="bottom"><div
														align="left">
														<form action="device.do?opt=queryAll" method="post">
															<span class="STYLE1"> <img src="web/images/tb.gif"
																width="14" height="14" />&nbsp;设备信息&nbsp;&nbsp;</span> <input
																type="text" name="search" class="STYLE21"
																value="设备编号或单位名称" /> <input type="submit" value="查询"
																class="STYLE21" />
														</form>
													</div>
												</td>
											</tr>
										</table>
									</td>
									<td><div align="right">
											<span class="STYLE1"><img
												src="web/images/add.gif" width="10" height="10" /> <a
												href="web/system/device/device_add.jsp"><span
													class="STYLE23">录入设备信息</span> </a> &nbsp;</span>
										</div>
									</td>
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
								align="center"></div>
						</td>
						<td width="10%" height="25" bgcolor="d3eaef" class="STYLE6"><div
								align="center">
								<span class="STYLE10">设备编号</span>
							</div>
						</td>

						<td width="15%" height="25" bgcolor="d3eaef" class="STYLE6"><div
								align="center">
								<span class="STYLE10">设备名称</span>
							</div>
						</td>
						<td width="15%" height="25" bgcolor="d3eaef" class="STYLE6"><div
								align="center">
								<span class="STYLE10">设备状态</span>
							</div>
						</td>
						<td width="10%" height="25" bgcolor="d3eaef" class="STYLE6"><div
								align="center">
								<span class="STYLE10">网点编号</span>
							</div>
						</td>
						<td width="10%" height="25" bgcolor="d3eaef" class="STYLE6"><div
								align="center">
								<span class="STYLE10">网点名称</span>
							</div>
						</td>
						<td width="10%" height="25" bgcolor="d3eaef" class="STYLE6"><div
								align="center">
								<span class="STYLE10">任务状态</span>
							</div>
						</td>

						<td width="10%" height="25" bgcolor="d3eaef" class="STYLE6"><div
								align="center">
								<span class="STYLE10">任务分配</span>
							</div>
						</td>
						<td width="16%" height="25" bgcolor="d3eaef" class="STYLE6"><div
								align="center">
								<span class="STYLE10">操作</span>
							</div>
						</td>
					</tr>
					<!-- 使用C标签循环输出列表项 -->
					<c:forEach items="${list}" var="deviceinfo">
						<tr>
							<td height="20" bgcolor="#FFFFFF"><div align="center">
							
								</div>
							</td>
							<td height="20" bgcolor="#FFFFFF" class="STYLE19"><div
									align="center">${deviceinfo.get(0)}</div>
							</td>
							<td height="20" bgcolor="#FFFFFF" class="STYLE19"><div
									align="center">${deviceinfo.get(1)}</div>
							</td>
							<td height="20" bgcolor="#FFFFFF" class="STYLE19"><div
									align="center">
									<c:if test="${deviceinfo.get(2) eq '正常'}">
										<img src="web/images/ok.gif" height="15" width="15" />
									</c:if>
									<c:if test="${deviceinfo.get(2) eq '异常'}">
										<img src="web/images/messager_warning.gif" height="15"
											width="15" />
									</c:if>
									${deviceinfo.get(2)}
								</div>
							</td>
							
							<td height="20" bgcolor="#FFFFFF" class="STYLE19"><div
									align="center">${deviceinfo.get(3)}</div>
							</td>
							<td height="20" bgcolor="#FFFFFF" class="STYLE19"><div
									align="center">${deviceinfo.get(4)}</div>
							</td>
							<td height="20" bgcolor="#FFFFFF" class="STYLE19"><div
									align="center">${deviceinfo.get(5)}</div>
							</td>
							<td height="20" bgcolor="#FFFFFF"><div align="center">
									<c:if test="${deviceinfo.get(2) eq '异常'}">
										<c:if test="${deviceinfo.get(5)eq '无'}">
										<form
											action=device.do?opt=toUpdState&device_id=${deviceinfo.get(0)}
											method="post">
											<input type="submit" value="任务分配" class="STYLE19" />
										</form>		
										</c:if>
									</c:if>


								</div>
							</td>
							<td height="20" bgcolor="#FFFFFF"><div align="center"
									class="STYLE21">
									<img src="web/images/pic12.gif" height="14" width="14" alt="删除" /><a
										href="device.do?opt=delDevice&device_id=${deviceinfo.get(0)}"
										onclick="return delOne()"><span class="STYLE21">删除信息</span>
									</a> <img src="web/images/pencil.png" height="14" width="14" /><a
										href="device.do?opt=toUpdDevice&device_id=${deviceinfo.get(0)}"><span
										class="STYLE21">修改信息</span> </a>
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
								<span class="STYLE22">&nbsp;&nbsp;&nbsp;&nbsp;共有<strong>
										${page.totalRows} </strong> 条记录，当前第<strong>
										${page.currentPage}</strong> 页，共 <strong>${page.totalPages}</strong> 页
								</span>
							</div></td>
						<td width="67%"><table width="312" border="0" align="right"
								cellpadding="0" cellspacing="0">
								<tr>
									<td width="49"><div align="center">
											<a href="device.do?opt=showAll&method=first"> <img
												src="web/images/main_54.gif" width="40" height="15" /> </a>
										</div>
									</td>
									<td width="49"><div align="center">
											<a href="device.do?opt=showAll&method=previous"><img
												src="web/images/main_56.gif" width="45" height="15" /> </a>
										</div>
									</td>
									<td width="49"><div align="center">
											<a href="device.do?opt=showAll&method=next"><img
												src="web/images/main_58.gif" width="45" height="15" /> </a>
										</div>
									</td>
									<td width="49"><div align="center">
											<a href="device.do?opt=showAll&method=last"><img
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
