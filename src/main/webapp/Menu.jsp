<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.tap.model.Menu , java.util.List"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>FoodVibez &#8211; Delicious Menu</title>
<link
	href="https://fonts.googleapis.com/css2?family=Playfair+Display:ital,wght@0,700;1,400&family=Inter:wght@400;500;600&display=swap"
	rel="stylesheet" />
<style>
*, *::before, *::after {
	box-sizing: border-box;
	margin: 0;
	padding: 0;
}

:root {
	--orange: #E85D04;
	--orange-lt: #FFF3EC;
	--orange-mid: #FDE8D8;
	--text-dark: #1A1008;
	--text-mid: #5C3D1E;
	--text-light: #9C7B5A;
	--white: #FFFFFF;
	--bg: #FAF7F4;
	--border: #EDE3D8;
}

body {
	font-family: 'Inter', sans-serif;
	background: var(--bg);
	color: var(--text-dark);
}

/* ── NAVBAR ── */
nav {
	display: flex;
	align-items: center;
	justify-content: space-between;
	padding: 0 40px;
	height: 70px;
	background: linear-gradient(135deg, #f8f8f8 0%, #efefef 100%);
	border-bottom: 1px solid var(--border);
	position: sticky;
	top: 0;
	z-index: 100;
}

.nav-brand {
	display: flex;
	align-items: center;
	gap: 10px;
	text-decoration: none;
}

.nav-brand-icon {
	width: 42px;
	height: 42px;
	background: var(--orange);
	border-radius: 12px;
	display: flex;
	align-items: center;
	justify-content: center;
}

.nav-brand-icon svg {
	width: 22px;
	height: 22px;
	fill: var(--white);
}

.nav-brand-name {
	font-family: 'Playfair Display', serif;
	font-size: 22px;
	font-weight: 700;
	color: var(--text-dark);
	letter-spacing: -0.3px;
}

/* center nav links */
.nav-center {
	display: flex;
	align-items: center;
	gap: 6px;
}

.nav-center a {
	display: flex;
	align-items: center;
	gap: 6px;
	padding: 8px 18px;
	border-radius: 50px;
	text-decoration: none;
	font-size: 14px;
	font-weight: 500;
	color: var(--text-mid);
	transition: background 0.2s, color 0.2s;
	white-space: nowrap;
}

.nav-center a:hover {
	background: rgba(232, 93, 4, 0.08);
	color: var(--orange);
}

.nav-center a.active {
	background: var(--orange-lt);
	color: var(--orange);
	font-weight: 600;
}

.nav-center a .nav-icon {
	font-size: 16px;
}

/* profile pill on right */
.nav-profile {
	display: flex;
	align-items: center;
	gap: 10px;
	background: var(--white);
	border: 1px solid var(--border);
	border-radius: 50px;
	padding: 5px 16px 5px 5px;
	cursor: pointer;
	transition: box-shadow 0.2s;
}

.nav-profile:hover {
	box-shadow: 0 2px 10px rgba(0, 0, 0, 0.10);
}

.nav-profile-avatar {
	width: 36px;
	height: 36px;
	border-radius: 50%;
	background: linear-gradient(135deg, #d4720a, #8b3a00);
	display: flex;
	align-items: center;
	justify-content: center;
	overflow: hidden;
	flex-shrink: 0;
}

.nav-profile-avatar svg {
	width: 20px;
	height: 20px;
	fill: var(--white);
}

.nav-profile-label {
	font-size: 14px;
	font-weight: 600;
	color: var(--text-dark);
}

/* ── HERO BANNER ── */
.hero {
	position: relative;
	text-align: center;
	padding: 56px 48px 48px;
	background: var(--white);
	overflow: hidden;
}

/* decorative leaf outlines */
.hero::before, .hero::after {
	content: '';
	position: absolute;
	width: 120px;
	height: 120px;
	border: 1.5px solid var(--border);
	border-radius: 50% 0;
	opacity: 0.5;
}

.hero::before {
	top: 20px;
	left: 60px;
	transform: rotate(-30deg);
}

.hero::after {
	top: 20px;
	left: 110px;
	transform: rotate(15deg);
	width: 80px;
	height: 80px;
}

.hero-eyebrow {
	font-family: 'Playfair Display', serif;
	font-style: italic;
	font-size: 18px;
	color: var(--orange);
	display: flex;
	align-items: center;
	justify-content: center;
	gap: 10px;
	margin-bottom: 8px;
}

.hero-eyebrow svg {
	width: 18px;
	height: 18px;
	fill: var(--orange);
}

.hero h2 {
	font-family: 'Playfair Display', serif;
	font-size: clamp(36px, 5vw, 58px);
	font-weight: 700;
	color: var(--text-dark);
	line-height: 1.1;
	margin-bottom: 12px;
}

.hero p {
	font-size: 15px;
	color: var(--text-light);
	font-weight: 400;
}

/* spice bowls – right side decoration */
.hero-spice {
	position: absolute;
	right: 0;
	top: 0;
	width: 200px;
	height: 100%;
	display: flex;
	align-items: center;
	justify-content: flex-end;
	pointer-events: none;
}

.spice-circle {
	width: 90px;
	height: 90px;
	border-radius: 50%;
	position: absolute;
}

.sc1 {
	background: radial-gradient(circle at 40% 40%, #D4720A, #8B3A00);
	width: 100px;
	height: 100px;
	right: 60px;
	top: 20px;
	opacity: 0.9;
}

.sc2 {
	background: radial-gradient(circle at 40% 40%, #C0392B, #7B1818);
	width: 70px;
	height: 70px;
	right: 10px;
	top: 60px;
	opacity: 0.85;
}

.sc3 {
	background: radial-gradient(circle at 40% 40%, #2E2E2E, #111);
	width: 55px;
	height: 55px;
	right: 90px;
	top: 90px;
	opacity: 0.8;
}

/* ── MENU GRID ── */
.menu-section {
	padding: 32px 48px;
	background: var(--bg);
}

.menu-grid {
	display: grid;
	grid-template-columns: repeat(4, 1fr);
	gap: 25px;
}

.menu-card {
    background: white;
    border-radius: 16px;
    overflow: hidden;
}

.menu-card:hover {
	transform: translateY(-5px);
}

.menu-card-img {
    width: 100%;
    height: 280px;
    overflow: hidden;
}

.menu-card-img img {
    width: 100%;
    height: 100%;
    object-fit: cover;
    display: block;
}

.menu-card:hover .menu-card-img img {
	transform: scale(1.05);
}

.veg-badge {
	position: absolute;
	top: 10px;
	right: 10px;
	background: #2E7D32;
	color: #fff;
	font-size: 10px;
	font-weight: 700;
	padding: 4px 10px;
	border-radius: 5px;
	letter-spacing: 0.05em;
}

.unavailable-badge {
	position: absolute;
	top: 10px;
	left: 10px;
	background: rgba(0, 0, 0, 0.55);
	color: #fff;
	font-size: 10px;
	font-weight: 600;
	padding: 4px 10px;
	border-radius: 5px;
	letter-spacing: 0.04em;
}

.menu-card-body {
	padding: 12px 14px 14px;
	display: flex;
	flex-direction: column;
	gap: 6px;
}

.menu-card-top {
	display: flex;
	align-items: flex-start;
	justify-content: space-between;
	gap: 8px;
}

.menu-card-info {
	flex: 1;
	min-width: 0;
}

.menu-card-name {
	font-size: 15px;
	font-weight: 700;
	color: var(--text-dark);
	margin-bottom: 2px;
	white-space: nowrap;
	overflow: hidden;
	text-overflow: ellipsis;
}

.menu-card-category {
	display: inline-block;
	font-size: 10px;
	font-weight: 600;
	color: var(--orange);
	background: var(--orange-lt);
	border-radius: 4px;
	padding: 2px 8px;
	letter-spacing: 0.06em;
	text-transform: uppercase;
}

.menu-card-desc {
	font-size: 12px;
	color: var(--text-light);
	line-height: 1.5;
	display: -webkit-box;
	-webkit-line-clamp: 2;
	-webkit-box-orient: vertical;
	overflow: hidden;
}

.menu-card-footer {
	display: flex;
	align-items: center;
	justify-content: space-between;
	margin-top: 2px;
}

.menu-card-price {
	font-size: 16px;
	font-weight: 800;
	color: var(--orange);
}

.btn-add {
	width: 34px;
	height: 34px;
	border-radius: 50%;
	border: 2px solid var(--orange);
	background: var(--white);
	color: var(--orange);
	font-size: 22px;
	line-height: 1;
	display: flex;
	align-items: center;
	justify-content: center;
	cursor: pointer;
	flex-shrink: 0;
	transition: background 0.2s, color 0.2s;
}

.btn-add:hover {
	background: var(--orange);
	color: var(--white);
}

.btn-add:disabled {
	border-color: #ccc;
	color: #ccc;
	cursor: not-allowed;
}

.menu-card.unavailable {
	opacity: 0.65;
}

.menu-card.unavailable .menu-card-img img {
	filter: grayscale(40%);
}

/* ── FOOTER BANNER ── */
.footer-banner {
    margin: 40px 48px 48px;
    background: var(--orange-lt);
    border: 1px solid #F5D5BE;
    border-radius: 16px;
    padding: 24px 32px;

    display: flex;
    flex-direction: column;   /* stack items vertically */
    align-items: center;      /* horizontal center */
    justify-content: center;  /* vertical center */
    text-align: center;       /* center text */
    gap: 15px;
}

.footer-banner-icon {
	width: 56px;
	height: 56px;
	background: var(--orange-mid);
	border-radius: 50%;
	display: flex;
	align-items: center;
	justify-content: center;
	flex-shrink: 0;
}

.footer-banner-icon svg {
	width: 26px;
	height: 26px;
	stroke: var(--orange);
	fill: none;
	stroke-width: 1.8;
	stroke-linecap: round;
	stroke-linejoin: round;
}

.footer-banner-text {
	flex: 1;
	text-align: center;
}

.footer-banner-text h3 {
	font-family: 'Playfair Display', serif;
	font-size: 20px;
	font-weight: 700;
	color: var(--text-dark);
	margin-bottom: 4px;
}

.footer-banner-text p {
	font-size: 13px;
	color: var(--text-light);
}

.btn-cart {
	display: flex;
	align-items: center;
	gap: 8px;
	background: var(--orange);
	color: var(--white);
	border: none;
	border-radius: 10px;
	padding: 13px 24px;
	font-family: 'Inter', sans-serif;
	font-size: 14px;
	font-weight: 600;
	cursor: pointer;
	white-space: nowrap;
	transition: background 0.2s, transform 0.15s;
}

.btn-cart:hover {
	background: #C94D00;
	transform: translateY(-1px);
}

.btn-cart svg {
	width: 18px;
	height: 18px;
	stroke: var(--white);
	fill: none;
	stroke-width: 2;
	stroke-linecap: round;
	stroke-linejoin: round;
}
</style>
</head>
<body>

	<!-- NAVBAR -->
	<nav>
		<!-- Brand -->
		<a class="nav-brand" href="#">
			<div class="nav-brand-icon">
				<svg viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
          <path d="M12 3C7 3 3 7 3 12h18c0-5-4-9-9-9z" />
          <rect x="2" y="12" width="20" height="2" rx="1" />
          <rect x="6" y="17" width="12" height="2" rx="1" />
          <rect x="9" y="19" width="6" height="2" rx="1" />
        </svg>
			</div> <span class="nav-brand-name">FoodVibez</span>
		</a>

		<!-- Center Links -->
		<div class="nav-center">

			<a href="restaurant" class="active"> <span class="nav-icon">&#128214;</span>
				Restaurant
			</a> <a href="callCartServlet" class="nav-item"><span class="icon"></span>Cart</a>
			<a href="LoginServlet"> &#8594;&nbsp;Login </a> <a
				href="ProfileServlet"> <span class="nav-icon">&#128100;</span>
				Profile
			</a>
		</div>

		<!-- Right Profile Pill -->
		<div class="nav-profile">
			
						
			
		</div>
	</nav>

	<!-- HERO -->
	<section class="hero">
		<div class="hero-spice">
			<div class="spice-circle sc1"></div>
			<div class="spice-circle sc2"></div>
			<div class="spice-circle sc3"></div>
		</div>

		<div class="hero-eyebrow">
			<!-- floral spark -->
			<svg viewBox="0 0 20 20">
				<path
					d="M10 2C10 2 11 6 14 7C11 8 10 12 10 12C10 12 9 8 6 7C9 6 10 2 10 2Z" />
				<circle cx="10" cy="10" r="1.5" /></svg>
			Discover Our
			<svg viewBox="0 0 20 20">
				<path
					d="M10 2C10 2 11 6 14 7C11 8 10 12 10 12C10 12 9 8 6 7C9 6 10 2 10 2Z" />
				<circle cx="10" cy="10" r="1.5" /></svg>
		</div>

		<h2>Delicious Menu</h2>
		<p>A perfect blend of authentic flavors and premium ingredients.</p>
	</section>

	<!-- MENU GRID -->
	<section class="menu-section">
		<div class="menu-grid">

			<%
			List<Menu> allMenu = (List<Menu>) request.getAttribute("allMenu");
			for (Menu menu : allMenu) {
			%>


			<div class="menu-card">
				<div class="menu-card-img">
					<img src="<%= request.getContextPath() + menu.getImageURL() %>"
     alt="<%= menu.getItemName() %>">
						alt="<%=menu.getItemName()%>" />
				</div>
				<div class="menu-card-body">
					<div class="menu-card-info">
						<div class="menu-card-name"><%=menu.getItemName()%></div>
						<div class="menu-card-price">
							&#8377;<%=menu.getPrice()%></div>
					</div>

					<form action="callCartServlet" method="POST">
						<input type="hidden" name="menuId" value="<%=menu.getMenuID()%>">
						<input type="hidden" name="quantity" value=1> <input
							type="hidden" name="restaurantId"
							value="<%=menu.getRestaurantID()%>"> <input
							type="hidden" name="action" value="add">


						<button type="submit" class="btn-add">+</button>
					</form>
				</div>

			</div>

			<%
			}
			%>

		</div>
	</section>

	<!-- FOOTER BANNER -->
	<div class="footer-banner">
		<div class="footer-banner-icon">
			<svg viewBox="0 0 24 24">
				<path d="M3 9h18M3 9l2 9h14l2-9M3 9l1.5-4h15L21 9" />
				<circle cx="9" cy="20" r="1" />
				<circle cx="15" cy="20" r="1" /></svg>
		</div>
		<div class="footer-banner-text">
			<h3>Craving Something Delicious?</h3>
			<p>Your favorite meal is just a click away!</p>
		</div>
		
	</div>

</body>
</html>