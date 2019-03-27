package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import entity.Admin;
import utils.Md5;

public class AdminDao {

	public boolean login(String name, String pwd) {
		List<Admin> list = new ArrayList<Admin>();
		Connection conn = BaseDao.getConnection();
		pwd = Md5.md5(pwd, "xuhui");
		if (conn != null) {
			String sql = "select *from admin where name='" + name + "' and pwd='" + pwd + "'";
			PreparedStatement stmt;
			ResultSet rs;
			try {
				stmt = conn.prepareStatement(sql);
				rs = stmt.executeQuery();
				if (rs.next()) {
					return true;
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return false;
	}
}
