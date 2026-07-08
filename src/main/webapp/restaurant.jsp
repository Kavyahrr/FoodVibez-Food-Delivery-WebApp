<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="com.tap.model.Restaurant"%>
<%@ page import="com.tap.model.User"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>FoodVibez</title>
<style>
@import
	url('https://fonts.googleapis.com/css2?family=Fraunces:opsz,wght@9..144,400;9..144,500;9..144,600;9..144,700&family=Inter:wght@400;500;600;700;800&display=swap')
	;

:root {
	--ink: #171310;
	--ink-soft: #6B645C;
	--surface: #F7F4EF;
	--paper: #FFFFFF;
	--line: #EAE5DD;
	--coral: #FF5A36;
	--coral-deep: #E84A28;
	--coral-tint: #FFF1ED;
	--sage: #2F8F5B;
	--sage-tint: #EAF6EF;
	--grey: #8C857C;
	--grey-tint: #F1EFEB;
	--shadow-sm: 0 2px 8px rgba(23, 19, 16, 0.06);
	--shadow-md: 0 12px 32px rgba(23, 19, 16, 0.10);
	--shadow-lg: 0 24px 60px rgba(23, 19, 16, 0.16);
}

* {
	box-sizing: border-box;
	margin: 0;
	padding: 0;
}

html {
	scroll-behavior: smooth;
}

body {
	background: var(--surface);
	color: var(--ink);
	font-family: 'Inter', sans-serif;
	-webkit-font-smoothing: antialiased;
	overflow-x: hidden;
}

.app {
	max-width: 1280px;
	margin: 0 auto;
}

::selection {
	background: var(--coral);
	color: white;
}

/* ---------- NAV ---------- */
nav {
	position: sticky;
	top: 0;
	z-index: 50;
	background: rgba(255, 255, 255, 0.85);
	backdrop-filter: blur(14px) saturate(160%);
	border-bottom: 1px solid var(--line);
	padding: 16px 40px;
	display: flex;
	align-items: center;
	justify-content: space-between;
}

.logo {
	font-family: 'Fraunces', serif;
	font-weight: 600;
	font-size: 23px;
	letter-spacing: -0.3px;
	display: flex;
	align-items: center;
	gap: 9px;
	color: var(--ink);
}

.logo .mark {
	width: 30px;
	height: 30px;
	border-radius: 9px;
	background: linear-gradient(135deg, var(--coral), var(--coral-deep));
	display: flex;
	align-items: center;
	justify-content: center;
	box-shadow: 0 4px 12px rgba(255, 90, 54, 0.35);
}

.logo .mark svg {
	width: 16px;
	height: 16px;
}

.nav-links {
	display: flex;
	align-items: center;
	gap: 8px;
	list-style: none;
}

.nav-links a {
	text-decoration: none;
	color: var(--ink-soft);
	font-weight: 500;
	font-size: 14.5px;
	padding: 9px 16px;
	border-radius: 9px;
	transition: all .18s ease;
}

.nav-links a:hover {
	color: var(--ink);
	background: var(--grey-tint);
}

.nav-links a.active {
	color: var(--coral-deep);
	background: var(--coral-tint);
	font-weight: 600;
}

.nav-right {
	display: flex;
	align-items: center;
	gap: 14px;
}

.icon-btn {
	width: 40px;
	height: 40px;
	border-radius: 11px;
	border: 1px solid var(--line);
	display: flex;
	align-items: center;
	justify-content: center;
	background: var(--paper);
	position: relative;
	cursor: pointer;
	color: var(--ink);
	transition: all .18s ease;
}

.icon-btn:hover {
	border-color: var(--ink);
	box-shadow: var(--shadow-sm);
}

.cart-badge {
	position: absolute;
	top: -6px;
	right: -6px;
	background: var(--coral);
	color: white;
	font-size: 10px;
	font-weight: 700;
	width: 18px;
	height: 18px;
	border-radius: 50%;
	display: flex;
	align-items: center;
	justify-content: center;
	border: 2px solid var(--paper);
}

.btn-login {
	background: var(--ink);
	color: var(--paper);
	border: none;
	padding: 11px 22px;
	border-radius: 10px;
	font-weight: 600;
	font-size: 14px;
	cursor: pointer;
	transition: all .18s ease;
}

.btn-login:hover {
	background: #2c2620;
	box-shadow: var(--shadow-sm);
}

.profile-pill {
	display: flex;
	align-items: center;
	gap: 9px;
	border: 1px solid var(--line);
	border-radius: 30px;
	padding: 5px 16px 5px 6px;
	background: var(--paper);
	cursor: pointer;
	transition: all .18s ease;
}

.profile-pill:hover {
	border-color: var(--ink);
	box-shadow: var(--shadow-sm);
}

.avatar {
	width: 30px;
	height: 30px;
	border-radius: 50%;
	background: linear-gradient(135deg, var(--sage), #246b44);
	display: flex;
	align-items: center;
	justify-content: center;
	color: white;
	font-weight: 700;
	font-size: 12.5px;
	overflow: hidden;
	flex-shrink: 0;
}

.avatar img {
	width: 100%;
	height: 100%;
	object-fit: cover;
	display: block;
}

.profile-pill span {
	font-weight: 600;
	font-size: 13.5px;
	color: var(--ink);
}

/* ---------- HERO ---------- */
.hero {
	position: relative;
	margin: 24px 24px 0;
	border-radius: 28px;
	overflow: hidden;
	background: #15110D;
	min-height: 430px;
	display: flex;
	align-items: stretch;
	box-shadow: var(--shadow-lg);
}

.hero-photo-wrap {
	position: absolute;
	inset: 0;
	z-index: 1;
}

.hero-photo-wrap img {
	position: absolute;
	right: 0;
	top: 0;
	height: 100%;
	width: auto;
	max-width: none;
	object-fit: cover;
}

.hero-photo-wrap::before {
	content: "";
	position: absolute;
	inset: 0;
	background: #15110D;
}

.hero-content {
	position: relative;
	z-index: 2;
	padding: 56px 56px;
	display: flex;
	flex-direction: column;
	justify-content: center;
	max-width: 560px;
	width: 100%;
}

.hero-script {
	display: flex;
	align-items: center;
	gap: 12px;
	font-family: 'Fraunces', serif;
	font-style: italic;
	font-weight: 500;
	font-size: 25px;
	color: #F0A33C;
	margin-bottom: 2px;
}

.hero-script svg {
	flex-shrink: 0;
	opacity: 0.9;
}

.hero h1 {
	font-family: 'Fraunces', serif;
	font-weight: 700;
	color: #FFFFFF;
	font-size: 72px;
	line-height: 1.05;
	letter-spacing: -1px;
	margin-bottom: 14px;
}

.hero-rule {
	display: flex;
	align-items: center;
	gap: 14px;
	margin-bottom: 18px;
}

.hero-rule .line {
	height: 1px;
	width: 170px;
	background: rgba(255, 170, 80, 0.4);
}

.hero-rule svg {
	flex-shrink: 0;
	color: #F0A33C;
}

.hero p {
	color: rgba(255, 255, 255, 0.92);
	font-size: 19px;
	line-height: 1.5;
	max-width: 460px;
	font-weight: 400;
	margin-bottom: 26px;
}

.hero-features {
	display: flex;
	align-items: flex-start;
	gap: 22px;
	flex-wrap: nowrap;
}

.hero-feature {
	display: flex;
	align-items: center;
	gap: 9px;
	flex-shrink: 0;
}

.hero-feature .ico {
	width: 40px;
	height: 40px;
	border-radius: 50%;
	background: rgba(60, 52, 40, 0.7);
	border: 1px solid rgba(255, 255, 255, 0.1);
	display: flex;
	align-items: center;
	justify-content: center;
	flex-shrink: 0;
	color: #FFFFFF;
}

.hero-feature .ico svg {
	width: 17px;
	height: 17px;
}

.hero-feature .copy {
	display: flex;
	flex-direction: column;
}

.hero-feature .copy .t {
	color: #FFFFFF;
	font-weight: 700;
	font-size: 13.5px;
	line-height: 1.3;
}

.hero-feature .copy .d {
	color: rgba(255, 255, 255, 0.6);
	font-size: 12px;
	font-weight: 500;
	margin-top: 1px;
}

/* ---------- POPULAR RESTAURANTS ---------- */
.section {
	padding: 80px 40px 30px;
}

.section-head {
	display: flex;
	justify-content: space-between;
	align-items: flex-end;
	margin-bottom: 42px;
}

.section-head .tag {
	font-weight: 700;
	color: var(--coral-deep);
	text-transform: uppercase;
	letter-spacing: 1.6px;
	font-size: 12px;
	margin-bottom: 10px;
	display: block;
}

.section-head h2 {
	font-family: 'Fraunces', serif;
	font-weight: 600;
	font-size: 38px;
	letter-spacing: -1px;
	color: var(--ink);
}

.section-head .sub {
	color: var(--ink-soft);
	font-size: 14.5px;
	max-width: 360px;
	text-align: right;
	line-height: 1.6;
}

.grid {
	display: grid;
	grid-template-columns: repeat(3, 1fr);
	gap: 26px;
}

.grid a {
	text-decoration: none;
	color: inherit;
}

.card {
	background: var(--paper);
	border-radius: 18px;
	overflow: hidden;
	display: flex;
	flex-direction: column;
}

.card:hover {
	transform: translateY(-5px);
	box-shadow: var(--shadow-md);
	border-color: transparent;
}

.card.is-closed {
	opacity: 0.92;
}

.card-media {
	height: 300px;
	position: relative;
	overflow: hidden;
	background: var(--grey-tint);
}

.card-media img {
	width: 100%;
	height: 100%;
	object-fit: cover;
	display: block;
}

.card:hover .card-media img {
	transform: scale(1.06);
}

.card.is-closed .card-media img {
	filter: grayscale(45%) brightness(0.85);
}

.media-gradient {
	position: absolute;
	inset: 0;
	background: linear-gradient(180deg, rgba(0, 0, 0, 0.05) 0%,
		rgba(0, 0, 0, 0.25) 100%);
}

.status-pill {
	position: absolute;
	top: 14px;
	left: 14px;
	padding: 6px 12px;
	border-radius: 30px;
	font-size: 11px;
	font-weight: 700;
	letter-spacing: 0.3px;
	display: flex;
	align-items: center;
	gap: 6px;
	z-index: 3;
	backdrop-filter: blur(6px);
}

.status-pill.open {
	background: rgba(47, 143, 91, 0.92);
	color: white;
}

.status-pill.closed {
	background: rgba(23, 19, 16, 0.6);
	color: #F1EFEB;
}

.status-pill .dot {
	width: 6px;
	height: 6px;
	border-radius: 50%;
	background: white;
}

.status-pill.open .dot {
	box-shadow: 0 0 0 0 rgba(255, 255, 255, 0.7);
	animation: livedot2 1.8s infinite;
}

@
keyframes livedot2 { 0%{
	box-shadow: 0 0 0 0 rgba(255, 255, 255, 0.6);
}

70


%
{
box-shadow


:


0


0


0


6px


rgba
(


255
,
255
,
255
,
0


)
;


}
100


%
{
box-shadow


:


0


0


0


0


rgba
(


255
,
255
,
255
,
0


)
;


}
}
.card-body .cuisine {
	color: var(--coral-deep);
	font-size: 12.5px;
	font-weight: 600;
	text-transform: uppercase;
	letter-spacing: 0.4px;
	margin-bottom: 10px;
}

.rating-chip {
	position: absolute;
	top: 14px;
	right: 14px;
	background: rgba(255, 255, 255, 0.95);
	color: var(--ink);
	padding: 5px 10px;
	border-radius: 30px;
	font-size: 12px;
	font-weight: 700;
	display: flex;
	align-items: center;
	gap: 4px;
	z-index: 3;
}

.rating-chip svg {
	width: 11px;
	height: 11px;
	fill: var(--coral);
}

.card-body {
	padding: 20px 20px 18px;
}

.card-body .name {
	font-family: 'Fraunces', serif;
	font-weight: 600;
	font-size: 18.5px;
	letter-spacing: -0.3px;
	margin-bottom: 7px;
	color: var(--ink);
}

.card-body .loc {
	display: flex;
	align-items: center;
	gap: 6px;
	color: var(--ink-soft);
	font-size: 13px;
	font-weight: 500;
	margin-bottom: 16px;
}

.card-body .loc svg {
	flex-shrink: 0;
	opacity: 0.7;
}

.card-footer {
	display: flex;
	justify-content: space-between;
	align-items: center;
	padding-top: 15px;
	border-top: 1px solid var(--line);
}

.delivery-time {
	display: flex;
	align-items: center;
	gap: 6px;
	font-size: 13px;
	font-weight: 600;
	color: var(--ink);
}

.delivery-time svg {
	flex-shrink: 0;
	color: var(--ink-soft);
}

.order-link {
	font-size: 12.5px;
	font-weight: 700;
	color: var(--coral-deep);
	cursor: pointer;
	display: flex;
	align-items: center;
	gap: 4px;
	transition: gap .18s ease;
}

.order-link:hover {
	gap: 7px;
}

.closed-note {
	font-size: 12.5px;
	font-weight: 600;
	color: var(--grey);
}

.notify-link {
	font-size: 12.5px;
	font-weight: 700;
	color: var(--ink-soft);
	cursor: pointer;
}

footer {
	text-align: center;
	padding: 60px 0 56px;
	color: var(--ink-soft);
	font-size: 13px;
	margin-top: 40px;
	border-top: 1px solid var(--line);
}

footer .f-logo {
	font-family: 'Fraunces', serif;
	font-weight: 600;
	font-size: 18px;
	color: var(--ink);
	margin-bottom: 8px;
}

@media ( max-width :980px) {
	.grid {
		grid-template-columns: repeat(2, 1fr);
	}
}

@media ( max-width :760px) {
	.grid {
		grid-template-columns: 1fr;
	}
	.hero h1 {
		font-size: 40px;
	}
	.nav-links {
		display: none;
	}
	.section-head {
		flex-direction: column;
		align-items: flex-start;
		gap: 10px;
	}
	.section-head .sub {
		text-align: left;
	}
	.hero-stats {
		position: static;
		border-radius: 0;
		margin-top: 20px;
	}
	.hero-content {
		padding: 48px 28px;
	}
}
</style>
</head>
<body>

	<div class="app">

		<!-- NAV -->
		<nav>
			<div class="logo">
				<span class="mark"> <svg viewBox="0 0 24 24" fill="none"
						stroke="white" stroke-width="2" stroke-linecap="round"
						stroke-linejoin="round">
						<path
							d="M3 11h18M3 11a9 9 0 0 1 18 0M3 11v7a2 2 0 0 0 2 2h14a2 2 0 0 0 2-2v-7" /></svg>
				</span> FoodVibez
			</div>
			<div class="nav-links">

				<a href="restaurant" class="nav-item active"><span class="icon"></span>Restaurant</a>
				<a href="login" class="nav-item"><span class="icon"></span>Login</a>
				<a href="callCartServlet" class="nav-item"><span class="icon"></span>Cart</a>
				<a href="orderHistory" class="nav-item">My Orders</a> <a
					href="ProfileServlet" class="nav-item"><span class="icon">👤</span>Profile</a>
			</div>
			<div class="nav-right">
		</nav>

		<%
		User user = (User) session.getAttribute("user");
		%>

		<!-- HERO -->
		<section class="hero">
			<div class="hero-photo-wrap">
				<img
					src="data:image/webp;base64,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"
					alt="Biryani bowl with herbs">
			</div>
			<div class="hero-content">
				<div class="hero-script">
					<svg width="22" height="14" viewBox="0 0 22 14" fill="none">
						<path d="M1 7c4-5 8-5 10 0s6 5 10 0" stroke="currentColor"
							stroke-width="1.5" stroke-linecap="round" /></svg>
					Welcome to
					<svg width="22" height="14" viewBox="0 0 22 14" fill="none"
						style="transform: scaleX(-1)">
						<path d="M1 7c4-5 8-5 10 0s6 5 10 0" stroke="currentColor"
							stroke-width="1.5" stroke-linecap="round" /></svg>
				</div>
				<h1>FoodVibez</h1>
				<div class="hero-rule">
					<span class="line"></span>
					<svg width="16" height="16" viewBox="0 0 24 24" fill="currentColor">
						<path d="M12 2l1.8 5.5L19 9l-5.2 1.5L12 16l-1.8-5.5L5 9l5.2-1.5z" /></svg>
					<span class="line"></span>
				</div>
				<p>Delicious meals, delivered with love.</p>
				<div class="hero-features">
					<div class="hero-feature">
						<span class="ico"><svg viewBox="0 0 24 24" fill="none"
								stroke="currentColor" stroke-width="2" stroke-linecap="round"
								stroke-linejoin="round">
								<rect x="1" y="6" width="13" height="11" />
								<path d="M14 9h4l3 4v4h-7z" />
								<circle cx="6" cy="20" r="2" />
								<circle cx="17" cy="20" r="2" /></svg></span> <span class="copy"> <span
							class="t">Fast Delivery</span> <span class="d">On time,
								every time</span>
						</span>
					</div>
					<div class="hero-feature">
						<span class="ico"><svg viewBox="0 0 24 24" fill="none"
								stroke="currentColor" stroke-width="2" stroke-linecap="round"
								stroke-linejoin="round">
								<path
									d="M11 20A7 7 0 0 1 4 13c0-4 7-10 7-10s7 6 7 10a7 7 0 0 1-7 7z" /></svg></span>
						<span class="copy"> <span class="t">Fresh
								Ingredients</span> <span class="d">Sourced with care</span>
						</span>
					</div>
					<div class="hero-feature">
						<span class="ico"><svg viewBox="0 0 24 24" fill="none"
								stroke="currentColor" stroke-width="2" stroke-linecap="round"
								stroke-linejoin="round">
								<path
									d="M6 13.87A4 4 0 0 1 7.41 6a5.11 5.11 0 0 1 1.05-1.54 5 5 0 0 1 7.08 0A5.11 5.11 0 0 1 16.59 6 4 4 0 0 1 18 13.87V21H6z" />
								<line x1="6" y1="17" x2="18" y2="17" /></svg></span> <span class="copy">
							<span class="t">Authentic Taste</span> <span class="d">Made
								to perfection</span>
						</span>
					</div>
				</div>
			</div>
		</section>

		<!-- POPULAR RESTAURANTS -->
		<section class="section">
			<div class="section-head">
				<div>
					<span class="tag">Trending this week</span>
					<h2>Popular Restaurants</h2>
				</div>
				<p class="sub">Handpicked kitchens loved by FoodVibes regulars —
					ranked by orders, ratings, and speed.</p>
			</div>

			<div class="grid">

				<!-- CARD 1 -->

				<%
				List<Restaurant> allRestaurant = (List<Restaurant>) request.getAttribute("allRestaurant");
				for (Restaurant restaurant : allRestaurant) {
				%>

				<a
					href="MenuServlet?restaurantId=<%=restaurant.getRestaurantID()%>">
					<div class="card">
						<div class="card-media">

							<img src="<%=request.getContextPath() + restaurant.getImg()%>"
								alt="<%=restaurant.getName()%>">
							<div class="media-gradient"></div>
							<span class="status-pill open"><span class="dot"></span><%=restaurant.isActive()%></span>
							<span class="rating-chip"><svg viewBox="0 0 24 24">
									<path
										d="M12 2l3.1 6.3 6.9 1-5 4.9 1.2 6.9L12 17.8 5.8 21.1 7 14.2l-5-4.9 6.9-1z" /></svg><%=restaurant.getRating()%></span>
						</div>
						<div class="card-body">
							<div class="name"><%=restaurant.getName()%></div>
							<div class="cuisine"><%=restaurant.getCuisineType()%></div>
							<div class="loc">
								<svg width="13" height="13" viewBox="0 0 24 24" fill="none"
									stroke="currentColor" stroke-width="2">
									<path d="M21 10c0 7-9 13-9 13s-9-6-9-13a9 9 0 0 1 18 0z" />
									<circle cx="12" cy="10" r="3" /></svg>
								<%=restaurant.getAddress()%>
							</div>
							<div class="card-footer">
								<div class="delivery-time">
									<svg width="15" height="15" viewBox="0 0 24 24" fill="none"
										stroke="currentColor" stroke-width="2">
										<circle cx="12" cy="12" r="9" />
										<path d="M12 7v5l3 3" /></svg>
									<%=restaurant.getDeliveryTime()%>
									min
								</div>
							</div>
						</div>
					</div>

				</a>

				<%
				}
				%>

			</div>
		</section>

		<footer>
			<div class="f-logo">FoodVibes</div>
			© 2026 FoodVibes — Made for people who don't like waiting.
		</footer>

	</div>

</body>
</html>