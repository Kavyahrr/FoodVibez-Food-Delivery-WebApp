<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>Order Success | Food Vibez</title>

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css">

<style>
* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
	font-family: 'Segoe UI', sans-serif;
}

body {
	background: #fff8f2;
	overflow-x: hidden;
}

/* ================= NAVBAR ================= */
/* ================= NAVBAR ================= */

.navbar{
    position:sticky;
    top:0;
    z-index:50;
    background:rgba(255,255,255,0.85);
    backdrop-filter:blur(14px) saturate(160%);
    border-bottom:1px solid #EAE5DD;
    padding:16px 40px;
    display:flex;
    align-items:center;
    justify-content:space-between;
}

.logo{
    display:flex;
    align-items:center;
    gap:10px;
}

.logo-icon{
    width:30px;
    height:30px;
    border-radius:9px;
    background:linear-gradient(135deg,#FF5A36,#E84A28);
    color:white;
    display:flex;
    justify-content:center;
    align-items:center;
    font-size:14px;
}

.logo h2{
    font-size:23px;
    font-family:Georgia, serif;
    color:#171310;
    margin:0;
}

.nav-links{
    display:flex;
    align-items:center;
    gap:8px;
}

.nav-links a{
    text-decoration:none;
    color:#6B645C;
    font-weight:500;
    font-size:14.5px;
    padding:9px 16px;
    border-radius:9px;
    transition:.2s;
}

.nav-links a:hover{
    background:#F1EFEB;
    color:#171310;
}

.profile-pill{
    display:flex;
    align-items:center;
    gap:9px;
    border:1px solid #EAE5DD;
    border-radius:30px;
    padding:5px 16px 5px 6px;
    background:#fff;
}

.avatar{
    width:30px;
    height:30px;
    border-radius:50%;
    background:linear-gradient(135deg,#2F8F5B,#246b44);
    color:#fff;
    display:flex;
    justify-content:center;
    align-items:center;
    font-size:12px;
    font-weight:700;
}

.profile-pill span{
    font-size:13.5px;
    font-weight:600;
}

/* ================= MAIN ================= */
.container {
	display: flex;
	justify-content: center;
	align-items: center;
	padding: 25px;
}
/* CARD */
.card{
    width:700px;
    min-height:460px;
    background:#fff;
    border-radius:20px;
    padding:30px 40px;
    text-align:center;
    box-shadow:0 8px 25px rgba(0,0,0,.08);
}

/* CONFETTI */
.confetti {
	position: relative;
	height: 35px;
}

.confetti span {
	position: absolute;
	font-size: 18px;
}

.confetti span:nth-child(1) {
	left: 28%;
	color: #ff9800;
}

.confetti span:nth-child(2) {
	left: 36%;
	color: #ffc107;
}

.confetti span:nth-child(3) {
	left: 44%;
	color: #4caf50;
}

.confetti span:nth-child(4) {
	left: 54%;
	color: #ff5722;
}

.confetti span:nth-child(5) {
	left: 62%;
	color: #f44336;
}

.confetti span:nth-child(6) {
	left: 70%;
	color: #4caf50;
}

/* SUCCESS ICON */
.success {
	width: 90px;
	height: 90px;
	margin: 10px auto;
	font-size: 40px;
}

.success::before {
	width: 120px;
	height: 120px;
}

.success::after {
	width: 105px;
	height: 105px;
}

/* TEXT */
h1{
    color:#047128;
    font-size:42px;
    margin-top:15px;
}

.subtitle{
    margin-top:15px;
    color:#666;
    font-size:22px;
    line-height:1.6;
}

.order-box{
    width:360px;
    margin:30px auto;
    background:#eefbea;
    border-radius:50px;
    display:flex;
    align-items:center;
    justify-content:center;
    gap:14px;
    padding:15px;
    font-size:22px;
    color:#2e7d32;
}

.mail{
    color:#666;
    font-size:18px;
    margin-bottom:30px;
}


/* BUTTONS */
.buttons {
	display: flex;
	justify-content: center;
	gap: 35px;
}

.btn{
    width:220px;
    padding:15px;
    text-decoration:none;
    border-radius:12px;
    font-size:18px;
    font-weight:600;
}

.btn-outline {
	border: 2px solid #ff7b00;
	color: #ff7b00;
	background: #fff;
}

.btn-outline:hover {
	background: #ff7b00;
	color: #fff;
}

.btn-fill {
	background: #ff7300;
	color: #fff;
}

.btn-fill:hover {
	background: #e66500;
}

/* RESPONSIVE */
@media ( max-width :900px) {
	.navbar {
		flex-direction: column;
		height: auto;
		padding: 20px;
	}
	.nav-links {
		margin-top: 20px;
		flex-wrap: wrap;
		justify-content: center;
	}
	.card {
		width: 95%;
		padding: 35px;
	}
	h1 {
		font-size: 38px;
	}
	.subtitle {
		font-size: 20px;
	}
	.order-box {
		width: 100%;
		font-size: 20px;
	}
	.buttons {
		flex-direction: column;
		align-items: center;
	}
	.btn {
		width: 100%;
	}
}
</style>

</head>
<body>

	<!-- NAVBAR -->

<nav class="navbar">

    <div class="logo">

        <div class="logo-icon">
            <i class="fa-solid fa-bell-concierge"></i>
        </div>

        <h2>FoodVibes</h2>

    </div>

    <div class="nav-links">

        <a href="restaurant">Restaurant</a>

        <a href="login">Login</a>

        <a href="callCartServlet">Cart</a>
        <a href="orderHistory" class="nav-item">My Orders</a>

        <a href="ProfileServlet">Profile</a>

    </div>

    <div class="profile-pill">

        

    </div>

</nav>

	<!-- MAIN -->

	<div class="container">

		<div class="card">

			<div class="confetti">
				<span>★</span> <span>●</span> <span>●</span> <span>★</span> <span>●</span>
				<span>★</span>
			</div>

			<div class="success">
				<i class="fa-solid fa-check"></i>
			</div>

			<h1>Order Placed Successfully!</h1>

			<p class="subtitle">
				Thank you for your order.<br> Your delicious food is being
				prepared and<br> will be delivered to you soon.
			</p>

			<div class="order-box">
				<i class="fa-solid fa-receipt"></i> <span>Your Order
					ID:&nbsp;&nbsp;<b>#ORD12345</b>
				</span>
			</div>


			<p class="mail">
				<i class="fa-solid fa-lock"></i> &nbsp; We've sent the order details
				to your registered email.
			</p>

			<div class="buttons">

				<a href="orderHistory" class="btn btn-outline"> <i
					class="fa-solid fa-lock"></i> View My Orders
				</a> <a href="restaurant" class="btn btn-fill"> <i
					class="fa-solid fa-bag-shopping"></i> Continue Ordering
				</a>

			</div>

		</div>

	</div>

</body>
</html>