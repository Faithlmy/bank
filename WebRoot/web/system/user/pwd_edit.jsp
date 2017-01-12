<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>修改密码</title>
<link rel="stylesheet" type="text/css"  href="web/css/web/table.css" />
<script type="text/javascript" src="web/js/line.js"></script>
<script type="text/javascript" src="web/jquery/jquery-1.9.1.js"></script>

<link rel="stylesheet" type="text/css" href="web/jquery/easyui/themes/default/easyui.css" />
<link rel="stylesheet" type="text/css" href="web/jquery/easyui/themes/icon.css" />
<script type="text/javascript" src="web/jquery/easyui/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="web/jquery/easyui/jquery.easyui.min.js"></script>
<script type="text/javascript" src="web/jquery/easyui/easyui-lang-zh_CN.js"></script>


<script type="text/javascript">
function check(){

var pwd1 = document.getElementById("new_pwd").value;
var pwd2 = document.getElementById("confirm_pwd").value;
if(pwd1!=""&&pwd2!=""){
if(pwd1 != pwd2){
 alert("两次密码不一致，请重新输入！");
}else{
  alert("密码可用！")
}
}else{
alert("请输入密码")
}

}
</script>
</head>

<body>
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
														<img src="web/images/tb.gif" width="14" height="14" />

														<span class="STYLE1"> 修改密码</span>
													</div></td>
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
						<td width="6%" height="25" bgcolor="d3eaef" class="STYLE10"></td>
						<td width="20%" height="25" bgcolor="d3eaef" class="STYLE6"><div
								align="center">
								<span class="STYLE10">字段名</span>
							</div>
						</td>
						<td width="50%" height="30" bgcolor="d3eaef" class="STYLE6"><div
								align="center">
								<span class="STYLE10">内容</span>
							</div>
						</td>
						<td width="20%" height="30" bgcolor="d3eaef" class="STYLE6"><div
								align="center">
								<span class="STYLE10"></span>
							</div>
						</td>
					</tr>

					<tr>
						<td height="20" bgcolor="#FFFFFF">&nbsp;</td>
						<td height="20" bgcolor="#FFFFFF" class="STYLE19"><div
								align="center">原密码：</div></td>
						<td bgcolor="#FFFFFF" class="STYLE19"><div align="center">
						<input class="easyui-validatebox" required="true"
										validType="length[6,15]" class="STYLE19" type="password" id="pwd1"/>
							</div></td>
						<td height="20" bgcolor="#FFFFFF">&nbsp;</td>


					</tr>
					<tr>
						<td height="20" bgcolor="#FFFFFF"><div align="center"></div>
						</td>

						<td width="20%" height="20" bgcolor="#FFFFFF" class="STYLE19"><div
								align="center">新密码：</div></td>
						<td bgcolor="#FFFFFF" class="STYLE19">
							<div align="center">
								<input class="easyui-validatebox" required="true"
										validType="length[6,15]" name="new_pwd" id="new_pwd" type="password"  class="STYLE19" />
							</div>
						</td>
						<td height="20" bgcolor="#FFFFFF">&nbsp;</td>
					</tr>
					<tr>
						<td height="20" bgcolor="#FFFFFF"><div align="center"></div>
						</td>

						<td width="20%" height="20" bgcolor="#FFFFFF" class="STYLE19"><div
								align="center">确认密码：</div></td>
						<td bgcolor="#FFFFFF" class="STYLE19">
							<div align="center">
								<input class="easyui-validatebox" required="true"
										validType="length[6,15]" name="confirm_pwd" id="confirm_pwd" type="text" class="STYLE19" onblur="check();"/>
							</div>
						</td>
						<td height="20" bgcolor="#FFFFFF">&nbsp;</td>
					</tr>
					<tr>
						<td height="20" bgcolor="#FFFFFF"><div align="center"></div>
						</td>

						<td width="20%" height="20" bgcolor="#FFFFFF" class="STYLE19"><br /></td>
						<td bgcolor="#FFFFFF" class="STYLE19">
							<div align="center">
								<form action="../../index.html">
									<input name="submit" type="submit" value="提交" class="STYLE19" />&nbsp;&nbsp;&nbsp;&nbsp;
									<input name="reset" type="reset" class="STYLE19" value="重置" />
								</form>
							</div>
						</td>
						<td height="20" bgcolor="#FFFFFF">&nbsp;</td>
					</tr>
				</table></td>
		</tr>

	</table>
</body>
</html>




