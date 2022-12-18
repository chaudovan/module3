<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 14/12/2022
  Time: 9:02 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Thêm mới</title>
</head>
<body>
<h2>Thêm mới sản phẩm</h2>
<a href="/product">Quay lại trang chủ</a><br>
<p style="color: red">${mess}</p>
<form method="post">
    <input name="id" type="number" placeholder="nhập id"><br><br>
    <input name="tenSP" placeholder="nhập tên sẩn phẩm"><br><br>
    <input name="gia" type="number" value="0"><br><br>
    <input name="moTa" placeholder="mô tả "><br><br>
    <input name="tenNSX" placeholder="nhập tên nhà sản xuất"><br><br>
    <button type="submit">Thêm mới</button>
</form>
</body>
</html>
