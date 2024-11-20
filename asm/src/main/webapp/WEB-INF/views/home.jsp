<%@ page contentType="text/html; charset=UTF-8" %>
<!doctype html>
<%@ include file="header.jsp" %>
<%@ include file="nav.jsp" %>

<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Hot Products</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/5.1.3/css/bootstrap.min.css">
    <style>
        body {
            background-color: #f4f4f9;
        }

        .container-product {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(250px, 1fr)); /* Tự động điều chỉnh số cột */
            gap: 20px;
            margin-top: 30px;
        }

        .product {
            background-color: #fff;
            border: 1px solid #ddd;
            border-radius: 10px;
            overflow: hidden;
            transition: box-shadow 0.3s ease;
        }

        .product:hover {
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
        }

        .img-product img {
            width: 100%;
            height: 250px;
            object-fit: cover;
            border-bottom: 1px solid #ddd;
        }

        .imfomation2 {
            text-align: center;
            margin-top: 20px;
            font-size: 1.5rem;
            font-weight: bold;
            color: #333;
        }

        .product-info {
            padding: 15px;
            text-align: center;
        }

        .product-info h6 {
            margin-bottom: 10px;
            color: #555;
        }

        .product-info .action-links a {
            margin: 0 10px;
            color: #007bff;
            font-weight: bold;
        }

        .add-product-btn {
            display: inline-block;
            margin-top: 30px;
            background-color: #28a745;
            color: #fff;
            padding: 10px 15px;
            border-radius: 50%;
            font-size: 1.5rem;
            transition: background-color 0.3s ease;
        }

        .add-product-btn:hover {
            background-color: #218838;
            color: #fff;
        }
    </style>
</head>
<body>
<div class="container">
    <div class="imfomation2">
        SẢN PHẨM HOT NHẤT
    </div>

    <div class="container-product">
        <c:forEach var="sp" items="${listSPCT}">
            <div class="product">
                <div class="img-product">
                    <a href=""><img src="${sp.hinhAnh}" alt="${sp.sanPham.ten}"></a>
                </div>
                <div class="product-info">
                    <h6>${sp.sanPham.ten} (${sp.ma})</h6>
                    <h6>${sp.donGia} VND</h6>
                    <div class="action-links">
                        <a href="delete-spct/${sp.id}">Xóa</a>
                        <a href="update-spct/${sp.id}">Sửa</a>
                    </div>
                </div>
            </div>
        </c:forEach>
    </div>

    <div class="row justify-content-center">
        <a href="/assignment/themSP" class="add-product-btn">
            <svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="currentColor" class="bi bi-plus-lg" viewBox="0 0 16 16">
                <path fill-rule="evenodd" d="M8 2a.5.5 0 0 1 .5.5v5h5a.5.5 0 0 1 0 1h-5v5a.5.5 0 0 1-1 0v-5h-5a.5.5 0 0 1 0-1h5v-5A.5.5 0 0 1 8 2"/>
            </svg>
        </a>
    </div>
</div>
</body>
<%@ include file="footer.jsp" %>
</html>
