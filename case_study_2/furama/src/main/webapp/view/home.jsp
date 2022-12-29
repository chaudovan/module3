<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 23/12/2022
  Time: 8:59 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <link rel="stylesheet" href="bootstrap-5.1.3-dist/css/bootstrap.css">

</head>
<body>
<div class="col-12 container-fluid ">
    <c:import url="header.jsp"></c:import>
    <c:import url="nav-bar.jsp"></c:import>
</div>
<div class="col-12 container-fluid">
    <div class="row border border-5 ">
        <c:import url="body-left.jsp"></c:import>
        <div class="col-10 border border-5 " style="height: 500px">
            <div><span class="col-12 text-center"> Furama Resort</span></div>
        </div>
    </div>
</div>
<div class="col-12 container-fluid">
    <div class="row border border-5 mt-2">
        <div class="row "><span class="text-center"> Furama Resort...</span></div>


    </div>
</div>
</div>
<script src="bootstrap-5.1.3-dist/js/bootstrap.bundle.js"></script>
</body>
</html>
