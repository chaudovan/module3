<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 12/12/2022
  Time: 7:53 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h2>Danh sách khách hàng</h2>
<table class="table table-striped">
    <tr>
        <th>Tên</th>
        <th>Ngày sinh</th>
        <th>Địa Chỉ</th>
        <th>Ảnh</th>
    </tr>

    <c:forEach var="customer" items="${customerList}" varStatus="status">
        <tr>
            <td>${customer.getTen()}</td>
            <td>${customer.getDate()}</td>
            <td>${customer.getDiaChi()}</td>
            <td><img src=""></td>
        </tr>
    </c:forEach>

</table>
</body>
</html>
