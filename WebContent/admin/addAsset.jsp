<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
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
<body>
	<jsp:include page="nav.jsp" />
	<div class="container" style="margin-top: 65px">
		<div class="row">
			<ol class="breadcrumb">
				<li><a href="#">资产管理</a></li>
				<li class="active">资产信息</li>
			</ol>
		
			<div class="s6">
				<form action="<%=path%>/AssetAddServ" method="post"
					class="inputstyle">
					资产编号：<input name="assetNo" type="text" /> 资产名称：<input
						name="assetName" type="text" /> <br /> 单价：<input
						name="assetUnitPrice" type="text" /> 生产厂商：<input
						name="manufacturer" type="text" /> <br /> 数量：<input type="text"
						name="assetNum" /> 使用单位：<input name="userCompany" type="text" />
					<br /> 存放地点：<input name="storagePlace" type="text" /> 购买人：<input
						name="purchaser" type="text" /> <br /> 资产类型： <select
						name="assetType">
						<option value="仪器">仪器</option>
						<option value="机电设备">机电设备</option>
						<option value="电子设备">电子设备</option>
						<option value="印刷设备">印刷设备</option>
						<option value="文体设备">文体设备</option>
						<option value="工具量具">工具量具</option>
					</select>资产状态： <select name="assetStatus">
						<option value="正常">正常</option>
						<option value="损坏">损坏</option>
						<option value="维修">维修</option>
					</select><br />
					<div class="texareastyle">
						备注信息：
						<textarea name="remark" cols="57" rows="5">
				</textarea>
					</div>
					<br />
					<div class="btn">
						<input name="" type="submit" value="保存" />
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a
							href="<%=path%>/QueryAssetInfoServ"> <input name=""
							type="button" value="返回" />
						</a>
					</div>
				</form>
			</div>


		</div>
	</div>
	<%@include file="bottom.jsp"%>
</body>
</html>
