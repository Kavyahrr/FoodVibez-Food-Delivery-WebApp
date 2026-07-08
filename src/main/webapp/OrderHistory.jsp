<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.util.List" %>
<%@ page import="com.tap.model.Order" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>My Orders | FoodVibez</title>

<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">

<style>

*{
    margin:0;
    padding:0;
    box-sizing:border-box;
    font-family:'Poppins',sans-serif;
}

body{
    background:#f8f8f8;
}

nav{
    position:sticky;
    top:0;
    z-index:50;
    background:rgba(255,255,255,0.95);
    border-bottom:1px solid #e5e5e5;
    padding:16px 40px;
    display:flex;
    align-items:center;
    justify-content:space-between;
}

.logo{
    font-size:28px;
    font-weight:700;
    display:flex;
    align-items:center;
    gap:10px;
}

.mark{
    width:36px;
    height:36px;
    background:#ff7300;
    color:white;
    border-radius:10px;
    display:flex;
    align-items:center;
    justify-content:center;
}

.nav-links{
    display:flex;
    align-items:center;
    gap:10px;
}

.nav-links a{
    text-decoration:none;
    color:#555;
    font-size:16px;
    font-weight:500;
    padding:10px 18px;
    border-radius:10px;
    transition:.3s;
}

.nav-links a:hover{
    background:#f4f4f4;
}

.nav-links a.active{
    background:#fff2e8;
    color:#ff7300;
    font-weight:600;
}

.nav-right{
    display:flex;
    align-items:center;
}

.profile-pill{
    padding:10px 20px;
    border:1px solid #ddd;
    border-radius:25px;
    background:white;
    font-weight:600;
}

/* MAIN */

.container{
    width:90%;
    max-width:1200px;
    margin:40px auto;
}

.page-title{
    margin-bottom:30px;
}

.page-title h1{
    font-size:38px;
    color:#222;
}

.page-title p{
    color:#777;
}

/* ORDER CARD */

.order-card{
    background:white;
    border-radius:18px;
    padding:25px;
    margin-bottom:20px;
    box-shadow:0 4px 15px rgba(0,0,0,.08);
    border:1px solid #eee;
}

.order-top{
    display:flex;
    justify-content:space-between;
    align-items:center;
    margin-bottom:20px;
}

.order-id{
    font-size:22px;
    font-weight:600;
}

.order-date{
    color:#666;
}

.order-details{
    display:grid;
    grid-template-columns:repeat(4,1fr);
    gap:20px;
}

.detail-box{
    background:#fafafa;
    border-radius:12px;
    padding:18px;
}

.detail-title{
    font-size:13px;
    color:#888;
    margin-bottom:8px;
}

.detail-value{
    font-size:18px;
    font-weight:600;
    color:#222;
}

/* STATUS */

.status{
    display:inline-block;
    padding:8px 18px;
    border-radius:30px;
    font-size:14px;
    font-weight:600;
}

.delivered{
    background:#e8f8eb;
    color:#0d8a2d;
}

.pending{
    background:#fff4d8;
    color:#c98b00;
}

.cancelled{
    background:#ffe4e4;
    color:#d40000;
}

/* EMPTY */

.empty{
    background:white;
    text-align:center;
    padding:70px;
    border-radius:18px;
}

.empty h2{
    margin-bottom:10px;
}

.empty p{
    color:#777;
    margin-bottom:20px;
}

.btn{
    display:inline-block;
    text-decoration:none;
    background:#ff7300;
    color:white;
    padding:14px 28px;
    border-radius:10px;
}

/* MOBILE */

@media(max-width:900px){

.order-details{
    grid-template-columns:1fr;
}

.navbar{
    flex-direction:column;
    height:auto;
    padding:20px;
}

.nav-links{
    flex-wrap:wrap;
    justify-content:center;
}

}

</style>

<%@ page import="java.util.List" %>
<%@ page import="com.tap.model.Order" %>

</head>
<body>

<nav>
    <div class="logo">
        <span class="mark">🍽</span>
        FoodVibez
    </div>

    <div class="nav-links">
        <a href="restaurant">Restaurant</a>
        <a href="callCartServlet">Cart</a>
        <a href="orderHistory" class="active">My Orders</a>
        <a href="ProfileServlet">Profile</a>
        
    </div>

    <div class="nav-right">
        
    </div>
</nav>

<div class="container">

    <div class="page-title">
        <h1>My Orders</h1>
        <p>Track and view all your previous orders</p>
    </div>

<%
List<Order> orders = (List<Order>) request.getAttribute("orders");

if (orders != null && !orders.isEmpty()) {

    for (Order order : orders) {

        String status = order.getStatus();
        String statusClass = "pending";

        if ("Delivered".equalsIgnoreCase(status)) {
            statusClass = "delivered";
        } else if ("Cancelled".equalsIgnoreCase(status)) {
            statusClass = "cancelled";
        }
%>

    <div class="order-card">

        <div class="order-top">

            <div>
                <div class="order-id">
                    Order #<%= order.getOrderId() %>
                </div>

                <div class="order-date">
                    <%= order.getOrderDate() %>
                </div>
            </div>

            <div>
                <span class="status <%= statusClass %>">
                    <%= status %>
                </span>
            </div>

        </div>

        <div class="order-details">

            <div class="detail-box">
                <div class="detail-title">Restaurant ID</div>
                <div class="detail-value">
                    <%= order.getRestaurantId() %>
                </div>
            </div>

            <div class="detail-box">
                <div class="detail-title">Payment Method</div>
                <div class="detail-value">
                    <%= order.getPaymenyMethod() %>
                </div>
            </div>

            <div class="detail-box">
                <div class="detail-title">Total Amount</div>
                <div class="detail-value">
                    ₹ <%= order.getTotalamout() %>
                </div>
            </div>

            <div class="detail-box">
                <div class="detail-title">Status</div>
                <div class="detail-value">
                    <%= order.getStatus() %>
                </div>
            </div>

        </div>

    </div>

<%
    }
} else {
%>

    <div class="empty">

        <h2>No Orders Yet</h2>

        <p>
            Looks like you haven't placed any orders.
        </p>

        <a href="restaurant" class="btn">
            Browse Restaurants
        </a>

    </div>

<%
}
%>

</div>

</body>
</html>