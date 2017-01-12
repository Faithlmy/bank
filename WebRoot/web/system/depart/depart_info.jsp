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
<title>部门管理</title>
<link rel="stylesheet" type="text/css" href="web/css/web/table.css" />
<script type="text/javascript" src="web/js/line.js"></script>
<script type="text/javascript" src="web/js/info.js"></script>
<script type="text/javascript" src="web/jquery/jquery-1.9.1.js"></script>

<script type="text/javascript">
function goDepart(){
	var xz = document.getElementById("depart_name").value;
	window.location.href="depart.do?opt=showByName&depart_name="+xz+" ";
}
function delDepart() {
var flag = false;
	if (confirm("确认删除？")){
		flag = true;
	    var xz = document.getElementById("depart_name").value;
		window.location.href="depart.do?opt=delDepart&depart_name="+xz+" ";
	}
	else{
		flag = false;
	}
	return flag;
	
}
function editDepart(){
	var xz = document.getElementById("depart_name").value;
	window.location.href="depart.do?opt=toupdDepart&depart_name="+xz+" ";
}
$(function(){
$.ajax({
	 type:"post",
	 async:true,
	 cache:false,
	 url:"depart.do",
	 data:"opt=showAllDepart",
	 dataType:"json",
	 success:function(departs){
	 	var contents = "";
for(i=0;i<departs.length;i++){
	 contents +="<option value='"+departs[i].depart_name+"'>"+departs[i].depart_name+"</option>";
	 }
	 $("#depart_name").append(contents);
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
						<td height="24" bgcolor="#353c44"><table width="100%"
								border="0" cellspacing="0" cellpadding="0">
								<tr>

									<td><div align="left">
											<span class="STYLE1"> 
											<img src="web/images/tb.gif" width="14" height="14" /> 
											<span class="STYLE1"> 部门信息</span>&nbsp;&nbsp;
												<select name="depart_name" id="depart_name">
													<option value="0">请选择部门</option>
												</select>&nbsp;&nbsp;&nbsp; 
											<input type="button" value="确认" onclick="goDepart();" />&nbsp;&nbsp;&nbsp; 
												<img src="web/images/add.gif" width="10" height="10" />
												 <a href="web/system/depart/depart_add.jsp">
												<span class="STYLE23" >添加部门信息 </span> </a> &nbsp;&nbsp; 
												<img src="web/images/del.gif" width="10" height="10" /> 
												<span class="STYLE23" onClick="return delDepart()">删除部门信息 </span>
											</a> &nbsp;&nbsp;
											<img src="web/images/edit.gif" width="10" height="10" /> 
												<span class="STYLE23" onClick="return editDepart()">修改部门信息 </span> </a>&nbsp;&nbsp;
											 </span>
										</div></td>
									<td><table width="100%" border="0" cellspacing="0"
											cellpadding="0">
											<tr>
												<td width="6%" height="19" valign="bottom"><div
														align="right">
														<form action="depart.do?opt=queryAll" method="post">
															<input type="text" name="search" class="STYLE21"
																value="部门名称或成员" /> &nbsp;<input type="submit"
																value="查询" class="STYLE21" />&nbsp;&nbsp;
														</form>
													</div></td>
											</tr>
										</table></td>
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
								align="center"></div>
						</td>
						<td width="10%" height="25" bgcolor="d3eaef" class="STYLE6"><div

					
						<td width="15%" height="25" bgcolor="d3eaef" class="STYLE6"><div

								align="center">
								<span class="STYLE10">部门编号</span>
							</div></td>
						<td width="12%" height="25" bgcolor="d3eaef" class="STYLE6"><div
								align="center">
								<span class="STYLE10">部门名称</span>
							</div></td>

						<td width="15%" height="25" bgcolor="d3eaef" class="STYLE6"><div
								align="center">
								<span class="STYLE10">用户编号</span>
							</div></td>
						<td width="15%" height="25" bgcolor="d3eaef" class="STYLE6"><div
								align="center">
								<span class="STYLE10">成员</span>
							</div></td>
						<td width="10%" height="25" bgcolor="d3eaef" class="STYLE6"><div
								align="center">
								<span class="STYLE10">性别</span>
							</div></td>
						<td width="15%" height="25" bgcolor="d3eaef" class="STYLE6"><div
								align="center">
								<span class="STYLE10">联系方式</span>

							</div>
						</td>
						
						<td colspan="2" height="25" bgcolor="d3eaef" class="STYLE6"><div
								align="center">

								<span class="STYLE10">基本操作</span>
							</div></td>

					</tr>
					<c:forEach items="${list}" var="departinfo">
						<tr>
							<td height="20" bgcolor="#FFFFFF"><div align="center">

								</div> <br />
							</td>
							<td height="20" bgcolor="#FFFFFF" class="STYLE19"><div
									align="center">${departinfo.get(0)}</div></td>
							<td height="20" bgcolor="#FFFFFF" class="STYLE19"><div
									align="center">${departinfo.get(1)}</div></td>
							<td height="20" bgcolor="#FFFFFF" class="STYLE19"><div
									align="center">${departinfo.get(2)}</div></td>
							<td height="20" bgcolor="#FFFFFF" class="STYLE19"><div
									align="center">${departinfo.get(3)}</div></td>
							<td height="20" bgcolor="#FFFFFF" class="STYLE19"><div
									align="center">${departinfo.get(4)}</div></td>
							<td height="20" bgcolor="#FFFFFF" class="STYLE19"><div
									align="center">${departinfo.get(5)}</div></td>

							<td height="20" bgcolor="#FFFFFF"><div align="center"
									class="STYLE21">
									<img src="web/images/pic12.gif" height="14" width="14" alt="删除" /><a
										href="depart.do?opt=removeEmployee&user_id=${departinfo.get(2)}"><span
										class="STYLE21" onclick="return delOne()">删除部门成员</span> </a> 
								</div></td>
						</tr>
					</c:forEach>
				</table></td>
		</tr>
	</table>
	<table width="100%" border="0" align="center" cellpadding="0"
		cellspacing="0">
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
											<a href="depart.do?opt=showAll&method=first"> <img
												src="web/images/main_54.gif" width="40" height="15" /> </a>
										</div></td>
									<td width="49"><div align="center">
											<a href="depart.do?opt=showAll&method=previous"><img
												src="web/images/main_56.gif" width="45" height="15" /> </a>
										</div></td>
									<td width="49"><div align="center">
											<a href="depart.do?opt=showAll&method=next"><img
												src="web/images/main_58.gif" width="45" height="15" /> </a>
										</div></td>
									<td width="49"><div align="center">
											<a href="depart.do?opt=showAll&method=last"><img
												src="web/images/main_60.gif" width="40" height="15" /> </a>
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