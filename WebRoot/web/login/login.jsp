<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>   
   <title>中国银行设备巡检系统</title>
   
<link rel="stylesheet" type="text/css" href="../css/login/login.css" />
<script type="text/javascript" src="../jquery/jquery-1.9.1.js"></script>

<script type="text/javascript">
function changeValidateCode(obj) {	
	//获取<img>标签的id属性，并且使用”?”表示使用get请求;---进行验证码局部刷新
	document.getElementById ("yzm").src =document.getElementById("yzm").src +"?" ;
	var checkcode = document.getElementById("checkcode");
	checkcode.value="";
	checkcode.focus();
}
function flush(){
	window.location.href="login.jsp"; //页面刷新	
}
function toMain(){

 window.location.href="../../user.do?opt=toMain&user_id="+document.getElementById("user_id").value;
}
$(function(){
$("#login").click(function(){
var user_id = $("#user_id").val();
var user_pwd = $("#user_pwd").val();
var checkcode = $("#checkcode").val();
if(checkcode==""){
	alert("验证码必填！");	
}else{
$.ajax({
   type: "POST",//get
   async: true,
   dataType:"html",
   cache: false,
   url: "../../user.do", 
   data: "opt=login&user_id="+user_id+"&user_pwd="+user_pwd+"&checkcode="+checkcode+"  ",
   success:function(message){
    var msg = message; 
 if(msg == -1){
 	alert("验证码输入不正确，请重新输入！！");
 	changeValidateCode(obj);
 }else if(msg == 1){
  	alert("用户名或密码错误，请重新输入！！");
 	flush();
 }else if(msg == 0){
 	toMain();
 	 }
   }
}); 
}
});
$("#checkcode").keydown(function(event){
var e = event || window.event || arguments.callee.caller.arguments[0];
    //alert(e.keyCode);
    if (e&&e.keyCode == 13)
    {
        e.returnValue=false;
        e.cancel = true;
        form1.login.click();
    }
});
$("#user_pwd").keydown(function(event){
var e = event || window.event || arguments.callee.caller.arguments[0];
    //alert(e.keyCode);
    if (e&&e.keyCode == 13)
    {
        e.returnValue=false;
        e.cancel = true;
        form1.login.click();
    }
});
  });
  </script>
</head>


<body>
<form name="form1" method="post">
	<table width="100%" height="100%" border="0" cellspacing="0"
		cellpadding="0">
		<tr>
			<td bgcolor="#1075b1">&nbsp;</td>
		</tr>
		<tr>
			<td height="608" background="../images/login_03.gif"><table
					width="847" border="0" align="center" cellpadding="0"
					cellspacing="0">
					<tr>
						<td height="318" background="../images/login_04.gif">&nbsp;</td>
					</tr>
					<tr>
						<td height="84">
						<table width="100%" border="0"
								cellspacing="0" cellpadding="0">
								<tr>
									<td width="381" height="84" background="../images/login_06.gif">&nbsp;</td>
									<td width="162" valign="middle"
										background="../images/login_07.gif"><table width="100%"
											border="0" cellspacing="0" cellpadding="0">
											<tr>
												<td width="44" height="24" valign="bottom"><div
														align="right">
														<span class="STYLE3">账&nbsp;&nbsp;&nbsp;&nbsp;号</span>
													</div>
												</td>
												<td width="10" valign="bottom">&nbsp;</td>
												<td height="24" colspan="2" valign="bottom">
													<div align="left">
														<input type="text" name="use_id" id="user_id"
															style="width:100px; height:17px; background-color:#87adbf; border:solid 1px #153966; font-size:12px; color:#283439;" />
													</div>
												</td>
											</tr>
											<tr>
												<td height="24" valign="bottom"><div align="right">
														<span class="STYLE3">密&nbsp;&nbsp;&nbsp;&nbsp;码</span>
													</div>
												</td>
												<td width="10" valign="bottom">&nbsp;</td>
												<td height="24" colspan="2" valign="bottom"><input
													type="password" name="user_pwd" id="user_pwd"
													style="width:100px; height:17px; background-color:#87adbf; border:solid 1px #153966; font-size:12px; color:#283439; " />
												</td>
											</tr>
											<tr>
												<td height="24" valign="bottom"><div align="right">
														<span class="STYLE3">验证码</span>
													</div>
												</td>
												<td width="10" valign="bottom">&nbsp;</td>
												<td width="52" height="24" valign="bottom">
												<input type="text" name="checkcode" id="checkcode" 
													style="width:50px; height:17px; background-color:#87adbf; border:solid 1px #153966; font-size:12px; color:#283439;"  onkeydown="keydown();"/>
												</td>
												<td width="62" valign="bottom"><div align="left">
															<img src="../login/img.jsp" id="yzm" onclick="changeValidateCode(this)" title="看不清楚？点击刷新" width="38" height="18">
													
													</div>
												</td>
											</tr>
											<tr></tr>
										</table>
									</td>
									<td width="26">
									<img src="../images/login_08.gif"
										width="26" height="84">
									</td>
									<td width="67" background="../images/login_09.gif"><table
											width="100%" border="0" cellspacing="0" cellpadding="0">
											<tr>
												<td height="25"><div align="center">
														<img src="../images/dl.gif" width="57" height="20" id="login" name="login" onclick="log();">
														</a>
													</div>
												</td>
											</tr>
											<tr>
												<td height="25"><div align="center">
														<img src="../images/cz.gif" width="57" height="20">
													</div>
												</td>
											</tr>
										</table>
									</td>
									<td width="211" background="../images/login_10.gif">&nbsp;</td>
								</tr>
							</table>

						</td>
					</tr>
					<tr>
						<td height="206" background="../images/login_11.gif">&nbsp;</td>
					</tr>
				</table>
			</td>
		</tr>
		<tr>
			<td bgcolor="#152753">&nbsp;</td>
		</tr>
	</table>
  </form>
</body>
</html>
