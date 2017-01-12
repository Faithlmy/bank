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
<title>查看详细</title>
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
												<td width="4%" height="19" valign="bottom"><div
														align="left">
														<img src="web/images/tb.gif" width="14" height="14" />												
												<span class="STYLE1">详细记录细则</span></div>
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
								align="center">记录编号:</div>
						</td>
						<td bgcolor="#FFFFFF" class="STYLE19"><div align="center">
								<c:out value="${recordinfo.get(0).get(0)}"></c:out>
							</div>
						</td>
						<td height="20" bgcolor="#FFFFFF"></td>

					</tr>
					<tr>
						<td height="20" bgcolor="#FFFFFF"><div align="center"></div>
						</td>
						<td height="20" bgcolor="#FFFFFF" class="STYLE19"><div
								align="center">记录类型:</div></td>
						<td height="20" bgcolor="#FFFFFF" class="STYLE19"><div
								align="center">
								<c:out value="${recordinfo.get(0).get(6)}"></c:out>
							</div></td>
						<td height="20" bgcolor="#FFFFFF"></td>
					</tr>
					<tr>
						<td height="20" bgcolor="#FFFFFF"></td>
						<td height="20" bgcolor="#FFFFFF" class="STYLE19"><div
								align="center">记录人:</div>
						</td>
						<td height="20" bgcolor="#FFFFFF" class="STYLE19"><div
								align="center">
								<c:out value="${recordinfo.get(0).get(2)}"></c:out>
							</div>
						</td>
						<td height="20" bgcolor="#FFFFFF"></td>
					</tr>
					
					<tr>
						<td height="20" bgcolor="#FFFFFF"></td>
						<td height="20" bgcolor="#FFFFFF" class="STYLE19"><div
								align="center">联系方式:</div>
						</td>
						<td height="20" bgcolor="#FFFFFF" class="STYLE19"><div
								align="center">
								<c:out value="${recordinfo.get(0).get(3)}"></c:out>
							</div>
						</td>
						<td height="20" bgcolor="#FFFFFF"></td>
					</tr>

					<tr>
						<td height="20" bgcolor="#FFFFFF"></td>
						<td height="20" bgcolor="#FFFFFF" class="STYLE19"><div
								align="center">设备编号:</div>
						</td>
						<td height="20" bgcolor="#FFFFFF" class="STYLE19"><div
								align="center">
								<c:out value="${recordinfo.get(0).get(4)}"></c:out>
							</div>
						</td>
						<td height="20" bgcolor="#FFFFFF"></td>
					</tr>
					<tr>
						<td height="20" bgcolor="#FFFFFF"></td>
						<td height="20" bgcolor="#FFFFFF" class="STYLE19"><div
								align="center">设备名称:</div>
						</td>
						<td height="20" bgcolor="#FFFFFF" class="STYLE19"><div
								align="center">
								<c:out value="${recordinfo.get(0).get(5)}"></c:out>
							</div>
						</td>
						<td height="20" bgcolor="#FFFFFF"></td>
					</tr>
					<tr>
						<td height="20" bgcolor="#FFFFFF"></td>
						<td height="20" bgcolor="#FFFFFF" class="STYLE19"><div
								align="center">相关单位:</div>
						</td>
						<td height="20" bgcolor="#FFFFFF" class="STYLE19"><div
								align="center">
								<c:out value="${recordinfo.get(0).get(6)}"></c:out>
							</div>
						</td>
						<td height="20" bgcolor="#FFFFFF"></td>
					</tr>
					<tr>
						<td height="20" bgcolor="#FFFFFF"></td>
						<td height="20" bgcolor="#FFFFFF" class="STYLE19"><div
								align="center">记录时间:</div>
						</td>
						<td height="20" bgcolor="#FFFFFF" class="STYLE19"><div
								align="center">
								<c:out value="${recordinfo.get(0).get(7)}"></c:out>
							</div>
						</td>
						<td height="20" bgcolor="#FFFFFF"></td>
					</tr>
					<tr>
						<td height="20" bgcolor="#FFFFFF"></td>
						<td height="20" bgcolor="#FFFFFF" class="STYLE19"><div
								align="center">状态信息:</div>
						</td>
						<td height="20" bgcolor="#FFFFFF" class="STYLE19"><div
								align="center">
								<c:out value="${recordinfo.get(0).get(8)}"></c:out>
							</div>
						</td>
						<td height="20" bgcolor="#FFFFFF"></td>
					</tr>
					<tr>
						<td height="20" bgcolor="#FFFFFF"></td>
						<td height="20" bgcolor="#FFFFFF" class="STYLE19"><div
								align="center">确认信息:</div>
						</td>
						<td height="20" bgcolor="#FFFFFF" class="STYLE19"><div
								align="center">
								<c:out value="${recordinfo.get(0).get(9)}"></c:out>
							</div>
						</td>
						<td height="20" bgcolor="#FFFFFF"></td>
					</tr>
					<tr>
						<td height="100" bgcolor="#FFFFFF"></td>
						<td height="100" bgcolor="#FFFFFF" class="STYLE19"><div
								align="center">记录细则:</div>
						</td>
						<td height="100" bgcolor="#FFFFFF" class="STYLE19"><div
								align="center">
								<c:out value="${recordinfo.get(0).get(10)}"></c:out>
							</div>
						</td>
						<td height="100" bgcolor="#FFFFFF"></td>
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



























