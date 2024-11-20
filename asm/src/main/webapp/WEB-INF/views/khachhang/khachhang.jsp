<%@ include file="../header.jsp" %>
<%@ include file="../nav.jsp" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Quản Lý Khách Hàng</title>
    <!-- Bootstrap CSS -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #eef2f3; /* Màu nền nhẹ nhàng */
            font-family: 'Arial', sans-serif;
        }
        h4 {
            margin: 0; /* Xóa margin để căn chỉnh tốt hơn */
        }
        .card {
            border-radius: 12px; /* Bo tròn góc */
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.1); /* Đổ bóng nhẹ */
        }
        .card-header {
            background-color: #4A90E2; /* Màu xanh đậm */
            color: white;
            text-align: center;
            padding: 20px;
        }
        .card-body {
            padding: 30px;
        }
        .form-control {
            border-radius: 8px;
            padding: 12px;
        }
        .table {
            margin-top: 20px;
            background-color: #fff; /* Nền trắng cho bảng */
        }
        .table thead {
            background-color: #4A90E2; /* Màu xanh cho header */
            color: white;
        }
        .table-hover tbody tr:hover {
            background-color: #d1ecf1; /* Màu nền khi hover */
        }
        .btn {
            border-radius: 5px;
            padding: 10px 15px;
        }
        .d-grid {
            margin-top: 20px;
        }
    </style>
</head>
<body>
<div class="container mt-5">
    <div class="row">
        <div class="col-md-4">
            <div class="card mb-4">
                <div class="card-header">
                    <h4>Thông Tin Khách Hàng</h4>
                </div>
                <div class="card-body">
                    <form method="POST" action="/assignment/khachhang">
                        <div class="mb-3">
                            <label class="form-label">Tên:</label>
                            <input name="ten" type="text" class="form-control" value="${param.ten}" />
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Mã Khách Hàng:</label>
                            <input name="maKH" type="text" class="form-control" value="${param.maKH}" />
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Số Điện Thoại:</label>
                            <input name="sdt" type="text" class="form-control" value="${param.sdt}" />
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Vai trò:</label>
                            <br>
                            <div class="form-check form-check-inline">
                                <input class="form-check-input" type="radio" name="trangThai" id="inlineRadio1" value="true" ${param.trangThai ? "checked" : ""}>
                                <label class="form-check-label" for="inlineRadio1">Vip</label>
                            </div>
                            <div class="form-check form-check-inline">
                                <input class="form-check-input" type="radio" name="trangThai" id="inlineRadio2" value="false" ${!param.trangThai ? "checked" : ""}>
                                <label class="form-check-label" for="inlineRadio2">Normal</label>
                            </div>
                        </div>
                        <div class="d-grid">
                            <button type="submit" class="btn btn-success">Add</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>

        <div class="col-md-8">
            <div class="card">
                <div class="card-header">
                    <h4>Danh Sách Khách Hàng</h4>
                </div>
                <div class="card-body">
                    <table class="table table-hover">
                        <thead>
                        <tr>
                            <th>#</th>
                            <th>Tên</th>
                            <th>Mã KH</th>
                            <th>Số Điện Thoại</th>
                            <th>Vai trò</th>
                            <th>Action</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${ds}" var="kh">
                            <tr>
                                <th scope="row">${kh.id}</th>
                                <td>${kh.ten}</td>
                                <td>${kh.maKH}</td>
                                <td>${kh.sdt}</td>
                                <td>${kh.trangThai ? "Vip" : "Normal"}</td>
                                <td>
                                    <a href="khachhang/update/${kh.id}" class="btn btn-warning btn-sm">Update</a>
                                    <a href="khachhang/delete/${kh.id}" class="btn btn-danger btn-sm">Delete</a>
                                </td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>

<%@ include file="../footer.jsp" %>
<!-- Bootstrap JS and dependencies -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
