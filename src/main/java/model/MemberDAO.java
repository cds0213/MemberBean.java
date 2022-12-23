package model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Vector;

public class MemberDAO {
	String idDB = "scott";
	String passDB = "tiger";
	String url = "jdbc:oracle:thin:@localhost:1521:xe";

	Connection conn;
	PreparedStatement pstmt;
	ResultSet rs;

	public void getcon() {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			conn = DriverManager.getConnection(url, idDB, passDB);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	private static MemberDAO instance = new MemberDAO();

	public static MemberDAO getInstance() {
		return instance;
	}

	public void insertMember(MemberBean mbean) {

		try {
			getcon();
			String sql = "insert into memberInfo values(?,?,?,?,?,?,?,?)";
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, mbean.getId());
			pstmt.setString(2, mbean.getPw1());
			pstmt.setString(3, mbean.getEmail());
			pstmt.setString(4, mbean.getTel());
			pstmt.setString(5, mbean.getHobby());
			pstmt.setString(6, mbean.getJob());
			pstmt.setString(7, mbean.getAge());
			pstmt.setString(8, mbean.getInfo());

			pstmt.executeUpdate(); // insert,update,delete
			conn.close();

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public Vector<MemberBean> allSelectMember() {

		// 가변 길이로 데이터를 저장
		Vector<MemberBean> vec = new Vector<MemberBean>();

		try {
			getcon();
			String sql = "select * from memberInfo";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				MemberBean mbean = new MemberBean();
				mbean.setId(rs.getString(1));
				mbean.setPw1(rs.getString(2));
				mbean.setEmail(rs.getString(3));
				mbean.setTel(rs.getString(4));
				mbean.setHobby(rs.getString(5));
				mbean.setJob(rs.getString(6));
				mbean.setAge(rs.getString(7));
				mbean.setInfo(rs.getString(8));
				vec.add(mbean);
			}
			conn.close();

		} catch (Exception e) {
			e.printStackTrace();
		}

		return vec;
	}

	public MemberBean oneSelectMember(String id) {
		MemberBean mbean = new MemberBean();

		try {
			getcon();

			String sql = "select * from memberInfo where id=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				mbean.setId(rs.getString(1));
				mbean.setPw1(rs.getString(2));
				mbean.setEmail(rs.getString(3));
				mbean.setTel(rs.getString(4));
				mbean.setHobby(rs.getString(5));
				mbean.setJob(rs.getString(6));
				mbean.setAge(rs.getString(7));
				mbean.setInfo(rs.getString(8));
			}

			conn.close();

		} catch (Exception e) {
			e.printStackTrace();
		}

		return mbean;
	}

	public void updateMember(MemberBean bean) {
		getcon();

		try {
			String sql = "update memberInfo set email=?, tel=? where id=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, bean.getEmail());
			pstmt.setString(2, bean.getTel());
			pstmt.setString(3, bean.getId());

			pstmt.executeUpdate();
			conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public String getPw1(String id) {
		String pw1 = "";
		getcon();

		try {
			String sql = "select pw1 from memberInfo where id=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				pw1 = rs.getString(1);
			}
			conn.close();

		} catch (Exception e) {
			e.printStackTrace();
		}

		return pw1;
	}

	public void deleteMember(String id) {
		getcon();

		try {
			String sql = "delete from memberInfo where id=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.executeUpdate();

			conn.close();

		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	public MemberBean searchId(String id) throws Exception {
		getcon();
		
		MemberBean sid = null;

		try {

			String sql = "select * from memberInfo where id=?";

			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				sid = new MemberBean();
				sid.setId(rs.getString("id"));
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return sid;
	}

}