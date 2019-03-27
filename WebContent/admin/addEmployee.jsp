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

<title>My JSP 'addemployee.jsp' starting page</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<style type="text/css">
.header {
	margin: 0 auto;
	width: 100%;
}

.logo {
	
}

#nav {
	height: 35px;
	line-height: 35px;
	background-color: #2ABFAA;
}

#nav ul {
	list-style-type: none;
	margin: 0 auto;
	width: 100%;
}

#nav li {
	float: left;
	width: 10%;
	text-align: center
}

#nav li a:link {
	font-size: 15px;
	color: #000000;
	width: 50px;
	text-decoration: none;
	text-align: center;
	font-family: "宋体";
}

#nav li a:hover {
	color: #F00
}

.s1 {
	border: solid 1px #000000;
	margin-bottom: 5px;
}

.s2 {
	border: solid 1px #000000;
	margin-top: 5px;
}

.s3 {
	height: 60px;
	clear: both;
}

.s4 {
	width: 900px;
	margin: 0 auto;
	margin-top: 40px;
	line-height: 40px;
	font-family: "宋体";
	color: #FF5F00;
	font-weight: bold
}

.s5 {
	border: solid 1px #000000;
	width: 900px;
	margin: 0 auto
}

.s6 {
	width: 860px;
	height: 380px;
	margin: 30px auto;
	border: solid 1px #440000
}

.footer {
	height: 20px;
	width: 100%;
	background-color: #2ABFAA;
	margin-top: 30px;
	font-size: 15px;
	text-align: center;
	color: #FFF
}

.inputstyle {
	font-size: 14px;
	font-family: "宋体";
	line-height: 40px;
}

.btn {
	font-size: 12px;
	margin-left: 100px;
}
</style>
</head>

<body>
	<div class="header">
		<div class="logo">
			<img src="images/logo.png" width="100%" height="61" />
		</div>
	</div>
	<!--end of header-->
	<div class="s1"></div>
	<div id="nav">
		<ul>
			<li><a href="index.jsp">资产管理</a></li>
			<li><a href="inquiry.jsp">资产查询</a></li>
			<li><a href="borrowmanage.jsp">借还管理</a></li>
			<li><a href="borrowInfo.jsp">借还查询</a></li>
			<li><a href="repairmanage.jsp">维修管理</a></li>
			<li><a href="repairInfo.jsp">维修查询</a></li>
			<li><a href="employee.jsp">员工管理</a></li>
			<li><a href="#">打印报表</a></li>
			<li><a href="changePw.jsp">修改密码</a></li>

		</ul>
	</div>
	<!--end of nav-->
	<div class="s2"></div>
	<div class="s4">
		<img src="images/employ.png" width="40" height="40" />增加员工信息
	</div>
	<div class="s5"></div>
	<!--end-->

	<div class="s6">
		<form action="" method="get" class="inputstyle">
			&nbsp;员工编号：<input name="" type="text" /> 姓名：<input name=""
				type="text" /> <br /> &nbsp;性&nbsp;&nbsp;别：<input name=""
				type="text" /> 年龄：<input name="" type="text" /> <br /> &nbsp;电话号码：<input
				name="" type="text" /> <br /> &nbsp;所在部门：<select>
				<option>教务处</option>
				<option>工学院</option>
				<option>商学院</option>
				<option>艺术学院</option>
			</select> &nbsp;&nbsp; 现任职务：<select>
				<option>辅导员</option>
				<option>高级教师</option>
				<option>特级教师</option>
			</select> <br />
			<div class="texareastyle">
				&nbsp;家庭住址：
				<textarea name="" cols="57" rows="5"></textarea>
			</div>
			<br />
			<div class="btn">
				<input name="" type="button" value="保存" />
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
