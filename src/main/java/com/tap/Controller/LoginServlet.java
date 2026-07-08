package com.tap.Controller;

import java.io.IOException;
import jakarta.servlet.http.HttpSession;

import org.mindrot.jbcrypt.BCrypt;

import com.tap.DAOImpl.UserDAOImpl;
import com.tap.model.User;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/login")
public class LoginServlet extends HttpServlet{ 
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.getRequestDispatcher("/Login.jsp").forward(req, resp);
	}
	
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String email = req.getParameter("email");
		String password = req.getParameter("password");
		
		UserDAOImpl userDAOImpl = new UserDAOImpl();
		
		User user = userDAOImpl.getUserByEmail(email);
		
		
		if(user == null) {
			resp.sendRedirect("login");
			return ;
			
		}
		
		String dbPassword = user.getPassword();
		
		if(BCrypt.checkpw(password, dbPassword)) {

		    HttpSession session = req.getSession();

		    session.setAttribute("user", user);

		    resp.sendRedirect("restaurant");

		} else {
		    resp.sendRedirect("login");
		}
	}

}
