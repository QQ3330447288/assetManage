package servlet;

import java.io.IOException;

import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.sql.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



import dao.AdminDao;
import entity.AssetInfo;
import entity.AssetLend;

@WebServlet("/AssetLendAddServ")
public class AssetLendAddServ extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8"); 
		response.setContentType("text/html;charset=utf-8");
		AssetLend assetLend= new AssetLend();
		assetLend.setAsset_id(request.getParameter("asset_id"));
		assetLend.setEmployee_id(request.getParameter("employee_id"));
		Date date = new Date();
//		SimpleDateFormat ft = new SimpleDateFormat ("yyyy-MM-dd hh:mm:ss");
//		String nowDate = ft.format(date);
//		assetLend.setLendTime();
		AdminDao aDao = new AdminDao();
		try {
			if (aDao.assetLendAdd(assetLend)) {
				request.getRequestDispatcher("/QueryAssetLendInfoServ").forward(request, response);
			}else {
				request.getRequestDispatcher("/admin/addAssetErr.jsp").forward(request, response);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

}
