package com.tap.Controller;

import java.io.IOException;

import com.tap.model.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/ProfileServlet")
public class ProfileServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req,
	                     HttpServletResponse resp)
	        throws ServletException, IOException {

	    HttpSession session = req.getSession(false);

	    System.out.println("Session = " + session);

	    if(session != null) {
	        System.out.println("User Object = " +
	                session.getAttribute("user"));
	    }

	    if(session == null || session.getAttribute("user") == null) {

	        System.out.println("User Not Found");

	        resp.sendRedirect("login");
	        return;
	    }

	    req.getRequestDispatcher("Profile.jsp")
	       .forward(req, resp);
	}
}