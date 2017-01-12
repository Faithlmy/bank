<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>员工分组信息</title>
<link rel="stylesheet" type="text/css" href="web/css/web/table.css" />
<script type="text/javascript" src="web/js/line.js"></script>
<script type="text/javascript" src="web/js/info.js"></script>
<script type="text/javascript" src="web/jquery/jquery-1.9.1.js"></script>

<script type="text/javascript">
function goGroup(){
	var xz = document.getElementById("group_name").value;
	window.location.href="group.do?opt=showByName&group_name="+xz+" ";
}
function delOne() {
var flag = false;
	if (confirm("确认删除？")){
		flag = true;
	    var xz = document.getElementById("group_name").value;
		window.location.href="group.do?opt=delGroup&group_name="+xz+" ";
	}
	else{
		flag = false;
	}
	return flag;
	
}
function editGroup(){
	var xz = document.getElementById("group_name").value;
	window.location.href="group.do?opt=toUpdGroup&group_name="+xz+" ";
}
$(function(){
	$.ajax({
	type:"post",
	async:true,
	cache:false,
	url:"group.do",
	data:"opt=findAllGroup",
	dataType:"json",
	success:function(groups){
	var content = "";
	for(i=0;i<groups.length;i++){
	 content +="<option value='"+groups[i].group_name+"'>"+groups[i].group_name+"</option>";
	 }
	 $("#group_name").append(content);
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
											<span class="STYLE1"> <img src="web/images/tb.gif"
												width="14" height="14" /> <span class="STYLE1">
													员工分组信息&nbsp;&nbsp;&nbsp; 
													<select name="group_name"
													id="group_name" class="STYLE19" style=" width: 135px">
														<option value="0">请选择组</option>
													</select>
												    <input type="button" value="确认" onclick="goGroup();" />
													&nbsp;&nbsp; <img src="web/images/add.gif" width="10"
													height="10" /> <a href="web/polling/group_add.jsp"> <span
														class="STYLE23">添加分组 </span> </a>&nbsp; <img
													src="web/images/del.gif" width="10" height="10" /> <span
													class="STYLE23" onClick="return delOne()">删除分组</span>&nbsp;&nbsp;
													<img src="web/images/edit.gif" height="10" width="10" /> <span
													class="STYLE23" onclick="editGroup();">编辑分组</span>
											</span>
										</div></td>
									<td>
									<table width="100%" border="0" cellspacing="0"
											cellpadding="0">
											
											<tr>
											
											<td width="6%" height="19" valign="bottom"></td>											
												<td width="6%" height="19" valign="bottom">
												<form action="group.do?opt=queryAll" method = "post">
													&nbsp; 
													<input type="text" name="search" class="STYLE21" value="输入组编号" />
													<input type="submit" value="查询" class="STYLE21" style="height: 25px" /></span>
												</form>
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
			<td><table width="100%" border="0" cellpadding="0"
					cellspacing="1" bgcolor="#a8c7ce" onMouseOver="changeto()"
					onmouseout="changeback()">
					<tr>
						<td width="4%" height="25" bgcolor="d3eaef" class="STYLE10"><div
								align="center">
							</div>
						</td>
						<td width="11%" height="25" bgcolor="d3eaef" class="STYLE6"><div
								align="center">
								<span class="STYLE10">编号</span>
							</div>
						</td>
						<td width="15%" height="25" bgcolor="d3eaef" class="STYLE6"><div
								align="center">
								<span class="STYLE10">用户编号</span>
							</div>
						</td>
						<td width="15%" height="25" bgcolor="d3eaef" class="STYLE6"><div
								align="center">
								<span class="STYLE10">组名</span>
							</div>
						</td>
						<td width="10%" height="25" bgcolor="d3eaef" class="STYLE6"><div
								align="center">
								<span class="STYLE10">组成员</span>
							</div>
						</td>
						<td width="20%" height="25" bgcolor="d3eaef" class="STYLE6"><div
								align="center">
								<span class="STYLE10">联系方式</span>
							</div>
						</td>
						<td width="25%" height="25" bgcolor="d3eaef" class="STYLE6"><div
								align="center">
								<span class="STYLE10">操作</span>
							</div>
						</td>
					</tr>
					<!-- 使用foreach输出组信息  -->
					<c:forEach items="${list}" var="groupinfo">
					<tr>
						<td height="20" bgcolor="#FFFFFF"><div align="center">
								
							</div>
						</td>
						<td height="20" bgcolor="#FFFFFF" class="STYLE19"><div
								align="center">${groupinfo.get(0)}</div>
						</td>
						<td height="20" bgcolor="#FFFFFF" class="STYLE19"><div
								align="center">${groupinfo.get(1)}</div>
						</td>
						<td height="20" bgcolor="#FFFFFF" class="STYLE19"><div
								align="center">${groupinfo.get(2)}</div>
						</td>
						<td height="20" bgcolor="#FFFFFF" class="STYLE19"><div
								align="center">${groupinfo.get(3)}</div>
						</td>
						<td height="20" bgcolor="#FFFFFF" class="STYLE19"><div
								align="center">${groupinfo.get(4)}</div>
						</td>
						<td height="20" bgcolor="#FFFFFF">
							<div align="center" class="STYLE21">
								<img src="web/images/pic12.gif" height="14" width="14" alt="删除" /><a href="group.do?opt=delGroupMember&user_id=${groupinfo.get(1)}" onClick="return delOne()"> <span class="STYLE21">删除组成员</span></a>
			
							</div>
						</td>
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
											<a href="group.do?opt=showAll&method=first"><img src="web/images/main_54.gif" width="40" height="15" /></a>
										</div></td>
									<td width="49"><div align="center">
											<a href="group.do?opt=showAll&method=previous"><img src="web/images/main_56.gif" width="45" height="15" /></a>
										</div></td>
									<td width="49"><div align="center">
											<a href="group.do?opt=showAll&method=next"><img src="web/images/main_58.gif" width="45" height="15" /></a>
										</div></td>
									<td width="49"><div align="center">
											<a href="group.do?opt=showAll&method=last"><img src="web/images/main_60.gif" width="40" height="15" /></a>
										</div></td>
									<td width="37" class="STYLE22"><div align="center">转到</div>
									</td>
									<td width="22"><div align="center">
											<input type="text" name="textfield" id="textfield"
												style="width:20px; height:12px; font-size:12px; border:solid 1px #7aaebd;" />
										</div></td>
									<td width="22" class="STYLE22"><div align="center">页</div>
									</td>
									<td width="35"><img src="web/images/main_62.gif" width="26"
										height="15" /></td>
								</tr>
							</table></td>
					</tr>
				</table></td>
		</tr>
	</table>

</body>
</html>