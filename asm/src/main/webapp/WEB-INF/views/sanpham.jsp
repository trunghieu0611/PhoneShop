<%@ page contentType="text/html; charset=UTF-8" %>
<!doctype html>
<%@ include file="header.jsp" %>
<%@ include file="nav.jsp" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Quản Lý Sản Phẩm</title>
    <!-- Bootstrap CSS -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #f8f9fa;
        }
        h2 {
            margin: 20px 0;
            text-align: center;
        }
        table {
            margin: 20px auto;
            width: 90%;
            border-collapse: collapse;
            background-color: #fff;
        }
        th, td {
            padding: 10px;
            text-align: center;
            border: 1px solid #dee2e6;
        }
        th {
            background-color: #007bff;
            color: black;
        }
        img {
            border-radius: 5px;
        }
    </style>
</head>
<body>
<div class="container">
    <h2>Danh Sách Sản Phẩm</h2>
    <!-- Form tìm kiếm sản phẩm -->
    <form action="/assignment/search" method="get" class="mb-3">
        <div class="input-group">
            <input type="text" name="keyword" class="form-control" placeholder="Tìm kiếm sản phẩm...">
            <div class="input-group-append">
                <button class="btn btn-primary" type="submit">Tìm kiếm</button>
            </div>
        </div>
    </form>
    <table class="table table-striped">
        <thead>
        <tr>
            <th>ID</th>
            <th>Mã</th>
            <th>Tên</th>
            <th>Trạng thái</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="sanPham" items="${listSP}">
            <tr>
                <td>${sanPham.id}</td>
                <td>${sanPham.maSP}</td>
                <td>${sanPham.ten}</td>
                <td>${sanPham.trangThai ? "Kích hoạt" : "Không kích hoạt"}</td>
            </tr>
        </c:forEach>
        </tbody>
    </table>

    <h2>Danh Sách Chi Tiết Sản Phẩm</h2>
    <table class="table table-striped">
        <thead>
        <tr>
            <th>ID</th>
            <th>Mã chi tiết</th>
            <th>Tên sản phẩm</th>
            <th>Kích thước</th>
            <th>Màu sắc</th>
            <th>Số lượng</th>
            <th>Đơn giá</th>
            <th>Hình ảnh</th>
            <th>Trạng thái</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="spChiTiet" items="${listSPCT}">
            <tr>
                <td>${spChiTiet.id}</td>
                <td>${spChiTiet.ma}</td>
                <td>${spChiTiet.sanPham.ten}</td>
                <td>${spChiTiet.kichThuoc.ten}</td>
                <td>${spChiTiet.mauSac.ten}</td>
                <td>${spChiTiet.soLuong}</td>
                <td>${spChiTiet.donGia}</td>
                <td><img src="${spChiTiet.hinhAnh}" alt="${spChiTiet.sanPham.ten}" width="50" height="50"/></td>
                <td>${spChiTiet.trangThai ? "Kích hoạt" : "Không kích hoạt"}</td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>

<%@ include file="footer.jsp" %>
<!-- Bootstrap JS and dependencies -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
