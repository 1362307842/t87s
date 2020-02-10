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
    
    <title>加载用户信息</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
  </head>
  <script type="text/javascript" src="<%=basePath%>js/jquery-1.12.4.js"></script>
<script type="text/javascript">
	var base = "<%=basePath%>";
	//Ajax局部删除刷新
	function remove(pk) {
		var isremove = confirm("确认删除吗？");
		if (isremove == true) {
			$.ajax({
				url : base + "/UserServlet",
				method : "post",
				data : {
					"id" : pk,
					"action" : "delUser"
				},
				success : function(jsonStr) {
					var result = eval("(" + jsonStr + ")");
					if (result.status == 1) {
						alert("删除成功");
						location.href = "<%=basePath%>UserServlet?action=getUser";
						
					}else {
						alert("删除失败");
					}
				}
			});
		}
	}
</script>
  <body>
    <table border="1px" align="center">
    	<tr>
    		<th colspan="15">用户信息</th>
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
    		<th>操作</th>
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
    			<td><a href="<%=basePath%>UserServlet?action=getUserById&id=${user.id}">修改</a>  <a href="javascript:remove(${user.id })">删除</a>   <a href="<%=basePath%>UserServlet?action=getUserByIds&id=${user.id}">修改用户名</a></td>
    			
    		</tr>
    	</c:forEach>
    </table>
    <h3 align="center"><a href="addUser.jsp">添加用户信息</a></h3>
    <h3 align="center"><a href="UserServlet?action=getUserByRole">Role和User两表查询</a></h3>
     <h3 align="center"><a href="UserServlet?action=getAddressListById&id=1">一对多查询</a></h3>
  </body>
</html>
