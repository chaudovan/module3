<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 25/12/2022
  Time: 11:23 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
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
            <div class="col-12 ">
                <center>
                    <h1>Employee Create</h1>
                    <h2>
                        <a href="/employee">List All Employee</a>
                    </h2>
                </center>
                <form method="post">
                    <%--    <input name="id" placeholder="nhập id"><br>--%>
                    <input name="name" placeholder="nhập tên"><br>
                    <input type="date" name="dayOfBirth"><br>
                    <input name="idCardE" placeholder="nhập id card"><br>
                    <input type="number" name="salaryE" placeholder="nhập tiền lương"><br>
                    <input name="phoneE" placeholder="nhập số điện thoại"><br>
                    <input name="emailE" placeholder="nhập email"><br>
                    <input name="addressE" placeholder="nhập địa chỉ"><br>
                    <select name="classIdP">
                        <option value="0">Chọn Position</option>
                        <c:forEach var="position" items="${positionList}">
                            <option value="${position.getIdP()}">${position.getNameP()}</option>
                        </c:forEach>
                    </select><br>
                    <select name="classIdE">
                        <option value="0">Chọn Education</option>
                        <c:forEach var="educationDegree" items="${educationDegreeList}">
                            <option value="${educationDegree.getIdED()}">${educationDegree.getNameED()}</option>
                        </c:forEach>
                    </select><br>
                    <select name="classIdD">
                        <option value="0">Chọn Division</option>
                        <c:forEach var="division" items="${divisionList}">
                            <option value="${division.getIdD()}">${division.getNameD()}</option>
                        </c:forEach>
                    </select><br>
                    <button type="submit">Save</button>
                </form>
            </div>
        </div>
    </div>
</div>
<div class="col-12 container-fluid">
    <div class="row border border-5 mt-2">
        <div class="row "><span class="text-center"> Furama Resort...</span></div>


    </div>
</div>
</div>

</body>
</html>
