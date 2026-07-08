package com.tap.model;

import java.util.Date;

public class Order {

	private int orderId;
	private int userId;
	private int restaurantId;
	private Date orderDate;
	private double totalamout;
	private String status;
	private String paymenyMethod;
	
	
	
	public Order() {
		// TODO Auto-generated constructor stub
	}



	public Order(int orderId, int userId, int restaurantId, Date orderDate, double totalamout, String status,
			String paymenyMethod) {
		super();
		this.orderId = orderId;
		this.userId = userId;
		this.restaurantId = restaurantId;
		this.orderDate = orderDate;
		this.totalamout = totalamout;
		this.status = status;
		this.paymenyMethod = paymenyMethod;
	}



	public int getOrderId() {
		return orderId;
	}



	public void setOrderId(int orderId) {
		this.orderId = orderId;
	}



	public int getUserId() {
		return userId;
	}



	public void setUserId(int userId) {
		this.userId = userId;
	}



	public int getRestaurantId() {
		return restaurantId;
	}



	public void setRestaurantId(int restaurantId) {
		this.restaurantId = restaurantId;
	}



	public Date getOrderDate() {
		return orderDate;
	}



	public void setOrderDate(Date orderDate) {
		this.orderDate = orderDate;
	}



	public double getTotalamout() {
		return totalamout;
	}



	public void setTotalamout(double totalamout) {
		this.totalamout = totalamout;
	}



	public String getStatus() {
		return status;
	}



	public void setStatus(String status) {
		this.status = status;
	}



	public String getPaymenyMethod() {
		return paymenyMethod;
	}



	public void setPaymenyMethod(String paymenyMethod) {
		this.paymenyMethod = paymenyMethod;
	}
	
	
	
	
}

