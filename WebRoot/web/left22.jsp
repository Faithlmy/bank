<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page import="com.zrgk.bankpolling.bean.PrivilegeInfo"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<link rel="stylesheet" type="text/css" href="web/css/web/left.css" />

<script type="text/javascript" src="web/js/jframe.js"></script>


</head>

<body>
<% String user_id = (String) session.getAttribute("user_id"); 
System.out.print(user_id+"hhhhhhh");%>
	<%-- <% List<PrivilegeInfo> list =(List<PrivilegeInfo>)session.getAttribute("pri");%> --%>
	<% List<PrivilegeInfo> list =(List<PrivilegeInfo>)request.getAttribute("pri");
		int i = 0;
	%>
	<table border="0" cellpadding="0" cellspacing="0" height="100%"
		width="147" align="left">
		<tbody>
			<% for(PrivilegeInfo p : list){
			if(p.getParent_id().equals("0")&& p.getPri_address().equals("left")){
			i++;
			%>
			<tr>
				<td height="23" background="web/images/main_34.gif">
					<table border="0" cellpadding="0" cellspacing="0" width="100%">
						<tbody>
							<tr>
								<td width="10%">&nbsp;</td>
								<td width="80%" id="imgmenu<%=i%>" class="menu_title"
									onMouseOver="this.className='menu_title2';"
									onClick="showsubmenu(<%=i%>)"
									onMouseOut="this.className='menu_title';" style="cursor:hand"><div
										class="STYLE5" align="center">
										<a href="javascript:void(0)"><%=p.getPri_name() %></a>
									</div></td>
								<td width="10%">&nbsp;</td>
							</tr>
						</tbody>
					</table></td>
			</tr>
			<tr>
				<td valign="top" id="submenu<%=i%>"  style="DISPLAY: none"><div class="sec_menu">
						<div align="center">
							<table border="0" cellpadding="0" cellspacing="0" width="70%"
								align="center">
								<tbody>
									<%for(PrivilegeInfo p1 : list){
					if(p1.getParent_id().equals(p.getPri_id())&&p1.getPri_address().equals("left")){
				 	 %>
									<tr>
										<td height="38">
											<table border="0" cellpadding="0" cellspacing="0"
												width="100%">
												<tbody>
													<tr>
														<td height="28" width="33"><img
															src="web/images/main_48.gif" height="28" width="28">
														</td>
														<td width="99">
															<table border="0" cellpadding="0" cellspacing="0"
																width="100%">
																<tbody>
																	<tr>
																		<td class="STYLE4" style="cursor:hand"
																			onmouseover="this.style.borderStyle='solid';this.style.borderWidth='1';borderColor='#7bc4d3'; "
																			onmouseout="this.style.borderStyle='none'"
																			height="23"><a href="<%=p1.getPri_url() %>"
																				target="<%=p1.getPri_target() %>"><%=p1.getPri_name() %></a>
																		</td>
																	</tr>
																</tbody>
															</table>
														</td>
													</tr>
												</tbody>
											</table>
										</td>
									</tr>
								 <%}
					} %>
								</tbody>
							</table>
						</div>
				</td>
			</tr>
			<%}} %>
			<tr>
				<td height="19" background="left_data/main_69.gif"><table
						border="0" cellpadding="0" cellspacing="0" width="100%">
						<tbody>
							<tr>
								<td width="24%">&nbsp;</td>
								<td valign="bottom" width="76%"><span class="STYLE3">版本：2014
										v2.0</span></td>
							</tr>
						</tbody>
					</table></td>
			</tr>
		</tbody>
	</table>

</body>
</html>
