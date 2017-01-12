<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html;charset=utf-8" />
<title>分配角色</title>

<link rel="stylesheet" type="text/css" href="../../css/web/table.css" />
<script type="text/javascript" src="../../js/line.js"></script>
<script type="text/javascript" src="../../js/info.js"></script>

<link rel="stylesheet" type="text/css" href="../../jquery/easyui/themes/default/easyui.css" />
<link rel="stylesheet" type="text/css" href="../../jquery/easyui/themes/icon.css" />
<script type="text/javascript" src="../../jquery/easyui/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="../../jquery/easyui/jquery.easyui.min.js"></script>
<script type="text/javascript" src="../../jquery/easyui/easyui-lang-zh_CN.js"></script>

<link rel="stylesheet" type="text/css" href="../../css/web/add.css"></link>
<link rel="stylesheet" href="../../css/web/dtree.css" type="text/css"></link>
<script type="text/javascript" src="../../js/mydtree.js"></script>

<script type="text/javascript">
	$(function(){
		$("#node").click(function(){
			document.getElementById("pri").value = d.getText();	
			document.getElementById("pri_id").value = d.getTextID();	
		});

//异步请求获取权限树
	$("#pri").focus(function(){
		if($("#pri").val()!=""){//如果文本框中的值不为
			$("#node").show();
		}else{
			$.ajax({
			type : "post",
			url : "../../../privilege.do?opt=tree",
			cache : false,
			dataType:"json",
			success : function(data) {		
				d = new dTree('d');
				d.config.check = true;
				d.add(0, -1, '系统');
		 		for(var i = 0;i<data.length-1;i++ ){		 		
		 			d.add(data[i].pri_id,data[i].parent_id,data[i].pri_name);
		 		}
		 		document.getElementById("node").innerHTML = d;
		 		$("#node").show();
			}
		});
		}
	});
	//单击确定  隐藏权限列表
	$("#certain").click(function() {
		$("#node").hide();
	});
		});
</script>
</head>

<body>
<form action="../../../role.do?opt=addRole" method="post">
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
																		<span class="STYLE1"> <img
																			src="../../images/tb.gif" height="14" width="14" />
																			添加角色</span>
																	</div></td>
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
								<td class="STYLE10" bgcolor="d3eaef" height="25" width="6%"><div
										align="center"></div></td>
								<td class="STYLE6" bgcolor="d3eaef" height="25" width="11%"><div
										align="center">
										<span class="STYLE10">字段名</span>
									</div></td>
								<td height="25" bgcolor="d3eaef" class="STYLE6"><div
										align="center">
										<span class="STYLE10">功能模块</span>
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
										align="center">角色编号：</div></td>
								<td height="25" bgcolor="#FFFFFF" class="STYLE19"><div
										align="center">
									<input type="text" class="easyui-validatebox"  required="true" class="STYLE19" 
										name="role_id" id="role_id"/></div>
								</td>
								<td class="STYLE19" bgcolor="#FFFFFF" height="25"><div
										align="center"></div></td>
							</tr>
							<tr>
								<td bgcolor="#FFFFFF" height="25"><div align="center">

									</div></td>
								<td class="STYLE19" bgcolor="#FFFFFF" height="25"><div
										align="center">角色名称：</div></td>
								<td height="25" bgcolor="#FFFFFF" class="STYLE19"><div
										align="center">
									<input type="text" class="easyui-validatebox"  required="true" class="STYLE19" name ="role_type" id="role_type" /></div>
								</td>
								<td class="STYLE19" bgcolor="#FFFFFF" height="25"><div
										align="center"></div></td>
							</tr>
							<tr>
								<td bgcolor="#FFFFFF" height="25"><div align="center">

									</div></td>
								<td class="STYLE19" bgcolor="#FFFFFF" height="25"><div
										align="center">角色描述：</div></td>
								<td height="25" bgcolor="#FFFFFF" class="STYLE19"><div
										align="center">
			
									<input type="text" class="easyui-validatebox"  required="true" class="STYLE19"
									name="role_describe" id="role_describe"/></div>
								</td>
								<td class="STYLE19" bgcolor="#FFFFFF" height="25"><div
										align="center"></div></td>
							</tr>
							<tr>
							<td bgcolor="#FFFFFF" height="25"><div align="center">
									</div></td>
								<td height="120" bgcolor="#FFFFFF" class="STYLE19"><div
										align="center" scope="row">拥有权限：</div></td>
								<td height="60" bgcolor="#FFFFFF" class="STYLE21" ><div align="center">									
									<textarea cols="60"  rows="8" align="center" name="p_name" id="pri" class="STYLE21" readonly></textarea></div>
									<input name="pri_id" readonly="readonly" type="hidden" id="pri_id">	
									<span id="node" style="display:none"></span>
								</td>
								<td class="STYLE19" bgcolor="#FFFFFF" height="25"><div
										align="center"><input type="button" class="STYLE19" value="确定" id="certain"> </div></td>
							</tr>

							<tr>
								<td class="STYLE19" bgcolor="#FFFFFF" height="25"><div
										align="center"></div>
								</td>
								<td class="STYLE19" bgcolor="#FFFFFF" height="25"><div
										align="center"></div>
								</td>
								<td height="25" bgcolor="#FFFFFF" class="STYLE19"><div
										align="center">
										
										<input name="submit" type="submit" class="STYLE19" value="提交" onclick="return submitOne();"/>
										&nbsp;&nbsp;&nbsp;&nbsp; <input name="reset" type="reset"
											class="STYLE19" value="重置" />
									</div>
									<div align="center"></div>
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
