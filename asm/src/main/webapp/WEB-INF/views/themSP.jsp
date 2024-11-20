<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="header.jsp" %>
<%@ include file="nav.jsp" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Quản Lý Sản Phẩm</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #f8f9fa;
        }
        .form-section {
            background-color: #fff;
            border-radius: 10px;
            padding: 20px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            margin-bottom: 20px;
        }
        h4 {
            color: #007bff;
            font-weight: bold;
            margin-bottom: 20px;
        }
        table {
            width: 100%;
            margin-top: 20px;
        }
        th, td {
            text-align: center;
            padding: 10px;
        }
        th {
            background-color: #007bff;
            color: #fff;
        }
        .btn-primary {
            background-color: #007bff;
            border: none;
        }
        .btn-primary:hover {
            background-color: #0056b3;
        }
        .custom-checkbox {
            display: flex;
            align-items: center;
        }
        .custom-checkbox label {
            margin-left: 5px;
        }
    </style>
</head>
<body>

<div class="container mt-4">
    <div class="row">
        <div class="col-md-5">
            <div class="form-section">
                <h4>Thêm Sản Phẩm</h4>
                <form action="/assignment/themSP" method="post">
                    <div class="mb-3">
                        <label class="form-label">Mã sản phẩm:</label>
                        <input type="text" class="form-control" name="maSP" required />
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Tên sản phẩm:</label>
                        <input type="text" class="form-control" name="ten" required />
                    </div>
                    <div class="mb-3 custom-checkbox">
                        <input type="checkbox" name="trangThai" value="true" />
                        <label> Kích hoạt</label>
                    </div>
                    <div class="d-grid">
                        <button type="submit" class="btn btn-primary">Thêm sản phẩm</button>
                    </div>
                </form>
            </div>

            <div class="form-section">
                <h4>Danh Sách Sản Phẩm</h4>
                <table class="table table-bordered">
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
            </div>
        </div>

        <div class="col-md-7">
            <div class="form-section">
                <h4>Thêm Chi Tiết Sản Phẩm</h4>
                <form action="/assignment/them-sp-chi-tiet" method="post">
                    <div class="mb-3">
                        <label class="form-label">Mã chi tiết sản phẩm:</label>
                        <input type="text" class="form-control" name="ma" required />
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Chọn sản phẩm:</label>
                        <select name="idSanPham" class="form-select" required>
                            <c:forEach var="sanPham" items="${listSP}">
                                <option value="${sanPham.id}">${sanPham.ten}</option>
                            </c:forEach>
                        </select>
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Kích thước:</label>
                        <div class="row">
                            <div class="col-md-11">
                                <select name="idKichThuoc" class="form-select" required>
                                    <c:forEach var="kichThuoc" items="${listKT}">
                                        <option value="${kichThuoc.id}">${kichThuoc.ten}</option>
                                    </c:forEach>
                                </select>
                            </div>
                            <div class="col-md-1">
                                <a href="/assignment/them-kich-thuoc">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="35" height="35" fill="currentColor" class="bi bi-plus-lg" viewBox="0 0 16 16">
                                        <path fill-rule="evenodd" d="M8 2a.5.5 0 0 1 .5.5v5h5a.5.5 0 0 1 0 1h-5v5a.5.5 0 0 1-1 0v-5h-5a.5.5 0 0 1 0-1h5v-5A.5.5 0 0 1 8 2"/>
                                    </svg>
                                </a>
                            </div>
                        </div>
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Màu sắc:</label>
                        <div class="row">
                            <div class="col-md-11">
                                <select name="idMauSac" class="form-select" required>
                                    <c:forEach var="mauSac" items="${listMS}">
                                        <option value="${mauSac.id}">${mauSac.ten}</option>
                                    </c:forEach>
                                </select>
                            </div>
                            <div class="col-md-1">
                                <a href="/assignment/them-mau-sac">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="35" height="35" fill="currentColor" class="bi bi-plus-lg" viewBox="0 0 16 16">
                                        <path fill-rule="evenodd" d="M8 2a.5.5 0 0 1 .5.5v5h5a.5.5 0 0 1 0 1h-5v5a.5.5 0 0 1-1 0v-5h-5a.5.5 0 0 1 0-1h5v-5A.5.5 0 0 1 8 2"/>
                                    </svg>
                                </a>
                            </div>
                        </div>
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Số lượng:</label>
                        <input type="number" class="form-control" name="soLuong" required />
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Đơn giá:</label>
                        <input type="number" class="form-control" name="donGia" step="0.01" required />
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Hình ảnh:</label>
                        <input type="text" class="form-control" name="hinhAnh" required />
                    </div>
                    <div class="mb-3 custom-checkbox">
                        <input type="checkbox" name="trangThai" value="true" />
                        <label> Kích hoạt</label>
                    </div>
                    <div class="d-grid">
                        <button type="submit" class="btn btn-primary">Thêm chi tiết sản phẩm</button>
                    </div>
                </form>
            </div>

            <div class="form-section">
                <h4>Danh Sách Chi Tiết Sản Phẩm</h4>
                <table class="table table-bordered">
                    <thead>
                    <tr>
                        <th>ID</th>
                        <th>Mã SPCT</th>
                        <th>Tên sản phẩm</th>
                        <th>Kích thước</th>
                        <th>Màu sắc</th>
                        <th>Số lượng</th>
                        <th>Đơn giá</th>
                        <th>Hinh anh</th>
                        <th>Trạng thái</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="spct" items="${listSPCT}">
                        <tr>
                            <td>${spct.id}</td>
                            <td>${spct.ma}</td>
                            <td>${spct.sanPham.ten}</td>
                            <td>${spct.kichThuoc.ten}</td>
                            <td>${spct.mauSac.ten}</td>
                            <td>${spct.soLuong}</td>
                            <td>${spct.donGia}</td>
                            <td><img src="${spct.hinhAnh}" alt="${spct.sanPham.ten}" width="50" height="50"/></td>
                            <td>${spct.trangThai ? "Kích hoạt" : "Không kích hoạt"}</td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
