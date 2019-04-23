<%@page import="java.util.List"%>
<%@page import="entity.AssetLend"%>
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
#nav>ul>li>#item3 {
	color: red
}
</style>
</head>
<body>
	<jsp:include page="top.jsp" />
	<jsp:include page="nav.jsp" />
	<div class="s2"></div>
	<div class="s4">
		<img src="images/b4.png" width="40" height="40" />资产借出/归还管理
	</div>
	<div class="s5"></div>
	<!--end-->
	<div class="form">
		<div class="form1">
			<form action="<%=path%>/AssetLendAddServ" method="post">
				<img src="images/redbook.png" width="48" height="48" />资产编号： <input
					name="asset_id" type="text" /> <img src="images/employ.png"
					width="40" height="40" />员工编号： <input name="employee_id"
					type="text" /> <input type="submit" value="借出" />
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
				<!-- <td align="center">归还时间</td> -->
				<td align="center">归还</td>
			</tr>
			<%
				List<AssetLend> list = (List<AssetLend>) request.getAttribute("list");
				if (list == null || list.size() < 1) {
					out.print("<tr><td bgcolor='#FFFFFF' colspan='5'>没有任何资产信息！</td></tr>");
				} else {
					for (AssetLend v : list) {
			%>
			<tr align="center">
				<td></td>
				<td><%=v.getAsset_id()%></td>
				<td><%=v.getEmployee_id()%></td>
				<td></td>
				<td></td>
				<td><a href="<%=path%>/DelAssetLendServ?lendNo=<%=v.getId()%>"
					onclick="return confirm('确认归还?')">归还 </a></td>
			</tr>
			<%
				}
				}
			%>
		</table>
	</div>
	<%@include file="bottom.jsp"%>
</body>
</html>
