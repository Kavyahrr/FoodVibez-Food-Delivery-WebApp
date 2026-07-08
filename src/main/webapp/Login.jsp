<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FoodVibez Login</title>

<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">

<style>

body{
    height:100vh;
    background:url('images/login-bg.png') center center/cover no-repeat;
    display:flex;
    align-items:center;
    position:relative;
    overflow:hidden;
}

body::before{
    content:"";
    position:absolute;
    inset:0;
    background:rgba(0,0,0,0.20);
}

.login-container{
    position:relative;
    z-index:2;
    width:80%;
    padding-left:80px;
}

.login-card{
    width:480px;          /* reduced from 620px */
    background:#fff;
    border-radius:24px;
    padding:35px 40px;    /* reduced padding */
    box-shadow:0 20px 50px rgba(0,0,0,0.25);
}

.welcome{
    text-align:center;
    color:#ff6b00;
    font-size:16px;
    font-weight:500;
    margin-bottom:10px;
}

.divider{
    width:180px;
    height:1px;
    background:#f0d5c2;
    margin:0 auto 15px;
    position:relative;
}

.divider::after{
    content:"✿";
    position:absolute;
    top:-11px;
    left:50%;
    transform:translateX(-50%);
    color:#ff6b00;
    background:#fff;
    padding:0 10px;
}

.title{
    text-align:center;
    font-size:38px;       /* reduced from 54px */
    font-weight:700;
    color:#111;
    margin-bottom:10px;
    line-height:1.2;
}

.subtitle{
    text-align:center;
    color:#666;
    font-size:16px;
    margin-bottom:28px;
}

.form-group{
    margin-bottom:18px;
}

label{
    display:block;
    margin-bottom:8px;
    font-size:16px;
    font-weight:500;
    color:#222;
}

input{
    box-sizing:border-box;
}

.input-box{
    overflow:hidden;
}

.input-box input{
    width:100%;
    height:55px;
    border:2px solid #ececec;
    border-radius:12px;
    padding-left:55px;
    padding-right:15px;
    font-size:16px;
    outline:none;
    transition:.3s;
    display:block;
}

.input-box input:focus{
    border-color:#ff6b00;
}

.icon{
    position:absolute;
    left:18px;
    top:50%;
    transform:translateY(-50%);
    font-size:18px;
    color:#ff6b00;
}

.login-btn{
    width:100%;
    height:56px;
    border:none;
    border-radius:12px;
    margin-top:10px;
    background:linear-gradient(135deg,#ff8a00,#ff5e00);
    color:white;
    font-size:20px;
    font-weight:600;
    cursor:pointer;
}

.login-btn:hover{
    transform:translateY(-2px);
}

.bottom-line{
    margin-top:25px;
    border-top:1px solid #eee;
    padding-top:20px;
    text-align:center;
    color:#666;
    font-size:15px;
}

.bottom-line a{
    color:#ff6b00;
    text-decoration:none;
    font-weight:600;
    margin-left:5px;
}

.logo-area{
    position:absolute;
    top:30px;
    left:50%;
    transform:translateX(-50%);
    text-align:center;
    color:white;
}

.logo-area h1{
    font-size:42px;
    font-weight:700;
}

.logo-area p{
    color:#ffb26a;
    letter-spacing:1px;
    font-size:13px;
}

@media(max-width:900px){

    .login-container{
    position:relative;
    z-index:2;
    width:100%;
    padding-left:60px;
}

    .login-card{
    width:300px;              /* reduced width */
    max-width:70%;
    background:#fff;
    border-radius:22px;
    padding:40px 38px;        /* reduced padding */
    box-shadow:0 15px 40px rgba(0,0,0,0.25);
}

    ..title{
    text-align:center;
    font-size:34px;           /* reduced */
    font-weight:700;
    color:#111;
    margin-bottom:10px;
}
}

</style>
</head>
<body>

<div class="logo-area">
    <h1>Spice Haven</h1>
    <p>FLAVORS THAT FEEL LIKE HOME</p>
</div>

<div class="login-container">

    <div class="login-card">

        <div class="welcome">Welcome Back!</div>

        <div class="divider"></div>

        <div class="title">Login to Your Account</div>

        <div class="subtitle">
            Enter your details to continue
        </div>

        <form action="login" method="post">

            <div class="form-group">
                <label>Email Address</label>
                <div class="input-box">
                    <span class="icon">👤</span>
                    <input type="email"
                           name="email"
                           placeholder="Enter your email"
                           required>
                </div>
            </div>

            <div class="form-group">
                <label>Password</label>
                <div class="input-box">
                    <span class="icon">🔒</span>
                    <input type="password"
                           name="password"
                           placeholder="Enter your password"
                           required>
                </div>
            </div>

            <button type="submit" class="login-btn">
                Login
            </button>

        </form>

        <div class="bottom-line">
            Don't have an account?
            <a href="Register">Create Account</a>
        </div>

    </div>

</div>

</body>
</html>