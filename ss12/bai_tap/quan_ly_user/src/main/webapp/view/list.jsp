<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 19/12/2022
  Time: 7:42 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
      integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
        crossorigin="anonymous"></script>
<html>
<head>
    <title>Danh sách User</title>
</head>
<body>
<center>
    <h1>User Management</h1>
</center>
<div>
    <div class="row" style="margin: 10px">
        <div class="col-3">
            <a href="/users?action=create">
                <button type="button" class="btn btn-primary">Add New User</button>
            </a>
        </div>
        <div class="col-9">
            <form action="/users?action=search" method="get" class="col-12 col-lg-auto mb-3 mb-lg-0 me-lg-3">
                <input type="search" hidden value="search" name="action">
                <input type="search" class="form-control" placeholder="Tìm kiếm" name="nameSearch">
                <button type="submit" class="btn btn-light " hidden>Tìm kiếm</button>
            </form>
        </div>
    </div>
    <table class="table table-striped">
        <caption><h2>List of Users</h2></caption>
        <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Email</th>
            <th>Country</th>
            <th>Actions</th>
        </tr>
        <c:forEach var="user" items="${userList}">
            <tr>
                <td><c:out value="${user.id}"/></td>
                <td><c:out value="${user.name}"/></td>
                <td><c:out value="${user.email}"/></td>
                <td><c:out value="${user.country}"/></td>
                <td>
                    <button class="btn btn-primary"><a style="color: white;text-decoration:none;" href="/users?action=edit&id=${user.id}">Edit</a></button>
<%--                    <a href="/users?action=delete&id=${user.id}">Delete</a>--%>
                    <button type="button" class="btn btn-primary" data-bs-toggle="modal"
                            data-bs-target="#exampleModal" onclick="xoa(${user.id},'${user.name}')">
                        Delete
                    </button>

                    <!-- Modal -->
                    <form action="/users">
                        <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel"
                             aria-hidden="true">
                            <div class="modal-dialog">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
                                        <button type="button" class="btn-close" data-bs-dismiss="modal"
                                                aria-label="Close"></button>
                                    </div>
                                    <div class="modal-body">
                                        Bạn có chắc chắn muốn xóa <span id="nameUser"></span> ????
                                        <input hidden name="id" id = "idDelete">
                                        <input hidden name="action" value="delete" >
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
                </td>



            </tr>
        </c:forEach>
    </table>
</div>
</body>
<script>
    function xoa(id,name) {
        document.getElementById("idDelete").value = id;
        document.getElementById("nameUser").innerText = name;
    }
</script>
</html>
