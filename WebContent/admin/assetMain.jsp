<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@page import="entity.AssetInfo"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
			<button type="button" class="btn btn-primary" data-toggle="modal"
				data-target="#myModal" style="background: #a94442">增加资产信息</button>
			<table class="table table-hover">
				<tr>
					<th>资产编号</th>
					<th>资产名称</th>
					<th>生产厂商</th>
					<th>单价</th>
					<th>数量</th>
					<th>使用单位</th>
					<th>存放地点</th>
					<th>购买人</th>
					<th>资产类型</th>
					<th>状态</th>
					<th>操作</th>
				</tr>
				<%
					List<AssetInfo> list = (List<AssetInfo>) request.getAttribute("list");
					if (list == null || list.size() < 1) {
						out.print("<tr><td bgcolor='#FFFFFF' colspan='5'>没有任何资产信息！</td></tr>");
					} else {
						for (AssetInfo v : list) {
				%>
				<tr>
					<td><%=v.getAssetNo()%></td>
					<td><%=v.getAssetName()%></td>
					<td><%=v.getManufacturer()%></td>
					<td><%=v.getAssetUnitPrice()%></td>
					<td><%=v.getAssetNum()%></td>
					<td><%=v.getUserCompany()%></td>
					<td><%=v.getStoragePlace()%></td>
					<td><%=v.getPurchaser()%></td>
					<td><%=v.getAssetType()%></td>
					<td><%=v.getAssetStatus()%></td>
					<td><a
						href="<%=path%>/QueryEditAssetServ?assetNo=<%=v.getAssetNo()%>">编辑</a>
						<a href="<%=path%>/DelAssetInfoServ?assetNo=<%=v.getAssetNo()%>"
						onclick="return confirm('确认删除？')">&nbsp;&nbsp;删除</a></td>
				</tr>
				<%
					}
					}
				%>
			</table>
			<nav aria-label="Page navigation" class="text-center">
				<ul class="pagination">
					<li><a href="#" aria-label="Previous"> <span
							aria-hidden="true">&laquo;</span>
					</a></li>
					<li class="active"><a href="#">1</a></li>
					<li><a href="#">2</a></li>
					<li><a href="#">3</a></li>
					<li><a href="#">4</a></li>
					<li><a href="#">5</a></li>
					<li><a href="#" aria-label="Next"> <span
							aria-hidden="true">&raquo;</span>
					</a></li>
				</ul>
			</nav>
		</div>
	</div>
	<!-- Modal -->
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<form>
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
						<h4 class="modal-title" id="myModalLabel">添加资产信息</h4>
					</div>
					<div class="modal-body">
						<div class="form-inline" style="margin-top: 5px">
							<div class="form-group">
								<label for="">资产编号：</label> <input type="text"
									class="form-control" id="exampleInputEmail1"
									placeholder="Email"> <label for="">资产名称：</label><input
									type="text" class="form-control" id="exampleInputEmail1"
									placeholder="Email">
							</div>
						</div>
						<div class="form-inline" style="margin-top: 5px">
							<div class="form-group">
								<label for="">单&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;价：</label>
								<input type="text" class="form-control"
									id="exampleInputPassword1" placeholder="Password"> <label
									for="">生产厂商：</label> <input type="text" class="form-control"
									id="exampleInputPassword1" placeholder="Password">
							</div>
						</div>
						<div class="form-inline" style="margin-top: 5px">
							<div class="form-group">
								<label for="">数&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;量：</label>
								<input type="text" class="form-control"
									id="exampleInputPassword1" placeholder="Password"> <label
									for="">使用单位：</label> <input type="text" class="form-control"
									id="exampleInputPassword1" placeholder="Password">
							</div>
						</div>
						<div class="form-inline" style="margin-top: 5px">
							<div class="form-group">
								<label for="">存放地点：</label> <input type="text"
									class="form-control" id="exampleInputPassword1"
									placeholder="Password"> <label for="">购买人：</label> <input
									type="text" class="form-control" id="exampleInputPassword1"
									placeholder="Password">
							</div>
						</div>
						<div class="form-inline" style="margin-top: 5px">
							<label>资产类型：</label><select class="form-control">
								<option>仪器</option>
								<option>机电设备</option>
								<option>电子设备</option>
								<option>印刷设备</option>
								<option>问题设备</option>
							</select> <label>资产状态：</label><select class="form-control">
								<option>正常</option>
								<option>损坏</option>
								<option>维修</option>
							</select>
						</div>
						<label>备注信息：</label>
						<textarea class="form-control" rows="3"></textarea>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
						<button type="submit" class="btn btn-primary">添加</button>
					</div>
				</div>
			</form>
		</div>
	</div>
	<%@include file="bottom.jsp"%>
</body>
</html>