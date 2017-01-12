<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
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
<title>新员工信息录入</title>
<link rel="stylesheet" type="text/css" href="../../css/web/table.css" />
<script type="text/javascript" src="../../js/line.js"></script>
<script type="text/javascript" src="../../js/info.js"></script>
<script type="text/javascript" src="../../js/verify.js"></script>

<link rel="stylesheet" type="text/css" href="../../jquery/easyui/themes/default/easyui.css" />
<link rel="stylesheet" type="text/css" href="../../jquery/easyui/themes/icon.css" />
<script type="text/javascript" src="../../jquery/easyui/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="../../jquery/easyui/jquery.easyui.min.js"></script>
<script type="text/javascript" src="../../jquery/easyui/easyui-lang-zh_CN.js"></script>

<script type="text/javascript">
$(function(){

// 验证邮箱是否合法
function ismail(mail) {
	// 测试E-mail的正则表达式
	var reg = new RegExp(
			/^\w+((-\w+)|(\.\w+))*\@[A-Za-z0-9]+((\.|-)[A-Za -z0-9]+)*\. [A-Za-z0-9]+$/);
	return (reg.test(mail));
}

	$.ajax({
	type:"post",
	async:true,
	cache:false,
	url:"../../../group.do",
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
	 $.ajax({
	 type:"post",
	 async:true,
	 cache:false,
	 url:"../../../depart.do",
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

<body onload="loadD();">
	<form id="user_add" action="../../../user.do?opt=addUser" method="post" >
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
															<img src="../../images/tb.gif" width="14" height="14" />


															<span class="STYLE1"> 新员工信息录入</span>
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
							<td width="6%" height="25" bgcolor="d3eaef" class="STYLE10"></td>
							<td width="20%" height="25" bgcolor="d3eaef" class="STYLE6"><div
									align="center">
									<span class="STYLE10">字段名</span>
								</div>
							</td>
							<td width="54%" height="30" colspan="2" bgcolor="d3eaef"
								class="STYLE6"><div align="center">
									<span class="STYLE10">内容</span>
								</div>
							</td>
							<td width="30%" height="20" bgcolor="d3eaef"><div
									align="center"></div></td>
						</tr>
						<tr>
							<td height="20" bgcolor="#FFFFFF"><div align="center"></div>
							</td>

							<td width="20%" height="20" bgcolor="#FFFFFF" class="STYLE19"><div
									align="center">用&nbsp;户&nbsp;名：</div></td>
							<td bgcolor="#FFFFFF" class="STYLE19">
								<div align="center">
									<input class="easyui-validatebox" required="true"
										validType="length[2,10]" name="user_name" type="text"
										class="STYLE19" />
								</div>
							</td>
							<td height="20" bgcolor="#FFFFFF" class="STYLE19">

								<div align="left"></div>
							</td>
							<td height="20" bgcolor="#FFFFFF"></td>
						</tr>
						<tr>
							<td height="20" bgcolor="#FFFFFF"><div align="center"></div>
							</td>

							<td width="20%" height="20" bgcolor="#FFFFFF" class="STYLE19"><div
									align="center">性&nbsp;&nbsp;&nbsp;&nbsp;别：</div></td>
							<td bgcolor="#FFFFFF" class="STYLE19">
								<div align="center">
									<input name="user_sex" type="radio" value="男" checked="checked" />男&nbsp;&nbsp;&nbsp;&nbsp;
									<input name="user_sex" type="radio" value="女" />女
								</div>
							</td>
							<td height="20" bgcolor="#FFFFFF" class="STYLE19">

								<div align="left"></div>
							</td>
							<td height="20" bgcolor="#FFFFFF"></td>

						</tr>
						<tr>
							<td height="20" bgcolor="#FFFFFF"><div align="center"></div>
							</td>

							<td width="20%" height="20" bgcolor="#FFFFFF" class="STYLE19"><div
									align="center">初始密码：</div></td>
							<td bgcolor="#FFFFFF" class="STYLE19">
								<div align="center">
									<input class="easyui-validatebox" required="true"
										validType="length[6,15]" name="user_pwd" type="text"
										class="STYLE19" value="123456" />
								</div>
							</td>
							<td height="20" bgcolor="#FFFFFF" class="STYLE19">

								<div align="left"></div>
							</td>
							<td height="20" bgcolor="#FFFFFF"><div align="center"></div>
							</td>
						</tr>
						<tr>
							<td height="20" bgcolor="#FFFFFF"><div align="center"></div>
							</td>

							<td width="20%" height="20" bgcolor="#FFFFFF" class="STYLE19"><div
									align="center">联系方式：</div></td>
							<td bgcolor="#FFFFFF" class="STYLE19">
								<div align="center">
									<input class="easyui-validatebox" validType="phone" required="true"
										name="user_tel" type="text" class="STYLE19" />
								</div>
							</td>
							<td height="20" bgcolor="#FFFFFF" class="STYLE19">

								<div align="left"></div>
							</td>
							<td height="20" bgcolor="#FFFFFF"><div align="center"></div>
							</td>
						</tr>
						<tr>
							<td height="20" bgcolor="#FFFFFF"><div align="center"></div>
							</td>

							<td width="20%" height="20" bgcolor="#FFFFFF" class="STYLE19"><div
									align="center">邮&nbsp;&nbsp;&nbsp;&nbsp;箱：</div></td>
							<td bgcolor="#FFFFFF" class="STYLE19">
								<div align="center">
									<input class="easyui-validatebox" required="true"
										validType="email" name="user_email" type="text"
										class="STYLE19" invalidMessage="email格式错误" validType="email" />
								</div>
							</td>
							<td height="20" bgcolor="#FFFFFF" class="STYLE19">
								<div align="left"></div>
							</td>
							<td height="20" bgcolor="#FFFFFF"><div align="center"></div>
							</td>
						</tr>
							<tr>
							<td height="20" bgcolor="#FFFFFF"><div align="center"></div>
							</td>
							<td height="20" bgcolor="#FFFFFF" class="STYLE19"><div
									align="center">所属部门:</div>
							</td>
							<td height="20" bgcolor="#FFFFFF" class="STYLE19"><div
									align="center">
									<select name="depart_name" id="depart_name" class="STYLE19"
										style=" width: 155px">
										<option value="0">请选择部门</option>							  
									</select>
								</div>
							</td>
							<td height="20" bgcolor="#FFFFFF" class="STYLE19"><div
									align="center"></div>
							</td>
							<td height="20" bgcolor="#FFFFFF"><div align="center"></div>
							</td>
						</tr>
						<tr>
							<td height="20" bgcolor="#FFFFFF"><div align="center"></div>
							</td>
							<td height="20" bgcolor="#FFFFFF" class="STYLE19"><div
									align="center">所&nbsp;属&nbsp;组：</div></td>
							<td bgcolor="#FFFFFF" class="STYLE19">
								<div align="center">
									<select name="group_name" id="group_name" class="STYLE19"
										style=" width: 155px">
										<option value="0">请选择组</option>								  
									</select>
								</div>
							</td>
							<td height="20" bgcolor="#FFFFFF" class="STYLE19">

								<div align="left"></div>
							</td>
							<td height="20" bgcolor="#FFFFFF"><div align="center"></div>
							</td>
						</tr>
						
						<tr>
							<td height="20" bgcolor="#FFFFFF"><div align="center"></div>
							</td>
							<td height="20" bgcolor="#FFFFFF" class="STYLE19"><div
									align="center">任务数量：</div></td>
							<td bgcolor="#FFFFFF" class="STYLE19">
								<div align="center">
									<input class="easyui-numberbox" required="true"
										name="user_taskcount" type="text" class="STYLE19" value="0" />
								</div>
							</td>
							<td height="20" bgcolor="#FFFFFF" class="STYLE19">

								<div align="left"></div>
							</td>
							<td height="20" bgcolor="#FFFFFF"><div align="center"></div>
							</td>
						</tr>
						<tr>
							<td height="20" bgcolor="#FFFFFF"><div align="center"></div>
							</td>
							<td height="20" bgcolor="#FFFFFF" class="STYLE19"><div
									align="center"></div></td>
							<td bgcolor="#FFFFFF" class="STYLE19">
								<div align="center">
									<input name="submit" type="submit" value="提交" class="STYLE19" onclick="return submitOne()"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									<input name="reset" type="reset" value="重置" class="STYLE19" />
								</div>
							</td>
							<td height="20" bgcolor="#FFFFFF" class="STYLE19">

								<div align="left"></div>
							</td>
							<td height="20" bgcolor="#FFFFFF"><div align="center"></div>
							</td>
						</tr>
					</table></td>
			</tr>

		</table>
	</form>
</body>
</html>





