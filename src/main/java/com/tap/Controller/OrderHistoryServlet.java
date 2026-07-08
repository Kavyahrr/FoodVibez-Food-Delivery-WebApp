package com.tap.Controller;

import java.io.IOException;
import java.util.List;

import com.tap.DAOImpl.OrderDAOImpl;
import com.tap.model.Order;
import com.tap.model.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/orderHistory")
public class OrderHistoryServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();

        User user = (User) session.getAttribute("user");

        if(user == null) {
            response.sendRedirect("login");
            return;
        }

        OrderDAOImpl orderDAO = new OrderDAOImpl();

        List<Order> orders =
                orderDAO.getOrdersByUserId(user.getUserId());

        System.out.println("Orders Size = " + orders.size());

        request.setAttribute("orders", orders);

        request.getRequestDispatcher("OrderHistory.jsp")
               .forward(request, response);
    }
}