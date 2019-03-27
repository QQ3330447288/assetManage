<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="<%=path%>/static/css/repairManage.css" />
</head>
<body>
	<jsp:include page="top.jsp" />
	<jsp:include page="nav.jsp" />
	<div class="s2"></div>
	<div class="s4">
		<img src="images/tongs.png" width="40" height="50" />资产维修操作
	</div>
	<div class="s5"></div>
	<!--end-->

	<div class="form">
		<form action="" method="get" class="inputstyle">
			&nbsp;&nbsp;资产编号：<input name="" type="text" /> 送修时间：<input name=""
				type="text" /> <br /> &nbsp;&nbsp;送修人&nbsp;：<input name=""
				type="text" /> 经手人&nbsp;：<input name="" type="text" /> <br />

			&nbsp;&nbsp;故障原因：
			<textarea name="" cols="57" rows="5"></textarea>

		</form>
		<div class="btn">
			<input name="" type="button" value="确认送修" />
		</div>

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
				<td align="center" bgcolor="#33FFFF">资产编号</td>
				<td align="center" bgcolor="#33FFFF">送修时间</td>
				<td align="center" bgcolor="#33FFFF">送修人</td>
				<td align="center" bgcolor="#33FFFF">经手人</td>
				<td align="center" bgcolor="#33FFFF">故障原因</td>
				<td align="center" bgcolor="#33FFFF">操作</td>
			</tr>
		</table>
	</div>
	<%@include file="bottom.jsp"%>
</body>
</html>