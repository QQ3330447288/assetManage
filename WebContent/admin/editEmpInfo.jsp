<%@page import="entity.Employee"%>
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
<title>添加员工信息</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<link rel="stylesheet" href="<%=path%>/static/css/public.css" />
<style>
#nav>ul>li>#item5 {
	color: red
}
</style>
</head>
<body>
	<jsp:include page="top.jsp" />
	<jsp:include page="nav.jsp" />
	<div class="s2"></div>
	<div class="s4">
		<img src="images/employ.png" width="40" height="40" />员工管理/增加员工信息
	</div>
	<div class="s5"></div>
	<div class="s6">
		<form action="<%=path%>/EmpInfoEditServ" method="post"
			class="inputstyle">
			<%
				List<Employee> list = (List<Employee>) request.getAttribute("list");
				if (list == null || list.size() < 1) {
					out.print("<tr><td bgcolor='#FFFFFF' colspan='5'>没有任何资产信息！</td></tr>");
				} else {
					for (Employee v : list) {
			%>
			<input name="id" type="text" value="<%=v.getId()%>" hidden="hidden"
				 /> 姓名：<input name="name" type="text"
				value="<%=v.getName()%>" /> <br /> &nbsp;性&nbsp;&nbsp;别： <select
				name="sex_id">
				<%
					if (v.getSex_id() == 0) {
				%>
				<option value="0" selected="selected">男</option>
				<option value="1">女</option>
				<%
					} else {
				%>
				<option value="0">男</option>
				<option value="1" selected="selected">女</option>
				<%
					}
				%>

			</select> 年龄：<input name="age" type="text" value="<%=v.getAge()%>" /> <br />
			&nbsp;电话号码：<input name="phone" type="text" value="<%=v.getPhone()%>" /><br />
			<br /> &nbsp; 所在部门： <select name="department_id">
				<%
					if (v.getDepartment_id() == 1) {
				%>
				<option value="1" selected="selected">教务处</option>
				<option value="2">工学院</option>
				<option value="3">商学院</option>
				<option value="4">艺术学院</option>
				<%
					} else if (v.getDepartment_id() == 2) {
				%>
				<option value="1">教务处</option>
				<option value="2" selected="selected">工学院</option>
				<option value="3">商学院</option>
				<option value="4">艺术学院</option>
				<%
					} else if (v.getDepartment_id() == 3) {
				%>
				<option value="1">教务处</option>
				<option value="2">工学院</option>
				<option value="3" selected="selected">商学院</option>
				<option value="4">艺术学院</option>
				<%
					} else {
				%>
				<option value="1">教务处</option>
				<option value="2">工学院</option>
				<option value="3">商学院</option>
				<option value="4" selected="selected">艺术学院</option>

				<%
					}
				%>

			</select> &nbsp;&nbsp; 现任职务：<select name="post_id">

				<%
					if (v.getPost_id() == 1) {
				%>
				<option value="1" selected="selected">辅导员</option>
				<option value="2">高级教师</option>
				<option value="3">特级教师</option>

				<%
					} else if (v.getPost_id() == 2) {
				%>
				<option value="1">辅导员</option>
				<option value="2" selected="selected">高级教师</option>
				<option value="3">特级教师</option>
				<%
					} else {
				%>
				<option value="1">辅导员</option>
				<option value="2">高级教师</option>
				<option value="3" selected="selected">特级教师</option>

				<%
					}
				%>

			</select> <br /> 状态：<select name="status">

				<%
					if ("在职".equals(v.getStatus())) {
				%>
				<option value="在职" selected="selected">在职</option>
				<option value="离职">离职</option>
				<%
					} else {
				%>
				<option value="在职">在职</option>
				<option value="离职" selected="selected">离职</option>
				<%
					}
				%>
			</select> <br />
			<div class="texareastyle">
				&nbsp;家庭住址：
				<textarea name="address" cols="57" rows="5"><%=v.getAddress()%>
				</textarea>
			</div>
			<br />
			<div class="btn">
				<input type="submit" value="修改" />
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a herf="employee.jsp"> <input
					name="" type="button" value="返回" /></a>
			</div>
			<%
				}
				}
			%>
		</form>
	</div>
	<div class="footer">
		<p>Copyright©2019-2088&nbsp;济南大学泉城学院所有</p>
	</div>
</body>
</html>
