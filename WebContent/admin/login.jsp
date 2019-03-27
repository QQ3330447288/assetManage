<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>登录</title>
<link rel="stylesheet" href="<%=path%>/static/css/login.css" />
</head>
<body>
	<div class="logo">
		<div class="go">欢迎进入高校资产管理系统！</div>
	</div>
	<div class="kg">
		<div class=" form1">
			<form action="<%=path %>/LoginServ" name="form2" method="post">
				用户名:<input name="name" type="text" /><br />
				密&nbsp;&nbsp;码:<input name="pwd" type="password" /> 
				<br /> 
				<br /> 
				<br /> 
				<input name="submit" type="submit" class="z" value="登录" onClick="mycheck()"> &nbsp;&nbsp; 
				<input type="reset" name="Submit2" value="重置" class="z" />
			</form>
		</div>
	</div>
	<div class="bottom">
		高校资产管理系统<br> 济南大学泉城学院所有@1997-2017
	</div>
	<script type="text/javascript" src="<%=path%>/static/js/login.js"></script>
</body>
</html>