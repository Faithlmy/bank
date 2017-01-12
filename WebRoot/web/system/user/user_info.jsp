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
<meta http-equiv="Content-Type" content="text/html;charset=utf-8" />
<link rel="stylesheet" type="text/css" href="web/css/web/table.css" />
<script type="text/javascript" src="web/js/line.js"></script>
<script type="text/javascript" src="web/js/info.js"></script>

<script type="text/javascript" src="js/jquery-1.7.2.min.js"></script>
<script type="text/javascript">
	function tz(){
	 	var go = document.getElementById("go").value;
  		window.location.href="user.do?opt=showAll&method=go&go="+go; 
	}
//验证在去第几页的框中输入的是否只有数字
	$(function(){
		$(".go").bind('click',function(){//点击go提交表单
		var reg = /^[-+]?\d+$/;
		if(reg.test($(".input2").val())){
		$("#f1").submit();
			return true;
		}else{
		alert("只能输入数字");
			return false;
		}
		});	
	});
	
	</script>
	

</head>

<body>
	<table width="100%" border="0" align="center" cellpadding="0"
		cellspacing="0">
		<tr>
			<td height="30"><table width="100%" border="0" cellspacing="0"
					cellpadding="0">
					<tr>
						<td height="25" bgcolor="#353c44"><table width="100%"
								border="0" cellspacing="0" cellpadding="0">
								<tr>
									<td><table width="100%" border="0" cellspacing="0"
											cellpadding="0">
											<tr>
												<td width="6%" height="19" valign="bottom"><div
														align="left">
														<form action="user.do?opt=queryAll" method="post">
															<img src="web/images/tb.gif" width="14" height="14" /> <span
																class="STYLE1"> 员工信息 </span>&nbsp;&nbsp; <input
																type="text" id="search" name="search" class="STYLE21"
																value="用户名或部门名称" /> <input type="submit" value="查询"
																class="STYLE21" style="height: 25px" />
														</form>
													</div></td>
											</tr>
										</table></td>
									<td><div align="right">
											<span class="STYLE1"><img
												src="web/images/add.gif" width="10" height="10" /> <a
												href="web/system/user/user_add.jsp"><span
													class="STYLE23">录入员工信息</span> </a> &nbsp;</span>
										</div>
									</td>
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
						<td width="12%" height="25" bgcolor="d3eaef" class="STYLE6"><div
								align="center">
								<span class="STYLE10">用户编号</span>
							</div></td>
						<td width="10%" height="25" bgcolor="d3eaef" class="STYLE6"><div
								align="center">
								<span class="STYLE10">用户名</span>
							</div></td>
						<td width="5%" height="25" bgcolor="d3eaef" class="STYLE6"><div
								align="center">
								<span class="STYLE10">性别</span>
							</div></td>
						<td width="10%" height="25" bgcolor="d3eaef" class="STYLE6"><div
								align="center">
								<span class="STYLE10">联系方式</span>
							</div></td>
						<td width="18%" height="25" bgcolor="d3eaef" class="STYLE6"><div
								align="center">
								<span class="STYLE10">邮箱</span>
							</div></td>
						<td width="10%" height="25" bgcolor="d3eaef" class="STYLE6"><div
								align="center">
								<span class="STYLE10">用户类型</span>
							</div></td>
					 	<td width="10%" height="25" bgcolor="d3eaef" class="STYLE6"><div
								align="center">
								<span class="STYLE10">所属部门</span>
							</div></td>
						
						<td bgcolor="d3eaef"><div align="center">
								<span class="STYLE21">操作</span>
							</div></td>
					</tr>
					<c:set var="i" value="1"></c:set>
					<!-- 使用C标签循环输出列表项 -->
					<c:forEach items="${list}" var="userinfo">
						<tr>
							<td height="20" bgcolor="#FFFFFF"><div align="center">
								
								</div></td>
							<td height="20" bgcolor="#FFFFFF" class="STYLE19"><div
									align="center">${userinfo.get(0) }</div></td>
							<td height="20" bgcolor="#FFFFFF" class="STYLE19"><div
									align="center">${userinfo.get(1) }</div></td>
							<td height="20" bgcolor="#FFFFFF" class="STYLE19"><div
									align="center">${userinfo.get(2) }</div></td>
							<td height="20" bgcolor="#FFFFFF" class="STYLE19"><div
									align="center">${userinfo.get(3)}</div></td>
							<td height="20" bgcolor="#FFFFFF" class="STYLE19"><div
									align="center">${userinfo.get(4) }</div></td>
						    <td height="20" bgcolor="#FFFFFF" class="STYLE19"><div
									align="center">${userinfo.get(5) }</div></td>
							 <td height="20" bgcolor="#FFFFFF" class="STYLE19"><div
									align="center">${userinfo.get(6) }</div></td>

							<td height="20" bgcolor="#FFFFFF"><div align="center"
									class="STYLE21">
									<img src="web/images/pic12.gif" height="14" width="14" alt="删除" />
									<a href="user.do?opt=delUser&user_id=${userinfo.get(0)}"
										onclick="return delOne()"><span class="STYLE21">删除用户</span>&nbsp; </a>
									<img src="web/images/search.png" height="14" width="14" /><a
										href="user.do?opt=showOne&user_id=${userinfo.get(0)}"><span
										class="STYLE21">查看明细</span>&nbsp; </a> <img
										src="web/images/pencil.png" height="14" width="14" /><a
										href="user.do?opt=toupdUser&user_id=${userinfo.get(0)}"><span
										class="STYLE21">修改信息</span> &nbsp;</a>
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
								<span class="STYLE22">&nbsp;&nbsp;&nbsp;&nbsp;共有<strong>
										${page.totalRows} </strong> 条记录，当前第<strong>
										${page.currentPage}</strong> 页，共 <strong>${page.totalPages}</strong> 页
								</span>
							</div></td>
						<td width="67%"><table width="312" border="0" align="right"
								cellpadding="0" cellspacing="0">
								<tr>
									<td width="49"><div align="center">
											<a href="user.do?opt=showAll&method=first"> <img
												src="web/images/main_54.gif" width="40" height="15" /> </a>
										</div></td>
									<td width="49"><div align="center">
											<a href="user.do?opt=showAll&method=previous"><img
												src="web/images/main_56.gif" width="45" height="15" /> </a>
										</div></td>
									<td width="49"><div align="center">
											<a href="user.do?opt=showAll&method=next"><img
												src="web/images/main_58.gif" width="45" height="15" /> </a>
										</div></td>
									<td width="49"><div align="center">
											<a href="user.do?opt=showAll&method=last"><img
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
