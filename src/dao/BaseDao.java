package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class BaseDao {

	public static Connection getConnection() {
		Connection conn = null;// ���ݿ�����
		try {
			Class.forName("com.mysql.jdbc.Driver"); // �������ݿ�������ע�ᵽ����������
			// ���ݿ������ַ���
			String url = "jdbc:mysql://localhost:3306/asset?useSSL=false";
			String username = "root"; // ���ݿ��û���
			String password = "nxl123"; // ���ݿ�����
			conn = DriverManager.getConnection(url, username, password);// ����Connection����
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return conn;
	}

}
