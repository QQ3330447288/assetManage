<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@page import="entity.AssetInfo"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	String admin = (String) session.getAttribute("admin");
	//System.out.print(admin);
	if (admin == null || "".equals(admin)) {
		response.sendRedirect("" + path + "/admin/login.jsp");
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>资产管理</title>
<link rel="stylesheet" href="<%=path%>/static/css/public.css" />
<style>
#nav>ul>li>#item6 {
	color: red
}
</style>
</head>
<body>
	<jsp:include page="top.jsp" />
	<jsp:include page="nav.jsp" />
	<div class="s2"></div>
	<form action="<%=path %>/QueryAssetByNameServ" method="POST">
		关键字检索:<input type="text" name="assetName" placeholder="请输入资产名关键字">
		<input type="submit" value="查询">
	</form>
	<div class="s5"></div>
	<table width="00" border="1" class="tab" cellpadding="0"
		cellspacing="0">
		<tr>
			<td align="center" bgcolor="#FFBF55">资产编号</td>
			<td align="center" bgcolor="#FFBF55">资产名称</td>
			<td align="center" bgcolor="#FFBF55">生产厂商</td>
			<td align="center" bgcolor="#FFBF55">单价</td>
			<td align="center" bgcolor="#FFBF55">数量</td>
			<td align="center" bgcolor="#FFBF55">使用单位</td>
			<td align="center" bgcolor="#FFBF55">存放地点</td>
			<td align="center" bgcolor="#FFBF55">购买人</td>
			<td align="center" bgcolor="#FFBF55">资产类型</td>
			<td align="center" bgcolor="#FFBF55">状态</td>
			<td align="center" bgcolor="#FFBF55">操作</td>
		</tr>
		<%
			List<AssetInfo> list = (List<AssetInfo>) request.getAttribute("list");
			if (list == null || list.size() < 1) {
				out.print("<tr><td bgcolor='#FFFFFF' colspan='5'>您可根据资产名关键字检索资产信息！</td></tr>");
			} else {
				for (AssetInfo v : list) {
		%>
		<tr align="center">
			<td><%=v.getAssetNo()%></td>
			<td><%=v.getAssetName()%></td>
			<td><%=v.getManufacturer()%></td>
			<td><%=v.getAssetUnitPrice()%></td>
			<td><%=v.getAssetNum()%></td>
			<td><%=v.getUserCompany()%></td>
			<td><%=v.getStoragePlace()%></td>
			<td><%=v.getPurchaser()%></td>
			<td><%=v.getAssetType()%></td>
			<td><%=v.getAssetStatus()%></td>
			<td><a
				href="<%=path%>/QueryEditAssetServ?assetNo=<%=v.getAssetNo()%>">编辑</a><a
				onclick="return confirm('确认删除？')"
				href="<%=path%>/DelAssetInfoServ?assetNo=<%=v.getAssetNo()%>">&nbsp;&nbsp;删除</a></td>
		</tr>
		<%
			}
			}
		%>
	</table>
	<%@include file="bottom.jsp"%>
</body>
</html>