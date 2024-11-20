<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="header.jsp" %>
<%@ include file="nav.jsp" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Quản Lý Hóa Đơn</title>
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
    </style>
</head>
<body>
<div class="container">
    <h2>Danh Sách Hóa Đơn</h2>
    <table class="table table-striped">
        <thead>
        <tr>
            <th>ID Hóa Đơn</th>
            <th>ID Nhân Viên</th>
            <th>ID Khách Hàng</th>
            <th>Ngày Mua Hàng</th>
            <th>Trạng Thái</th>
            <th>Thao Tác</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="hoaDon" items="${listHD}">
            <tr>
                <td>${hoaDon.id}</td>
                <td>${hoaDon.nhanVien.id}</td>
                <td>${hoaDon.khachHang.id}</td>
                <td>${hoaDon.ngayMuaHang}</td>
                <td>${hoaDon.trangThai}</td>
<%--                <td>--%>
<%--                    <a href="/hoa-don/update/${hoaDon.id}" class="btn btn-warning">Cập nhật</a>--%>
<%--                </td>--%>
            </tr>
        </c:forEach>
        </tbody>
    </table>

    <h2>Danh Sách Chi Tiết Hóa Đơn</h2>
    <table class="table table-striped">
        <thead>
        <tr>
            <th>ID</th>
            <th>ID Hóa Đơn</th>
            <th>ID Sản Phẩm Chi Tiết</th>
            <th>Số Lượng</th>
            <th>Đơn Giá</th>
            <th>Trạng Thái</th>
            <th>Thao Tác</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="hoaDonChiTiet" items="${listHDCT}">
            <tr>
                <td>${hoaDonChiTiet.id}</td>
                <td>${hoaDonChiTiet.hoaDon.id}</td>
                <td>${hoaDonChiTiet.sanPhamChiTiet.id}</td>
                <td>${hoaDonChiTiet.soLuong}</td>
                <td>${hoaDonChiTiet.donGia}</td>
                <td>${hoaDonChiTiet.trangThai}</td>
                <td>
                    <a href="/hoa-don/update-chi-tiet/${hoaDonChiTiet.id}" class="btn btn-warning">Cập nhật</a>
                </td>
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
