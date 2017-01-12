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
<title>编辑岗位信息</title>
<link rel="stylesheet" type="text/css" href="web/css/web/table.css" />
<script type="text/javascript" src="web/js/line.js"></script>
<script type="text/javascript" src="web/js/info.js"></script>

<link rel="stylesheet" type="text/css"
	href="../../jquery/easyui/themes/default/easyui.css" />
<link rel="stylesheet" type="text/css"
	href="../../jquery/easyui/themes/icon.css" />
<script type="text/javascript"
	src="../../jquery/easyui/jquery-1.7.2.min.js"></script>
<script type="text/javascript"
	src="../../jquery/easyui/jquery.easyui.min.js"></script>
<script type="text/javascript"
	src="../../jquery/easyui/easyui-lang-zh_CN.js"></script>
	

</head>

<body>
	<form action="position.do?opt=updPosition" method="post">
	<input type="hidden" name="user_id" value="${userinfo.user_id}" />
		<table width="100%" border="0" align="center" cellpadding="0"
			cellspacing="0" bordercolor="#000000">
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
																class="STYLE1"> 修改岗位信息</span>
														</div>
													</td>
												</tr>
											</table></td>
										<td><div align="right">
												<span class="STYLE1">&nbsp;</span><span class="STYLE1">
													&nbsp;</span>
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
							<td width="6%" height="25" bgcolor="d3eaef" class="STYLE10"></td>
							<td width="20%" height="25" bgcolor="d3eaef" class="STYLE6"><div
									align="center">
									<span class="STYLE10">字段名</span>
								</div>
							</td>
							<td height="30" bgcolor="d3eaef" class="STYLE6"><div
									align="center">
									<span class="STYLE10">内容</span>
								</div>
							</td>
							<td width="20%" height="25" bgcolor="d3eaef" class="STYLE10"></td>
						</tr>


						<tr>
							<td height="20" bgcolor="#FFFFFF"><div align="center"></div>
							</td>
							<td height="20" bgcolor="#FFFFFF" class="STYLE19"><div
									align="center">用户编号:</div></td>
							<td height="20" bgcolor="#FFFFFF" class="STYLE19"><div
									align="center">
									<div align="center">${userinfo.user_id}</div>
								</div></td>
							<td height="20" bgcolor="#FFFFFF"><div align="center"></div>
							</td>
						</tr>
						<tr>
							<td height="20" bgcolor="#FFFFFF"><div align="center"></div>
							</td>
							<td height="20" bgcolor="#FFFFFF" class="STYLE19"><div
									align="center">用户名:</div></td>
							<td height="20" bgcolor="#FFFFFF" class="STYLE19"><div
									align="center">${userinfo.user_name}</div></td>
							<td height="20" bgcolor="#FFFFFF"><div align="center"></div>
							</td>
						</tr>
						<tr>
							<td height="20" bgcolor="#FFFFFF"><div align="center"></div>
							</td>
							<td height="20" bgcolor="#FFFFFF" class="STYLE19"><div
									align="center">职位:</div></td>
							<td height="20" bgcolor="#FFFFFF" class="STYLE19"><div
									align="center">
									<select name="user_type" class="STYLE19" style="width:105px">
										<option></option>
										<option>系统管理员</option>
										<option>巡检中心管理员</option>
										<option>巡检工</option>
										<option>维修工</option>
										<option>网点值班人</option>
										


									</select>
								</div></td>
							<td height="20" bgcolor="#FFFFFF"><div align="center"></div>
							</td>
						</tr>


						<tr>
							<td height="20" bgcolor="#FFFFFF"><div align="center"></div>
							</td>
							<td height="20" bgcolor="#FFFFFF" class="STYLE19"><div
									align="center">所属部门:</div></td>
							<td height="20" bgcolor="#FFFFFF" class="STYLE19"><div
									align="center">${userinfo.user_depart}</div></td>
							<td height="20" bgcolor="#FFFFFF"><div align="center"></div>
							</td>
						</tr>
						<tr>
							<td height="20" bgcolor="#FFFFFF"><div align="center"></div>
							</td>
							<td height="20" bgcolor="#FFFFFF" class="STYLE19"><div
									align="center">联系方式:</div></td>
							<td height="20" bgcolor="#FFFFFF" class="STYLE19"><div
									align="center">${userinfo.user_tel}</div></td>
							<td height="20" bgcolor="#FFFFFF"><div align="center"></div>
							</td>
						</tr>

						<tr>
							<td height="20" bgcolor="#FFFFFF"><div align="center"></div>
							</td>
							<td height="20" bgcolor="#FFFFFF"><div align="center"></div>
							</td>
							<td height="20" bgcolor="#FFFFFF"><div align="center">

									<input name="submit" class="STYLE19" type="submit" value="提交" onclick="return submitOne()"/>&nbsp;
									<input name="reset" class="STYLE19" type="reset" value="重置" />

								</div>
							</td>

							<td height="20" bgcolor="#FFFFFF" class="STYLE19"><div
									align="center">
									<div align="center"></div>
								</div></td>
						</tr>
					</table></td>
			</tr>

		</table>
	</form>
</body>
</html>