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

@WebServlet("/QueryAssetInfoServ")
public class QueryAssetInfoServ extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		AdminDao aDao = new AdminDao();
		List<AssetInfo> list;
		try {
			list = aDao.queryAssetInfo();
			if (list!=null) {
				request.setAttribute("list", list);
				request.getRequestDispatcher("/admin/assetMain.jsp").forward(request, response);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}
}
