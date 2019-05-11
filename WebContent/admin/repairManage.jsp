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
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css"
	integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u"
	crossorigin="anonymous">
</head>
</head>
<body>
	<jsp:include page="nav.jsp" />
	<div class="container" style="margin-top: 65px">
		<div class="row">
			<ol class="breadcrumb">
				<li><a href="#">维修管理</a></li>
				<li class="active">维修信息</li>
			</ol>
			<form action="<%=path%>/RepairInfoAddServ" method="post">
				<div class="form-inline">
					<div class="form-group">
						<label for="">资产编号：</label> <input type="text"
							class="form-control" id="" placeholder="请输入资产编号">
					</div>
					<div class="form-group">
						<label for="">送修时间：</label> <input type="text"
							class="form-control" id="" placeholder="点击选择时间">
					</div>
				</div>
				<div class="form-inline" style="margin-top: 5px">
					<div class="form-group">
						<label for="">送&nbsp;&nbsp;修&nbsp;&nbsp;人：</label> <input type="text" class="form-control"
							id="" placeholder="请输入送修人信息">
					</div>
					<div class="form-group">
						<label for="">经&nbsp;&nbsp;手&nbsp;&nbsp;人:</label> <input type="text" class="form-control"
							id="" placeholder="请输入经手人信息">
					</div>
				</div>
				<div style="margin-top:10px">
					<label>故障原因：</label>
					<textarea class="form-control" rows="3" placeholder="简要描述故障原因"></textarea>
				</div>
				<button type="submit" class="btn btn-primary"
					style="background: #a94442; margin-top: 5px">确认送修</button>
			</form>
			<table class="table table-hover" style="margin-top: 5px;">
				<tr>
					<th>资产编号</th>
					<th>送修时间</th>
					<th>送修人</th>
					<th>经手人</th>
					<th>故障原因</th>
					<th>操作</th>
				</tr>
				<%
					List<AssetRepairInfo> list = (List<AssetRepairInfo>) request.getAttribute("list");
					if (list == null || list.size() < 1) {
						out.print("<tr><td bgcolor='#FFFFFF' colspan='5'>没有任何资产信息！</td></tr>");
					} else {
						for (AssetRepairInfo v : list) {
				%>
				<tr>
					<td><%=v.getAssetId()%></td>
					<td><%=v.getSendRepairTime()%></td>
					<td><%=v.getSendRepairPerson()%></td>
					<td><%=v.getPassHandPerson()%></td>
					<td><%=v.getRepairReason()%></td>
					<td><a href="<%=path%>/QueryEditRepairServ?id=<%=v.getId()%>">编辑</a><a
						onclick="return confirm('确认删除？')"
						href="<%=path%>/DelAssetRepairServ?id=<%=v.getId()%>">&nbsp;&nbsp;删除</a></td>
				</tr>
				<%
					}
					}
				%>
			</table>
		</div>
	</div>
	<%@include file="bottom.jsp"%>
</body>
</html>