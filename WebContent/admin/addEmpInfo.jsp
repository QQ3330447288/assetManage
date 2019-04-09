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
		<form action="<%=path%>/EmpInfoAddServ" method="post"
			class="inputstyle">
			&nbsp;员工编号：<input name="id" type="text" /> 姓名：<input name="name"
				type="text" /> <br /> &nbsp;性&nbsp;&nbsp;别： <select name="sex_id">
				<option value="0">男</option>
				<option value="1">女</option>
			</select> 年龄：<input name="age" type="text" /> <br /> &nbsp;电话号码：<input
				name="phone" type="text" /><br /> <br /> &nbsp; 所在部门： <select name="department_id">
				<option value="1">教务处</option>
				<option value="2">工学院</option>
				<option value="3">商学院</option>
				<option value="4">艺术学院</option>
			</select> &nbsp;&nbsp; 现任职务：<select name="post_id">
				<option value="1">辅导员</option>
				<option value="2">高级教师</option>
				<option value="3">特级教师</option>
			</select> <br />
			状态：<select name="status">
				<option value="在职">在职</option>
				<option value="离职">离职</option>
			</select> <br />
			<div class="texareastyle">
				&nbsp;家庭住址：
				<textarea name="address" cols="57" rows="5"></textarea>
			</div>
			<br />
			<div class="btn">
				<input type="submit" value="保存" />
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a herf="employee.jsp"> <input
					name="" type="button" value="返回" /></a>
			</div>
		</form>
	</div>
	<div class="footer">
		<p>Copyright©2019-2088&nbsp;济南大学泉城学院所有</p>
	</div>
</body>
</html>
