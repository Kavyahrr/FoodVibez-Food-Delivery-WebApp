package com.tap.DAOImpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.tap.DAOInterface.OrderItemDAO;
import com.tap.model.OrderItem;
import com.tap.utility.DBConnection;

public class OrderItemDAOImpl implements OrderItemDAO {

    private Connection connection;

    private static final String INSERT_QUERY =
            "INSERT INTO orderitem(orderId,menuId,quantity,itemTotal) VALUES(?,?,?,?)";

    private static final String GET_QUERY =
            "SELECT * FROM orderitem WHERE orderItemId=?";

    private static final String UPDATE_QUERY =
            "UPDATE orderitem SET quantity=?, itemTotal=? WHERE orderItemId=?";

    private static final String DELETE_QUERY =
            "DELETE FROM orderitem WHERE orderItemId=?";

    private static final String GET_BY_ORDER_QUERY =
            "SELECT * FROM orderitem WHERE orderId=?";

    public OrderItemDAOImpl() {
        connection = DBConnection.getConnection();
    }

    @Override
    public void addOrderItem(OrderItem orderItem) {

        try {

            PreparedStatement pstmt =
                    connection.prepareStatement(INSERT_QUERY);

            pstmt.setInt(1, orderItem.getOrderId());
            pstmt.setInt(2, orderItem.getMenuId());
            pstmt.setInt(3, orderItem.getQuantity());
            pstmt.setDouble(4, orderItem.getItemTotal());

            pstmt.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public OrderItem getOrderItem(int orderItemId) {

        OrderItem item = null;

        try {

            PreparedStatement pstmt =
                    connection.prepareStatement(GET_QUERY);

            pstmt.setInt(1, orderItemId);

            ResultSet rs = pstmt.executeQuery();

            if (rs.next()) {

                item = new OrderItem(
                        rs.getInt("orderItemId"),
                        rs.getInt("orderId"),
                        rs.getInt("menuId"),
                        rs.getInt("quantity"),
                        rs.getDouble("itemTotal")
                );
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return item;
    }

    @Override
    public void updateOrderItem(OrderItem orderItem) {

        try {

            PreparedStatement pstmt =
                    connection.prepareStatement(UPDATE_QUERY);

            pstmt.setInt(1, orderItem.getQuantity());
            pstmt.setDouble(2, orderItem.getItemTotal());
            pstmt.setInt(3, orderItem.getOrderItemId());

            pstmt.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public void deleteOrderItem(int orderItemId) {

        try {

            PreparedStatement pstmt =
                    connection.prepareStatement(DELETE_QUERY);

            pstmt.setInt(1, orderItemId);

            pstmt.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public List<OrderItem> getOrderItemsByOrder(int orderId) {

        List<OrderItem> orderItems = new ArrayList<>();

        try {

            PreparedStatement pstmt =
                    connection.prepareStatement(GET_BY_ORDER_QUERY);

            pstmt.setInt(1, orderId);

            ResultSet rs = pstmt.executeQuery();

            while (rs.next()) {

                OrderItem item = new OrderItem(
                        rs.getInt("orderItemId"),
                        rs.getInt("orderId"),
                        rs.getInt("menuId"),
                        rs.getInt("quantity"),
                        rs.getDouble("itemTotal")
                );

                orderItems.add(item);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return orderItems;
    }
}