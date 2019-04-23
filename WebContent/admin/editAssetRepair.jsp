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
		<form action="<%=path%>/AssetRepairEditServ" method="post"
			class="inputstyle">
			
			<%
				List<AssetRepairInfo> list = (List<AssetRepairInfo>) request.getAttribute("list");
				if (list != null && list.size() > 0) {
					for (AssetRepairInfo v : list) {
			%>
			<input name="id" hidden="hidden" value="<%=v.getId()%>"/>
			资产编号：<input name="assetId" type="text" value="<%=v.getAssetId()%>"/> 送修时间：<input
				name="sendRepairTime" type="text" value="<%=v.getSendRepairTime()%>" /><br /> 送修人;：<input
				name="sendRepairPerson" type="text" value="<%=v.getSendRepairPerson()%>" /> 经手人：<input
				name="passHandPerson" type="text"  value="<%=v.getPassHandPerson()%>"/><br /> 故障原因：
			<textarea name="repairReason" cols="57" rows="5"><%=v.getRepairReason()%></textarea>
			
				<%
				}
				}
			%>
			
			
		<div class="btn">
			<input type="submit" value="修改送修信息" />
		</div>
		</form>

	</div>
	<!--end-->
	<%@include file="bottom.jsp"%>
</body>
</html>