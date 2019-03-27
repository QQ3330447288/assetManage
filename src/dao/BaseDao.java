package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class BaseDao {

	public static Connection getConnection() {
		Connection conn = null;// 数据库连接
		try {
			Class.forName("com.mysql.jdbc.Driver"); // 加载数据库驱动，注册到驱动管理器
			// 数据库连接字符串
			String url = "jdbc:mysql://localhost:3306/asset?useSSL=false";
			String username = "root"; // 数据库用户名
			String password = "nxl123"; // 数据库密码
			conn = DriverManager.getConnection(url, username, password);// 创建Connection连接
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return conn;
	}

}
