package com.tap.DAOInterface;

import java.util.List;

import com.tap.model.Order;

public interface OrderDAO {
	int addOrder(Order order);
	Order getOrder(int orderId);
	void updateOrder(Order order);
	void deleteOrder(int orderId);
	List<Order> getAllOrdersByUser(int userId);
	List<Order> getOrdersByUserId(int userId);

}
