<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 15/12/2022
  Time: 12:04 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Sửa</title>
</head>
<body>
<h2>Thông tin sản phẩm</h2>
<a href="/product">Quay lại trang chủ</a><br>
<form method="post">
    <input name="id" value="${product.id}"><br><br>
    <input name="tenSP" value="${product.tenSP}"><br><br>
    <input name="gia" type="number" value="${product.gia}"><br><br>
    <input name="moTa" value="${product.moTa}"><br><br>
    <input name="tenNSX" value="${product.tenNSX}"><br><br>
    <button type="submit">edit</button>
</form>
</body>
</html>
