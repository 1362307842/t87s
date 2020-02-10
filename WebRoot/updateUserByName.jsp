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
    
    <title>修改用户名称</title>
    
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
   <form action="<%=basePath%>UserServlet?action=updateUserByName" method="post">
   	<table border="0px" align="center">
   		<tr>
   			<th colspan="2">修改名称</th>
   		</tr>
   		<tr style="display: none">
    		<th>用户id</th>
    		<td><input type="text" name="id" id="id" value="${users.id}"/></td>
    	</tr>
   		<tr>
    		<th>用户名称</th>
    		<td><input type="text" name="userName" id="userName" value="${users.userName}"/></td>
    	</tr>
    	<tr>
    		<td><input type="reset" name="res" id="res" value="重置"/></td>
    		<td><input type="submit" name="sub" id="sub" value="修改"/></td>
    	</tr>
   	</table>
   </form>
  </body>
</html>
