<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>添加用户信息</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
	<form action="<%=basePath%>UserServlet?action=addUser" method="post">
		    <table border="0px" align="center">
    	<tr>
    		<th colspan="2">添加用户信息</th>
    	</tr>
    	<tr>
    		<th>用户编码</th>
    		<td><input type="text" name="userCode" id="userCode"/></td>
    	</tr>
    	<tr>
    		<th>用户名称</th>
    		<td><input type="text" name="userName" id="userName"/></td>
    	</tr>
    	<tr>
    		<th>用户密码</th>
    		<td><input type="text" name="userPassword" id="userPassword"/></td>
    	</tr>
    	<tr>
    		<th>性别</th>
    		<td><input type="text" name="gender" id="gender"/></td>
    	</tr>
    	<tr>
    		<th>出生日期</th>
    		<td><input type="text" name="birthday" id="birthday"/></td>
    	</tr>
    	<tr>
    		<th>手机</th>
    		<td><input type="text" name="phone" id="phone"/></td>
    	</tr>
    	<tr>
    		<th>地址</th>
    		<td><input type="text" name="address" id="address"/></td>
    	</tr>
    	<tr>
    		<th>用户类型</th>
    		<td><input type="text" name="userType" id="userType"/></td>
    	</tr>
    	<tr>
    		<th>创建者（userId）</th>
    		<td><input type="text" name="createdBy" id="createdBy"/></td>
    	</tr>
    	<tr>
    		<th>创建时间</th>
    		<td><input type="text" name="creationDate" id="creationDate"/></td>
    	</tr>
    	<tr>
    		<th>更新者（userId）</th>
    		<td><input type="text" name="modifyBy" id="modifyBy"/></td>
    	</tr>
    	<tr>
    		<th>更新时间</th>
    		<td><input type="text" name="modifyDate" id="modifyDate"/></td>
    	</tr>
    	<tr>
    		<th>角色id</th>
    		<td><input type="text" name="userRole" id="userRole"/></td>
    	</tr>
    	<tr>
    		<td><input type="reset" name="res" id="res" value="重置"/></td>
    		<td><input type="submit" name="sub" id="sub" value="添加"/></td>
    	</tr>
    </table>
	</form>
  </body>
</html>
