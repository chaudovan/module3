<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 14/12/2022
  Time: 7:44 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
      integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
        crossorigin="anonymous"></script>
<html>
<head>
    <title>Product</title>
</head>
<body>
<h1>Product List</h1>
<a href="/product?action=create">Thêm Mới Sản Phẩm</a>
<table class="table table-striped">
    <tr>
        <th>ID</th>
        <th>Name</th>
        <th>Giá</th>
        <th>Mô Tả</th>
        <th>Nhà Sản Xuất</th>
        <th>Sửa</th>
        <th>Xóa</th>
    </tr>
    <c:forEach var="product" items='${requestScope["productList"]}' varStatus="status">
        <tr>
            <td><a href="/product?action=view&id=${product.id-1}">${product.id}</a></td>
            <td>${product.tenSP}</td>
            <td>${product.gia}</td>
            <td>${product.moTa}</td>
            <td>${product.tenNSX}</td>
            <td><a href="/product?action=edit&id=${product.id-1}">Sửa</a></td>
                <%--            <td><a href="/product?action=delete&id=${product.id-1}">Sửa</a></td>--%>
            <td>

                <button type="button" class="btn btn-primary" data-bs-toggle="modal"
                        data-bs-target="#exampleModal" onclick="xoa(${product.id-1},'${product.tenSP}')">
                    Xóa
                </button>

                <!-- Modal -->
                <form action="/product">
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
                                    Bạn có chắc chắn muốn xóa <span id="tenSP"></span> ????
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
<form action="/product">
    <input type="text" placeholder="Tìm kiếm" name="nameFind">
    <input type="submit" value="find" name="action">
</form>
<!-- Button trigger modal -->

</body>
<script>
    function xoa(id,name) {
        document.getElementById("idDelete").value = id;
        document.getElementById("tenSP").innerText = name;

    }
</script>
</html>
