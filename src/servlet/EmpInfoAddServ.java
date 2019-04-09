package servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.AdminDao;
import entity.Employee;

@WebServlet("/EmpInfoAddServ")
public class EmpInfoAddServ extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html,charset=utf-8");
		Employee emp = new Employee();
		emp.setId(request.getParameter("id"));
		emp.setName(request.getParameter("name"));
		emp.setSex_id(Byte.parseByte(request.getParameter("sex_id")));
		emp.setAge(Integer.parseInt(request.getParameter("age")));
		emp.setDepartment_id(Integer.parseInt(request.getParameter("department_id")));
		emp.setPost_id(Integer.parseInt(request.getParameter("post_id")));
		emp.setAddress(request.getParameter("address"));
		emp.setPhone(request.getParameter("phone"));
		emp.setStatus(request.getParameter("status"));
		AdminDao aDao = new AdminDao();
		if (aDao.empAdd(emp)) {
			request.getRequestDispatcher("/admin/addEmpSuccess.jsp").forward(request, response);
		} else {
			request.getRequestDispatcher("/admin/addEmpErr.jsp").forward(request, response);
		}
	}
}
