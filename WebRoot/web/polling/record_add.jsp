<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http：//www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http：//www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>添加报修记录信息</title>
<link rel="stylesheet" type="text/css" href="../css/web/table.css" />
<script type="text/javascript" src="../js/line.js"></script>
<script type="text/javascript" src="../js/info.js"></script>
<script type="text/javascript" src="../js/record.js"></script>

<link rel="stylesheet" type="text/css"
	href="../jquery/easyui/themes/default/easyui.css" />
<link rel="stylesheet" type="text/css"
	href="../jquery/easyui/themes/icon.css" />
<script type="text/javascript"
	src="../jquery/easyui/jquery-1.7.2.min.js"></script>
<script type="text/javascript"
	src="../jquery/easyui/jquery.easyui.min.js"></script>
<script type="text/javascript"
	src="../jquery/easyui/easyui-lang-zh_CN.js"></script>

<script type="text/javascript">
	$(function() {
		$("#user_id").bind("blur", function() {
			var user_id = $("#user_id").val();
			$.ajax({
				type : "POST",//get
				async : true,
				//dataType:"json",
				cache : false,
				url : "../../user.do",
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
				url : "../../device.do",
				data : "opt=showAsync&device_id=" + device_id + " ",
				success : function(message) {
					eval("msg=" + message);
					$("#device_name").val(msg.device_name);
					$("#site_name").val(msg.site_name);
				}
			});
		});

	});
</script>
</head>
<body>
	<form action="../../record.do?opt=addRecord" method="post">
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
																class="STYLE1"> 添加记录信息</span>
														</div></td>
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
									align="center">用户编号：</div>
							</td>
							<td height="20" bgcolor="#FFFFFF" class="STYLE19"><div
									align="center">
									<div align="center">
										<input class="easyui-validatebox" required="true" type="text"
											class="STYLE19" name="user_id" id="user_id" />
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
									align="center">记&nbsp;录&nbsp;人：</div>
							</td>
							<td height="20" bgcolor="#FFFFFF" class="STYLE19"><div
									align="center">
									<div align="center">
										<input class="easyui-validatebox" required="true"
											validType="length[2,10]" type="text" class="STYLE19"
											name="record_user" id="user_name" readonly="readonly"/>
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
									align="center">联系方式：</div>
							</td>
							<td height="20" bgcolor="#FFFFFF" class="STYLE19"><div
									align="center">
									<input class="easyui-validatebox" required="true" type="text"
										class="STYLE19" name="record_tel" id="user_tel" readonly="readonly" />
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
									align="center">记录类型：</div>
							</td>
							<td height="20" bgcolor="#FFFFFF" class="STYLE19"><div
									align="center">
									<select name="record_type" class="STYLE19"
										style=" width： 155px">
										<option>--</option>
										<option>报修申请</option>
										<option>巡检记录</option>
										<option>维修记录</option>
									</select>
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
									align="center">设备编号：</div>
							</td>
							<td height="20" bgcolor="#FFFFFF" class="STYLE19"><div
									align="center">
									<input class="easyui-validatebox" required="true" type="text"
										class="STYLE19" name="device_id" id="device_id" />
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
									align="center">设备名称：</div>
							</td>
							<td height="20" bgcolor="#FFFFFF" class="STYLE19"><div
									align="center">
									<input class="easyui-validatebox" required="true" type="text"
										class="STYLE19" name="record_device" id="device_name" readonly="readonly" />
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
									align="center">相关单位：</div>
							</td>
							<td height="20" bgcolor="#FFFFFF" class="STYLE19"><div
									align="center">
									<input class="easyui-validatebox" required="true" type="text"
										class="STYLE19" name="record_site" id="site_name" readonly="readonly" />
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
									align="center">记录时间：</div>
							</td>
							<td height="20" bgcolor="#FFFFFF" class="STYLE19"><div
									align="center">
									<input class="easyui-datetimebox" name="record_time"
										style="width: 155px" ></input>
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
									align="center">记录状态：</div>
							</td>
							<td height="20" bgcolor="#FFFFFF" class="STYLE19"><div
									align="center">
									<input class="easyui-validatebox" required="true" type="text"
										class="STYLE19" name="record_state" />
								</div>
							</td>
							<td height="20" bgcolor="#FFFFFF" class="STYLE19"><div
									align="center"></div>
							</td>
						</tr>
						<tr>
							<td height="98" bgcolor="#FFFFFF"><div align="center"></div>
							</td>
							<td height="98" bgcolor="#FFFFFF" class="STYLE19"><div
									align="center">记录细则：</div>
							</td>
							<td height="98" bgcolor="#FFFFFF" class="STYLE19"><div
									align="center">
									<textarea name="record_details" class="STYLE19" rows="5"
										cols="30"></textarea>
								</div></td>
							<td height="20" bgcolor="#FFFFFF" class="STYLE19"><div
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

									<input name="submit" class="STYLE19" type="submit" value="提交"
										onclick="return submitOne()" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									<input name="reset" class="STYLE19" type="reset" value="重置" />

								</div>
							</td>
							<td height="20" bgcolor="#FFFFFF" class="STYLE19"><br />
							</td>
						</tr>
					</table>
				</td>
			</tr>
		</table>
	</form>
</body>
</html>
