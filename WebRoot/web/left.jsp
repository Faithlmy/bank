<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<link rel="stylesheet" type="text/css" href="css/web/left.css" />

<script type="text/javascript" src="js/jframe.js"></script>


</head>

<body>
	<table border="0" cellpadding="0" cellspacing="0" height="100%"
		width="147" align="left">
		<tbody>
			<tr>
				<td height="23" background="images/main_34.gif">
					<table border="0" cellpadding="0" cellspacing="0" width="100%">
						<tbody>
							<tr>
								<td width="10%">&nbsp;</td>
								<td width="80%" id="imgmenu1" class="menu_title"
									onMouseOver="this.className='menu_title2';"
									onClick="showsubmenu(1)"
									onMouseOut="this.className='menu_title';" style="cursor:hand"><div
										class="STYLE5" align="center">系统管理</div>
								</td>
								<td width="10%">&nbsp;</td>
							</tr>
						</tbody>
					</table></td>
			</tr>
			<tr>
				<td valign="top" id="submenu1"><div class="sec_menu">
						<div align="center">
							<table border="0" cellpadding="0" cellspacing="0" width="70%"
								align="center">
								<tbody>
									<tr>
										<td height="38">
											<table border="0" cellpadding="0" cellspacing="0"
												width="100%">
												<tbody>
													<tr>
														<td height="28" width="33"><img
															src="images/user-info.gif" height="28" width="28">
														</td>
														<td width="99">
															<table border="0" cellpadding="0" cellspacing="0"
																width="100%">
																<tbody>
																	<tr>
																		<td class="STYLE4" style="cursor:hand"
																			onmouseover="this.style.borderStyle='solid';this.style.borderWidth='1';borderColor='#7bc4d3'; "
																			onmouseout="this.style.borderStyle='none'"
																			height="23"><a href="../user.do?opt=showAll"
																			target="table">用户管理</a>
																		</td>
																	</tr>
																</tbody>
															</table></td>
													</tr>
												</tbody>
											</table></td>
									</tr>
									<tr>
										<td height="38">
											<table border="0" cellpadding="0" cellspacing="0"
												width="100%">
												<tbody>
													<tr>
														<td height="28" width="33"><img src="images/lm.gif"
															height="28" width="28">
														</td>
														<td width="99">
															<table border="0" cellpadding="0" cellspacing="0"
																width="100%">
																<tbody>
																	<tr>
																		<td class="STYLE4"
																			style="background-image: url(&quot;&quot;); border-style: none; border-width: 1px;"
																			onmouseover="this.style.backgroundImage='url(images/tab_bg.gif)';this.style.borderStyle='solid';this.style.borderWidth='1';borderColor='#adb9c2'; "
																			onmouseout="this.style.backgroundImage='url()';this.style.borderStyle='none'"
																			height="23"><a href="../log.do?opt=showAll"
																			target="table">日志管理</a>
																		</td>
																	</tr>
																</tbody>
															</table></td>
													</tr>
												</tbody>
											</table></td>
									</tr>
									<tr>
										<td height="38">
											<table border="0" cellpadding="0" cellspacing="0"
												width="100%">
												<tbody>
													<tr>
														<td height="28" width="33"><img src="images/ad.gif"
															height="28" width="28" />
														</td>
														<td width="99">
															<table border="0" cellpadding="0" cellspacing="0"
																width="100%">
																<tbody>
																	<tr>
																		<td class="STYLE4"
																			style="background-image: url(&quot;&quot;); border-style: none; border-width: 1px;"
																			onmouseover="this.style.backgroundImage='url(images/tab_bg.gif)';this.style.borderStyle='solid';this.style.borderWidth='1';borderColor='#adb9c2'; "
																			onmouseout="this.style.backgroundImage='url()';this.style.borderStyle='none'"
																			height="23"><a href="../depart.do?opt=showAll"
																			target="table">部门管理</a></td>
																	</tr>
																</tbody>
															</table></td>
													</tr>
												</tbody>
											</table></td>
									</tr>
									<tr>
										<td height="38">
											<table border="0" cellpadding="0" cellspacing="0"
												width="100%">
												<tbody>
													<tr>
														<td height="28" width="33"><img
															src="images/usercontrol.gif" height="28" width="28">
														</td>
														<td width="99">
															<table border="0" cellpadding="0" cellspacing="0"
																width="100%">
																<tbody>
																	<tr>
																		<td class="STYLE4"
																			style="background-image: url(&quot;&quot;); border-style: none; border-width: 1px;"
																			onmouseover="this.style.backgroundImage='url(images/tab_bg.gif)';this.style.borderStyle='solid';this.style.borderWidth='1';borderColor='#adb9c2'; "
																			onmouseout="this.style.backgroundImage='url()';this.style.borderStyle='none'"
																			height="23"><a href="../position.do?opt=showAll"
																			target="table">岗位管理</a></td>
																	</tr>
																</tbody>
															</table></td>
													</tr>
												</tbody>
											</table></td>
									</tr>
									<tr>
										<td height="38"><table border="0" cellpadding="0"
												cellspacing="0" width="100%">
												<tbody>
													<tr>
														<td height="28" width="33"><img
															src="images/tool-down-pic.gif" height="28" width="28">
														</td>
														<td width="99"><table border="0" cellpadding="0"
																cellspacing="0" width="100%">
																<tbody>
																	<tr>
																		<td class="STYLE4"
																			style="background-image: url(&quot;&quot;); border-style: none; border-width: 1px;"
																			onmouseover="this.style.backgroundImage='url(images/tab_bg.gif)';this.style.borderStyle='solid';this.style.borderWidth='1';borderColor='#adb9c2'; "
																			onmouseout="this.style.backgroundImage='url()';this.style.borderStyle='none'"
																			height="23"><a href="../device.do?opt=showAll"
																			target="table">设备管理</a></td>
																	</tr>
																</tbody>
															</table></td>
													</tr>
												</tbody>
											</table></td>
									</tr>
									<tr>
										<td height="38"><table border="0" cellpadding="0"
												cellspacing="0" width="100%">
												<tbody>
													<tr>
														<td height="28" width="33"><img
															src="images/main_40.gif" height="28" width="28"></td>
														<td width="99"><table border="0" cellpadding="0"
																cellspacing="0" width="100%">
																<tbody>
																	<tr>
																		<td class="STYLE4"
																			style="background-image: url(&quot;&quot;); border-style: none; border-width: 1px;"
																			onmouseover="this.style.backgroundImage='url(images/tab_bg.gif)';this.style.borderStyle='solid';this.style.borderWidth='1';borderColor='#adb9c2'; "
																			onmouseout="this.style.backgroundImage='url()';this.style.borderStyle='none'"
																			height="23"><a href="../role.do?opt=showAll"
																			target="table">角色管理</a></td>
																	</tr>
																</tbody>
															</table></td>
													</tr>
												</tbody>
											</table></td>
									</tr>
									<tr>
										<td height="38"><table border="0" cellpadding="0"
												cellspacing="0" width="100%">
												<tbody>
													<tr>
														<td height="28" width="33"><img
															src="images/password.gif" height="28" width="28"></td>
														<td width="99"><table border="0" cellpadding="0"
																cellspacing="0" width="100%">
																<tbody>
																	<tr>
																		<td class="STYLE4"
																			style="background-image: url(&quot;&quot;); border-style: none; border-width: 1px;"
																			onmouseover="this.style.backgroundImage='url(images/tab_bg.gif)';this.style.borderStyle='solid';this.style.borderWidth='1';borderColor='#adb9c2'; "
																			onmouseout="this.style.backgroundImage='url()';this.style.borderStyle='none'"
																			height="23"><a
																			href="../privilege.do?opt=showAll" target="table">权限管理</a>
																		</td>
																	</tr>
																</tbody>
															</table></td>
													</tr>
												</tbody>
											</table></td>
									</tr>

								</tbody>
							</table>
						</div>
					</div></td>
			</tr>
			<tr>
				<td height="23" background="images/main_34_1.gif">
					<table border="0" cellpadding="0" cellspacing="0" width="100%">
						<tbody>
							<tr>
								<td width="10%">&nbsp;</td>
								<td width="80%" id="imgmenu2" class="menu_title"
									onMouseOver="this.className='menu_title2';"
									onClick="showsubmenu(2)"
									onMouseOut="this.className='menu_title';" style="cursor:hand"><div
										class="STYLE5" align="center">巡检中心</div>
								</td>
								<td width="10%">&nbsp;</td>
							</tr>
						</tbody>
					</table></td>

			</tr>

			<tr>
				<td valign="top" id="submenu2" style="DISPLAY: none"><div
						align="center">
						<table border="0" cellpadding="0" cellspacing="0" width="82%"
							align="center">
							<tbody>
								<tr>
									<td height="38"><table border="0" cellpadding="0"
											cellspacing="0" width="100%">
											<tbody>
												<tr>
													<td height="28" width="33"><img
														src="images/ipsecurity.gif" height="28" width="28">
													</td>
													<td width="99"><table border="0" cellpadding="0"
															cellspacing="0" width="100%">
															<tbody>
																<tr>
																	<td class="STYLE4"
																		style="background-image: url(&quot;&quot;); border-style: none; border-width: 1px;"
																		onmouseover="this.style.backgroundImage='url(images/tab_bg.gif)';this.style.borderStyle='solid';this.style.borderWidth='1';borderColor='#adb9c2'; "
																		onmouseout="this.style.backgroundImage='url()';this.style.borderStyle='none'"
																		onclick="doChange()" height="23"><a
																		href="../record.do?opt=showAll&record_type=poll"
																		target="table">巡检管理</a></td>
																</tr>
															</tbody>
														</table></td>
												</tr>
											</tbody>
										</table></td>
								</tr>
								<tr>
									<td height="38"><table border="0" cellpadding="0"
											cellspacing="0" width="100%">
											<tbody>
												<tr>
													<td height="28" width="33"><img src="images/mime.gif"
														height="28" width="28"></td>
													<td width="99"><table border="0" cellpadding="0"
															cellspacing="0" width="100%">
															<tbody>
																<tr>
																	<td class="STYLE4"
																		style="background-image: url(&quot;&quot;); border-style: none; border-width: 1px;"
																		onmouseover="this.style.backgroundImage='url(images/tab_bg.gif)';this.style.borderStyle='solid';this.style.borderWidth='1';borderColor='#adb9c2'; "
																		onmouseout="this.style.backgroundImage='url()';this.style.borderStyle='none'"
																		height="23"><a
																		href="../record.do?opt=showAll&record_type=fix"
																		target="table">维修管理</a></td>
																</tr>
															</tbody>
														</table></td>
												</tr>
											</tbody>
										</table></td>
								</tr>
								<tr>
									<td height="38"><table border="0" cellpadding="0"
											cellspacing="0" width="100%">
											<tbody>
												<tr>
													<td height="28" width="33"><img
														src="images/user-info.gif" height="28" width="28"></td>
													<td width="99"><table border="0" cellpadding="0"
															cellspacing="0" width="100%">
															<tbody>
																<tr>
																	<td class="STYLE4"
																		style="background-image: url(&quot;&quot;); border-style: none; border-width: 1px;"
																		onmouseover="this.style.backgroundImage='url(images/tab_bg.gif)';this.style.borderStyle='solid';this.style.borderWidth='1';borderColor='#adb9c2'; "
																		onmouseout="this.style.backgroundImage='url()';this.style.borderStyle='none'"
																		onclick="doChange()" height="23"><a
																		href="../group.do?opt=showAll" target="table">分组管理</a>
																	</td>
																</tr>
															</tbody>
														</table></td>
												</tr>
											</tbody>
										</table></td>
								</tr>
								<tr>
									<td height="38"><table border="0" cellpadding="0"
											cellspacing="0" width="100%">
											<tbody>
												<tr>
													<td height="28" width="33"><img
														src="images/sitebackup.gif" height="28" width="28">
													</td>
													<td width="99"><table border="0" cellpadding="0"
															cellspacing="0" width="100%">
															<tbody>
																<tr>
																	<td class="STYLE4"
																		style="background-image: url(&quot;&quot;); border-style: none; border-width: 1px;"
																		onmouseover="this.style.backgroundImage='url(images/tab_bg.gif)';this.style.borderStyle='solid';this.style.borderWidth='1';borderColor='#adb9c2'; "
																		onmouseout="this.style.backgroundImage='url()';this.style.borderStyle='none'"
																		height="23"><a
																		href="../user.do?opt=showAllEmployee" target="table">工作记录</a>
																	</td>
																</tr>
															</tbody>
														</table></td>
												</tr>
											</tbody>
										</table></td>
								</tr>
							</tbody>
						</table>
					</div></td>
			</tr>
			<tr>
				<td height="23" background="images/main_34_1.gif"><table
						border="0" cellpadding="0" cellspacing="0" width="100%">
						<tbody>
							<tr>
								<td width="10%">&nbsp;</td>
								<td width="80%" id="imgmenu3" class="menu_title"
									onMouseOver="this.className='menu_title2';"
									onClick="showsubmenu(3)"
									onMouseOut="this.className='menu_title';" style="cursor:hand"3><div
										class="STYLE5" align="center">银行网点</div>
								</td>
								<td width="10%">&nbsp;</td>
							</tr>
						</tbody>
					</table></td>
			</tr>
			<tr>
				<td valign="top" id="submenu3" style="DISPLAY: none"><div
						align="center">
						<table border="0" cellpadding="0" cellspacing="0" width="82%"
							align="center">
							<tbody>
								<tr>
									<td height="38"><table border="0" cellpadding="0"
											cellspacing="0" width="100%">
											<tbody>
												<tr>
													<td height="28" width="33"><img src="images/title.gif"
														height="28" width="28"></td>
													<td width="99"><table border="0" cellpadding="0"
															cellspacing="0" width="100%">
															<tbody>
																<tr>
																	<td class="STYLE4"
																		style="background-image: url(&quot;&quot;); border-style: none; border-width: 1px;"
																		onmouseover="this.style.backgroundImage='url(images/tab_bg.gif)';this.style.borderStyle='solid';this.style.borderWidth='1';borderColor='#adb9c2'; "
																		onmouseout="this.style.backgroundImage='url()';this.style.borderStyle='none'"
																		onclick="doChange()" height="23"><a
																		href="../site.do?opt=showAll" target="table">网点管理</a>
																	</td>
																</tr>
															</tbody>
														</table></td>
												</tr>
											</tbody>
										</table></td>
								</tr>
								<tr>
									<td height="38"><table border="0" cellpadding="0"
											cellspacing="0" width="100%">
											<tbody>
												<tr>
													<td height="28" width="33"><img
														src="images/lminfo.gif" height="28" width="28"></td>
													<td width="99"><table border="0" cellpadding="0"
															cellspacing="0" width="100%">
															<tbody>
																<tr>
																	<td class="STYLE4"
																		style="background-image: url(&quot;&quot;); border-style: none; border-width: 1px;"
																		onmouseover="this.style.backgroundImage='url(images/tab_bg.gif)';this.style.borderStyle='solid';this.style.borderWidth='1';borderColor='#adb9c2'; "
																		onmouseout="this.style.backgroundImage='url()';this.style.borderStyle='none'"
																		height="23"><a
																		href="../record.do?opt=showAll&record_type=report"
																		target="table">报修管理</a></td>
																</tr>
															</tbody>
														</table></td>
												</tr>
											</tbody>
										</table></td>
								</tr>




							</tbody>
						</table>
					</div></td>
			</tr>

			<tr>
				<td height="19" background="left_data/main_69.gif"><table
						border="0" cellpadding="0" cellspacing="0" width="100%">
						<tbody>
							<tr>
								<td width="24%">&nbsp;</td>
								<td valign="bottom" width="76%"><span class="STYLE3">版本：2014
										v1.0</span></td>
							</tr>
						</tbody>
					</table></td>
			</tr>
		</tbody>
	</table>

</body>
</html>
