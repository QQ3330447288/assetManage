<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">
<title>修改密码</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<link rel="stylesheet" href="<%=path%>/static/css/pwd.css" />
</head>
<body>
	<jsp:include page="top.jsp" />
	<jsp:include page="nav.jsp" />
	<div class="s2"></div>
	<div class="s4">
		<img src="images/draw.png" width="40" height="40" />系统用户修改密码
	</div>
	<div class="s5"></div>
	<div class="s6">
		<form action="" method="get" class="form1">
			<div class="inputstyle">
				<img src="images/pen.png" width="20" height="20" />旧密码：&nbsp;<input
					name="" type="password" />
			</div>
			<div class="inputstyle">
				<img src="images/pen.png" width="20" height="20" />新密码：&nbsp;<input
					name="" type="password" />
			</div>
			<div class="inputstyle">
				<img src="images/pen.png" width="20" height="20" />确认密码：<input
					name="" type="password" />
			</div>
			<div class="btn">
				<input name="" type="button" value="提交" />
			</div>
		</form>
	</div>
	<%@include file="bottom.jsp"%>
</body>
</html>
