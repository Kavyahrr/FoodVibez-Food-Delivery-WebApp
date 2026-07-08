<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.tap.model.Cart,com.tap.model.CartItem"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Spice Haven Checkout</title>

<link
	href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap"
	rel="stylesheet">

<style>
* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
	font-family: 'Poppins', sans-serif;
}

body {
	background: #f7f7f7;
	color: #222;
}

/* NAVBAR */
/* NAVBAR */
.navbar {
	position: sticky;
	top: 0;
	z-index: 50;
	background: rgba(255, 255, 255, 0.85);
	backdrop-filter: blur(14px) saturate(160%);
	border-bottom: 1px solid #EAE5DD;
	padding: 16px 40px;
	display: flex;
	align-items: center;
	justify-content: space-between;
}

.logo {
	display: flex;
	align-items: center;
	gap: 10px;
}

.logo-icon {
	width: 30px;
	height: 30px;
	border-radius: 9px;
	background: linear-gradient(135deg, #FF5A36, #E84A28);
	color: white;
	display: flex;
	align-items: center;
	justify-content: center;
	font-size: 16px;
}

.logo h1 {
	font-family: 'Georgia', serif;
	font-size: 23px;
	font-weight: 600;
	margin: 0;
}

/* CENTER NAVIGATION */
.nav-links {
	display: flex;
	align-items: center;
	gap: 8px;
}

.nav-links a {
	text-decoration: none;
	color: #6B645C;
	font-weight: 500;
	font-size: 14.5px;
	padding: 9px 16px;
	border-radius: 9px;
	transition: all .18s ease;
}

.nav-links a:hover {
	color: #171310;
	background: #F1EFEB;
}

.nav-links a.active {
	color: #E84A28;
	background: #FFF1ED;
	font-weight: 600;
}

/* PROFILE RIGHT */
.profile-pill {
	display: flex;
	align-items: center;
	gap: 9px;
	border: 1px solid #EAE5DD;
	border-radius: 30px;
	padding: 5px 16px 5px 6px;
	background: #fff;
}

.avatar {
	width: 30px;
	height: 30px;
	border-radius: 50%;
	background: linear-gradient(135deg, #2F8F5B, #246b44);
	color: white;
	display: flex;
	align-items: center;
	justify-content: center;
	font-size: 12px;
	font-weight: 700;
}

.profile-pill span {
	font-size: 13.5px;
	font-weight: 600;
}

/* MAIN */
.container {
	max-width: 1200px;
	margin: 40px auto;
	padding: 0 20px;
}

.page-title {
	margin-bottom: 25px;
}

.page-title h2 {
	font-size: 34px;
	margin-bottom: 5px;
}

.page-title p {
	color: #666;
}

/* CHECKOUT LAYOUT */
.checkout-wrapper {
	display: grid;
	grid-template-columns: 1.4fr 1fr;
	gap: 30px;
}

/* CARD */
.card {
	background: white;
	border: 1px solid #e5e5e5;
	border-radius: 16px;
	padding: 24px;
	margin-bottom: 20px;
}

.card-title {
	font-size: 22px;
	font-weight: 600;
	margin-bottom: 20px;
}

/* FORM */
.form-group {
	margin-bottom: 14px;
}

.form-group input, .form-group textarea {
	width: 100%;
	border: 1px solid #ddd;
	border-radius: 10px;
	padding: 14px;
	font-size: 15px;
	outline: none;
}

textarea {
	resize: none;
	height: 90px;
}

/* PAYMENT */
.payment-option {
	display: flex;
	align-items: center;
	gap: 12px;
	border: 1px solid #ddd;
	padding: 16px;
	border-radius: 10px;
	margin-bottom: 12px;
	cursor: pointer;
}

.payment-option.active-payment {
	border: 2px solid #60a5fa;
	background: #eaf3ff;
}

/* SUMMARY */
.summary-item {
	display: flex;
	justify-content: space-between;
	margin-bottom: 16px;
	font-size: 15px;
}

.divider {
	border-top: 1px solid #e5e5e5;
	margin: 18px 0;
}

.total {
	display: flex;
	justify-content: space-between;
	font-size: 28px;
	font-weight: 700;
}

.total-price {
	color: #2563eb;
}

.place-order {
	width: 100%;
	margin-top: 25px;
	background: #ff7300;
	border: none;
	color: white;
	height: 54px;
	border-radius: 10px;
	font-size: 17px;
	font-weight: 600;
	cursor: pointer;
}

.secure {
	text-align: center;
	color: #888;
	margin-top: 12px;
	font-size: 14px;
}

/* MOBILE */
@media ( max-width :900px) {
	.checkout-wrapper {
		grid-template-columns: 1fr;
	}
	.navbar {
		flex-direction: column;
		height: auto;
		padding: 20px;
		gap: 15px;
	}
	.nav-links {
		flex-wrap: wrap;
		justify-content: center;
	}
}

.empty-cart {
	background: white;
	max-width: 700px;
	margin: 50px auto;
	padding: 50px 30px;
	text-align: center;
	border-radius: 16px;
	border: 1px solid #e5e5e5;
	box-shadow: 0 4px 15px rgba(0, 0, 0, 0.08);
}

.empty-cart h2 {
	font-size: 32px;
	color: #333;
	margin-bottom: 15px;
}

.empty-cart p {
	font-size: 16px;
	color: #777;
	margin-bottom: 25px;
}

.browse-btn {
	display: inline-block;
	background: #ff7300;
	color: white;
	text-decoration: none;
	padding: 14px 30px;
	border-radius: 10px;
	font-size: 16px;
	font-weight: 600;
	transition: 0.3s;
}

.browse-btn:hover {
	background: #e66600;
	transform: translateY(-2px);
}

.form-group select {
	width: 100%;
	height: 55px;
	padding: 0 15px;
	border: 1px solid #ddd;
	border-radius: 10px;
	font-size: 16px;
	background: #fff;
	color: #333;
	outline: none;
	cursor: pointer;
	transition: 0.3s;
}

.form-group select:focus {
	border-color: #ff7300;
	box-shadow: 0 0 0 3px rgba(255, 115, 0, 0.15);
}

.form-group label {
	display: block;
	font-size: 18px;
	font-weight: 500;
	margin-bottom: 10px;
	color: #222;
}
</style>
</head>
<body>

	<!-- NAVBAR -->

	<div class="navbar">

		<div class="logo">
			<div class="logo-icon">🍽</div>
			<h1>FoodVibez</h1>
		</div>

		<div class="nav-links">
			<a href="restaurant">Restaurant</a> <a href="login">Login</a> <a
				href="callCartServlet">Cart</a>
				<a href="orderHistory" class="nav-item">My Orders</a>
				 <a href="ProfileServlet">👤Profile</a>
		</div>

		<div class="profile-pill">
			
		</div>

	</div>

	<!-- MAIN -->

	<div class="container">

		<div class="page-title">
			<h2>Checkout</h2>
			<p>Confirm your details and place your order</p>
		</div>

		<%
        Cart cart = (Cart) session.getAttribute("cart");
        Integer restaurantId = (Integer) session.getAttribute("restaurantId");

        double grandTotal = 0;
        double deliveryFee = 40;
        double platformFee = 5;
        double finalAmount = 0;

        if (cart != null && !cart.getItem().isEmpty()) {

            for (CartItem item : cart.getItem().values()) {
                grandTotal += item.getTotalPrice();
            }

            finalAmount = grandTotal + deliveryFee + platformFee;
        %>
		<form action="checkout" method="post">

			<div class="checkout-wrapper">

				<!-- LEFT -->

				<div>

					<div class="card">

						<div class="card-title">📍 Delivery Address</div>

						<div class="form-group">
							<label>Full Name</label> <input type="text" name="customerName"
								placeholder="Enter your full name">
						</div>

						<div class="form-group">
							<label>Mobile Number</label> <input type="text"
								name="mobileNumber" placeholder="Enter Mobile Number">
						</div>

						<div class="form-group">
							<label>Delivery Address</label> <input type="text" name="address"
								placeholder="Enter your complete delivery address">
						</div>

					</div>

					<div class="card">

						<div class="card-title">💳 Payment Method</div>

						<div class="form-group">
							<label>Select Payment Method</label> <select name="paymentMode"
								required>
								<option value="">Select Payment Method</option>
								<option value="Cash On Delivery">Cash On Delivery</option>
								<option value="UPI">UPI</option>
								<option value="Debit Card">Debit Card</option>
								<option value="Credit Card">Credit Card</option>
								<option value="Net Banking">Net Banking</option>
							</select>
						</div>

					</div>

				</div>

				<!-- RIGHT -->

				<div>

					<div class="card">

						<div class="card-title">Order Summary</div>

						<% for (CartItem item : cart.getItem().values()) { %>

						<div class="summary-item">
							<span> <%= item.getName() %> x <%= item.getQuantity() %>
							</span> <span> ₹<%= item.getTotalPrice() %>
							</span>
						</div>

						<% } %>

						<div class="divider"></div>

						<div class="summary-item">
							<span>Item Total</span> <span>₹<%= grandTotal %></span>
						</div>

						<div class="summary-item">
							<span>Delivery Fee</span> <span>₹<%= deliveryFee %></span>
						</div>

						<div class="summary-item">
							<span>Platform Fee</span> <span>₹<%= platformFee %></span>
						</div>

						<div class="divider"></div>

						<div class="total">
							<span>Total</span> <span class="total-price">₹<%= finalAmount %></span>
						</div>

						<%
                    session.setAttribute("finalAmount", finalAmount);
                    %>

						<input type="hidden" name="restaurantId"
							value="<%= restaurantId %>"> <input type="hidden"
							name="totalAmount" value="<%= finalAmount %>">

						<button class="place-order">Place Order →</button>

						<div class="secure">🔒 Secure checkout</div>

					</div>

				</div>

			</div>
		</form>

		<% } else { %>

		<div class="empty-cart">
			<div style="font-size: 70px; margin-bottom: 15px;">🍽️</div>
			<h2>Your Cart is Empty</h2>
			<p>Please add food items before checkout.</p>
			<a class="browse-btn" href="restaurant">Browse Restaurant</a>
		</div>

		<% } %>

	</div>

</body>
</html>