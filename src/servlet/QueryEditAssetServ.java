package servlet;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.AdminDao;
import entity.AssetInfo;


@WebServlet("/QueryEditAssetServ")
public class QueryEditAssetServ extends HttpServlet {
	String assetNo;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		assetNo = request.getParameter("assetNo");
		doPost(request, response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		AdminDao aDao = new AdminDao();
		List<AssetInfo> list;
		try {
			list = aDao.queryAssetInfoByAssetNo(assetNo);
			if (list!=null&&list.size()>0) {
				request.setAttribute("list", list);
				request.getRequestDispatcher("/admin/editAsset.jsp").forward(request, response);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}
