<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>两表查询</title>
    
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
    <table border="1px" align="center">
    	<tr>
    		<th colspan="20"> Role和User两表查询</th>
    	</tr>
    	
    	<tr>
    		<th style="display: none">编号</th>
    		<th>用户编码</th>
    		<th>用户名称</th>
    		<th>用户密码</th>
    		<th>性别</th>
    		<th>出生日期</th>
    		<th>手机</th>
    		<th>地址</th>
    		<th>用户类型</th>
    		<th>创建者</th>
    		<th>创建时间</th>
    		<th>更新者</th>
    		<th>更新时间</th>
    		<th>角色编号</th>
    		<th>角色编码</th>
    		<th>角色名称</th>
    		<th>创建者</th>
    		<th>创建时间</th>
    		<th>修改者</th>
    		<th>修改时间</th>
    	</tr>
    	<c:forEach var="user" items="${list}">
    	<tr>
    		<td style="display: none">${user.id}</td>
    			<td>${user.userCode}</td>
    			<td>${user.userName}</td>
    			<td>${user.userPassword}</td>
    			<td>${user.gender}</td>
    			<td>${user.birthday}</td>
    			<td>${user.phone}</td>
    			<td>${user.address}</td>
    			<td>${user.userType}</td>
    			<td>${user.createdBy}</td>
    			<td>${user.creationDate}</td>
    			<td>${user.modifyBy}</td>
    			<td>${user.modifyDate}</td>
    			<td>${user.userRole}</td>
    			<td>${user.role.roleCode}</td>
    			<td>${user.role.roleName}</td>
    			<td>${user.role.createdBy}</td>
    			<td>${user.role.creationDate}</td>
    			<td>${user.role.modifyBy}</td>
    			<td>${user.role.modifyDate}</td>
    			</tr>
    	</c:forEach>
    	
    </table>
    <h3><a href="UserServlet?action=getUser">查询用户数据</a></h3>
  </body>
</html>
