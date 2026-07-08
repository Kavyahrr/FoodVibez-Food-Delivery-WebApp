package com.tap.DAOImpl;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.tap.DAOInterface.OrderDAO;
import com.tap.model.Order;
import com.tap.utility.DBConnection;

public class OrderDAOImpl implements OrderDAO {

    private Connection connection;

    private static final String INSERT_QUERY =
            "INSERT INTO ordertable(userId, restaurantId, orderDate, totalAmount, status, paymentMethod) VALUES(?,?,?,?,?,?)";

    private static final String GET_ORDER_QUERY =
            "SELECT * FROM ordertable WHERE orderId=?";

    private static final String UPDATE_QUERY =
            "UPDATE ordertable SET status=?, paymentMethod=? WHERE orderId=?";

    private static final String DELETE_QUERY =
            "DELETE FROM ordertable WHERE orderId=?";

    private static final String GET_ALL_BY_USER_QUERY =
    		"SELECT * FROM ordertable WHERE userId=? ORDER BY OrderDate DESC";

    public OrderDAOImpl() {
        connection = DBConnection.getConnection();
    }

    @Override
    public int addOrder(Order order) {
    	int orderId = 0;

        try {

            PreparedStatement pstmt =
                    connection.prepareStatement(INSERT_QUERY, Statement.RETURN_GENERATED_KEYS);

            pstmt.setInt(1, order.getUserId());
            pstmt.setInt(2, order.getRestaurantId());
            pstmt.setDate(3,
                    new Date(order.getOrderDate().getTime()));
            pstmt.setDouble(4, order.getTotalamout());
            pstmt.setString(5, order.getStatus());
            pstmt.setString(6, order.getPaymenyMethod());

            pstmt.executeUpdate();
            
            ResultSet rs = pstmt.getGeneratedKeys();
            if(rs.next()) {
            	orderId = rs.getInt(1);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return orderId;
        
    }

    @Override
    public Order getOrder(int orderId) {

        Order order = null;

        try {

            PreparedStatement pstmt =
                    connection.prepareStatement(GET_ORDER_QUERY);

            pstmt.setInt(1, orderId);

            ResultSet rs = pstmt.executeQuery();

            if (rs.next()) {

                order = new Order(
                        rs.getInt("orderId"),
                        rs.getInt("userId"),
                        rs.getInt("restaurantId"),
                        rs.getDate("orderDate"),
                        rs.getDouble("totalAmount"),
                        rs.getString("status"),
                        rs.getString("paymentMethod")
                );
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return order;
    }

    @Override
    public void updateOrder(Order order) {

        try {

            PreparedStatement pstmt =
                    connection.prepareStatement(UPDATE_QUERY);

            pstmt.setString(1, order.getStatus());
            pstmt.setString(2, order.getPaymenyMethod());
            pstmt.setInt(3, order.getOrderId());

            pstmt.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public void deleteOrder(int orderId) {

        try {

            PreparedStatement pstmt =
                    connection.prepareStatement(DELETE_QUERY);

            pstmt.setInt(1, orderId);

            pstmt.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public List<Order> getAllOrdersByUser(int userId) {

        List<Order> orders = new ArrayList<>();

        try {

            PreparedStatement pstmt =
                    connection.prepareStatement(GET_ALL_BY_USER_QUERY);

            pstmt.setInt(1, userId);

            ResultSet rs = pstmt.executeQuery();

            while (rs.next()) {

                Order order = new Order(
                        rs.getInt("orderId"),
                        rs.getInt("userId"),
                        rs.getInt("restaurantId"),
                        rs.getDate("orderDate"),
                        rs.getDouble("totalAmount"),
                        rs.getString("status"),
                        rs.getString("paymentMethod")
                );

                orders.add(order);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return orders;
    }
    
    public List<Order> getOrdersByUserId(int userId) {

        List<Order> orders = new ArrayList<>();

        String query =
                "SELECT * FROM ordertable WHERE userId=? ORDER BY OrderDate DESC";

        try {

            PreparedStatement pstmt =
                    connection.prepareStatement(query);

            pstmt.setInt(1, userId);

            ResultSet rs = pstmt.executeQuery();

            while (rs.next()) {

                Order order = new Order();

                order.setOrderId(rs.getInt("orderId"));
                order.setUserId(rs.getInt("userId"));
                order.setRestaurantId(rs.getInt("restaurantId"));
                order.setOrderDate(rs.getTimestamp("OrderDate"));
                order.setTotalamout(rs.getDouble("TotalAmount"));
                order.setStatus(rs.getString("Status"));
                order.setPaymenyMethod(rs.getString("PaymentMethod"));

                orders.add(order);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        System.out.println("Orders Found = " + orders.size());
        return orders;
    }
    
}