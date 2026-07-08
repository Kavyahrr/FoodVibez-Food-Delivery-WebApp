package com.tap.Controller;

import java.io.IOException;

import org.mindrot.jbcrypt.BCrypt;

import com.tap.DAOImpl.UserDAOImpl;
import com.tap.model.User;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/Register")
public class RegisterServlet extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		RequestDispatcher requestDispatcher = req.getRequestDispatcher("/Register.jsp");
		requestDispatcher.forward(req,resp);
	}
	
	
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String name = req.getParameter("name");
		String email = req.getParameter("email");
		String password = req.getParameter("password");
		String address = req.getParameter("address");
		String role = req.getParameter("role");
		
		String hashpw = BCrypt.hashpw(password, BCrypt.gensalt(12));
		
		User user = new User(name, email, hashpw, address, role);
		
		
		UserDAOImpl userDAOImpl = new UserDAOImpl();
		int res = userDAOImpl.addUser(user);
		System.out.println("Register Result = " + res);
		
		if(res == 1) {
			resp.sendRedirect("Login.jsp");
		} else {
			
			resp.sendRedirect("Register.jsp");
		}
	}

}
