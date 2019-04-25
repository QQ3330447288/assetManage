package dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import entity.Admin;
import entity.AssetInfo;
import entity.AssetLend;
import entity.AssetRepairInfo;
import entity.Employee;
import javafx.css.PseudoClass;
import utils.Md5;

public class AdminDao {
	/**
	 * ����Ա��¼
	 * 
	 * @param name
	 * @param pwd
	 * @return boolean
	 */
	public boolean login(String name, String pwd) {
		Connection conn = BaseDao.getConnection();
		pwd = Md5.md5(pwd, "Thanlon");
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
	 * ����ʲ�
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
	 * ��ѯ�����ʲ�
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
	 * �h���ʲ���Ϣ
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
	 * �����ʲ���Ų�ѯ
	 * 
	 * @param assetNo
	 * @return list���޸��ʲ���Ϣ
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
	 * �޸��ʲ���Ϣ
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
	 * ��ӆT����Ϣ
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
	 * ��ѯ�����ʲ�
	 * 
	 * @return list
	 * @throws SQLException
	 */
	public List<Employee> queryEmpInfo() throws SQLException {
		List<Employee> list = new ArrayList<Employee>();
		Connection conn = BaseDao.getConnection();
		if (conn != null) {
			String sql = "SELECT *FROM employee AS e" + " INNER JOIN post AS p ON e.post_id = p.id"
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
	 * ���ά����Ϣ
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
				stmt.setDate(2, null);
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
	 * ��ѯ�S����Ϣ
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
					assetRepairInfo.setId(rs.getInt("id"));
					// System.out.println(rs.getInt("id"));
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

	/**
	 * ����ʲ�
	 * 
	 * @param assetInfo
	 * @return
	 * @throws SQLException
	 */
	public boolean assetLendAdd(AssetLend assetLend) throws SQLException {
		Connection conn = BaseDao.getConnection();
		if (conn != null) {
			String sql = "INSERT lend(asset_id,employee_id,lendTime) " + "values(?,?,?)";
			PreparedStatement stmt = null;
			try {
				stmt = conn.prepareStatement(sql);
				stmt.setString(1, assetLend.getAsset_id());
				stmt.setString(2, assetLend.getEmployee_id());
				stmt.setDate(3, (Date) assetLend.getLendTime());
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
	 * ��ѯ�軹��Ϣ
	 * 
	 * @return list
	 * @throws SQLException
	 */
	public List<AssetLend> queryAssetLendInfo() throws SQLException {
		List<AssetLend> list = new ArrayList<AssetLend>();
		Connection conn = BaseDao.getConnection();
		if (conn != null) {
			String sql = "select *from lend";
			PreparedStatement stmt = null;
			ResultSet rs = null;
			try {
				stmt = conn.prepareStatement(sql);
				rs = stmt.executeQuery();
				while (rs.next()) {
					AssetLend assetLend = new AssetLend();
					assetLend.setId(rs.getInt("id"));
					assetLend.setAsset_id(rs.getString("asset_id"));
					assetLend.setEmployee_id(rs.getString("employee_id"));
					list.add(assetLend);
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
	 * �h������ʲ�
	 * 
	 * @param assetNo
	 * @return
	 */
	public boolean delAssetLend(String lendNo) {
		Connection conn = BaseDao.getConnection();
		if (conn != null) {
			String sql = "DELETE FROM lend WHERE id = ?";
			PreparedStatement stmt = null;
			try {
				stmt = conn.prepareStatement(sql);
				stmt.setString(1, lendNo);
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
	 * �h���ʲ�ά����Ϣ
	 * 
	 * @param assetNo
	 * @return
	 */
	public boolean delAssetRepair(String id) {
		Connection conn = BaseDao.getConnection();
		if (conn != null) {
			String sql = "DELETE FROM assetrepairinfo WHERE id = ?";
			PreparedStatement stmt = null;
			try {
				stmt = conn.prepareStatement(sql);
				stmt.setString(1, id);
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
	 * �h��Ա��
	 * 
	 * @param assetNo
	 * @return
	 */
	public boolean delEmp(String id) {
		Connection conn = BaseDao.getConnection();
		if (conn != null) {
			String sql = "DELETE FROM employee WHERE id = ?";
			PreparedStatement stmt = null;
			try {
				stmt = conn.prepareStatement(sql);
				stmt.setString(1, id);
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
	 * �����ʲ�id��ѯ
	 * 
	 * @param no
	 * @return list���޸��ʲ���Ϣ
	 * @throws SQLException
	 */
	public List<AssetRepairInfo> queryRepairByNo(String id) throws SQLException {
		List<AssetRepairInfo> list = new ArrayList<AssetRepairInfo>();
		Connection conn = BaseDao.getConnection();
		if (conn != null) {
			String sql = "select *from assetrepairinfo WHERE id = ?";
			PreparedStatement stmt = null;
			ResultSet rs = null;
			try {
				stmt = conn.prepareStatement(sql);
				stmt.setString(1, id);
				rs = stmt.executeQuery();
				while (rs.next()) {
					AssetRepairInfo assetRepairInfo = new AssetRepairInfo();
					assetRepairInfo.setAssetId(rs.getString("assetId"));
					assetRepairInfo.setSendRepairTime(rs.getDate("sendRepairTime"));
					assetRepairInfo.setSendRepairPerson(rs.getString("sendRepairPerson"));
					assetRepairInfo.setPassHandPerson(rs.getString("intermediator"));
					assetRepairInfo.setRepairReason(rs.getString("reason"));
					assetRepairInfo.setId(rs.getInt("id"));
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

	/**
	 * �޸�ά����Ϣ
	 * 
	 * @param assetInfo
	 * @return
	 * @throws SQLException
	 */
	public boolean assetRepairEdit(AssetRepairInfo repairInfo) {
		Connection conn = BaseDao.getConnection();
		if (conn != null) {
			String sql = "UPDATE assetrepairinfo SET assetId=?,sendRepairPerson=?,intermediator=?,reason=? WHERE id=?";
			PreparedStatement stmt = null;
			try {
				stmt = conn.prepareStatement(sql);
				stmt.setString(1, repairInfo.getAssetId());
				stmt.setString(2, repairInfo.getSendRepairPerson());
				stmt.setString(3, repairInfo.getPassHandPerson());
				stmt.setString(4, repairInfo.getRepairReason());
//				System.out.println(repairInfo.getId());
				stmt.setInt(5, repairInfo.getId());
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
	 * Ա����Ϣ�޸� ����Ա��id��ѯ
	 * 
	 * @param no
	 * @return list���޸��ʲ���Ϣ
	 * @throws SQLException
	 */
	public List<Employee> queryEmpByNo(String id) throws SQLException {
		List<Employee> list = new ArrayList<Employee>();
		Connection conn = BaseDao.getConnection();
		if (conn != null) {
			String sql = "select *from employee WHERE id = ?";
			PreparedStatement stmt = null;
			ResultSet rs = null;
			try {
				stmt = conn.prepareStatement(sql);
				stmt.setString(1, id);
				rs = stmt.executeQuery();
				while (rs.next()) {
					Employee emp = new Employee();
					emp.setId(rs.getString("id"));
					emp.setName(rs.getString("name"));
					emp.setSex_id(rs.getByte("sex_id"));
					emp.setAge(rs.getInt("age"));
					emp.setDepartment_id(rs.getInt("department_id"));
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
	 * �༭�T����Ϣ
	 * 
	 * @param assetInfo
	 * @return
	 * @throws SQLException
	 */
	public boolean empEdit(Employee emp) {
		Connection conn = BaseDao.getConnection();
		if (conn != null) {
			String sql = "UPDATE employee SET name=?,sex_id=?,age=?,department_id=?,post_id=?,address=?,phone=?,status=? WHERE id=?";
			PreparedStatement stmt = null;
			try {
				stmt = conn.prepareStatement(sql);

				stmt.setString(1, emp.getName());
//				System.out.println(emp.getName());
				stmt.setByte(2, emp.getSex_id());
				stmt.setInt(3, emp.getAge());
				stmt.setInt(4, emp.getDepartment_id());
				stmt.setInt(5, emp.getPost_id());
				stmt.setString(6, emp.getAddress());
				stmt.setString(7, emp.getPhone());
				stmt.setString(8, emp.getStatus());
//				System.out.println(emp.getStatus());
				stmt.setString(9, emp.getId());
//				System.out.println(emp.getId());
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
	 * �����ʲ����Ʋ�ѯ�ʲ�
	 * 
	 * @return list
	 * @throws SQLException
	 */
	public List<AssetInfo> queryAssetByName(String assetName) throws SQLException {
		List<AssetInfo> list = new ArrayList<AssetInfo>();
		Connection conn = BaseDao.getConnection();
		if (conn != null) {
			//System.out.println(assetName);
			String sql = "SELECT *FROM assetInfo WHERE assetName LIKE '%" + assetName + "%'";
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
}
