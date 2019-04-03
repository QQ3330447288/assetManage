package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import entity.Admin;
import entity.AssetInfo;
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
	 * 添加资产
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
}
