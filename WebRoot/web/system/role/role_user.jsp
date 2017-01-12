<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
    <title>My JSP 'role_user.jsp' starting page</title>
  	
<link rel="stylesheet" type="text/css"  href="../../css/web/table.css" />
<script type="text/javascript" src="../../js/line.js"></script>
<script type="text/javascript" src="../../jquery/jquery-1.9.1.js"></script>

<script type="text/javascript">
$(function(){

//异步加载所有用户名
$.ajax({
type:"post",
async:true,
cache:false,
url:"../../../user.do",
data:"opt=findAllUser",
dataType:"json",
success:function(users){
var content = "";
for(i=0;i<users.length;i++){
	 content +="<option value='"+users[i].user_name+"'>"+users[i].user_name+"</option>";
	 }
	 $("#user_name").append(content);
}
});

//异步加载所有角色名称
$.ajax({
type:"post",
async:true,
cache:false,
url:"../../../role.do",
data:"opt=findAllRole",
dataType:"json",
success:function(roles){
var contents = "";
for(i=0;i<roles.length;i++){
	          contents +="<option value='"+roles[i].role_type+"'>"+roles[i].role_type+"</option>";
	      }
	     $("#role_type").append(contents);
}
});
//用户名绑定改变事件，触发的时候，异步刷新出用户对应的编号和当前角色
   $("#user_name").bind("change",function(){
   var user_name = $("#user_name").val(); 
   $.ajax({
   type: "POST",//get
   async: true,
   cache: false,
   url: "../../../user.do", 
   data: "opt=showAsyncRole&user_name="+user_name+" ",
   //dataType:"json",
   success:function(message){
   eval("msg="+message);
   $("#user_id").val(msg.user_id);
   $("#user_type").val(msg.role_type);
   }
   });
});
});
</script>
</head>
  
  <body>
  <form action="../../../user.do?opt=addRoleUser" method="post">
    <table width="100%" border="0" align="center" cellpadding="0"
		cellspacing="0">
		<tbody>
			<tr>
				<td height="30"><table border="0" cellpadding="0"
						cellspacing="0" width="100%">
						<tbody>
							<tr>
								<td bgcolor="#353c44" height="24"><table border="0"
										cellpadding="0" cellspacing="0" width="100%">
										<tbody>
											<tr>
												<td><table border="0" cellpadding="0" cellspacing="0"
														width="100%">
														<tbody>
															<tr>
																<td height="19" valign="bottom" width="6%"><div
																		align="left">
																		<img src="../../images/tb.gif" height="14" width="14" />
																		<span class="STYLE1"> 给用户分配角色</span>
																	</div>
																</td>
															</tr>
														</tbody>
													</table></td>
											</tr>
										</tbody>
									</table></td>
							</tr>
						</tbody>
					</table></td>
			</tr>
			<tr>
				<td><table onmouseover="changeto()" onmouseout="changeback()"
						bgcolor="#a8c7ce" border="0" cellpadding="0" cellspacing="1"
						width="100%">
						<tbody>
							<tr>
								<td class="STYLE10" bgcolor="d3eaef" height="25" width="10%"><div
										align="center"></div></td>
								<td class="STYLE6" bgcolor="d3eaef" height="25" width="25%"><div
										align="center">
										<span class="STYLE10">字段</span>
									</div></td>
								<td height="25" bgcolor="d3eaef" class="STYLE6"><div
										align="center">
										<span class="STYLE10">内容</span>
									</div>
									<div align="center"></div>
								</td>
								<td class="STYLE6" bgcolor="d3eaef" height="25" width="21%"><div
										align="center">
										<span class="STYLE10"></span>
									</div></td>
							</tr>
						<tr>
								<td bgcolor="#FFFFFF" height="25"><div align="center">
									</div></td>
								<td class="STYLE19" bgcolor="#FFFFFF" height="25"><div
										align="center">用户名称：</div></td>
								<td height="25" bgcolor="#FFFFFF" class="STYLE19"><div
										align="center">
										<select name="user_name" id = "user_name" style="width:155px">
										<option value="0">请选择</option>

										</select>
									</div>
								</td>
								<td class="STYLE19" bgcolor="#FFFFFF" height="25"><div
										align="center"></div></td>
							</tr>
							<tr>
								<td bgcolor="#FFFFFF" height="25"><div
										align="center"></div></td>
								<td class="STYLE19" bgcolor="#FFFFFF" height="25"><div
										align="center">用户编号：</div></td>
								<td height="25" bgcolor="#FFFFFF" class="STYLE19">
									<div align="center">
									<input type="text" name="user_id" id="user_id"/>
									</div>
								</td>
								<td class="STYLE19" bgcolor="#FFFFFF" height="25">&nbsp;</td>
							</tr>
							<tr>
								<td bgcolor="#FFFFFF" height="25"><div
										align="center"></div></td>
								<td class="STYLE19" bgcolor="#FFFFFF" height="25"><div
										align="center">当前角色：</div></td>
								<td height="25" bgcolor="#FFFFFF" class="STYLE19">
									<div align="center">
									<input type="text" name="user_type" id="user_type"/>
									</div>
								</td>
								<td class="STYLE19" bgcolor="#FFFFFF" height="25">&nbsp;</td>
							</tr>
							<tr>
								<td bgcolor="#FFFFFF" height="25"><div
										align="center"></div></td>
								<td class="STYLE19" bgcolor="#FFFFFF" height="25"><div
										align="center">分配角色：</div></td>
								<td height="25" bgcolor="#FFFFFF" class="STYLE19">
									<div align="center">
									<select name="role_type" id = "role_type" style="width:155px">
									<option value="0">请选择</option>
										</select>
									</div>
								</td>
								<td class="STYLE19" bgcolor="#FFFFFF" height="25">&nbsp;</td>
							</tr>

							<tr>
							   <td bgcolor="#FFFFFF" height="25"><div
										align="center"></div></td>
								<td class="STYLE19" bgcolor="#FFFFFF" height="25"><div
										align="center"></div></td>
								<td height="25" bgcolor="#FFFFFF" class="STYLE19"><div
										align="center">

										<input name="submit" type="submit" class="STYLE19"
											value="分配" /> &nbsp;&nbsp;&nbsp;&nbsp; 
										<input name="reset" type="reset" class="STYLE19" value="重置" />
									</div>
								</td>
								<td class="STYLE19" bgcolor="#FFFFFF" height="25"><div
										align="center"></div></td>
							</tr>
						</tbody>
					</table></td>
			</tr>
		</tbody>
		</form>
  </body>
</html>
