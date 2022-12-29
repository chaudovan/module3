<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 25/12/2022
  Time: 10:37 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="bootstrap-5.1.3-dist/css/bootstrap.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
            crossorigin="anonymous"></script>
</head>
<body>
<div class="col-12 container-fluid ">
    <c:import url="../header.jsp"></c:import>
    <c:import url="../nav-bar.jsp"></c:import>
</div>
<div class="col-12 container-fluid">
    <div class="row border border-5 ">
        <div class="col-12 border border-5 " style="height: 500px">
            <div><span class="col-12 text-center">
                <center>
    <h1>Employee Management</h1>
</center>
<div>
    <div class="row" style="margin: 10px">
        <div class="col-3">
            <a href="/employee?action=create">
                <button type="button" class="btn btn-primary">Employee New</button>
            </a>
        </div>
        <div class="col-9">
            <form action="/employee?action=search" method="get" class="col-12 col-lg-auto mb-3 mb-lg-0 me-lg-3">
                <input type="search" hidden value="search" name="action">
                <input type="text" placeholder="Nhập tên" name="nameSearch">
                <input type="text" placeholder="Nhập địa chỉ" name="addressSearch">
                <select name="position">
                    <option value="">--chọn chức vụ--</option>
                    <c:forEach var="position" items="${positionList}">
                        <option value="${position.getIdP()}">${position.getNameP()}</option>
                    </c:forEach>
                </select>
                <button type="submit" class="btn btn-light" style="color: #0a58ca">Tìm kiếm</button>
            </form>
<%--            <form action="/student" method="get">--%>
<%--    <input type="text" name="action" value="search" hidden>--%>
<%--    <input type="text" name="nameSearch" placeholder="nhập tên">--%>
<%--    <input type="text" name="pointSearch" placeholder="nhập điểm">--%>
<%--    <select name="classIdSearch">--%>
<%--        <option value="">---Chọn lớp---</option>--%>
<%--        <c:forEach var="clazz" items="${clazzList}">--%>
<%--            <option value="${clazz.id}">${clazz.name}</option>--%>
<%--        </c:forEach>--%>
<%--    </select>--%>
<%--    <button type="submit">Tìm kiếm</button>--%>
<%--</form>--%>
        </div>
    </div>
    <table class="table table-striped">
        <caption><h2>List of Employee</h2></caption>
        <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Birthday</th>
            <th>ID_Card</th>
            <th>Salary</th>
            <th>Phone_Number</th>
            <th>Email</th>
            <th>Address</th>
            <th>Position</th>
            <th>EducationDegree</th>
            <th>Division</th>
            <th>Action</th>
        </tr>
        <c:forEach var="employee" items="${employeeList}">
            <tr>
<%--                idE,nameE,dayOfBirthE,idCardE,salaryE,phoneE,emailE,addressE,idPosition,idEducation,idDivision--%>
                <td><c:out value="${employee.idE}"/></td>
                <td><c:out value="${employee.nameE}"/></td>
                <td><c:out value="${employee.dayOfBirthE}"/></td>
                <td><c:out value="${employee.idCardE}"/></td>
                <td><c:out value="${employee.salaryE}"/></td>
                <td><c:out value="${employee.phoneE}"/></td>
                <td><c:out value="${employee.emailE}"/></td>
                <td><c:out value="${employee.addressE}"/></td>
                <td><c:out value="${employee.getIdPosition().getNameP()}"/></td>
                <td><c:out value="${employee.getIdEducation().getNameED()}"/></td>
                <td><c:out value="${employee.getIdDivision().getNameD()}"/></td>
                <td>
                    <button class="btn btn-primary"><a style="color: white;text-decoration:none;"
                                                       href="/employee?action=edit&id=${employee.idE}">Edit</a></button>
<%--                    <a href="/users?action=delete&id=${user.id}">Delete</a>--%>
                    <button type="button" class="btn btn-primary" data-bs-toggle="modal"
                            data-bs-target="#exampleModal" onclick="xoa(${employee.idE},'${employee.nameE}')">
                        Delete
                    </button>
                </td>
            </tr>
        </c:forEach>
    </table>
</div>
            </span></div>
        </div>
    </div>
</div>
<div class="col-12 container-fluid">
    <div class="row border border-5 mt-2">
        <div class="row "><span class="text-center"> Furama Resort...</span></div>


    </div>
</div>
</div>
<!-- Modal -->
<form action="/employee">
    <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel"
         aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Xóa đi Xóa đi</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal"
                            aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    Bạn có chắc chắn muốn xóa <span id="nameEmployee"></span> ????
                    <input hidden name="id" id="idDelete">
                    <input hidden name="action" value="delete">
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close
                    </button>
                    <button type="submit" class="btn btn-primary">Ok</button>
                </div>
            </div>
        </div>
    </div>
</form>
<script src="bootstrap-5.1.3-dist/js/bootstrap.bundle.js"></script>
<script>
    function xoa(id, name) {
        document.getElementById("nameEmployee").innerText = name;
        document.getElementById("idDelete").value = id;
    }
</script>
</body>

</html>
