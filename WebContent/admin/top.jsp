<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String admin = (String) session.getAttribute("admin");
	if (admin == null || "".equals(admin)) {
		response.sendRedirect("" + path + "+/admin/login.jsp");
	}
%>
<!--begin of header-->
<div class="header">
	<div class="logo">
		<img src="<%=path%>/static/images/logo.png" width="100%" height="61" />
	</div>
</div>

<%
	if (admin == null || "".equals(admin)) {
		response.sendRedirect("" + path + "+/admin/login.jsp");
	} else {
%>
<div>欢迎【<%=admin%>】登录系统</div>
<div><a href="<%=path%>/SignOutServ">退出系统</a></div>
<%
	}
%>
<!--end of header-->
<div class="s1"></div>
