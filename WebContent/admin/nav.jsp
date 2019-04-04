<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
%>
<div id="nav">
	<ul>
		<li><a href="<%=path%>/admin/index.jsp" id="item1">首页</a></li>
		<li><a href="<%=path%>/QueryAssetInfoServ" id="item2">资产管理</a></li>
		<li><a href="<%=path%>/admin/lendManage.jsp" id="item3">借还管理</a></li>
		<li><a href="<%=path%>/admin/repairManage.jsp" id="item4">维修管理</a></li>
		<li><a href="<%=path%>/admin/employeeManage.jsp" id="item5">员工管理</a></li>
		<li><a href="#">打印报表</a></li>
		<li><a href="<%=path%>/admin/changePwd.jsp" id="item7">修改密码</a></li>
	</ul>
</div>
<!--end of nav-->