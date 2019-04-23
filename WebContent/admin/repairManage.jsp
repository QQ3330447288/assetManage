<%@page import="java.util.List"%>
<%@page import="entity.AssetRepairInfo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	String admin = (String) session.getAttribute("admin");
	if (admin == null || "".equals(admin)) {
		response.sendRedirect("" + path + "/admin/login.jsp");
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>资产管理</title>
<link rel="stylesheet" href="<%=path%>/static/css/repairManage.css" />
<style>
#nav>ul>li>#item4 {
	color: red
}
</style>
</head>
<body>
	<jsp:include page="top.jsp" />
	<jsp:include page="nav.jsp" />
	<div class="s2"></div>
	<div class="s4">
		<img src="images/tongs.png" width="40" height="50" />资产维修操作
	</div>
	<div class="s5"></div>
	<div class="form">
		<form action="<%=path%>/RepairInfoAddServ" method="post"
			class="inputstyle">
			资产编号：<input name="assetId" type="text" /> 送修时间：<input
				name="sendRepairTime" type="text" /><br /> 送修人;：<input
				name="sendRepairPerson" type="text" /> 经手人：<input
				name="passHandPerson" type="text" /><br /> 故障原因：
			<textarea name="repairReason" cols="57" rows="5"></textarea>
		<div class="btn">
			<input type="submit" value="确认送修" />
		</div>
		</form>

	</div>
	<!--end-->
	<div class="s6">
		<img src="images/Mail.png" width="40" height="40" />资产送修详细信息
	</div>
	<!--end-->
	<div class="s7">
		<table width="600" border="1" cellspacing="0" cellpadding="0"
			class="tab">
			<tr>
				<td align="center" bgcolor="#33FFFF" name="">资产编号</td>
				<td align="center" bgcolor="#33FFFF" name="">送修时间</td>
				<td align="center" bgcolor="#33FFFF" name="">送修人</td>
				<td align="center" bgcolor="#33FFFF" name="">经手人</td>
				<td align="center" bgcolor="#33FFFF" name="">故障原因</td>
				<td align="center" bgcolor="#33FFFF">操作</td>
			</tr>
				<%
			List<AssetRepairInfo> list = (List<AssetRepairInfo>) request.getAttribute("list");
			if (list == null || list.size() < 1) {
				out.print("<tr><td bgcolor='#FFFFFF' colspan='5'>没有任何资产信息！</td></tr>");
			} else {
				for (AssetRepairInfo v : list) {
		%>
		<tr align="center">
			<td><%=v.getAssetId()%></td>
			<td><%=v.getSendRepairTime()%></td>
			<td><%=v.getSendRepairPerson()%></td>
			<td><%=v.getPassHandPerson()%></td>
			<td><%=v.getRepairReason()%></td>
			<td><a href="<%=path%>/QueryEditRepairServ?id=<%=v.getId()%>">编辑</a><a onclick="return confirm('确认删除？')" href="<%=path%>/DelAssetRepairServ?id=<%=v.getId()%>">&nbsp;&nbsp;删除</a></td>
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