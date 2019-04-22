package servlet;

import java.io.IOException;
import java.sql.Date;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.AdminDao;
import entity.AssetRepairInfo;

@WebServlet("/RepairInfoAddServ")
public class RepairInfoAddServ extends HttpServlet {

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8"); 
		response.setContentType("text/html;charset=utf-8");
		AssetRepairInfo repairInfo = new AssetRepairInfo();
		repairInfo.setAssetId(request.getParameter("assetId"));
//		repairInfo.setSendRepairTime(Date.valueOf(request.getParameter("sendRepairTime")));
		repairInfo.setSendRepairPerson(request.getParameter("sendRepairPerson"));
		repairInfo.setPassHandPerson(request.getParameter("passHandPerson"));
		repairInfo.setRepairReason(request.getParameter("repairReason"));
		AdminDao aDao = new AdminDao();
		if (aDao.addRepairInfo(repairInfo)) {
			request.getRequestDispatcher("/QueryAssetRepairInfoServ").forward(request, response);
		}else {
			request.getRequestDispatcher("/admin/addAssetErr.jsp").forward(request, response);
		}
	}

}
