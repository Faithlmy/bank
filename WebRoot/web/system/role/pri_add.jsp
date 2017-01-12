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
<title>添加权限</title>
<link rel="stylesheet" type="text/css" href="../../css/web/table.css" />
<script type="text/javascript" src="../../js/line.js"></script>
<script type="text/javascript" src="../../js/info.js"></script>

<link rel="stylesheet" type="text/css" href="../../jquery/easyui/themes/default/easyui.css" />
<link rel="stylesheet" type="text/css" href="../../jquery/easyui/themes/icon.css" />
<script type="text/javascript" src="../../jquery/easyui/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="../../jquery/easyui/jquery.easyui.min.js"></script>
<script type="text/javascript" src="../../jquery/easyui/easyui-lang-zh_CN.js"></script>

</head>

<body>
	<form action="../../../privilege.do?opt=addPri" method="post">
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
															<img src="../../images/tb.gif" width="14" height="14" />

															<span class="STYLE1"> 添加权限</span>
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
								<td width="50%" height="30" bgcolor="d3eaef" class="STYLE6"><div
									align="center">
									<span class="STYLE10"></span>
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
									align="center">权限编号:</div>
							</td>
							<td height="20" bgcolor="#FFFFFF" class="STYLE19"><div
									align="center">
									<input class="easyui-validatebox" required="true"
										type="text" class="STYLE19" name="pri_id" />
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
									align="center">权限名称:</div>
							</td>
							<td height="20" bgcolor="#FFFFFF" class="STYLE19"><div
									align="center">
									<input class="easyui-validatebox" required="true"
										 type="text" class="STYLE19" name="pri_name" />
								</div>
							</td>
							<td height="20" bgcolor="#FFFFFF" class="STYLE19"><div
									align="center"></div>
							</td>
						</tr>
						
							<tr>
							<td height="20" bgcolor="#FFFFFF"><div align="center"></div>
							</td>

							<td width="20%" height="20" bgcolor="#FFFFFF" class="STYLE19"><div
									align="center">显示位置:</div></td>
							<td bgcolor="#FFFFFF" class="STYLE19">
								<div align="center">
									<input name="pri_address" type="radio" value="left" checked="checked" />左侧菜单栏显示
									<input name="pri_address" type="radio" value="right" />右侧页面显示
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
							<td height="20" bgcolor="#FFFFFF" class="STYLE19"><div
									align="center">权限链接:</div>
							</td>
							<td height="20" bgcolor="#FFFFFF" class="STYLE19"><div
									align="center">
									<input class="easyui-validatebox" required="true"
										 type="text" class="STYLE19" name="pri_url" />
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
									align="center">上级权限:</div>
							</td>
							<td height="20" bgcolor="#FFFFFF" class="STYLE19"><div
									align="center">
									<select name="parent_id" class="STYLE19"
										style=" width: 135px">
										<option value="QX000">请选择上级权限</option>
										<option value="QX100">系统管理</option>
										<option value="QX110">用户管理</option>
										<option value="QX120">部门管理</option>
										<option value="QX130">岗位管理</option>
										<option value="QX140">设备管理</option>
										<option value="QX150">角色管理</option>
										<option value="QX160">权限管理</option>
										<option value="QX200">巡检中心</option>
										<option value="QX210">巡检管理</option>
										<option value="QX220">维修管理</option>
										<option value="QX230">分组管理</option>
										<option value="QX240">记录管理</option>
										<option value="QX300">银行网点</option>
										<option value="QX310">网点管理</option>
										<option value="QX320">报修管理</option>
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
									align="center">跳转位置:</div>
							</td>
							<td height="20" bgcolor="#FFFFFF" class="STYLE19"><div
									align="center">
									<select name="pri_target" class="STYLE19"
										style=" width: 135px">
										<option value="main">主窗口</option>
										<option value="left">左侧窗口</option>
										<option value="right">右侧窗口</option>
										<option value="0">不跳转</option>
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
									align="center"></div>
							</td>
							<td height="20" bgcolor="#FFFFFF" class="STYLE19"><div
									align="center">
									<input name="submit" class="STYLE19" type="submit" value="添加" onclick="return submitOne()"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									<input name="reset" class="STYLE19" type="reset" value="重置" />
								</div>
							</td>
							<td height="20" bgcolor="#FFFFFF" class="STYLE19">
							<div align="center"></div></td>
						</tr>
					</table>
				</td>
			</tr>
		</table>
</form>
</body>
</html>
