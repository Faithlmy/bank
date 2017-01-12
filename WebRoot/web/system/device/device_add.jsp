<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>设备信息的录入</title>
<link rel="stylesheet" type="text/css" href="../../css/web/table.css" />
<script type="text/javascript" src="../../js/line.js"></script>
<script type="text/javascript" src="../../js/info.js"></script>

<link rel="stylesheet" type="text/css"
	href="../../jquery/easyui/themes/default/easyui.css" />
<link rel="stylesheet" type="text/css"
	href="../../jquery/easyui/themes/icon.css" />
<script type="text/javascript"
	src="../../jquery/easyui/jquery-1.7.2.min.js"></script>
<script type="text/javascript"
	src="../../jquery/easyui/jquery.easyui.min.js"></script>
<script type="text/javascript"
	src="../../jquery/easyui/easyui-lang-zh_CN.js"></script>

<script type="text/javascript">
	$(function(){
  $("#site_id").bind("blur",function(){
var site_id = $("#site_id").val();
$.ajax({

   type: "POST",//get
   async: true,
   //dataType:"json",
   cache: false,
   url: "../../../site.do", 
   data: "opt=showAsync&site_id="+site_id+" ",
   success:function(message){
   eval("msg="+message);
   $("#site_name").val(msg.site_name);
   }
});
});
});
	</script>	
</head>
<body>
	<form action="../../../device.do?opt=addDevice" method="post">
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


															<span class="STYLE1"> 设备信息录入</span>
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
							<td width="25%" height="25" bgcolor="d3eaef" class="STYLE6"><div
									align="center">
									<span class="STYLE10">字段名</span>
								</div>
							</td>
							<td width="44%" height="30" colspan="2" bgcolor="d3eaef" class="STYLE6"><div
									align="center">
									<span class="STYLE10">内容</span>
								</div>
							</td>
							<td width="35%" height="25" bgcolor="d3eaef" class="STYLE10"></td>
						</tr>
						<tr>
							<td height="20" bgcolor="#FFFFFF"><div align="center"></div>
							</td>
							<td  height="20" bgcolor="#FFFFFF" class="STYLE19"><div
									align="center">设备编号：</div></td>
							<td bgcolor="#FFFFFF" class="STYLE19">
								<div align="center">
									<input class="easyui-validatebox" required="true"
										 name="device_id" type="text" class="STYLE19" />
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

							<td  height="20" bgcolor="#FFFFFF" class="STYLE19"><div
									align="center">设&nbsp;备&nbsp;名：</div></td>
							<td bgcolor="#FFFFFF" class="STYLE19">
								<div align="center">
									<input class="easyui-validatebox" required="true"
										 name="device_name" type="text" class="STYLE19" />
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
							<td  height="20" bgcolor="#FFFFFF" class="STYLE19"><div
									align="center">设备状态：</div></td>
							<td bgcolor="#FFFFFF" class="STYLE19">
								<div align="center">
									<input name="device_state" type="radio" value="正常"
										checked="checked" /><img src="../../images/ok.png">正常&nbsp;&nbsp;&nbsp;&nbsp;
									<input name="device_state" type="radio" value="异常" /><img
										src="../../images/no.png">异常
								</div>
							</td>
							<td height="20" bgcolor="#FFFFFF"><div align="center"></div>
							</td>
							<td height="20" bgcolor="#FFFFFF"><div align="center"></div>
							</td>
						</tr>

						<tr>
							<td height="20" bgcolor="#FFFFFF"><div align="center"></div>
							</td>

							<td  height="20" bgcolor="#FFFFFF" class="STYLE19"><div
									align="center">网点编号：</div></td>
							<td bgcolor="#FFFFFF" class="STYLE19">
								<div align="center">
									<input class="easyui-validatebox" required="true" name="site_id" type="text" class="STYLE19" id="site_id"/>
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

							<td  height="20" bgcolor="#FFFFFF" class="STYLE19"><div
									align="center">网点名称：</div></td>
							<td bgcolor="#FFFFFF" class="STYLE19">
								<div align="center">
									<input class="easyui-validatebox" required="true" name="site_name" type="text" class="STYLE19" id="site_name"/>
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

							<td  height="20" bgcolor="#FFFFFF" class="STYLE19"><div
									align="center">任务状态：</div></td>
							<td bgcolor="#FFFFFF" class="STYLE19">
								<div align="center">
									<input class="easyui-validatebox" required="true" name="task_state" type="text" class="STYLE19" value="无"/>
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
							<td height="20" bgcolor="#FFFFFF"><div align="center"></div>
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
