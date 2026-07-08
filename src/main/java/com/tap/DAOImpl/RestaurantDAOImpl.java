package com.tap.DAOImpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.tap.DAOInterface.RestaurantDAO;
import com.tap.model.Restaurant;
import com.tap.utility.DBConnection;

public class RestaurantDAOImpl implements RestaurantDAO {

	public static final String INSERT_QUERY =
			"INSERT INTO restaurant (Name, CuisineType, DeliveryTime, Address, AdminUserID, Rating, IsActive, Img) VALUES (?,?,?,?,?,?,?,?)";

	public static final String SELECT_QUERY =
			"SELECT * FROM restaurant WHERE RestaurantID = ?";

	public static final String SELECT_ALL_QUERY =
			"SELECT * FROM restaurant";

	public static final String UPDATE_QUERY =
			"UPDATE restaurant SET Name = ?, CuisineType = ?, DeliveryTime = ?, Address = ?, AdminUserID = ?, Rating = ?, IsActive = ?, Img = ? WHERE RestaurantID = ?";

	public static final String DELETE_QUERY =
			"DELETE FROM restaurant WHERE RestaurantID = ?";

	Connection con = null;
	Restaurant r = null;

	@Override
	public void addRestaurant(Restaurant r) {

		con = DBConnection.getConnection();

		try {
			PreparedStatement pstmt = con.prepareStatement(INSERT_QUERY);

			pstmt.setString(1, r.getName());
			pstmt.setString(2, r.getCuisineType());
			pstmt.setInt(3, r.getDeliveryTime());
			pstmt.setString(4, r.getAddress());
			pstmt.setInt(5, r.getAdminUserID());
			pstmt.setDouble(6, r.getRating());
			pstmt.setBoolean(7, r.isActive());
			pstmt.setString(8, r.getImg());

			int res = pstmt.executeUpdate();
			System.out.println("Restaurant Added : " + res);

		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	@Override
	public void updateRestaurant(Restaurant r) {

		con = DBConnection.getConnection();

		try {
			PreparedStatement pstmt = con.prepareStatement(UPDATE_QUERY);

			pstmt.setString(1, r.getName());
			pstmt.setString(2, r.getCuisineType());
			pstmt.setInt(3, r.getDeliveryTime());
			pstmt.setString(4, r.getAddress());
			pstmt.setInt(5, r.getAdminUserID());
			pstmt.setDouble(6, r.getRating());
			pstmt.setBoolean(7, r.isActive());
			pstmt.setString(8, r.getImg());
			pstmt.setInt(9, r.getRestaurantID());

			int res = pstmt.executeUpdate();
			System.out.println("Restaurant Updated : " + res);

		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	@Override
	public void deleteRestaurant(int id) {

		con = DBConnection.getConnection();

		try {
			PreparedStatement pstmt = con.prepareStatement(DELETE_QUERY);

			pstmt.setInt(1, id);

			int res = pstmt.executeUpdate();
			System.out.println("Restaurant Deleted : " + res);

		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	@Override
	public Restaurant getRestaurant(int id) {

		con = DBConnection.getConnection();

		try {
			PreparedStatement pstmt = con.prepareStatement(SELECT_QUERY);

			pstmt.setInt(1, id);

			ResultSet res = pstmt.executeQuery();

			while (res.next()) {
				r = getResultSet(res);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}

		return r;
	}

	@Override
	public List<Restaurant> getAllRestaurant() {

		List<Restaurant> list = new ArrayList<>();

		con = DBConnection.getConnection();

		try {
			Statement stmt = con.createStatement();

			ResultSet res = stmt.executeQuery(SELECT_ALL_QUERY);

			while (res.next()) {
				Restaurant r = getResultSet(res);
				list.add(r);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}

		return list;
	}

	private Restaurant getResultSet(ResultSet res) throws SQLException {

		int restaurantID = res.getInt("RestaurantID");
		String name = res.getString("Name");
		String cuisineType = res.getString("CuisineType");
		int deliveryTime = res.getInt("DeliveryTime");
		String address = res.getString("Address");
		int adminUserID = res.getInt("AdminUserID");
		double rating = res.getDouble("Rating");
		boolean isActive = res.getBoolean("IsActive");
		String img = res.getString("Img");

		return new Restaurant(
				restaurantID,
				name,
				cuisineType,
				deliveryTime,
				address,
				adminUserID,
				rating,
				isActive,
				img
		);
	}
}