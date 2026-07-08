package com.tap.DAOImpl;

import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import com.tap.DAOInterface.MenuDAO;
import com.tap.model.Menu;
import com.tap.utility.DBConnection;

public class MenuDAOImpl implements MenuDAO {

	public static final String INSERT_QUERY =
			"INSERT INTO menu (restaurantID,itemName,description,price,isAvailable,category,imageURL) VALUES (?,?,?,?,?,?,?)";

	public static final String SELECT_QUERY =
			"SELECT * FROM menu WHERE menuID = ?";

	public static final String SELECT_ALL_QUERY =
			"SELECT * FROM menu";

	public static final String UPDATE_QUERY =
			"UPDATE menu SET restaurantID=?, itemName=?, description=?, price=?, isAvailable=?, category=?, imageURL=? WHERE menuID=?";

	public static final String DELETE_QUERY =
			"DELETE FROM menu WHERE menuID=?";
	
	public static final String GET_MENU_BY_RESTAURANT =
	        "SELECT * FROM menu WHERE restaurantID=?";

	Connection con = null;
	Menu m = null;

	@Override
	public void addMenu(Menu m) {

		con = DBConnection.getConnection();

		try {

			PreparedStatement pstmt =
					con.prepareStatement(INSERT_QUERY);

			pstmt.setInt(1, m.getRestaurantID());
			pstmt.setString(2, m.getItemName());
			pstmt.setString(3, m.getDescription());
			pstmt.setDouble(4, m.getPrice());
			pstmt.setBoolean(5, m.isAvailable());
			pstmt.setString(6, m.getCategory());
			pstmt.setString(7, m.getImageURL());

			int res = pstmt.executeUpdate();

			System.out.println(res);

		} catch (SQLException e) {

			e.printStackTrace();
		}
	}

	@Override
	public void updateMenu(Menu m) {

		con = DBConnection.getConnection();

		try {

			PreparedStatement pstmt =
					con.prepareStatement(UPDATE_QUERY);

			pstmt.setInt(1, m.getRestaurantID());
			pstmt.setString(2, m.getItemName());
			pstmt.setString(3, m.getDescription());
			pstmt.setDouble(4, m.getPrice());
			pstmt.setBoolean(5, m.isAvailable());
			pstmt.setString(6, m.getCategory());
			pstmt.setString(7, m.getImageURL());
			pstmt.setInt(8, m.getMenuID());

			int i = pstmt.executeUpdate();

			System.out.println(i);

		} catch (SQLException e) {

			e.printStackTrace();
		}
	}

	@Override
	public void deleteMenu(int id) {

		con = DBConnection.getConnection();

		try {

			PreparedStatement pstmt =
					con.prepareStatement(DELETE_QUERY);

			pstmt.setInt(1, id);

			int i = pstmt.executeUpdate();

			System.out.println(i);

		} catch (SQLException e) {

			e.printStackTrace();
		}
	}

	@Override
	public Menu getMenu(int id) {

		con = DBConnection.getConnection();

		try {

			PreparedStatement pstmt =
					con.prepareStatement(SELECT_QUERY);

			pstmt.setInt(1, id);

			ResultSet res = pstmt.executeQuery();

			while (res.next()) {

				m = getresultSet(res);
			}

		} catch (SQLException e) {

			e.printStackTrace();
		}

		return m;
	}

	@Override
	public List<Menu> getAllMenu() {

		List<Menu> list = new ArrayList<Menu>();

		con = DBConnection.getConnection();

		try {

			Statement stmt = con.createStatement();

			ResultSet res = stmt.executeQuery(SELECT_ALL_QUERY);

			while (res.next()) {

				Menu m = getresultSet(res);

				list.add(m);
			}

		} catch (SQLException e) {

			e.printStackTrace();
		}

		return list;
	}
	
	@Override
	public List<Menu> getMenuByRestaurantId(int restaurantId) {

	    List<Menu> list = new ArrayList<>();

	    con = DBConnection.getConnection();

	    try {

	        PreparedStatement pstmt =
	                con.prepareStatement(GET_MENU_BY_RESTAURANT);

	        pstmt.setInt(1, restaurantId);

	        ResultSet res = pstmt.executeQuery();

	        while(res.next()) {

	            Menu m = getresultSet(res);

	            list.add(m);
	        }

	    } catch (SQLException e) {
	        e.printStackTrace();
	    }

	    return list;
	}

	private Menu getresultSet(ResultSet res) throws SQLException {

		int menuID = res.getInt("menuID");
		int restaurantID = res.getInt("restaurantID");
		String itemName = res.getString("itemName");
		String description = res.getString("description");
		BigDecimal price = res.getBigDecimal("price");
		boolean isAvailable = res.getBoolean("isAvailable");
		String category = res.getString("category");
		String imageURL = res.getString("imageURL");

		Timestamp createdAt = res.getTimestamp("createdAt");
		Timestamp updatedAt = res.getTimestamp("updatedAt");
		Timestamp deletedAt = res.getTimestamp("deletedAt");

		return m = new Menu(
				menuID,
				restaurantID,
				itemName,
				description,
				price,
				isAvailable,
				category,
				imageURL,
				createdAt != null ? createdAt.toLocalDateTime() : null,
				updatedAt != null ? updatedAt.toLocalDateTime() : null,
				deletedAt != null ? deletedAt.toLocalDateTime() : null
		);
	}
}