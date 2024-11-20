<%@ include file="../header.jsp" %>
<%@ include file="../nav.jsp" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Update Customer Information</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/5.1.3/css/bootstrap.min.css">
    <style>
        body {
            background-color: #f8f9fa;
        }

        .form-container {
            margin-top: 50px;
            padding: 20px;
            background-color: #fff;
            border-radius: 10px;
            box-shadow: 0px 0px 15px rgba(0, 0, 0, 0.1);
        }

        .form-title {
            text-align: center;
            margin-bottom: 20px;
            font-size: 1.5rem;
            color: #343a40;
        }

        .btn-submit {
            background-color: #007bff;
            border-color: #007bff;
        }

        .btn-submit:hover {
            background-color: #0056b3;
            border-color: #004085;
        }

        .form-check-label {
            margin-right: 20px;
        }

        .footer {
            margin-top: 40px;
        }
    </style>
</head>
<body>
<div class="container">
    <div class="row justify-content-center">
        <div class="col-md-6">
            <div class="form-container">
                <h4 class="form-title">Thông Tin Khách Hàng</h4>
                <form method="POST" action="/assignment/khachhang/update">
                    <div class="mb-3">
                        <label class="form-label">Id:</label>
                        <input name="id" type="text" class="form-control" value="${kh.id}" readonly />
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Tên:</label>
                        <input name="ten" type="text" class="form-control" value="${kh.ten} ${param.ten}" />
                    </div>
                    <span class="text-danger">${msgSU2}</span>
                    <div class="mb-3">
                        <label class="form-label">Mã Khách Hàng:</label>
                        <input name="maKH" type="text" class="form-control" value="${kh.maKH} ${param.maKH}" />
                    </div>
                    <span class="text-danger">${msgSU3}</span>
                    <div class="mb-3">
                        <label class="form-label">Số Điện Thoại:</label>
                        <input name="sdt" type="text" class="form-control" value="${kh.sdt} ${param.sdt}" />
                    </div>
                    <span class="text-danger">${msgSU4}</span>
                    <div class="mb-3">
                        <label class="form-label">Vai trò:</label><br>
                        <div class="form-check form-check-inline">
                            <input class="form-check-input" type="radio" name="trangThai" id="inlineRadio1" value="true" ${kh.trangThai ? "checked" : ""}>
                            <label class="form-check-label" for="inlineRadio1">Vip</label>
                        </div>
                        <div class="form-check form-check-inline">
                            <input class="form-check-input" type="radio" name="trangThai" id="inlineRadio2" value="false" ${!kh.trangThai ? "checked" : ""}>
                            <label class="form-check-label" for="inlineRadio2">Normal</label>
                        </div>
                    </div>
                    <span class="text-danger">${msgSU5}</span>
                    <div class="d-grid">
                        <button type="submit" class="btn btn-submit btn-block">Update</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
<%@ include file="../footer.jsp" %>
</body>
</html>
