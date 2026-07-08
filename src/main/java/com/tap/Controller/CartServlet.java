package com.tap.Controller;

import java.io.IOException;

import com.tap.DAOImpl.MenuDAOImpl;
import com.tap.model.Cart;
import com.tap.model.CartItem;
import com.tap.model.Menu;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/callCartServlet")
public class CartServlet extends HttpServlet{
	
	
     
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		HttpSession session = req.getSession();
		Cart cart = (Cart)session.getAttribute("cart");
		Integer restaurantId = (Integer)session.getAttribute("restaurantId");
		
		String restaurantIdParam = req.getParameter("restaurantId");
		System.out.println("restaurantId = " + restaurantIdParam);

		Integer newRestaurantId = null;

		if(restaurantIdParam != null){
		    newRestaurantId = Integer.parseInt(restaurantIdParam);
		}
		
		
		if(cart ==null || restaurantId == null || restaurantId != newRestaurantId) {
			cart = new Cart();
			session.setAttribute("cart", cart);
			session.setAttribute("restaurantId", newRestaurantId);
		}
		
		
		
		String action = req.getParameter("action");

		if(action != null) {

		    if(action.equals("add")) {
		        addItemToCart(req,cart);
		    }
		    else if(action.equals("update")) {
		        UpdateCart(req,cart);
		    }
		    else if(action.equals("delete")) {
		        removeItemFromCart(req,cart);
		    }

		}
		
		resp.sendRedirect("Cart.jsp");
		
	}

	private void removeItemFromCart(HttpServletRequest req, Cart cart) {
		Integer menuId = Integer.parseInt(req.getParameter("menuId"));
		cart.removeItem(menuId);
		
	}

	
	private void UpdateCart(HttpServletRequest req, Cart cart) {
		Integer menuId = Integer.parseInt(req.getParameter("menuId"));
		Integer quantity = Integer.parseInt(req.getParameter("quantity"));
		
		cart.updateItem(menuId,quantity);
	}

	private void addItemToCart(HttpServletRequest req, Cart cart) {
		int menuId = Integer.parseInt(req.getParameter("menuId"));
		int quantity = Integer.parseInt(req.getParameter("quantity"));
		
		MenuDAOImpl menuDAOImpl = new MenuDAOImpl();
		Menu menu = menuDAOImpl.getMenu(menuId);
		
		HttpSession session = req.getSession();
		session.setAttribute("restaurantId", menu.getRestaurantID());
		
		
		if(menu != null) {
			CartItem cartItem = new CartItem(menuId, 
					menu.getRestaurantID(),
					menu.getItemName(),
					menu.getPrice(),
					quantity,
					menu.getImageURL()
					);
			
			cart.addItem(cartItem);
		}
		
		
		
		
		
		
	}
}
