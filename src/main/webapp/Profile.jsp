<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="com.tap.model.User"%>

<%
User user = (User) session.getAttribute("user");

if(user == null){
    response.sendRedirect("login");
    return;
}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>My Profile | FoodVibez</title>

<link href="https://fonts.googleapis.com/css2?family=Fraunces:wght@600;700&family=Inter:wght@400;500;600;700&display=swap" rel="stylesheet">

<style>

:root{
    --coral:#ff5a36;
    --coral-dark:#e84a28;
    --bg:#f7f4ef;
    --card:#ffffff;
    --line:#e7e2da;
    --text:#171310;
    --muted:#6b645c;
}

*{
    margin:0;
    padding:0;
    box-sizing:border-box;
}

body{
    background:var(--bg);
    font-family:'Inter',sans-serif;
}

/* ================= NAVBAR ================= */

nav{
    position:sticky;
    top:0;
    z-index:50;
    background:rgba(255,255,255,0.85);
    backdrop-filter:blur(14px) saturate(160%);
    border-bottom:1px solid #EAE5DD;
    padding:16px 40px;

    display:flex;
    align-items:center;
}

.logo{
    font-family:'Fraunces', serif;
    font-weight:600;
    font-size:23px;
    letter-spacing:-0.3px;
    display:flex;
    align-items:center;
    gap:9px;
    color:#171310;
}

.logo-icon{
    width:30px;
    height:30px;
    border-radius:9px;
    background:linear-gradient(135deg,#FF5A36,#E84A28);
    display:flex;
    align-items:center;
    justify-content:center;
    color:white;
}

/* CENTER MENU */
.nav-links{
    flex:1;
    display:flex;
    justify-content:center;
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
    transition:all .18s ease;
}

.nav-links a:hover{
    color:#171310;
    background:#F1EFEB;
}

.nav-links a.active{
    color:#E84A28;
    background:#FFF1ED;
    font-weight:600;
}

/* PROFILE RIGHT */
.profile-right{
    display:flex;
    align-items:center;
}

.profile-pill{
    display:flex;
    align-items:center;
    gap:9px;
    border:1px solid #EAE5DD;
    border-radius:30px;
    padding:5px 16px 5px 6px;
    background:white;
}

.profile-avatar{
    width:30px;
    height:30px;
    border-radius:50%;
    background:linear-gradient(135deg,#2F8F5B,#246b44);
    color:white;
    display:flex;
    align-items:center;
    justify-content:center;
    font-weight:700;
    font-size:12px;
}

.profile-pill span{
    font-weight:600;
    font-size:13.5px;
    color:#171310;
}

/* ================= PROFILE ================= */

.container{
    width:100%;
    display:flex;
    justify-content:center;
    padding:50px 20px;
}

.profile-card{
    width:100%;
    max-width:800px;

    background:var(--card);

    border-radius:28px;

    padding:45px;

    box-shadow:
    0 20px 45px rgba(0,0,0,0.08);

    border:1px solid var(--line);
}

.profile-header{
    text-align:center;
    margin-bottom:35px;
}

.avatar{
    width:130px;
    height:130px;

    margin:auto;

    border-radius:50%;

    background:linear-gradient(
        135deg,
        var(--coral),
        var(--coral-dark)
    );

    display:flex;
    align-items:center;
    justify-content:center;

    color:white;
    font-size:48px;
    font-weight:700;

    box-shadow:
    0 10px 30px rgba(255,90,54,.35);
}

.profile-header h2{
    margin-top:18px;

    font-size:30px;
    color:var(--text);

    font-family:'Fraunces',serif;
}

.profile-header p{
    color:var(--muted);
    margin-top:5px;
}

/* ================= FORM ================= */

.form-group{
    margin-bottom:20px;
}

.form-group label{
    display:block;
    margin-bottom:8px;
    font-weight:600;
    color:#333;
}

.form-group input,
.form-group textarea{

    width:100%;

    padding:14px 16px;

    border:1px solid #ddd;
    border-radius:12px;

    font-size:15px;

    transition:.3s;
}

.form-group input:focus,
.form-group textarea:focus{

    outline:none;

    border-color:var(--coral);
}

.readonly{
    background:#f3f3f3;
}

textarea{
    resize:none;
}

/* ================= BUTTONS ================= */

.button-group{

    margin-top:30px;

    display:flex;
    gap:15px;
}

.save-btn{

    flex:1;

    border:none;

    background:var(--coral);

    color:white;

    padding:15px;

    border-radius:12px;

    font-size:16px;
    font-weight:600;

    cursor:pointer;

    transition:.3s;
}

.save-btn:hover{
    background:var(--coral-dark);
}

.logout-btn{

    flex:1;

    text-decoration:none;

    text-align:center;

    background:#222;

    color:white;

    padding:15px;

    border-radius:12px;

    font-size:16px;
    font-weight:600;

    transition:.3s;
}

.logout-btn:hover{
    background:#000;
}

/* ================= MOBILE ================= */

@media(max-width:768px){

    nav{
        flex-direction:column;
        gap:15px;
    }

    .nav-links{
        flex-wrap:wrap;
        justify-content:center;
    }

    .profile-card{
        padding:25px;
    }

    .button-group{
        flex-direction:column;
    }

    .avatar{
        width:110px;
        height:110px;
        font-size:40px;
    }
}

</style>
</head>

<body>

<!-- NAVBAR -->

<nav>

    <div class="logo">
        <div class="logo-icon">🍽</div>
        FoodVibez
    </div>

    <div class="nav-links">

        <a href="restaurant">
            Restaurant
        </a>

        <a href="callCartServlet">
            Cart
        </a>
        <a href="orderHistory" class="nav-item">My Orders</a>

        <a href="ProfileServlet" class="active">
            👤 Profile
        </a>

    </div>

</nav>

<!-- PROFILE -->

<div class="container">

    <div class="profile-card">

        <div class="profile-header">

            <div class="avatar">
                <%= user.getName().substring(0,1).toUpperCase() %>
            </div>

            <h2><%= user.getName() %></h2>

            <p>Manage your account details</p>

        </div>

        <form action="UpdateProfileServlet" method="post">

            <input
                type="hidden"
                name="userId"
                value="<%= user.getUserId() %>">

            <div class="form-group">
                <label>User ID</label>

                <input
                    type="text"
                    value="<%= user.getUserId() %>"
                    readonly
                    class="readonly">
            </div>

            <div class="form-group">
                <label>Full Name</label>

                <input
                    type="text"
                    name="name"
                    value="<%= user.getName() %>"
                    required>
            </div>

            <div class="form-group">
                <label>Email Address</label>

                <input
                    type="email"
                    name="email"
                    value="<%= user.getEmail() %>"
                    required>
            </div>

            <div class="form-group">
                <label>Address</label>

                <textarea
                    name="address"
                    rows="4"
                    required><%= user.getAddress() %></textarea>
            </div>

            <div class="form-group">
                <label>Role</label>

                <input
                    type="text"
                    value="<%= user.getRole() %>"
                    readonly
                    class="readonly">
            </div>

            <div class="button-group">

                <button
                    type="submit"
                    class="save-btn">
                    Save Changes
                </button>

                <a
                    href="logout"
                    class="logout-btn">
                    Logout
                </a>

            </div>

        </form>

    </div>

</div>

</body>
</html>