package com.tap.DAOImpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import com.tap.DAOInterface.UserDAO;
import com.tap.model.User;
import com.tap.utility.DBConnection;

public class UserDAOImpl implements UserDAO {

	public static final String INSERT_QUERY = "INSERT INTO user (name,email,password,address,role, "
			+ "last_login_at) VALUES (?,?,?,?,?,?)";

	public static final String SELECT_QUERY = "SELECT * FROM user  "
			+ "WHERE  id = ?";


	public static final String SELECT_ALL_QUERY = "SELECT * FROM user";


	public static final String UPDATE_QUERY = "UPDATE user SET name = ?, email = ? , password = ? , address = ?, role = ?, last_login_at = ? WHERE id = ?";

	public static final String DELETE_QUERY = "DELETE FROM user WHERE id = ?";

	public static final String GET_USER_BY_EMAIL =
			"SELECT * FROM user WHERE email=?";

	public static final String UPDATE_LAST_LOGIN =
			"UPDATE user SET last_login_at = ? WHERE id = ?";

	Connection con = null;
	User u = null;

	@Override
	public int addUser(User u) {

		con = DBConnection.getConnection();

		try {

			PreparedStatement pstmt = con.prepareStatement(INSERT_QUERY);

			pstmt.setString(1, u.getName());
			pstmt.setString(2, u.getEmail());
			pstmt.setString(3, u.getPassword());
			pstmt.setString(4, u.getAddress());
			pstmt.setString(5, u.getRole());
			pstmt.setTimestamp(6,
					new Timestamp(System.currentTimeMillis()));

			int res = pstmt.executeUpdate();

			System.out.println(res);

			return res;   // IMPORTANT

		} catch (SQLException e) {
			e.printStackTrace();
		}

		return 0;
	}

	@Override
	public void updateUser(User u) {

		con = DBConnection.getConnection();
		try {
			PreparedStatement pstmt = con.prepareStatement(UPDATE_QUERY);
			pstmt.setString(1, u.getName());
			pstmt.setString(2, u.getEmail());
			pstmt.setString(3, u.getPassword());
			pstmt.setString(4, u.getAddress());
			pstmt.setString(5, u.getRole());
			pstmt.setTimestamp(6, new Timestamp(System.currentTimeMillis()));
			pstmt.setInt(7, u.getUserId());


			int i = pstmt.executeUpdate();
			System.out.println(i);

		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	@Override
	public void deleteUpadte(int id) {

		con = DBConnection.getConnection();

		try {
			PreparedStatement pstmt = con.prepareStatement(DELETE_QUERY);
			pstmt.setInt(1,id);
			int i = pstmt.executeUpdate();
			System.out.println(i);



		} catch (SQLException e) {

			e.printStackTrace();
		}


	}

	@Override
	public User getUser(int id1) {
		con = DBConnection.getConnection();

		try {
			PreparedStatement pstmt = con.prepareStatement(SELECT_QUERY);
			pstmt.setInt(1, id1);

			ResultSet res = pstmt.executeQuery();

			while(res.next()) {
				u=getresultSet(res);
			}	

		} 

		catch (SQLException e) {
			e.printStackTrace();
		}

		return u;
	}



	@Override
	public List<User> getAllUser() {

		List<User> list = new ArrayList<User>() ;

		con = DBConnection.getConnection();

		try {
			Statement stmt = con.createStatement();
			ResultSet res = stmt.executeQuery(SELECT_ALL_QUERY);	

			while(res.next()) {
				User u = getresultSet(res);
				list.add(u);
			}		

		} catch (SQLException e) {
			e.printStackTrace();
		}

		return list;
	}




	private User getresultSet(ResultSet res) throws SQLException {
		int id = res.getInt("id");
		String name =res.getString("name");
		String email =res.getString("email");
		String password =res.getString("password");
		String address =res.getString("address");
		String role =res.getString("role");
		Timestamp created_at = res.getTimestamp("created_at");
		Timestamp last_login_at = res.getTimestamp("last_login_at");


		return u = new User(id, name, email, password, address, role, created_at, last_login_at);
	}

	@Override
	public User getUserByEmail(String email) {

		User user = null;

		con = DBConnection.getConnection();

		try {

			PreparedStatement pstmt =
					con.prepareStatement(GET_USER_BY_EMAIL);

			pstmt.setString(1, email);

			ResultSet rs = pstmt.executeQuery();

			if(rs.next()) {
				user = getresultSet(rs);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}

		return user;
	}

	@Override
	public void updateLastLogin(int id) {

		con = DBConnection.getConnection();

		try {

			PreparedStatement pstmt =
					con.prepareStatement(UPDATE_LAST_LOGIN);

			pstmt.setTimestamp(1,
					new Timestamp(System.currentTimeMillis()));

			pstmt.setInt(2, id);

			int i = pstmt.executeUpdate();

			System.out.println("Last Login Updated : " + i);

		} catch (SQLException e) {
			e.printStackTrace();
		}
	}


}
