<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>FoodVibez - Register</title>

<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">

<style>

*{
    margin:0;
    padding:0;
    box-sizing:border-box;
    font-family:'Poppins',sans-serif;
}

body{
    min-height:100vh;
    background:url('images/register-bg.png') center center/cover no-repeat;
    display:flex;
    justify-content:flex-end;
    align-items:center;
    padding-right:180px;  
    position:relative;
}

body::before{
    content:"";
    position:absolute;
    top:0;
    left:0;
    width:100%;
    height:100%;
    background:rgba(0,0,0,0.18);
    z-index:1;
    pointer-events:none;
}

.register-card{
    width:450px;          /* Increased from 400px */
    background:#fff;
    border-radius:20px;
    padding:20px 25px;    /* Same padding */
    box-shadow:0 15px 35px rgba(0,0,0,0.22);
    position:relative;
    z-index:10;
}

.welcome{
    text-align:center;
    color:#ff6b00;
    font-size:15px;
    font-weight:500;
    margin-bottom:6px;
}

.divider{
    width:180px;
    height:1px;
    background:#f2d5c0;
    margin:0 auto 10px;
    position:relative;
}

.divider::after{
    content:"✿";
    position:absolute;
    top:-10px;
    left:50%;
    transform:translateX(-50%);
    background:#fff;
    color:#ff6b00;
    padding:0 6px;
}

.title{
    text-align:center;
    font-size:36px;
    font-weight:700;
    color:#111;
    margin-bottom:4px;
}

.subtitle{
    text-align:center;
    color:#666;
    font-size:13px;
    margin-bottom:15px;
}

.form-group{
    margin-bottom:10px;
}

label{
    display:block;
    margin-bottom:4px;
    font-size:14px;
    font-weight:600;
    color:#222;
}

.input-box{
    position:relative;
    width:100%;
}

.icon{
    position:absolute;
    left:15px;
    top:50%;
    transform:translateY(-50%);
    z-index:2;
}

.input-box input,
.input-box select{
    width:100%;
    height:42px;
    border:2px solid #ececec;
    border-radius:10px;
    outline:none;
    padding-left:45px;
    padding-right:12px;
    font-size:14px;
    background:#fff;
    transition:.3s;
}

.input-box input:focus,
.input-box select:focus{
    border-color:#ff6b00;
}

.register-btn{
    width:100%;
    height:46px;
    border:none;
    border-radius:10px;
    margin-top:8px;
    background:linear-gradient(135deg,#ff8a00,#ff5e00);
    color:#fff;
    font-size:17px;
    font-weight:600;
    cursor:pointer;
    transition:0.3s;
}

.register-btn:hover{
    transform:translateY(-2px);
}

.bottom-line{
    margin-top:12px;
    padding-top:12px;
    border-top:1px solid #eee;
    text-align:center;
    color:#666;
    font-size:13px;
}

.bottom-line a{
    text-decoration:none;
    color:#ff6b00;
    font-weight:600;
    cursor:pointer;
}

@media(max-width:900px){
    body{
        justify-content:center;
        padding:20px;
    }

    .register-card{
        width:100%;
        max-width:400px;
    }

    .title{
        font-size:30px;
    }
}

</style>
</head>
<body>

<div class="register-card">

    <div class="welcome">Create Account!</div>

    <div class="divider"></div>

    <h1 class="title">Register</h1>

    <p class="subtitle">
        Fill in your details to get started
    </p>

    <form action="Register" method="post">

        <div class="form-group">
            <label>Full Name</label>
            <div class="input-box">
                <span class="icon">👤</span>
                <input type="text" name="name"
                       placeholder="Enter your full name" required>
            </div>
        </div>

        <div class="form-group">
            <label>Email Address</label>
            <div class="input-box">
                <span class="icon">✉️</span>
                <input type="email" name="email"
                       placeholder="Enter your email" required>
            </div>
        </div>

        <div class="form-group">
            <label>Password</label>
            <div class="input-box">
                <span class="icon">🔒</span>
                <input type="password" name="password"
                       placeholder="Create your password" required>
            </div>
        </div>

        <div class="form-group">
            <label>Address</label>
            <div class="input-box">
                <span class="icon">📍</span>
                <input type="text" name="address"
                       placeholder="Enter your address" required>
            </div>
        </div>

        <div class="form-group">
            <label>Role</label>
            <div class="input-box">
                <span class="icon">👨‍🍳</span>

                <select name="role" required>
                    <option value="">Select Role</option>
                    <option value="Customer">Customer</option>
                    <option value="Restaurant Owner">Restaurant Owner</option>
                    <option value="Admin">Admin</option>
                </select>

            </div>
        </div>
        
        
        <button type="submit" class="register-btn">
            Register
        </button>

    </form>

    <div class="bottom-line">
        Already have an account?
        <a href="Login.jsp">Login</a>
    </div>

</div>

</body>
</html>