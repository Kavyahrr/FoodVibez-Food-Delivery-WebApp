package com.tap.Controller;

import java.io.IOException;
import java.sql.Timestamp;

import com.tap.DAOImpl.OrderDAOImpl;
import com.tap.DAOImpl.OrderItemDAOImpl;
import com.tap.model.Cart;
import com.tap.model.CartItem;
import com.tap.model.Order;
import com.tap.model.OrderItem;
import com.tap.model.User;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/checkout")
public class CheckoutServlet extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();
		User user = (User) session.getAttribute("user");
		Cart cart = (Cart) session.getAttribute("cart");
		Integer restaurantId = (Integer) session.getAttribute("restaurantId");
		double finalAmount = (double) session.getAttribute("finalAmount");
		String paymentMode = req.getParameter("paymentMode");
		
		if(user == null) {
			RequestDispatcher rd = req.getRequestDispatcher("Login.jsp");
			rd.forward(req, resp);
		}
		
		if(user != null && cart != null && !cart.getItem().isEmpty())  {
			Order order = new Order();
			order.setUserId(user.getUserId());
			order.setRestaurantId(restaurantId);
			order.setOrderDate(new Timestamp(System.currentTimeMillis()));
			order.setPaymenyMethod(paymentMode);
			order.setStatus("pending");
			order.setTotalamout(finalAmount);
			
			OrderDAOImpl orderDAOImpl = new OrderDAOImpl();
			int orderId = orderDAOImpl.addOrder(order);
			
			OrderItem orderItem = new OrderItem();
			
			orderItem.setOrderId(orderId);
			
			
			for (CartItem item : cart.getItem().values()) {
				orderItem.setMenuId(item.getMenuId());
				orderItem.setQuantity(item.getQuantity());
				orderItem.setItemTotal(item.getTotalPrice());
				
			}
			
			
			OrderItemDAOImpl orderItemDAOImpl = new OrderItemDAOImpl();
			orderItemDAOImpl.addOrderItem(orderItem);
			
			session.removeAttribute("cart");
			session.removeAttribute("restaurantId");
			session.removeAttribute("finalAmount");
			
			resp.sendRedirect("OrderSuccess.jsp");
			
		} else {
			resp.sendRedirect("cart.jsp");
		}
		
	}
	

}
