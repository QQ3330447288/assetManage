<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	String admin = (String) session.getAttribute("admin");
	if (admin == null || "".equals(admin)) {
		response.sendRedirect("" + path + "/admin/login.jsp");
	}
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>借还管理</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<link rel="stylesheet" href="<%=path%>/static/css/public.css" />
<style>
#nav>ul>li>#item3{
color:red
}
</style>
</head>
<body>
	<jsp:include page="top.jsp"/>
	<jsp:include page="nav.jsp"/>
	<div class="s2"></div>
	<div class="s4">
		<img src="images/b4.png" width="40" height="40" />资产借出/归还管理
	</div>
	<div class="s5"></div>
	<!--end-->
	<div class="form">
		<div class="form1">
			<form action="" method="get">

				<img src="images/redbook.png" width="48" height="48" />资产编号： <input
					name="" type="text" /> <img src="images/employ.png" width="40"
					height="40" />员工编号： <input name="" type="text" /> <input name=""
					type="button" value="借出" />
			</form>
		</div>
		<!--end of form-->
	</div>
	<!--end-->
	<div class="excel">
		<table width="850px" border="1" cellpadding="0px" cellspacing="0px"
			bgcolor="#33FFFF" class="tab">
			<tr>
				<td align="center">借用人</td>
				<td align="center">资产编号</td>
				<td align="center">员工编号</td>
				<td align="center">借用时间</td>
				<td align="center">应还时间</td>
				<td align="center">归还时间</td>
				<td align="center">查看</td>
				<td align="center">归还</td>
			</tr>
		</table>
	</div>
	<%@include file="bottom.jsp"%>
</body>
</html>
