package com.tap.Controller;

import java.io.IOException;

import com.tap.DAOImpl.UserDAOImpl;
import com.tap.model.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet("/UpdateProfileServlet")
public class UpdateProfileServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req,
                          HttpServletResponse resp)
            throws ServletException, IOException {

        HttpSession session = req.getSession(false);

        if(session == null || session.getAttribute("user") == null) {
            resp.sendRedirect("login");
            return;
        }

        int userId =
                Integer.parseInt(req.getParameter("userId"));

        String name = req.getParameter("name");
        String email = req.getParameter("email");
        String address = req.getParameter("address");

        User user = (User) session.getAttribute("user");

        user.setUserId(userId);
        user.setName(name);
        user.setEmail(email);
        user.setAddress(address);

        UserDAOImpl dao = new UserDAOImpl();
        dao.updateUser(user);

        session.setAttribute("user", user);

        resp.sendRedirect("ProfileServlet");
    }
}