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
<title>添加资产</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<link rel="stylesheet" type="text/css" href="<%=path%>/static/css/addAssets.css">
</head>
<body>
	<jsp:include page="top.jsp" />
	<jsp:include page="nav.jsp" />
	<div class="s2"></div>
	<div class="s4">
		<img src="images/Helpbook.png" width="40" height="40" />增加资产信息
	</div>
	<div class="s5"></div>
	<div class="s6">
		<form action="" method="get" class="inputstyle">
			&nbsp;资产编号：<input name="" type="text" /> 资产名称：<input name=""
				type="text" /> <br /> &nbsp;单&nbsp;&nbsp;价：<input name=""
				type="text" /> 生产厂商：<input name="" type="text" /> <br />
			&nbsp;数&nbsp;&nbsp;量：<input name="" type="text" /> 使用单位：<input
				name="" type="text" /> <br /> &nbsp;存放地点：<input name="" type="text" />
			购买人：&nbsp;<input name="" type="text" /> <br /> &nbsp;资产类型：<select>
				<option>仪器</option>
				<option>机电设备</option>
				<option>电子设备</option>
				<option>印刷设备</option>
				<option>文体设备</option>
				<option>工具量具</option>
			</select> &nbsp;&nbsp; 资产状态：<select>
				<option>正常</option>
				<option>损坏</option>
				<option>维修</option>
			</select> <br />
			<div class="texareastyle">
				&nbsp;备注信息：
				<textarea name="" cols="57" rows="5"></textarea>
			</div>
			<br />
			<div class="btn">
				<input name="" type="button" value="保存" />
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href="index.jsp"><input
					name="" type="button" value="返回" />
			</div>
			</a>
		</form>
	</div>
	<div class="footer">
		<p>Copyright©2019-2088&nbsp;济南大学泉城学院所有</p>
	</div>
</body>
</html>
