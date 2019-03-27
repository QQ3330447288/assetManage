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

<title>员工管理</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<link rel="stylesheet" href="<%=path%>/static/css/public.css" />
</head>
<body>
	<jsp:include page="top.jsp" />
	<jsp:include page="nav.jsp" />
	<div class="s2"></div>
	<div class="s3">
		<div class="s4">
			<img src="images/employ.png" width="40" height="40" />员工信息管理
		</div>
		<div class="button">
			<input name="" type="button" value="添加员工信息"
				onclick="window.open('addemployee.jsp')" />
		</div>
	</div>
	<div class="s5"></div>
	<table width="00" border="1" class="tab" cellpadding="0"
		cellspacing="0">
		<tr>
			<td align="center" bgcolor="#33FFFF">员工编号</td>
			<td align="center" bgcolor="#33FFFF">姓名</td>
			<td align="center" bgcolor="#33FFFF">性别</td>
			<td align="center" bgcolor="#33FFFF">年龄</td>
			<td align="center" bgcolor="#33FFFF">所在部门</td>
			<td align="center" bgcolor="#33FFFF">现任职务</td>
			<td align="center" bgcolor="#33FFFF">家庭住址</td>
			<td align="center" bgcolor="#33FFFF">联系电话</td>
			<td align="center" bgcolor="#33FFFF">状态</td>
			<td align="center" bgcolor="#33FFFF">操作</td>
		</tr>
	</table>
	<%@include file="bottom.jsp"%>
</body>
</html>
