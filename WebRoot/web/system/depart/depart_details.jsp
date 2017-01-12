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
<title>部门详细信息</title>
<link rel="stylesheet" type="text/css" href="web/css/web/table.css" />
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
														align="left">
														<img src="web/images/tb.gif" width="14" height="14" /> <span
															class="STYLE1">部门详细信息</span>
													</div>
												</td>
											</tr>
										</table>
									</td>
									<td></td>
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
						<td width="6%" height="25" bgcolor="d3eaef" class="STYLE10"></td>
						<td width="20%" height="25" bgcolor="d3eaef" class="STYLE6"><div
								align="center">
								<span class="STYLE10">字段名</span>
							</div>
						</td>
						<td width="54%" height="30" bgcolor="d3eaef" class="STYLE6"><div
								align="center">
								<span class="STYLE10">内容</span>
							</div>
						</td>
						<td width="20%" height="25" bgcolor="d3eaef" class="STYLE10"></td>
					</tr>


					<tr>
						<td height="20" bgcolor="#FFFFFF"></td>

						<td height="20" bgcolor="#FFFFFF" class="STYLE19"><div
								align="center">部门编号:</div>
						</td>
						<td bgcolor="#FFFFFF" class="STYLE19"><div align="center">
							${departinfo.depart_id}
							</div>
						</td>
						<td height="20" bgcolor="#FFFFFF"></td>
					</tr>
					<tr>
						<td height="20" bgcolor="#FFFFFF"></td>
						<td height="20" bgcolor="#FFFFFF" class="STYLE19"><div
								align="center">部门名称:</div>
						</td>
						<td height="20" bgcolor="#FFFFFF" class="STYLE19"><div
								align="center">${departinfo.depart_name}</div>
						</td>
						<td height="20" bgcolor="#FFFFFF"></td>
					</tr>
					<tr>
						<td height="20" bgcolor="#FFFFFF"></td>
						<td height="20" bgcolor="#FFFFFF" class="STYLE19"><div
								align="center">部门简介:</div>
						</td>
						<td height="20" bgcolor="#FFFFFF" class="STYLE19"><div
								align="center">${departinfo.depart_tips}</div>
						</td>
						<td height="20" bgcolor="#FFFFFF"></td>
					</tr>
					<tr>
						<td height="20" bgcolor="#FFFFFF"></td>
						<td height="20" bgcolor="#FFFFFF" class="STYLE19"><div
								align="center">部门负责人:</div>
						</td>
						<td height="20" bgcolor="#FFFFFF" class="STYLE19"><div
								align="center">
								${departinfo.user_name}
							</div>
						</td>
						<td height="20" bgcolor="#FFFFFF"></td>
					</tr>
					<tr>
						<td height="20" bgcolor="#FFFFFF"></td>
						<td height="20" bgcolor="#FFFFFF" class="STYLE19"><div
								align="center">负责人编号:</div>
						</td>
						<td height="20" bgcolor="#FFFFFF" class="STYLE19"><div
								align="center">
								${departinfo.user_id}
							</div>
						</td>
						<td height="20" bgcolor="#FFFFFF"></td>
					</tr>
					<tr>
						<td height="200" bgcolor="#FFFFFF"></td>
						<td height="200" bgcolor="#FFFFFF" class="STYLE19"><div
								align="center">部门人员:</div>
						</td>
						<td height="200" bgcolor="#FFFFFF" class="STYLE19"><div
								align="center"></div>
						</td>
						<td height="200" bgcolor="#FFFFFF"></td>
					</tr>
					<tr>
						<td height="30" bgcolor="#FFFFFF"></td>
						<td height="30" bgcolor="#FFFFFF" class="STYLE19"><div
								align="center"></div>
						</td>
						<td height="30" bgcolor="#FFFFFF" class="STYLE19"><div
								align="center"></div></td>
						<td height="20" bgcolor="#FFFFFF"></td>

					</tr>

				</table>
			</td>
		</tr>
	</table>
</body>
</html>




























