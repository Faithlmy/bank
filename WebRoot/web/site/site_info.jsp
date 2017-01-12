<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>银行网点管理</title>
<link rel="stylesheet" type="text/css"  href="web/css/web/table.css" />
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
														<form action="site.do?opt=queryAll" method="post">
															<img src="web/images/tb.gif" width="14" height="14" /> <span
																class="STYLE1"> 银行网点管理&nbsp;&nbsp;&nbsp;&nbsp; <input
																type="text" name="search" class="STYLE21"
																value="网点名称或IP地址" /> <input type="submit" value="查询"
																class="STYLE21" style="height: 25px" /> </span>
														</form>
													</div></td>
											</tr>
										</table></td>
									<td><div align="right">
											<span class="STYLE1"><img src="web/images/add.gif" width="10"
												height="10" /> <a href="web/site/site_add.jsp"><span
													class="STYLE23">录入新网点 </span> </a> &nbsp;</span>
										</div></td>
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
						<td width="4%" height="20" bgcolor="d3eaef" class="STYLE10"><div
								align="center"></div></td>
						<td width="16%" height="20" bgcolor="d3eaef" class="STYLE6"><div
								align="center">
								<span class="STYLE10">网点编号</span>
							</div></td>
						<td width="16%" height="20" bgcolor="d3eaef" class="STYLE6"><div
								align="center">
								<span class="STYLE10">网点名称</span>
							</div></td>
						<td width="16%" height="20" bgcolor="d3eaef" class="STYLE6"><div
								align="center">
								<span class="STYLE10">网点位置</span>
							</div></td>
						
						<td width="16%" height="20" bgcolor="d3eaef" class="STYLE6"><div
								align="center">
								<span class="STYLE10">联系方式</span>
							</div></td>
						<td width="16%" height="20" bgcolor="d3eaef" class="STYLE6"><div
								align="center">
								<span class="STYLE10">网点IP地址</span>
							</div></td>
						<td width="16%" height="20" bgcolor="d3eaef" class="STYLE6"><div
								align="center">
								<span class="STYLE10">基本操作</span>
							</div></td>

					</tr>

					<!-- 使用C标签循环输出列表项 -->
					<c:forEach items="${list}" var="siteinfo">
						<tr>
							<td height="20" bgcolor="#FFFFFF"><div align="center">
									
								</div></td>
							<td height="20" bgcolor="#FFFFFF" class="STYLE19"><div
									align="center">${siteinfo.get(0)}</div></td>
							<td height="20" bgcolor="#FFFFFF" class="STYLE19"><div
									align="center">${siteinfo.get(1)}</div></td>
							<td height="20" bgcolor="#FFFFFF" class="STYLE19"><div
									align="center">${siteinfo.get(2)}</div></td>
							<td height="20" bgcolor="#FFFFFF" class="STYLE19"><div
									align="center">${siteinfo.get(3)}</div></td>
							<td height="20" bgcolor="#FFFFFF" class="STYLE19"><div
									align="center">${siteinfo.get(4)}</div></td>
							<td height="20" bgcolor="#FFFFFF"><div align="center"
									class="STYLE21">
									<img src="web/images/pic12.gif" height="14" width="14" alt="删除" /><a
										href="site.do?opt=delSite&site_id=${siteinfo.get(0)}" onclick="return delOne()"><span
										class="STYLE21">删除 </span>
									</a> <img src="web/images/pencil.png"  height="14" width="14"/> <a
										href="site.do?opt=toUpdSite&site_id=${siteinfo.get(0)}"><span
										class="STYLE21">修改</span> </a>
								</div></td>
						</tr>
					</c:forEach>




				</table></td>
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
											<a href="site.do?opt=showAll&method=first"> <img
												src="web/images/main_54.gif" width="40" height="15" />
											</a>
										</div></td>
									<td width="49"><div align="center">
											<a href="site.do?opt=showAll&method=previous"><img
												src="web/images/main_56.gif" width="45" height="15" />
											</a>
										</div></td>
									<td width="49"><div align="center">
											<a href="site.do?opt=showAll&method=next"><img
												src="web/images/main_58.gif" width="45" height="15" />
											</a>
										</div></td>
									<td width="49"><div align="center">
											<a href="site.do?opt=showAll&method=last"><img
												src="web/images/main_60.gif" width="40" height="15" />
											</a>
										</div></td>
									<td width="37" class="STYLE22"><div align="center">转到</div>
									</td>
									<td width="22"><div align="center">
											<input type="text" name="textfield" id="textfield"
												style="width: 20px; height: 12px; font-size: 12px; border: solid 1px #7aaebd;" />
										</div></td>
									<td width="22" class="STYLE22"><div align="center">页</div>
									</td>
									<td width="35"><img src="web/images/main_62.gif"
										width="26" height="15" /></td>
								</tr>
							</table></td>
					</tr>
				</table></td>
		</tr>
	</table>
</body>
</html>
