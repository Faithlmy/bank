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
<title>用户信息</title>
<link rel="stylesheet" type="text/css" href="web/css/web/table.css" />
<script type="text/javascript" src="web/js/line.js"></script>
<script type="text/javascript">
function loadM(){
alert("123");
var ss = ${userinfo};
eval("s="+ss)
alert(s);
}
</script>
</head>

<body onload="return loadM();">
	<table width="100%" border="0" align="center" cellpadding="0"
		cellspacing="0" bordercolor="#000000">
		<tr>
			<td height="30" colspan="3"><table width="100%" border="0"
					cellspacing="0" cellpadding="0">
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
															class="STYLE1"> 用户详细信息</span>
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
			<td colspan="3"><table width="100%" border="0" cellpadding="0"
					cellspacing="1" bgcolor="#a8c7ce" onmouseover="changeto()"
					onmouseout="changeback()">
					<tr>
						<td width="6%"  height="30" bgcolor="d3eaef" class="STYLE10"></td>
						<td width="20%" height="30" bgcolor="d3eaef" class="STYLE6"><div
								align="center">
								<span class="STYLE10">字段名</span>
							</div></td>
						<td width="54%" height="30" bgcolor="d3eaef" class="STYLE6"><div
								align="center">
								<span class="STYLE10">内容</span>
							</div></td>
						<td width="20%" height="20" bgcolor="d3eaef" class="STYLE19"><div
								align="center"></div></td>

					</tr>

					<tr>
						<td width="6%" height="20" bgcolor="#FFFFFF"><div align="center"></div>
						</td>

						<td width="20%" height="20" bgcolor="#FFFFFF" class="STYLE19"><div
								align="center">用户编号：</div></td>
						<td width="46%" bgcolor="#FFFFFF" class="STYLE19">
							<div align="center">
								<c:out value="${userinfo.get(0).get(0)}"></c:out>
							</div>
						</td>
						<td height="20" bgcolor="#FFFFFF" class="STYLE19"><div
								align="center"></div></td>
					</tr>
					<tr>
						<td height="20" bgcolor="#FFFFFF"><div align="center"></div>
						</td>

						<td width="20%" height="20" bgcolor="#FFFFFF" class="STYLE19"><div
								align="center">用&nbsp;户&nbsp;名：</div></td>
						<td bgcolor="#FFFFFF" class="STYLE19">
							<div align="center">
								<c:out value="${userinfo.get(0).get(1)}"></c:out>
							</div>
						</td>
						<td height="20" bgcolor="#FFFFFF" class="STYLE19"><div
								align="center"></div></td>
					</tr>
					<tr>
						<td height="20" bgcolor="#FFFFFF"><div align="center"></div>
						</td>

						<td width="20%" height="20" bgcolor="#FFFFFF" class="STYLE19"><div
								align="center">性&nbsp;&nbsp;&nbsp;&nbsp;别：</div></td>
						<td bgcolor="#FFFFFF" class="STYLE19">
							<div align="center">
								<c:out value="${userinfo.get(0).get(2)}"></c:out>
							</div>
						</td>
						<td height="20" bgcolor="#FFFFFF" class="STYLE19"><div
								align="center"></div></td>
					</tr>
					<tr>
						<td height="20" bgcolor="#FFFFFF"><div align="center"></div>
						</td>

						<td width="20%" height="20" bgcolor="#FFFFFF" class="STYLE19"><div
								align="center">联系方式：</div></td>
						<td bgcolor="#FFFFFF" class="STYLE19">
							<div align="center">
								<c:out value="${userinfo.get(0).get(3)}"></c:out>
							</div>
						</td>
						<td height="20" bgcolor="#FFFFFF" class="STYLE19"><div
								align="center"></div></td>
					</tr>
					<tr>
						<td height="20" bgcolor="#FFFFFF"><div align="center"></div>
						</td>

						<td width="20%" height="20" bgcolor="#FFFFFF" class="STYLE19"><div
								align="center">邮&nbsp;&nbsp;&nbsp;&nbsp;箱：</div></td>
						<td bgcolor="#FFFFFF" class="STYLE19">
							<div align="center">
								<c:out value="${userinfo.get(0).get(4)}"></c:out>
							</div>
						</td>
						<td height="20" bgcolor="#FFFFFF" class="STYLE19"><div
								align="center"></div></td>
					</tr>
					<tr>
						<td height="20" bgcolor="#FFFFFF"><div align="center"></div>
						</td>
						<td height="20" bgcolor="#FFFFFF" class="STYLE19"><div
								align="center">所属部门：</div></td>
						<td bgcolor="#FFFFFF" class="STYLE19">
							<div align="center">
								<c:out value="${userinfo.get(0).get(5)}"></c:out>
							</div>
						</td>
						<td height="20" bgcolor="#FFFFFF" class="STYLE19"><div
								align="center"></div></td>
					</tr>
					<tr>
						<td height="20" bgcolor="#FFFFFF"><div align="center"></div>
						</td>
						<td height="20" bgcolor="#FFFFFF" class="STYLE19"><div
								align="center">用户类型：</div></td>
						<td bgcolor="#FFFFFF" class="STYLE19">
							<div align="center">
								<div align="center">
									<c:out value="${userinfo.get(0).get(6)}"></c:out>
								</div>
							</div>
						</td>
						<td height="20" bgcolor="#FFFFFF" class="STYLE19"><div
								align="center"></div></td>
					</tr>
				</table></td>
		</tr>
	</table>
</body>
</html>




