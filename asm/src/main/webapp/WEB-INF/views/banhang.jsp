<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="header.jsp" %>
<%@ include file="nav.jsp" %>
<!doctype html>
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
            padding: 20px;
            background-color: #f8f9fa; /* Màu nền nhẹ */
        }
        .section-title {
            font-weight: bold;
            color: #1a73e8;
            margin-bottom: 15px;
            border-bottom: 2px solid #1a73e8;
            padding-bottom: 5px;
        }
        .table-container {
            border: 1px solid #ddd;
            border-radius: 5px; /* Bo góc cho bảng */
            overflow: hidden; /* Để tránh làm mất border-radius */
            margin-bottom: 20px;
            background-color: #fff; /* Màu nền trắng cho bảng */
        }
        .table th, .table td {
            text-align: center;
            vertical-align: middle; /* Căn giữa theo chiều dọc */
        }
        .btn-green {
            background-color: #28a745;
            color: white;
        }
        .btn-red {
            background-color: #dc3545;
            color: white;
        }
        .btn-light-green {
            background-color: #d4edda;
            color: black;
        }
        .form-control {
            margin-bottom: 10px;
        }
        .voucher-section {
            display: flex;
            align-items: center;
        }
        .voucher-section select {
            margin-right: 10px;
        }
        .voucher-section a {
            color: #1a73e8;
        }
        .btn {
            width: 100%; /* Đưa nút đến toàn bộ chiều rộng */
            margin-top: 10px; /* Khoảng cách giữa các nút */
        }
    </style>
</head>
<body>
<div class="container">
    <div class="section-title">Hóa Đơn</div>
    <div class="table-container">
        <table class="table table-bordered table-hover">
            <thead class="thead-light">
            <tr>
                <th>STT</th>
                <th>Tên nhân viên</th>
                <th>Tên khách hàng</th>
                <th>Ngày tạo</th>
                <th>Trạng thái</th>
                <th>Action</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${listHD}" var="hd" varStatus="i">
                <tr>
                    <td>${i.index + 1}</td> <!-- Thay đổi từ i.count sang i.index + 1 -->
                    <td>${hd.nhanVien.tenNV}</td>
                    <td>${hd.khachHang.ten}</td>
                    <td>${hd.ngayMuaHang}</td>
                    <td>${hd.trangThai}</td>
                    <td><a href="/assignment/banhang/hoa-don/${hd.id}">!</a></td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>

    <div class="row">
        <div class="col-md-8">
            <div class="section-title">Giỏ Hàng</div>
            <div class="table-container">
                <table class="table table-bordered table-hover">
                    <thead class="thead-light">
                    <tr>
                        <th>ID</th>
                        <th>Tên SP</th>
                        <th>Giá Bán</th>
                        <th>SL Mua</th>
                        <th>Thành Tiền</th>
                    </tr>
                    </thead>
                    <tbody id="cart-body">
                    <c:forEach items="${hdct}" var="item">
                        <tr>
                            <td>${item.sanPhamChiTiet.id}</td>
                            <td>${item.sanPhamChiTiet.sanPham.ten}</td>
                            <td>${item.donGia}</td>
                            <td>${item.soLuong}</td> <!-- Hiển thị số lượng từ giỏ hàng -->
                            <td>${item.donGia * item.soLuong}</td> <!-- Tính thành tiền -->
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
        <div class="col-md-4">
            <div class="section-title">Tạo hóa đơn</div>
            <form method="post" action="/assignment/banhang/taohoadon">
                <div class="table-container">
                    <div class="mb-3">
                        <label class="form-label">Thông tin khách hàng</label><br>
                        <select name="khachHang" required>
                            <c:forEach var="ds" items="${ds}">
                                <option value="${ds.id}">${ds.ten}</option>
                            </c:forEach>
                        </select>
                    </div>
                    <input type="hidden" name="ngayMuaHang" value="${dateNow}">
                    <input type="hidden" name="trangThai" value="false">
                    <div class="mb-3">
                        <label class="form-label">ID NV</label>
                        <input name="nhanVien" value="${idNV}" type="text" class="form-control" placeholder="ID NV" required>
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Tổng tiền</label>
                        <input type="text" class="form-control" value="0" readonly>
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Khách đưa</label>
                        <input type="text" class="form-control">
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Tiền thừa</label>
                        <input type="text" class="form-control" value="0" readonly>
                    </div>
                    <button class="btn btn-green">Thanh toán</button>
                    <button class="btn btn-light-green">Tạo HĐ</button>
                    <button class="btn btn-red">Hủy</button>
                </div>
            </form>
        </div>
    </div>

    <div class="row">
        <div class="imfomation2">
            <h4>Danh sách chi tiết sản phẩm</h4>
        </div>
        <table class="table">
            <thead>
            <tr>
                <th>ID</th>
                <th>Tên SP</th>
                <th>Kích thước</th>
                <th>Màu sắc</th>
                <th>SL ton</th>
                <th>Đơn giá</th>
                <th>SL mua</th>
                <th>Them vao GH</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach var="spChiTiet" items="${listSPCT}">
                <tr>
                    <td>${spChiTiet.id}</td>
                    <td>${spChiTiet.sanPham.ten}</td>
                    <td>${spChiTiet.kichThuoc.ten}</td>
                    <td>${spChiTiet.mauSac.ten}</td>
                    <td>${spChiTiet.soLuong}</td>
                    <td>${spChiTiet.donGia}</td>
                    <form method="POST" action="/assignment/banhang/them-san-pham" onsubmit="validateForm(event)">
                        <td>
                            <input style="width: 45px" type="number" name="soLuong" value="1" min="1"
                                   max="${spChiTiet.soLuong}">
                            <input type="hidden" name="sanPhamChiTiet" value="${spChiTiet.id}">
                            <input type="hidden" name="trangThai" value="false">
                            <input type="hidden" name="donGia" value="${spChiTiet.donGia}">
                            <input type="hidden" id="idHoaDon" name="hoaDon" value="${idAn}">
                        </td>
                        <td>
                            <button type="submit">Add</button>
                        </td>
                    </form>
                </tr>
            </c:forEach>

            </tbody>
        </table>
    </div>

</div>
<%@ include file="footer.jsp" %>
<!-- jQuery và Bootstrap JS -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

</body>
</html>
