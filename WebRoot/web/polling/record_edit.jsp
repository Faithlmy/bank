<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html;charset=utf-8" ></meta>
<title>编辑信息</title>
<link rel="stylesheet" type="text/css" href="web/css/web/table.css"></link>
<script type="text/javascript" src="web/js/line.js"></script>
<script type="text/javascript" src="web/js/info.js"></script>

<link rel="stylesheet" type="text/css" href="web/jquery/easyui/themes/default/easyui.css"></link>
<link rel="stylesheet" type="text/css" href="web/jquery/easyui/themes/icon.css" ></link>
<script type="text/javascript" src="web/jquery/easyui/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="web/jquery/easyui/jquery.easyui.min.js"></script>
<script type="text/javascript" src="web/jquery/easyui/easyui-lang-zh_CN.js"></script>
<script type="text/javascript">
	
	$(function() {
		$("#user_id").bind("blur", function() {
			var user_id = $("#user_id").val();
			$.ajax({
				type : "POST",//get
				async : true,
				//dataType:"json",
				cache : false,
				url : "user.do",
				data : "opt=showAsync&user_id=" + user_id + " ",
				success : function(message) {
					eval("msg=" + message);
					$("#user_name").val(msg.user_name);
					$("#user_tel").val(msg.user_tel);
				}
			});
		});
		$("#device_id").bind("blur", function() {
			var device_id = $("#device_id").val();
			$.ajax({
				type : "POST",//get
				async : true,
				//dataType:"json",
				cache : false,
				url : "device.do",
				data : "opt=showAsync&device_id=" + device_id + " ",
				success : function(message) {
					eval("msg=" + message);
					$("#device_name").val(msg.device_name);
					
				}
			});
		});
	});
</script>	
</head>
<body>
	<form action="record.do?opt=updRecord" method="post">
	<input type="hidden" name="record_id" value="${recordinfo.get(0).get(0)}" />
	<input type="hidden" name="record_type" value="${recordinfo.get(0).get(6)}" />
	<input type="hidden" name="record_confrim" value="${recordinfo.get(0).get(9)}" />
	
		<table width="100%" border="0" align="center" cellpadding="0"
			cellspacing="0" bordercolor="#000000">
			<tr>
				<td height="30">
					<table width="100%" border="0" cellspacing="0" cellpadding="0">
						<tr>
							<td height="24" bgcolor="#353c44">
								<table width="100%" border="0" cellspacing="0" cellpadding="0">
									<tr>
										<td><table width="100%" border="0" cellspacing="0"
												cellpadding="0">
												<tr>
													<td width="6%" height="19" valign="bottom"><div
															align="left">
															<img src="web/images/tb.gif" width="14" height="14" ></img> <span
																class="STYLE1"> 编辑记录信息</span>
														</div></td>
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
							<td width="20%" height="25" bgcolor="d3eaef" class="STYLE6"><div
									align="center">
									<span class="STYLE10"></span>
								</div></td>

						</tr>
						<tr>
							<td height="20" bgcolor="#FFFFFF"><div align="center"></div>
							</td>
							<td height="20" bgcolor="#FFFFFF" class="STYLE19"><div
									align="center">记录编号:</div></td>
							<td height="20" bgcolor="#FFFFFF" class="STYLE19"><div
									align="center">
									<div align="center">
										${recordinfo.get(0).get(0)}
									</div>
								</div></td>
							<td height="20" bgcolor="#FFFFFF" class="STYLE19"><div
									align="center"></div></td>
						</tr>
						<tr>
							<td height="20" bgcolor="#FFFFFF"><div align="center"></div>
							</td>
							<td height="20" bgcolor="#FFFFFF" class="STYLE19"><div
									align="center">记录类型:</div>
							</td>
							<td height="20" bgcolor="#FFFFFF" class="STYLE19"><div
									align="center">
									${recordinfo.get(0).get(6)}
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
									align="center">用户编号:</div></td>
							<td height="20" bgcolor="#FFFFFF" class="STYLE19"><div
									align="center">
									<div align="center">
										<input class="easyui-validatebox" required="true" type="text" class="STYLE19" id="user_id" name="user_id"
											value="${recordinfo.get(0).get(1)}"></input>
									</div>
								</div></td>
							<td height="20" bgcolor="#FFFFFF" class="STYLE19"><div
									align="center"></div></td>
						</tr>

						<tr>
							<td height="20" bgcolor="#FFFFFF"><div align="center"></div>
							</td>
							<td height="20" bgcolor="#FFFFFF" class="STYLE19"><div
									align="center">记&nbsp;录&nbsp;人:</div>
							</td>
							<td height="20" bgcolor="#FFFFFF" class="STYLE19"><div
									align="center">
									<div align="center">
										<input readonly="readonly" class="easyui-validatebox" required="true"
										validType="length[3,10]" id="user_name" name="user_name" type="text" class="STYLE19"
											value="${recordinfo.get(0).get(2)}" ></input>
									</div>
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
									<input readonly="readonly" class="easyui-numberbox" required="true" id="user_tel" name="user_tel" type="text" class="STYLE19"
										value="${recordinfo.get(0).get(3)}" ></input>
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
									align="center">设备编号:</div></td>
							<td height="20" bgcolor="#FFFFFF" class="STYLE19"><div
									align="center">
									<input  class="easyui-validatebox" required="true" type="text" class="STYLE19" id="device_id" name="device_id"
										value="${recordinfo.get(0).get(4)} "></input>
								</div></td>
							<td height="20" bgcolor="#FFFFFF" class="STYLE19"><div
									align="center"></div>
							</td>
						</tr>
						<tr>
							<td height="20" bgcolor="#FFFFFF"><div align="center"></div>
							</td>
							<td height="20" bgcolor="#FFFFFF" class="STYLE19"><div
									align="center">相关设备:</div>
							</td>
							<td height="20" bgcolor="#FFFFFF" class="STYLE19"><div
									align="center">
									<input readonly="readonly" class="easyui-validatebox" required="true" id="device_name" name="device_name" type="text" class="STYLE19"
										value="${recordinfo.get(0).get(5)}"></input>
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
									align="center">记录时间:</div>
							</td>
							<td height="20" bgcolor="#FFFFFF" class="STYLE19"><div
									align="center">
									<input class="easyui-datetimebox" name="record_time"  value="${recordinfo.get(0).get(7)}" style="width: 155px"></input>					
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
									align="center">记录状态:</div>
							</td>
							<td height="20" bgcolor="#FFFFFF" class="STYLE19"><div
									align="center">
									<input class="easyui-validatebox" required="true" name="record_state" class="STYLE19" type="text"
										value="${recordinfo.get(0).get(8)} " ></input>
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
									align="center">确认信息:</div>
							</td>
							<td height="20" bgcolor="#FFFFFF" class="STYLE19"><div
									align="center">
									${recordinfo.get(0).get(9)}
								</div>
							</td>
							<td height="20" bgcolor="#FFFFFF" class="STYLE19"><div
									align="center"></div>
							</td>
						</tr>

						<tr>
							<td height="100" bgcolor="#FFFFFF"><div align="center"></div>
							</td>
							<td height="100" bgcolor="#FFFFFF" class="STYLE19"><div
									align="center">记录细则:</div>
							</td>
							<td height="100" bgcolor="#FFFFFF" class="STYLE19"><div
									align="center">
									<textarea  name="record_details" class="STYLE19" rows="5"
										cols="30">${recordinfo.get(0).get(10)}</textarea>
								</div></td>
							<td height="100" bgcolor="#FFFFFF" class="STYLE19"><div
									align="center"></div>
							</td>
						</tr>
						<tr>
							<td height="20" bgcolor="#FFFFFF"><div align="center"></div>
							</td>
							<td height="20" bgcolor="#FFFFFF" class="STYLE19"><div
									align="center"></div>
							</td>
							<td height="20" bgcolor="#FFFFFF" class="STYLE19"><div
									align="center">
									<input name="submit" type="submit" class="STYLE19" value="提交" onclick="return submitOne()"></input>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									<input name="reset" type="reset" class="STYLE19" value="重置" ></input>

								</div>
							</td>
							<td height="20" bgcolor="#FFFFFF" class="STYLE19">&nbsp;
								<div align="center"></div></td>
						</tr>
						</table>
				</td>
			</tr>

		</table>
	</form>

</body>
</html>