
<%@ include file="nav.jsp" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Login</title>

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <style>

        .form-control {
            border-radius: 8px;
        }
        .login-btn {
            background-color: #007bff;
            border: none;
            border-radius: 8px;
            padding: 10px;
            font-size: 16px;
        }
        .login-btn:hover {
            background-color: #0056b3;
        }
        .forgot-password {
            text-align: center;
            margin-top: 10px;
        }
        .forgot-password a {
            color: #007bff;
        }
        .forgot-password a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>

<div class="login-container">
    <h2 class="text-center mb-4">Login</h2>
    <form action="/assignment/login" method="POST">
        <div class="mb-3">
            <label class="form-label">Username</label>
            <input type="text" class="form-control" id="tenDangNhap" name="tenDangNhap" required>
        </div>
        <div class="mb-3">
            <label class="form-label">Password</label>
            <input type="password" class="form-control" id="matKhau" name="matKhau" required>
        </div>
        <button type="submit" class="btn login-btn w-100">Login</button>
    </form>
    <div class="forgot-password">
        <a href="#">Forgot password?</a>
    </div>
</div>
<%@ include file="footer.jsp" %>
<!-- Bootstrap JS (Optional) -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
