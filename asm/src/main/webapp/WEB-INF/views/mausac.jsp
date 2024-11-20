<%@ page contentType="text/html; charset=UTF-8" %>
<!doctype html>
<%@ include file="header.jsp" %>
<%@ include file="nav.jsp" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>
</head>
<body>
<style>
    .imfomation2 {
        height: 50px;
        text-align: center;
        padding-top: 20px;


    }
</style>
<div class="container">
    <div class="row">
        <div class="col-md-6">
            <div class="imfomation2">
                <h4>Thêm mau sac</h4>
            </div>
            <form action="/assignment/them-mau-sac" method="post">
                <div class="mb-3">
                    <label class="form-label">Mã mau sac:</label>
                    <input type="text" class="form-control" name="ma" required/>
                </div>
                <div class="mb-3">
                    <label class="form-label">Tên mau sac:</label>
                    <input type="text" class="form-control" name="ten" required/>
                </div>
                <div class="mb-3">
                    <label class="form-label">Trạng thái:</label>
                    <input type="checkbox" name="trangThai" value="true"/>
                </div>
                <div class="d-grid">
                    <button type="submit" style="width: 150px" class="btn btn-primary">Thêm mau sac</button>
                </div>
            </form>

        </div>
        <div class="col-md-6">
            <div class="imfomation2">
                <h4>Danh mau sac</h4>
            </div>
            <table class="table">
                <thead>
                <tr>
                    <th>ID</th>
                    <th>Mã</th>
                    <th>Tên</th>
                    <th>Trạng thái</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach var="mauSac" items="${ds}">
                    <tr>
                        <td>${mauSac.id}</td>
                        <td>${mauSac.ma}</td>
                        <td>${mauSac.ten}</td>
                        <td>${mauSac.trangThai ? "Kích hoạt" : "Không kích hoạt"}</td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
            <br>
            <a href="themSP">
                <button type="button" class="btn btn-secondary">Quay ve</button>
            </a>
        </div>

    </div>
</div>
</body>
</html>