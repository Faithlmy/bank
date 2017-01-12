<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>设备报修管理（管理员）</title>
<link rel="stylesheet" type="text/css"  href="../css/web/table.css" />
<script type="text/javascript" src="../js/line.js"></script>
</head>
<body>
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td height="30"><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td height="24" bgcolor="#353c44"><table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td width="6%" height="19" valign="bottom"><div align="center"><img src="../images/tb.gif" width="14" height="14" /></div></td>
                <td width="94%" valign="bottom"><span class="STYLE1"> 网点设备报修信息&nbsp;&nbsp;&nbsp;&nbsp; <input type="text"
												name="search" class="STYLE21"  value="输入设备编号或网点名称"/> 
												<a href="devicerecord.html"><input type="button" value="查询" class="STYLE21" style="height: 25px" /></a></span></td>
              </tr>
            </table></td>
            <td><div align="right"><span class="STYLE1">
              <input type="checkbox" name="checkbox" id="checkbox" onclick="selAll();"/>
              全选      &nbsp;&nbsp;<img src="../images/add.gif" width="10" height="10" /> <span class="STYLE23">添加 </span>  &nbsp; <img src="../images/del.gif" width="10" height="10" /><span class="STYLE23"> 删除</span>    &nbsp;&nbsp;<img src="../images/edit.gif" width="10" height="10" /> <span class="STYLE23">编辑  </span> &nbsp;</span><span class="STYLE1"> &nbsp;</span></div></td>
          </tr>
        </table></td>
      </tr>
    </table></td>
  </tr>
  <tr>
    <td><table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="#a8c7ce" onmouseover="changeto()"  onmouseout="changeback()">
      <tr>
        <td width="4%" height="20" bgcolor="d3eaef" class="STYLE10"><div align="center">
          <input type="checkbox" name="checkbox" id="checkbox" onclick="selAll();"/>
        </div></td>
        <td width="10%" height="20" bgcolor="d3eaef" class="STYLE6"><div align="center"><span class="STYLE10">报修记录编号</span></div></td>
        <td width="12%" height="20" bgcolor="d3eaef" class="STYLE6"><div align="center"><span class="STYLE10">报修设备</span></div></td>
        <td width="12%" height="20" bgcolor="d3eaef" class="STYLE6"><div align="center"><span class="STYLE10">报修单位</span></div></td>
		<td width="12%" height="20" bgcolor="d3eaef" class="STYLE6"><div align="center"><span class="STYLE10">网点编号</span></div></td>
		<td width="12%" height="20" bgcolor="d3eaef" class="STYLE6"><div align="center"><span class="STYLE10">网点位置</span></div></td>
		<td width="14%" height="20" bgcolor="d3eaef" class="STYLE6"><div align="center"><span class="STYLE10">网点联系方式</span></div></td>
        <td width="14%" height="20" bgcolor="d3eaef" class="STYLE6"><div align="center"><span class="STYLE10">网点IP地址</span></div></td>
        <td width="14%" height="20" bgcolor="d3eaef" class="STYLE6"><div align="center"><span class="STYLE10">基本操作</span></div></td>
      </tr>

      <tr>
        <td height="20" bgcolor="#FFFFFF"><div align="center">
          <input type="checkbox" name="checkbox" id="checkbox" />
        </div></td>
        <td height="20" bgcolor="#FFFFFF" class="STYLE19"><div align="center">XR001</div></td>
        <td height="20" bgcolor="#FFFFFF" class="STYLE19"><div align="center">打印机</div></td>
        <td height="20" bgcolor="#FFFFFF" class="STYLE19"><div align="center">中国银行高新支行</div></td>
		<td height="20" bgcolor="#FFFFFF" class="STYLE19"><div align="center">BS001</div></td>
		<td height="20" bgcolor="#FFFFFF" class="STYLE19"><div align="center">高新区</div></td>
        <td height="20" bgcolor="#FFFFFF" class="STYLE19"><div align="center">029-45645</div></td>
        <td height="20" bgcolor="#FFFFFF" class="STYLE19"><div align="center">192.168.1.1</div></td>
        <td height="20" bgcolor="#FFFFFF"><div align="center"><span class="STYLE21">删除 | 查看</span></div></td>
      </tr>
      <tr>
        <td height="20" bgcolor="#FFFFFF"><div align="center">
          <input type="checkbox" name="checkbox" id="checkbox" />
        </div></td>
        <td height="20" bgcolor="#FFFFFF" class="STYLE19"><div align="center">XR002</div></td>
        <td height="20" bgcolor="#FFFFFF" class="STYLE19"><div align="center">打印机</div></td>
        <td height="20" bgcolor="#FFFFFF" class="STYLE19"><div align="center">中国银行高新支行</div></td>
		<td height="20" bgcolor="#FFFFFF" class="STYLE19"><div align="center">BS002</div></td>
		<td height="20" bgcolor="#FFFFFF" class="STYLE19"><div align="center">高新区</div></td>
        <td height="20" bgcolor="#FFFFFF" class="STYLE19"><div align="center">029-45645</div></td>
        <td height="20" bgcolor="#FFFFFF" class="STYLE19"><div align="center">192.168.1.1</div></td>
        <td height="20" bgcolor="#FFFFFF"><div align="center"><span class="STYLE21">删除 | 查看</span></div></td>
      </tr>
      <tr>
        <td height="20" bgcolor="#FFFFFF"><div align="center">
          <input type="checkbox" name="checkbox" id="checkbox" />
        </div></td>
        <td height="20" bgcolor="#FFFFFF" class="STYLE19"><div align="center">XR003</div></td>
        <td height="20" bgcolor="#FFFFFF" class="STYLE19"><div align="center">打印机</div></td>
        <td height="20" bgcolor="#FFFFFF" class="STYLE19"><div align="center">中国银行高新支行</div></td>
		<td height="20" bgcolor="#FFFFFF" class="STYLE19"><div align="center">BS003</div></td>
		<td height="20" bgcolor="#FFFFFF" class="STYLE19"><div align="center">高新区</div></td>
        <td height="20" bgcolor="#FFFFFF" class="STYLE19"><div align="center">029-45645</div></td>
        <td height="20" bgcolor="#FFFFFF" class="STYLE19"><div align="center">192.168.1.1</div></td>
        <td height="20" bgcolor="#FFFFFF"><div align="center"><span class="STYLE21">删除 | 查看</span></div></td>
      </tr>
      <tr>
        <td height="20" bgcolor="#FFFFFF"><div align="center">
          <input type="checkbox" name="checkbox" id="checkbox" />
        </div></td>
        <td height="20" bgcolor="#FFFFFF" class="STYLE19"><div align="center">XR004</div></td>
        <td height="20" bgcolor="#FFFFFF" class="STYLE19"><div align="center">打印机</div></td>
        <td height="20" bgcolor="#FFFFFF" class="STYLE19"><div align="center">中国银行高新支行</div></td>
		<td height="20" bgcolor="#FFFFFF" class="STYLE19"><div align="center">BS004</div></td>
		<td height="20" bgcolor="#FFFFFF" class="STYLE19"><div align="center">高新区</div></td>
        <td height="20" bgcolor="#FFFFFF" class="STYLE19"><div align="center">029-45645</div></td>
        <td height="20" bgcolor="#FFFFFF" class="STYLE19"><div align="center">192.168.1.1</div></td>
        <td height="20" bgcolor="#FFFFFF"><div align="center"><span class="STYLE21">删除 | 查看</span></div></td>
      </tr>
      <tr>
        <td height="20" bgcolor="#FFFFFF"><div align="center">
          <input type="checkbox" name="checkbox" id="checkbox" />
        </div></td>
        <td height="20" bgcolor="#FFFFFF" class="STYLE19"><div align="center">XR005</div></td>
        <td height="20" bgcolor="#FFFFFF" class="STYLE19"><div align="center">打印机</div></td>
        <td height="20" bgcolor="#FFFFFF" class="STYLE19"><div align="center">中国银行高新支行</div></td>
		<td height="20" bgcolor="#FFFFFF" class="STYLE19"><div align="center">BS005</div></td>
		<td height="20" bgcolor="#FFFFFF" class="STYLE19"><div align="center">高新区</div></td>
        <td height="20" bgcolor="#FFFFFF" class="STYLE19"><div align="center">029-45645</div></td>
        <td height="20" bgcolor="#FFFFFF" class="STYLE19"><div align="center">192.168.1.1</div></td>
        <td height="20" bgcolor="#FFFFFF"><div align="center"><span class="STYLE21">删除 | 查看</span></div></td>
      </tr>
      <tr>
        <td height="20" bgcolor="#FFFFFF"><div align="center">
          <input type="checkbox" name="checkbox" id="checkbox" />
        </div></td>
        <td height="20" bgcolor="#FFFFFF" class="STYLE19"><div align="center">XR006</div></td>
        <td height="20" bgcolor="#FFFFFF" class="STYLE19"><div align="center">打印机</div></td>
        <td height="20" bgcolor="#FFFFFF" class="STYLE19"><div align="center">中国银行高新支行</div></td>
		<td height="20" bgcolor="#FFFFFF" class="STYLE19"><div align="center">BS006</div></td>
		<td height="20" bgcolor="#FFFFFF" class="STYLE19"><div align="center">高新区</div></td>
        <td height="20" bgcolor="#FFFFFF" class="STYLE19"><div align="center">029-45645</div></td>
        <td height="20" bgcolor="#FFFFFF" class="STYLE19"><div align="center">192.168.1.1</div></td>
        <td height="20" bgcolor="#FFFFFF"><div align="center"><span class="STYLE21">删除 | 查看</span></div></td>
      </tr>
      <tr>
        <td height="20" bgcolor="#FFFFFF"><div align="center">
          <input type="checkbox" name="checkbox" id="checkbox" />
        </div></td>
        <td height="20" bgcolor="#FFFFFF" class="STYLE19"><div align="center">XR007</div></td>
        <td height="20" bgcolor="#FFFFFF" class="STYLE19"><div align="center">打印机</div></td>
        <td height="20" bgcolor="#FFFFFF" class="STYLE19"><div align="center">中国银行高新支行</div></td>
		<td height="20" bgcolor="#FFFFFF" class="STYLE19"><div align="center">BS007</div></td>
		<td height="20" bgcolor="#FFFFFF" class="STYLE19"><div align="center">高新区</div></td>
        <td height="20" bgcolor="#FFFFFF" class="STYLE19"><div align="center">029-45645</div></td>
        <td height="20" bgcolor="#FFFFFF" class="STYLE19"><div align="center">192.168.1.1</div></td>
        <td height="20" bgcolor="#FFFFFF"><div align="center"><span class="STYLE21">删除 | 查看</span></div></td>
      </tr>
      <tr>
        <td height="20" bgcolor="#FFFFFF"><div align="center">
          <input type="checkbox" name="checkbox" id="checkbox" />
        </div></td>
        <td height="20" bgcolor="#FFFFFF" class="STYLE19"><div align="center">XR008</div></td>
        <td height="20" bgcolor="#FFFFFF" class="STYLE19"><div align="center">打印机</div></td>
        <td height="20" bgcolor="#FFFFFF" class="STYLE19"><div align="center">中国银行高新支行</div></td>
		<td height="20" bgcolor="#FFFFFF" class="STYLE19"><div align="center">BS008</div></td>
		<td height="20" bgcolor="#FFFFFF" class="STYLE19"><div align="center">高新区</div></td>
        <td height="20" bgcolor="#FFFFFF" class="STYLE19"><div align="center">029-45645</div></td>
        <td height="20" bgcolor="#FFFFFF" class="STYLE19"><div align="center">192.168.1.1</div></td>
        <td height="20" bgcolor="#FFFFFF"><div align="center"><span class="STYLE21">删除 | 查看</span></div></td>
      </tr>
    </table></td>
  </tr>
  <tr>
    <td height="30"><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="33%"><div align="left"><span class="STYLE22">&nbsp;&nbsp;&nbsp;&nbsp;共有<strong> 243</strong> 条记录，当前第<strong> 1</strong> 页，共 <strong>10</strong> 页</span></div></td>
        <td width="67%"><table width="312" border="0" align="right" cellpadding="0" cellspacing="0">
          <tr>
            <td width="49"><div align="center"><img src="../images/main_54.gif" width="40" height="15" /></div></td>
            <td width="49"><div align="center"><img src="../images/main_56.gif" width="45" height="15" /></div></td>
            <td width="49"><div align="center"><img src="../images/main_58.gif" width="45" height="15" /></div></td>
            <td width="49"><div align="center"><img src="../images/main_60.gif" width="40" height="15" /></div></td>
            <td width="37" class="STYLE22"><div align="center">转到</div></td>
            <td width="22"><div align="center">
              <input type="text" name="textfield" id="textfield"  style="width:20px; height:12px; font-size:12px; border:solid 1px #7aaebd;"/>
            </div></td>
            <td width="22" class="STYLE22"><div align="center">页</div></td>
            <td width="35"><img src="../images/main_62.gif" width="26" height="15" /></td>
          </tr>
        </table></td>
      </tr>
    </table></td>
  </tr>
</table>
</body>
</html>
