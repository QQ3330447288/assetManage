package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import entity.Admin;
import entity.AssetInfo;
import entity.AssetRepairInfo;
import entity.Employee;
import javafx.css.PseudoClass;
import utils.Md5;

public class AdminDao {
	/**
	 * 登录
	 * 
	 * @param name
	 * @param pwd
	 * @return 是否登录
	 */
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
				e.printStackTrace();
			}
		}
		return false;
	}

	/**
	 * 添加资产
	 * 
	 * @param assetInfo
	 * @return
	 * @throws SQLException
	 */
	public boolean assetAdd(AssetInfo assetInfo) throws SQLException {
		Connection conn = BaseDao.getConnection();
		if (conn != null) {
			String sql = "INSERT assetInfo("
					+ "assetNo,assetName,assetUnitPrice,manufacturer,assetNum,userCompany,storagePlace,purchaser,assetType,assetStatus,remark)"
					+ "values(?,?,?,?,?,?,?,?,?,?,?)";
			PreparedStatement stmt = null;
			try {
				stmt = conn.prepareStatement(sql);
				stmt.setString(1, assetInfo.getAssetNo());
				stmt.setString(2, assetInfo.getAssetName());
				stmt.setFloat(3, assetInfo.getAssetUnitPrice());
				stmt.setString(4, assetInfo.getManufacturer());
				stmt.setInt(5, assetInfo.getAssetNum());
				stmt.setString(6, assetInfo.getUserCompany());
				stmt.setString(7, assetInfo.getStoragePlace());
				stmt.setString(8, assetInfo.getPurchaser());
				stmt.setString(9, assetInfo.getAssetType());
				stmt.setString(10, assetInfo.getAssetStatus());
				stmt.setString(11, assetInfo.getRemark());
				int row = stmt.executeUpdate();
				if (row >= 1) {
					return true;
				}

			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				stmt.close();
				conn.close();
			}
		}
		return false;
	}

	/**
	 * 查询所有资产
	 * 
	 * @return list
	 * @throws SQLException
	 */
	public List<AssetInfo> queryAssetInfo() throws SQLException {
		List<AssetInfo> list = new ArrayList<AssetInfo>();
		Connection conn = BaseDao.getConnection();
		if (conn != null) {
			String sql = "select *from assetInfo";
			PreparedStatement stmt = null;
			ResultSet rs = null;
			try {
				stmt = conn.prepareStatement(sql);
				rs = stmt.executeQuery();
				while (rs.next()) {
					AssetInfo assetInfo = new AssetInfo();
					assetInfo.setAssetNo(rs.getString("assetNo"));
					assetInfo.setAssetName(rs.getString("assetName"));
					assetInfo.setAssetUnitPrice(rs.getFloat("assetUnitPrice"));
					assetInfo.setManufacturer(rs.getString("manufacturer"));
					assetInfo.setAssetNum(rs.getInt("assetNum"));
					assetInfo.setUserCompany(rs.getString("userCompany"));
					assetInfo.setStoragePlace(rs.getString("storagePlace"));
					assetInfo.setAssetType(rs.getString("assetType"));
					assetInfo.setAssetStatus(rs.getString("assetStatus"));
					assetInfo.setRemark(rs.getString("remark"));
					assetInfo.setPurchaser(rs.getString("purchaser"));
					list.add(assetInfo);
				}
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				rs.close();
				stmt.close();
				conn.close();
			}
		}
		return list;
	}

	/**
	 * 刪除资产信息
	 * 
	 * @param assetNo
	 * @return
	 */
	public boolean delAssetInfo(String assetNo) {
		Connection conn = BaseDao.getConnection();
		if (conn != null) {
			String sql = "DELETE FROM assetInfo WHERE assetNo = ?";
			PreparedStatement stmt = null;
			try {
				stmt = conn.prepareStatement(sql);
				stmt.setString(1, assetNo);
				int row = stmt.executeUpdate();
				System.out.println(row);
				if (row >= 1) {
					return true;
				}
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				try {
					stmt.close();
					conn.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
		return false;
	}

	/**
	 * 根据资产编号查询
	 * 
	 * @param assetNo
	 * @return list到修改资产信息
	 * @throws SQLException
	 */
	public List<AssetInfo> queryAssetInfoByAssetNo(String assetNo) throws SQLException {
		List<AssetInfo> list = new ArrayList<AssetInfo>();
		Connection conn = BaseDao.getConnection();
		if (conn != null) {
			String sql = "select *from assetInfo WHERE assetNo = ?";
			PreparedStatement stmt = null;
			ResultSet rs = null;
			try {
				stmt = conn.prepareStatement(sql);
				stmt.setString(1, assetNo);
				rs = stmt.executeQuery();
				while (rs.next()) {
					AssetInfo assetInfo = new AssetInfo();
					assetInfo.setAssetNo(rs.getString("assetNo"));
					assetInfo.setAssetName(rs.getString("assetName"));
					assetInfo.setAssetUnitPrice(rs.getFloat("assetUnitPrice"));
					assetInfo.setManufacturer(rs.getString("manufacturer"));
					assetInfo.setAssetNum(rs.getInt("assetNum"));
					assetInfo.setUserCompany(rs.getString("userCompany"));
					assetInfo.setStoragePlace(rs.getString("storagePlace"));
					assetInfo.setAssetType(rs.getString("assetType"));
					assetInfo.setAssetStatus(rs.getString("assetStatus"));
					assetInfo.setRemark(rs.getString("remark"));
					assetInfo.setPurchaser(rs.getString("purchaser"));
					list.add(assetInfo);
				}
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				rs.close();
				stmt.close();
				conn.close();
			}
		}
		return list;
	}

	/**
	 * 修改资产信息
	 * 
	 * @param assetInfo
	 * @return
	 * @throws SQLException
	 */
	public boolean assetEdit(AssetInfo assetInfo) {
		Connection conn = BaseDao.getConnection();
		if (conn != null) {
			String sql = "UPDATE assetInfo set assetNo=?,assetName=?,assetUnitPrice=?,manufacturer=?,assetNum=?,userCompany=?,storagePlace=?,purchaser=?,assetType=?,assetStatus=?,remark=?";
			PreparedStatement stmt = null;
			try {
				stmt = conn.prepareStatement(sql);
				stmt.setString(1, assetInfo.getAssetNo());
				stmt.setString(2, assetInfo.getAssetName());
				stmt.setFloat(3, assetInfo.getAssetUnitPrice());
				stmt.setString(4, assetInfo.getManufacturer());
				stmt.setInt(5, assetInfo.getAssetNum());
				stmt.setString(6, assetInfo.getUserCompany());
				stmt.setString(7, assetInfo.getStoragePlace());
				stmt.setString(8, assetInfo.getPurchaser());
				stmt.setString(9, assetInfo.getAssetType());
				stmt.setString(10, assetInfo.getAssetStatus());
				stmt.setString(11, assetInfo.getRemark());
				int row = stmt.executeUpdate();
				if (row >= 1) {
					return true;
				}

			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				try {
					stmt.close();
					conn.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
		return false;
	}

	/**
	 * 添加资产
	 * 
	 * @param assetInfo
	 * @return
	 * @throws SQLException
	 */
	public boolean empAdd(Employee emp) {
		Connection conn = BaseDao.getConnection();
		if (conn != null) {
			String sql = "INSERT employee(" + "id,name,sex_id,age,department_id,post_id,address,phone,status)"
					+ "values(?,?,?,?,?,?,?,?,?)";
			PreparedStatement stmt = null;
			try {
				stmt = conn.prepareStatement(sql);
				stmt.setString(1, emp.getId());
				stmt.setString(2, emp.getName());
				stmt.setByte(3, emp.getSex_id());
				stmt.setInt(4, emp.getAge());
				stmt.setInt(5, emp.getDepartment_id());
				stmt.setInt(6, emp.getPost_id());
				stmt.setString(7, emp.getAddress());
				stmt.setString(8, emp.getPhone());
				stmt.setString(9, emp.getStatus());
				int row = stmt.executeUpdate();
				if (row >= 1) {
					return true;
				}

			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				try {
					stmt.close();
					conn.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
		return false;
	}

	/**
	 * 查询所有资产
	 * 
	 * @return list
	 * @throws SQLException
	 */
	public List<Employee> queryEmpInfo() throws SQLException {
		List<Employee> list = new ArrayList<Employee>();
		Connection conn = BaseDao.getConnection();
		if (conn != null) {
			String sql = "SELECT *FROM employee AS e"
					+ " INNER JOIN post AS p ON e.post_id = p.id"
					+ " INNER JOIN department as d ON d.id = e.department_id";
			PreparedStatement stmt = null;
			ResultSet rs = null;
			try {
				stmt = conn.prepareStatement(sql);
				rs = stmt.executeQuery();
				while (rs.next()) {
					Employee emp = new Employee();
					emp.setId(rs.getString("id"));
					emp.setName(rs.getString("name"));
					emp.setSex_id(rs.getByte("sex_id"));
					emp.setAge(rs.getInt("age"));
					emp.setDepart_name(rs.getString("depart_name"));
					emp.setPost_name(rs.getString("post_name"));
					emp.setPost_id(rs.getInt("post_id"));
					emp.setAddress(rs.getString("address"));
					emp.setPhone(rs.getString("phone"));
					emp.setStatus(rs.getString("status"));
					list.add(emp);
				}
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				rs.close();
				stmt.close();
				conn.close();
			}
		}
		return list;
	}
	/**
	 * 添加维修信息
	 * 
	 * @param assetInfo
	 * @return
	 * @throws SQLException
	 */
	public boolean addRepairInfo(AssetRepairInfo repairInfo) {
		Connection conn = BaseDao.getConnection();
		if (conn != null) {
			String sql = "INSERT assetrepairinfo(" + "assetId,sendRepairTime,sendRepairPerson,intermediator,reason)"
					+ "values(?,?,?,?,?)";
			PreparedStatement stmt = null;
			try {
				stmt = conn.prepareStatement(sql);
				stmt.setString(1, repairInfo.getAssetId());
				stmt.setDate(2,null);
				stmt.setString(3, repairInfo.getSendRepairPerson());
				stmt.setString(4, repairInfo.getPassHandPerson());
				stmt.setString(5, repairInfo.getRepairReason());
				int row = stmt.executeUpdate();
				if (row >= 1) {
					return true;
				}

			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				try {
					stmt.close();
					conn.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
		return false;
	}
	/**
	 * 查询維修信息
	 * 
	 * @return list
	 * @throws SQLException
	 */
	public List<AssetRepairInfo> queryAssetRepairInfo() throws SQLException {
		List<AssetRepairInfo> list = new ArrayList<AssetRepairInfo>();
		Connection conn = BaseDao.getConnection();
		if (conn != null) {
			String sql = "select *from assetrepairinfo";
			PreparedStatement stmt = null;
			ResultSet rs = null;
			try {
				stmt = conn.prepareStatement(sql);
				rs = stmt.executeQuery();
				while (rs.next()) {
					AssetRepairInfo assetRepairInfo = new AssetRepairInfo();
					assetRepairInfo.setAssetId(rs.getString("assetId"));
					assetRepairInfo.setSendRepairTime(rs.getDate("sendRepairTime"));
					assetRepairInfo.setSendRepairPerson(rs.getString("sendRepairPerson"));
					assetRepairInfo.setPassHandPerson(rs.getString("intermediator"));
					assetRepairInfo.setRepairReason(rs.getString("reason"));
					list.add(assetRepairInfo);
				}
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				rs.close();
				stmt.close();
				conn.close();
			}
		}
		return list;
	}

}
