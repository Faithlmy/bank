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
<title>修改员工信息</title>
<link rel="stylesheet" type="text/css" href="web/css/web/table.css" />
<script type="text/javascript" src="web/js/line.js"></script>
<script type="text/javascript" src="web/js/info.js"></script>

<link rel="stylesheet" type="text/css" href="web/jquery/easyui/themes/default/easyui.css" />
<link rel="stylesheet" type="text/css" href="web/jquery/easyui/themes/icon.css" />
<script type="text/javascript" src="web/jquery/easyui/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="web/jquery/easyui/jquery.easyui.min.js"></script>
<script type="text/javascript" src="web/jquery/easyui/easyui-lang-zh_CN.js"></script>
<script type="text/javascript">
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
for(var i=0;i<departs.length;i++){
	 contents +="<option value='"+departs[i].depart_name+"'>"+departs[i].depart_name+"</option>";
	 }
	 $("#user_depart").append(contents);
	 }
	 });
});
</script>
</head>

<body>
	<form action="user.do?opt=updUser" method="post">
	<input type="hidden" name="user_id" value="${userinfo.get(0).get(0)}" />
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
																class="STYLE1"> 修改员工信息</span>
														</div>
													</td>
												</tr>
											</table>
										</td>
										<td><div align="right">
												<span class="STYLE1">&nbsp;</span><span class="STYLE1">
													&nbsp;</span>
											</div>
										</td>
									</tr>
								</table>
							</td>
						</tr>
					</table>
				</td>
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
								</div></td>
							<td width="50%" height="30"  bgcolor="d3eaef" class="STYLE6"><div
									align="center">
									<span class="STYLE10">内容</span>
								</div></td>
							<td width="24%" height="25" bgcolor="d3eaef" class="STYLE10"></td>
						</tr>

						<tr>
							<td height="20" bgcolor="#FFFFFF"><div align="center"></div>
							</td>

							<td width="20%" height="20" bgcolor="#FFFFFF" class="STYLE19"><div
									align="center">用户编号：</div>
							</td>
							<td bgcolor="#FFFFFF" class="STYLE19">
								<div align="center">
									${userinfo.get(0).get(0)}
								</div></td>
							<td height="20" bgcolor="#FFFFFF" class="STYLE19">

								<div align="left"></div></td>
						</tr>
						<tr>
							<td height="20" bgcolor="#FFFFFF"><div align="center"></div>
							</td>

							<td width="20%" height="20" bgcolor="#FFFFFF" class="STYLE19"><div
									align="center">用&nbsp;户&nbsp;名：</div>
							</td>
							<td bgcolor="#FFFFFF" class="STYLE19">
								<div align="center">
									<input class="easyui-validatebox" required="true" validType="length[2,10]" name="user_name" type="text" class="STYLE19"
										value="${userinfo.get(0).get(1)}" />
								</div></td>
							<td height="20" bgcolor="#FFFFFF" class="STYLE19">

								<div align="left"></div></td>
						</tr>
						<tr>
							<td height="20" bgcolor="#FFFFFF"><div align="center"></div>
							</td>

							<td width="20%" height="20" bgcolor="#FFFFFF" class="STYLE19"><div
									align="center">性&nbsp;&nbsp;&nbsp;&nbsp;别：</div>
							</td>
							<td bgcolor="#FFFFFF" class="STYLE19">
								<div align="center">
								
									<input type="radio" name="user_sex" value="男"<c:if test="${userinfo.get(0).get(2) eq'男'}">checked="checked"</c:if> />
 
									男<input type="radio" name="user_sex" value="女"
										<c:if test="${userinfo.get(0).get(2) eq'女'}">checked="checked"</c:if> />女
								</div></td>
							<td height="20" bgcolor="#FFFFFF" class="STYLE19"></td>
						</tr>
						<tr>
							<td height="20" bgcolor="#FFFFFF"><div align="center"></div>
							</td>

							<td width="20%" height="20" bgcolor="#FFFFFF" class="STYLE19"><div
									align="center">联系方式：</div>
							</td>
							<td bgcolor="#FFFFFF" class="STYLE19">
								<div align="center">
									<input class="easyui-validatebox" required="true" name="user_tel" type="text" class="STYLE19"
										value="${userinfo.get(0).get(3)}" />
								</div></td>
							<td height="20" bgcolor="#FFFFFF" class="STYLE19">

								<div align="left"></div></td>
						</tr>
						<tr>
							<td height="20" bgcolor="#FFFFFF"><div align="center"></div>
							</td>

							<td width="20%" height="20" bgcolor="#FFFFFF" class="STYLE19"><div
									align="center">邮&nbsp;&nbsp;&nbsp;&nbsp;箱：</div>
							</td>
							<td bgcolor="#FFFFFF" class="STYLE19">
								<div align="center">
									<input  class="easyui-validatebox" required="true" validType="email" name="user_email" type="text" class="STYLE19"
										value="${userinfo.get(0).get(4)}"/>
								</div></td>
							<td height="20" bgcolor="#FFFFFF" class="STYLE19">

								<div align="left"></div></td>
						</tr>
						<tr>
							<td height="20" bgcolor="#FFFFFF"><div align="center"></div>
							</td>
							<td height="20" bgcolor="#FFFFFF" class="STYLE19"><div
									align="center">所属部门：</div>
							</td>
							<td bgcolor="#FFFFFF" class="STYLE19">
								<div align="center">
									<select class="STYLE19" name="user_depart" id="user_depart" style="width: 155px">
											
									</select>
								</div></td>
							<td height="20" bgcolor="#FFFFFF" class="STYLE19">

								<div align="left"></div></td>
						</tr>
						
						<tr>
							<td height="20" bgcolor="#FFFFFF"><div align="center"></div>
							</td>
							<td height="20" bgcolor="#FFFFFF" class="STYLE19"><div
									align="center"></div>
							</td>
							<td bgcolor="#FFFFFF" class="STYLE19">
								<div align="center">

									<input name="submit" type="submit" value="提交" class="STYLE19" onclick="return submitOne()" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									<input name="reset" type="reset" class="STYLE19" value="重置" />

								</div></td>
							<td height="20" bgcolor="#FFFFFF" class="STYLE19">

								<div align="left"></div></td>
						</tr>
					</table>
				</td>
			</tr>

		</table>
	</form>
</body>
</html>




