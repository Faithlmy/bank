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
<title>添加网点信息</title>

<link rel="stylesheet" type="text/css"  href="../css/web/table.css" />
<script type="text/javascript" src="../js/line.js"></script>
<script type="text/javascript" src="../js/info.js"></script>

<link rel="stylesheet" type="text/css" href="../jquery/easyui/themes/default/easyui.css" />
<link rel="stylesheet" type="text/css" href="../jquery/easyui/themes/icon.css" />
<script type="text/javascript" src="../jquery/easyui/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="../jquery/easyui/jquery.easyui.min.js"></script>
<script type="text/javascript" src="../jquery/easyui/easyui-lang-zh_CN.js"></script>

<script type="text/javascript">
$(function(){
$("#user_id").bind("blur",function(){
   var user_id = $("#user_id").val(); 
   $.ajax({
   type: "POST",//get
   async: true,
   //dataType:"json",
   cache: false,
   url: "../../user.do", 
   data: "opt=showAsync&user_id="+user_id+" ",
   success:function(message){
   eval("msg="+message);
   $("#user_name").val(msg.user_name);
   }
   });
});
});
</script>

</head>

<body>
<form action="../../site.do?opt=addSite" method="post">
	<table width="100%" border="0" align="center" cellpadding="0"
		cellspacing="0" bordercolor="#000000">
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
												<td width="6%" height="19" valign="bottom"><div
														align="left">
														<img src="../images/tb.gif" width="14" height="14" /> <span
															class="STYLE1"> 添加网点信息</span>
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
			<td><table width="100%" border="0" cellpadding="0"
					cellspacing="1" bgcolor="#a8c7ce" onmouseover="changeto()"
					onmouseout="changeback()">
					<tr>
						<td width="6%" height="25" bgcolor="d3eaef" class="STYLE10"></td>
						<td width="20%" height="25" bgcolor="d3eaef" class="STYLE6"><div
								align="center">
								<span class="STYLE10">字段名</span>
							</div></td>
						<td width="50%" height="30" bgcolor="d3eaef" class="STYLE6"><div
								align="center">
								<span class="STYLE10">内容</span>
							</div></td>
						<td width="20%" height="30" bgcolor="d3eaef" class="STYLE6"><div
								align="center">
								<span class="STYLE10"></span>
							</div></td>
					</tr>
										<tr>
						<td height="20" bgcolor="#FFFFFF"><div align="center"></div>
						</td>
						<td height="20" bgcolor="#FFFFFF" class="STYLE19"><div
								align="center">网点编号:</div>
						</td>
						<td height="20" bgcolor="#FFFFFF" class="STYLE19"><div
								align="center">
								<input class="easyui-validatebox" required="true"
										validType="length[5,6]" type="text" class="STYLE19" name="site_id" />
							</div>
						</td>
						<td height="20" bgcolor="#FFFFFF" class="STYLE19"><div
								align="center"></div>
						</td>
					</tr>
					
					<tr>
						<td height="20" bgcolor="#FFFFFF"><div align="center"></div>
						</td>
						<td height="20" bgcolor="#FFFFFF" class="STYLE19"><div
								align="center">网点名称:</div>
						</td>
						<td height="20" bgcolor="#FFFFFF" class="STYLE19"><div
								align="center">
								<input class="easyui-validatebox" required="true" type="text" class="STYLE19" name="site_name" />
							</div>
						</td>
						<td height="20" bgcolor="#FFFFFF" class="STYLE19"><div
								align="center"></div>
						</td>
					</tr>
					<tr>
						<td height="20" bgcolor="#FFFFFF"><div align="center"></div>
						</td>
						<td height="20" bgcolor="#FFFFFF" class="STYLE19"><div
								align="center">网点位置:</div>
						</td>
						<td height="20" bgcolor="#FFFFFF" class="STYLE19"><div
								align="center">
								<input class="easyui-validatebox" required="true" type="text" class="STYLE19" name="site_address" />
							</div>
						</td>
						<td height="20" bgcolor="#FFFFFF" class="STYLE19"><div
								align="center"></div>
						</td>
					</tr>
					<tr>
						<td height="20" bgcolor="#FFFFFF"><div align="center"></div>
						</td>
						<td height="20" bgcolor="#FFFFFF" class="STYLE19"><div
								align="center">联系方式:</div>
						</td>
						<td height="20" bgcolor="#FFFFFF" class="STYLE19"><div
								align="center">
								<input class="easyui-validatebox" required="true" type="text" class="STYLE19" name="site_tel" />
							</div>
						</td>
						<td height="20" bgcolor="#FFFFFF" class="STYLE19"><div
								align="center"></div>
						</td>
					</tr>
					<tr>
						<td height="20" bgcolor="#FFFFFF"><div align="center"></div>
						</td>
						<td height="20" bgcolor="#FFFFFF" class="STYLE19"><div
								align="center">IP地址:</div>
						</td>
						<td height="20" bgcolor="#FFFFFF" class="STYLE19"><div
								align="center">
								<input class="easyui-validatebox" required="true" type="text" class="STYLE19" name="site_ip" />
							</div>
						</td>
						<td height="20" bgcolor="#FFFFFF" class="STYLE19"><div
								align="center"></div>
						</td>
					</tr>
					
					<tr>
						<td height="20" bgcolor="#FFFFFF"><div align="center"></div>
						</td>
						<td height="20" bgcolor="#FFFFFF" class="STYLE19">&nbsp;<div
								align="center"></div>
						</td>
						<td height="20" bgcolor="#FFFFFF" class="STYLE19"><div
								align="center">
								
									<input name="submit" type="submit" class="STYLE19" value="提交" onclick="return submitOne()"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									<input name="reset" type="reset" class="STYLE19" value="重置" />

							</div>
						</td>
						<td height="20" bgcolor="#FFFFFF" class="STYLE19">
						<br /></td>
					</tr>
				</table>
			</td>
		</tr>
	</table>
	</form>
</body>
</html>