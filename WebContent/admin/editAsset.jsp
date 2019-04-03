<%@page import="entity.AssetInfo"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	String admin = (String) session.getAttribute("admin");
	//System.out.print(admin);
	if (admin == null || "".equals(admin)) {
		response.sendRedirect("" + path + "/admin/login.jsp");
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>编辑资产信息</title>
<link rel="stylesheet" href="<%=path%>/static/css/addAsset.css">
<style>
#nav>ul>li>#item2 {
	color: red
}
</style>
</head>
<body>
	<jsp:include page="top.jsp" />
	<jsp:include page="nav.jsp" />
	<div class="s2"></div>
	<div class="s4">
		<img src="images/Helpbook.png" width="40" height="40" />资产管理 / 修改资产信息
	</div>
	<div class="s5"></div>
	<div class="s6">
		<form action="<%=path%>/AssetEditServ" method="post"
			class="inputstyle">
			<%
				List<AssetInfo> list = (List<AssetInfo>) request.getAttribute("list");
				if (list != null && list.size() > 0) {
					for (AssetInfo v : list) {
			%>
			资产编号：<input value="<%=v.getAssetNo()%>" name="assetNo" type="text"
				value="<%=v.getAssetNo()%>" /> 资产名称：<input name="assetName"
				type="text" value="<%=v.getAssetName()%>" /> <br /> 单价：<input
				name="assetUnitPrice" type="text" value="<%=v.getAssetUnitPrice()%>" />
			生产厂商：<input name="manufacturer" type="text"
				value="<%=v.getManufacturer()%>" /> <br /> 数量：<input type="text"
				name="assetNum" value="<%=v.getAssetNum()%>" /> 使用单位：<input
				name="userCompany" type="text" value="<%=v.getUserCompany()%>" /> <br />
			存放地点：<input name="storagePlace" type="text"
				value="<%=v.getStoragePlace()%>" /> 购买人：<input name="purchaser"
				type="text" value="<%=v.getPurchaser()%>" /> <br /> 资产类型： <select
				name="assetType">
				<%
					if ("仪器".equals(v.getAssetType())) {
				%>
				<option value="仪器" selected="selected">仪器</option>
				<option value="机电设备">机电设备</option>
				<option value="电子设备">电子设备</option>
				<option value="印刷设备">印刷设备</option>
				<option value="文体设备">文体设备</option>
				<option value="工具量具">工具量具</option>
				<%
					} else if ("机电设备".equals(v.getAssetType())) {
				%>
				<option value="仪器">仪器</option>
				<option value="机电设备" selected="selected">机电设备</option>
				<option value="电子设备">电子设备</option>
				<option value="印刷设备">印刷设备</option>
				<option value="文体设备">文体设备</option>
				<option value="工具量具">工具量具</option>
				<%
					} else if ("电子设备".equals(v.getAssetType())) {
				%>
				<option value="仪器">仪器</option>
				<option value="机电设备">机电设备</option>
				<option value="电子设备" selected="selected">电子设备</option>
				<option value="印刷设备">印刷设备</option>
				<option value="文体设备">文体设备</option>
				<option value="工具量具">工具量具</option>
				<%
					} else if ("印刷设备".equals(v.getAssetType())) {
				%>
				<option value="仪器">仪器</option>
				<option value="机电设备">机电设备</option>
				<option value="电子设备">电子设备</option>
				<option value="印刷设备" selected="selected">印刷设备</option>
				<option value="文体设备">文体设备</option>
				<option value="工具量具">工具量具</option>
				<%
					} else if ("文体设备".equals(v.getAssetType())) {
				%>
				<option value="仪器">仪器</option>
				<option value="机电设备">机电设备</option>
				<option value="电子设备">电子设备</option>
				<option value="印刷设备" >印刷设备</option>
				<option value="文体设备" selected="selected">文体设备</option>
				<option value="工具量具">工具量具</option>
				<%
				} else {
				%>
				<option value="仪器">仪器</option>
				<option value="机电设备">机电设备</option>
				<option value="电子设备">电子设备</option>
				<option value="印刷设备">印刷设备</option>
				<option value="文体设备">文体设备</option>
				<option value="工具量具" selected="selected">工具量具</option>
				<%
				}
				%>
			</select> 资产状态： <select name="assetStatus">
				<%
					if ("正常".equals(v.getAssetStatus())) {
				%>
				<option value="正常" selected="selected">正常</option>
				<option value="损坏">损坏</option>
				<option value="维修">维修</option>
				<%
					} else if ("损坏".equals(v.getAssetStatus())) {
				%>
				<option value="正常">正常</option>
				<option value="损坏" selected="selected">损坏</option>
				<option value="维修">维修</option>
				<%
					} else {
				%>
				<option value="正常">正常</option>
				<option value="损坏">损坏</option>
				<option value="维修" selected="selected">维修</option>
				<%
					}
				%>
			</select><br />
			<div class="texareastyle">
				备注信息：
				<textarea name="remark" cols="57" rows="5"><%=v.getRemark()%>
				</textarea>
			</div>
			<br />
			<%
				}
				}
			%>
			<div class="btn">
				<input type="submit" value="修改" />
				<a href="<%=path%>/QueryAssetInfoServ">
					<input name="" type="button" value="返回" />
				</a>
			</div>
		</form>
	</div>
	<div class="footer">
		<p>Copyright©2019-2088&nbsp;济南大学泉城学院所有</p>
	</div>
</body>
</html>
