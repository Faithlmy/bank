<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title></title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">

<link rel="stylesheet" type="text/css" href="web/css/web/top.css" />
<script type="text/javascript">
   function logout(){
    if(confirm("确认退出？")){ 	
    	top.location.href="web/login/login.jsp";	 	
    }else{
    top.location.href="web/main.html";
    }
   }
</script>
</head>

<body>
	<table>
		<tr>
			<table width="100%" border="0" cellspacing="0" cellpadding="0">

				<tr>
					<td height="57" background="web/images/main_03.gif"><table
							width="100%" border="0" cellspacing="0" cellpadding="0">
							<tr>
								<td width="378" height="57" background="web/images/main_01.gif">&nbsp;</td>
								<td>&nbsp;</td>
								<td width="281" valign="bottom"><table width="100%"
										border="0" cellspacing="0" cellpadding="0">
										<tr>
											<td width="33" height="27"><img
												src="web/images/main_05.gif" width="33" height="27" />
											</td>
											<td width="248" background="web/images/main_06.gif"><table
													width="225" border="0" align="center" cellpadding="0"
													cellspacing="0">
													<tr>
														<td height="17"><div align="right">
																<a href="user.do?opt=updPwd"
																	target="table"><img src="web/images/pass.gif"
																	width="69" height="17" /> </a>
															</div>
														</td>
														<td><div align="right">
																<a href="user.do?opt=showOne&user_id=${user_id}"
																	target="table"><img src="web/images/user.gif"
																	width="69" height="17" /> </a>
															</div>
														</td>
														<td><div align="right">
																<a href="user.do?opt=logout" onclick="logout();"><img src="web/images/quit.gif" width="69"
																	height="17" />
																</a>
															</div>
														</td>
													</tr>
												</table>
											</td>
										</tr>
									</table>
								</td>
							</tr>
						</table>
					</td>
				</tr>
				<tr>
					<td height="40" background="web/images/main_10.gif"><table
							width="100%" border="0" cellspacing="0" cellpadding="0">
							<tr>
								<td width="194" height="40" background="web/images/main_07.gif">&nbsp;</td>
								<td><table width="100%" border="0" cellspacing="0"
										cellpadding="0">
										<tr>
											<td width="21"><img src="web/images/main_13.gif"
												width="19" height="14" /><span class="STYLE7"></span></td>
											<td width="35" class="STYLE7">
												<div align="center">
													<a target="table" href="web/right.html"><span
														class="STYLE7">首页</span>
													</a>
												</div>
											</td>
											<td width="21" class="STYLE7"><img
												src="web/images/main_15.gif" width="19" height="14"
												onclick="window.history.go(-1)" />
											</td>
											<td width="35" class="STYLE7"><div align="center"
													onclick="window.history.go(-1)">后退</div>
											</td>
											<td width="21" class="STYLE7"><img
												src="web/images/main_17.gif" width="19" height="14"
												onclick="window.history.go(1)" />
											</td>
											<td width="35" class="STYLE7"><div align="center"
													onclick="window.history.go(1)">前进</div>
											</td>
											<td width="21" class="STYLE7"><img
												src="web/images/main_19.gif" width="19" height="14"
												onclick="window.history.go(0)" />
											</td>
											<td width="35" class="STYLE7"><div align="center"
													onclick="window.history.go(0)">刷新</div>
											</td>
											<td width="21" class="STYLE7"><img
												src="web/images/main_21.gif" width="19" height="14" />
											</td>
											<td width="35" class="STYLE7"><div align="center">帮助</div>
											</td>
											<td>&nbsp;</td>
										</tr>
									</table>
								</td>
								<td width="248" background="web/images/main_11.gif"><table
										width="100%" border="0" cellspacing="0" cellpadding="0">
										<tr>
											<td width="16%"><span class="STYLE5"></span>
											</td>
											<td width="75%"><div align="center">
													<span class="STYLE7"> <script type="text/javascript">
														function showtime() {
															var now = new Date();
															var year = now
																	.getFullYear();
															var month = now
																	.getMonth() + 1;
															if(month<10){ month="0"+month;}
															var day = now
																	.getDate();
															if(day<10){ day="0"+day;}
															var hours = now
																	.getHours();
															if(hours<10){ hours="0"+hours;}
															var minutes = now
																	.getMinutes();
															if(minutes<10){ minutes="0"+minutes;}		
															var seconds = now
																	.getSeconds();
															if(seconds<10){ seconds="0"+seconds;}		
															time = "系统时间："
																	+ year
																	+ '-'
																	+ month
																	+ '-' + day
																	+ ' '
																	+ hours
																	+ ':'
																	+ minutes
																	+ ':'
																	+ seconds;
															var div1 = document
																	.getElementById('div1');
															div1.innerHTML = time;
														}
														function letstart() {
															taskId = setInterval(
																	showtime,
																	1000);
														}

														window.onload = function() {
															/*var div1=document.getElementById('div1');
															 div1.onclick=letstart;*/
															letstart();
														}
													</script>
														<div id="div1"></div> </span>
												</div>
											</td>
											<td width="9%">&nbsp;</td>
										</tr>
									</table>
								</td>
							</tr>
						</table>
					</td>
				</tr>
				<tr>
					<td height="30" background="web/images/main_31.gif"><table
							width="100%" border="0" cellspacing="0" cellpadding="0">
							<tr>
								<td width="8" height="30"><img src="web/images/main_28.gif"
									width="8" height="30" />
								</td>
								<td width="147" background="web/images/main_29.gif"><table
										width="100%" border="0" cellspacing="0" cellpadding="0">
										<tr>
											<td width="24%">&nbsp;</td>
											<td width="43%" height="20" valign="bottom" class="STYLE1">管理菜单</td>
											<td width="33%">&nbsp;</td>
										</tr>
									</table>
								</td>
								<td width="39"><img src="web/images/main_30.gif" width="39"
									height="30" />
								</td>
								<td><table width="100%" border="0" cellspacing="0"
										cellpadding="0">
										<tr>
											<td height="20" valign="bottom"><span class="STYLE1">当前登录用户：${user_name}
													&nbsp;用户角色：${user_type}</span>
											</td>
											<td valign="bottom" class="STYLE1">
												<div align="right">
													<img src="web/images/sj.gif" width="6" height="7" />
													本机IP地址：${site_ip} &nbsp; &nbsp;&nbsp;
												</div>
											</td>
										</tr>
									</table>
								</td>
								<td width="17"><img src="web/images/main_32.gif" width="17"
									height="30" />
								</td>
							</tr>
						</table>
					</td>
				</tr>
			</table>
		</tr>
	</table>
</body>
</html>
