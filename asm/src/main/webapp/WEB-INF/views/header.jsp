<!-- header.jsp -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Phone Store</title>

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <style>
        body {
            background-color: #f8f9fa;
        }
        .navbar {
            margin-bottom: 30px;
        }
        /* Hero Section Styles */
        .hero-section {
            background-image: url('https://example.com/your-hero-image.jpg'); /* Thay bằng đường dẫn hình ảnh của bạn */
            background-size: cover;
            background-position: center;
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            color: white;
            text-align: center;
            position: relative;
        }
        .hero-overlay {
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background-color: rgba(0, 0, 0, 0.5); /* Tạo lớp overlay tối */
        }
        .hero-content {
            position: relative;
            z-index: 1;
        }
        .hero-section h1 {
            font-size: 4rem;
            margin-bottom: 20px;
        }
        .hero-section p {
            font-size: 1.5rem;
            margin-bottom: 30px;
        }
        .btn-hero {
            padding: 15px 30px;
            font-size: 1.2rem;
            background-color: #007bff;
            border: none;
            border-radius: 8px;
            color: white;
        }
        .btn-hero:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<!-- Hero Section -->
<section class="hero-section">
    <div class="hero-overlay"></div>
    <div class="hero-content">
        <h1>Welcome to Phone Store</h1>
        <p>Find the best smartphones at unbeatable prices!</p>
        <a href="products.jsp" class="btn btn-hero">Explore Products</a>
    </div>
</section>
