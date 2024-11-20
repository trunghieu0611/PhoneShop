<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="header.jsp" %>
<%@ include file="nav.jsp" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Update Product</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container mt-5">
    <h2>Cập nhật sản phẩm</h2>
    <form action="/assignment/updateSP" method="post">
        <input type="hidden" name="id" value="${sp.id}">
        <div class="mb-3">
            <label for="maSP" class="form-label">Mã sản phẩm:</label>
            <input type="text" id="maSP" name="ma" class="form-control" value="${sp.sanPham.maSP}">
        </div>
        <div class="mb-3">
            <label for="ten" class="form-label">Tên sản phẩm:</label>
            <input type="text" id="ten" name="ten" class="form-control" value="${sp.sanPham.ten}">
        </div>
        <div class="mb-3">
            <label for="donGia" class="form-label">Don gia:</label>
            <input type="text" id="donGia" name="donGia" class="form-control" value="${sp.donGia}">
        </div>
        <div class="mb-3">
            <label for="soLuong" class="form-label">So Luong:</label>
            <input type="text" id="soLuong" name="soLuong" class="form-control" value="${sp.soLuong}">
        </div>
        <div class="mb-3">
            <label for="hinhAnh" class="form-label">Hình ảnh:</label>
            <input type="text" id="hinhAnh" name="hinhAnh" class="form-control" value="${sp.hinhAnh}">
        </div>
        <div class="form-check mb-3">
            <input type="checkbox" id="trangThai" name="trangThai" class="form-check-input" value="true" ${sp.sanPham.trangThai ? 'checked' : ''}>
            <input type="hidden" name="trangThai" value="false">
            <label for="trangThai" class="form-check-label">Còn hàng</label>
        </div>
        <button type="submit" class="btn btn-primary">Cập nhật</button>
    </form>
</div>
<%@ include file="footer.jsp" %>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
