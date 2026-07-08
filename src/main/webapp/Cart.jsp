<%@page import="com.tap.model.CartItem"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.tap.model.Cart , java.util.List"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Spice Haven Cart</title>

<link
	href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700;800&display=swap"
	rel="stylesheet">

<style>
* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
	font-family: 'Poppins', sans-serif;
}

body {
	min-height: 100vh;
	background: #fdf3ea;
	position: relative;
	overflow-x: hidden;
}

/* NAVBAR */
.navbar {
	position: relative;
	z-index: 2;
	display: flex;
	justify-content: space-between;
	align-items: center;
	padding: 20px 50px;
	background: #1c1c1c;
}

.logo h1 {
	color: white;
	font-size: 38px;
	font-family: Georgia, serif;
}

.logo p {
	color: #ff8b1f;
	font-size: 12px;
	letter-spacing: 1px;
}

.nav-links {
	display: flex;
	align-items: center;
	gap: 25px;
}

.nav-links a {
	color: white;
	text-decoration: none;
	font-size: 15px;
	font-weight: 500;
}

.cart-btn {
	background: #ff7a00;
	color: white;
	padding: 10px 20px;
	border-radius: 10px;
	text-decoration: none;
	font-size: 15px;
	font-weight: 600;
}

/* MAIN */
.main {
	position: relative;
	z-index: 2;
	min-height: calc(100vh - 100px);
	display: flex;
	justify-content: center;
	align-items: flex-start;
	padding: 40px 30px;
}

/* CART CONTAINER */
.cart-container {
	width: 100%;
	max-width: 1100px;
	background: white;
	border-radius: 20px;
	padding: 32px;
	box-shadow: 0 12px 30px rgba(0, 0, 0, .12);
	display: flex;
	flex-direction: column;
}

/* HEADER */
.cart-top {
	display: flex;
	justify-content: space-between;
	align-items: center;
	text-align: left;
	margin-bottom: 20px;
	padding-bottom: 16px;
	border-bottom: 1px solid #ececec;
}

.cart-top-left {
	display: flex;
	align-items: center;
	gap: 14px;
}

.icon-circle {
	width: 50px;
	height: 50px;
	border-radius: 50%;
	background: #fff4ea;
	display: flex;
	justify-content: center;
	align-items: center;
	margin: 0;
	font-size: 22px;
	flex-shrink: 0;
}

.cart-top h1 {
	font-size: 26px;
	font-weight: 700;
	color: #111;
	margin-top: 0;
}

.cart-top p {
	color: #666;
	font-size: 13px;
	margin-top: 2px;
}

.add-more-btn {
	background: #fff4ea;
	color: #ff6b00;
	border: 2px solid #ffd7b0;
	padding: 10px 18px;
	border-radius: 10px;
	font-size: 14px;
	font-weight: 600;
	cursor: pointer;
	white-space: nowrap;
	text-decoration: none;
	display: inline-flex;
	align-items: center;
	gap: 6px;
}

.add-more-btn:hover {
	background: #ffe9d6;
}

/* ITEMS SECTION */
.items-section {
	margin-bottom: 18px;
}

/* TABLE */
.table-head {
	display: grid;
	grid-template-columns: 3fr 1fr 1fr 1fr 35px;
	font-size: 13px;
	font-weight: 600;
	color: #888;
	text-transform: uppercase;
	letter-spacing: .5px;
	margin-bottom: 12px;
	padding: 0 8px;
}

.cart-item {
	display: grid;
	grid-template-columns: 3fr 1fr 1fr 1fr 35px;
	align-items: center;
	gap: 8px;
	border: 1px solid #ececec;
	border-radius: 12px;
	padding: 12px;
	margin-bottom: 10px;
}

.item-info {
	display: flex;
	align-items: center;
	gap: 12px;
}

.item-info img {
	width: 70px;
	height: 55px;
	object-fit: cover;
	border-radius: 8px;
	flex-shrink: 0;
}

.item-name {
	font-size: 14px;
	font-weight: 600;
	color: #111;
}

.item-desc {
	font-size: 11px;
	color: #777;
	margin-top: 2px;
}

.price {
	color: #ff6b00;
	font-weight: 600;
	font-size: 14px;
}

.total {
	color: #ff6b00;
	font-weight: 700;
	font-size: 14px;
}

/* QUANTITY */
.qty {
	width: 78px;
	height: 34px;
	border: 2px solid #f0e0d3;
	border-radius: 8px;
	display: flex;
	justify-content: space-around;
	align-items: center;
}

.qty button {
	border: none;
	background: none;
	color: #ff6b00;
	font-size: 18px;
	cursor: pointer;
}

.qty-btn {
	border: none;
	background: none;
	color: #ff6b00;
	font-size: 18px;
	cursor: pointer;
}

.qty-btn:disabled {
	color: #ccc;
	cursor: not-allowed;
}

.qty span {
	font-size: 14px;
	font-weight: 600;
}

/* DELETE */
.delete {
	border: none;
	background: none;
	text-align: center;
	font-size: 18px;
	cursor: pointer;
}

/* SUMMARY */
.summary {
	margin-top: auto;
	border: 1px solid #ececec;
	border-radius: 12px;
	overflow: hidden;
	display: grid;
	grid-template-columns: 1fr 1fr;
	align-items: stretch;
}

.bill {
	padding: 18px;
	display: flex;
	flex-direction: column;
	justify-content: flex-start;
}

.bill-row {
	display: flex;
	justify-content: space-between;
	margin-bottom: 10px;
	font-size: 15px;
}

.grand {
	border-top: 1px solid #eee;
	padding-top: 10px;
	margin-top: 8px;
	font-size: 18px;
	font-weight: 700;
}

.grand span:last-child {
	color: #ff6b00;
}

/* CHECKOUT */
.checkout {
	border-left: 1px solid #ececec;
	padding: 18px;
	display: flex;
	flex-direction: column;
	justify-content: flex-start;
	align-items: center;
}

.checkout-btn {
	width: 100%;
	height: 55px;
	border: none;
	border-radius: 10px;
	background: linear-gradient(135deg, #ff9800, #ff5e00);
	color: white;
	font-size: 16px;
	font-weight: 600;
	cursor: pointer;
	display: flex;
	align-items: center;
	justify-content: center;
	text-decoration: none;
}

.secure {
	text-align: center;
	margin-top: 14px;
	color: #888;
	font-size: 13px;
}

/* EMPTY CART */
.empty-cart {
	flex: 1;
	display: flex;
	flex-direction: column;
	align-items: center;
	justify-content: center;
	text-align: center;
	padding: 60px 20px;
}

.empty-cart h2 {
	font-size: 22px;
	color: #111;
	margin-bottom: 8px;
}

.empty-cart p {
	color: #777;
	font-size: 14px;
	margin-bottom: 20px;
}

.empty-cart .checkout-btn {
	display: inline-block;
	width: auto;
	height: auto;
	padding: 12px 26px;
	text-decoration: none;
}

/* MOBILE */
@media ( max-width :900px) {
	.navbar {
		flex-direction: column;
		gap: 15px;
		padding: 20px;
	}
	.nav-links {
		flex-wrap: wrap;
		justify-content: center;
	}
	.main {
		justify-content: center;
		padding: 15px;
	}
	.cart-container {
		width: 100%;
		max-width: 100%;
		padding: 16px;
	}
	.cart-top {
		flex-direction: column;
		align-items: flex-start;
		gap: 14px;
	}
	.add-more-btn {
		width: 100%;
		justify-content: center;
	}
	.table-head {
		display: none;
	}
	.cart-item {
		grid-template-columns: 1fr;
		text-align: center;
	}
	.item-info {
		flex-direction: column;
	}
	.summary {
		grid-template-columns: 1fr;
	}
	.checkout {
		border-left: none;
		border-top: 1px solid #ececec;
	}
	.cart-top h1 {
		font-size: 26px;
	}
}

.navbar {
	display: flex;
	align-items: center;
	justify-content: space-between;
	padding: 20px 50px;
	background: #fff;
	border-bottom: 1px solid #eae5dd;
}

.logo h1 {
	font-size: 30px;
	color: #171310;
	margin: 0;
}

.nav-center {
	display: flex;
	align-items: center;
	gap: 10px;
	margin: 0 auto;
}

.nav-center a {
	text-decoration: none;
	color: #6B645C;
	font-size: 15px;
	font-weight: 500;
	padding: 10px 18px;
	border-radius: 10px;
}

.nav-center a:hover {
	background: #f1efeb;
}

.nav-center .active {
	background: #FFF1ED;
	color: #E84A28;
	font-weight: 600;
}
</style>
</head>

<body>

	<nav class="navbar">

		<div class="logo">
			<h1>FoodVibez</h1>
		</div>

		<div class="nav-center">
			<a href="restaurant">Restaurant</a> <a href="login">Login</a> 
			<a href="callCartServlet" class="active">Cart</a>
			<a href="orderHistory" class="nav-item">My Orders</a>
			<a href="ProfileServlet">👤Profile</a>
		</div>

	</nav>

	<div class="main">

		<div class="cart-container">

			<%
        Cart cart = (Cart) session.getAttribute("cart");
        Integer restaurantId = (Integer) session.getAttribute("restaurantId");

        double grandTotal = 0;
        double deliveryFee = 40;
    %>

			<div class="cart-top">
				<div class="cart-top-left">
					<div class="icon-circle">🛒</div>
					<div>
						<h1>Your Cart</h1>
						<p>Review your items and proceed to checkout</p>
					</div>
				</div>

				<% if (cart != null && !cart.getItem().isEmpty()) { %>
				<a class="add-more-btn"
					href="MenuServlet?restaurantId=<%= restaurantId %>"> + Add More
					Items </a>
				<% } %>
			</div>

			<% if (cart != null && !cart.getItem().isEmpty()) { %>

			<div class="items-section">

				<div class="table-head">
					<div>Item</div>
					<div>Price</div>
					<div>Quantity</div>
					<div>Total</div>
					<div></div>
				</div>

				<%
            for (CartItem item : cart.getItem().values()) {
                grandTotal = grandTotal + item.getTotalPrice();
        %>

				<div class="cart-item">

					<div class="item-info">
						<img
							src="<%= request.getContextPath() %><%= item.getImageURL() %>"
							alt="<%= item.getName() %>"
							style="width: 80px; height: 80px; object-fit: cover; border-radius: 10px;">
						<div>
							<div class="item-name"><%= item.getName() %></div>
						</div>
					</div>

					<div class="price">
						₹<%= item.getPrice() %></div>

					<div class="qty">
						<form action="callCartServlet" method="post"
							style="display: contents;">
							<input type="hidden" name="menuId"
								value="<%= item.getMenuId() %>"> <input type="hidden"
								name="restaurantId" value="<%= restaurantId %>"> <input
								type="hidden" name="action" value="update"> <input
								type="hidden" name="quantity"
								value="<%= item.getQuantity() > 0 ? item.getQuantity() - 1 : 1 %>">
							<button class="qty-btn" type="submit"
								<%= item.getQuantity() <= 0 ? "disabled" : "" %>>-</button>
						</form>

						<span><%= item.getQuantity() %></span>

						<form action="callCartServlet" method="post"
							style="display: contents;">
							<input type="hidden" name="menuId"
								value="<%= item.getMenuId() %>"> <input type="hidden"
								name="restaurantId" value="<%= restaurantId %>"> <input
								type="hidden" name="action" value="update"> <input
								type="hidden" name="quantity"
								value="<%= item.getQuantity() + 1 %>">
							<button class="qty-btn" type="submit">+</button>
						</form>
					</div>

					<div class="total">
						₹<%= item.getTotalPrice() %></div>

					<form action="callCartServlet" method="post"
						style="display: contents;">
						<input type="hidden" name="menuId" value="<%= item.getMenuId() %>">
						<input type="hidden" name="restaurantId"
							value="<%= restaurantId %>"> <input type="hidden"
							name="action" value="delete">
						<button type="submit" class="delete">🗑</button>
					</form>

				</div>

				<% } %>

			</div>

			<div class="summary">

				<div class="bill">

					<div class="bill-row">
						<span>Subtotal</span> <span>₹<%= grandTotal %></span>
					</div>

					<div class="bill-row">
						<span>Delivery Fee</span> <span>₹<%= deliveryFee %></span>
					</div>

					<div class="bill-row grand">
						<span>Grand Total</span> <span>₹<%= grandTotal + deliveryFee %></span>
					</div>

				</div>

				<div class="checkout">

					<a href="Checkout.jsp" class="checkout-btn"> Proceed to
						Checkout → </a>

					<div class="secure">🔒 Secure Checkout</div>

				</div>

			</div>

			<% } else { %>

			<div class="empty-cart">
				<h2>Your cart is empty</h2>
				<p>Please add some food items from the menu.</p>
				<a class="checkout-btn" href="restaurant">Browse Restaurants</a>
			</div>

			<% } %>

		</div>

	</div>

</body>
</html>