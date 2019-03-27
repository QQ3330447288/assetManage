<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>登录失败</title>
</head>
<body>
	登录失败，3秒后返回登录页面！
	<script>
setInterval(() => {
	window.location.href="<%=path%>/admin/login.jsp";
}, 3000);
</script>
</body>
</html>