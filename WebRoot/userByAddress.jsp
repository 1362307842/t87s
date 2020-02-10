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
    
    <title>一对多地址展示</title>
    
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
    		<th>用户编码</th>
    		<th>用户名称</th>
    		<th>用户密码</th>
    		<th>性别</th>
    		<th>出生日期</th>
    		<th>手机</th>
    		<th>收货地址明细</th>
    		<th>邮编</th>
    		<th>联系人电话</th>
    		<th>创建者</th>
    		<th>创建时间</th>
    	</tr>
    	
    		<tr>
    			<td rowspan="5">${user.userCode }</td>
    			<td rowspan="5">${user.userName }</td>
    			<td rowspan="5">${user.userPassword }</td>
    			<td rowspan="5">${user.gender }</td>
    			<td rowspan="5">${user.birthday }</td>
    			<td rowspan="5">${user.phone }</td>
    			<c:forEach var="address" items="${address }">
    			<td>${address.addressDesc }</td>
    			<td>${address.postCode }</td>
    			<td>${address.tel }</td>
    			<td>${address.createdBy }</td>
    			<td>${address.creationDate }</td>
    		
    		</tr>
    	</c:forEach>
    	
    </table>
        <h3><a href="UserServlet?action=getUser">查询用户数据</a></h3>
  </body>
</html>
