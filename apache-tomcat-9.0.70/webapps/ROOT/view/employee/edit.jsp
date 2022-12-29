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
                <form action="/employee?action=edit&id=${employee.idE}" method="post">
                    <%--    <input name="id" placeholder="nhập id"><br>--%>
                    <input name="name" value="${employee.nameE}"><br>
                    <input type="date" name="dayOfBirth" value="${employee.dayOfBirthE}"><br>
                    <input name="idCardE" value="${employee.idCardE}"><br>
                    <input type="number" name="salaryE" value="${employee.salaryE}"><br>
                    <input name="phoneE" value="${employee.phoneE}"><br>
                    <input name="emailE" value="${employee.emailE}"><br>
                    <input name="addressE" value="${employee.addressE}"><br>
                    <select name="classIdP">
                        <c:forEach var="position" items="${positionList}">
                            <c:if test="${position.idP==employee.getIdPosition().getIdP()}">
                                <option value="${position.getIdP()}">${position.nameP}</option>
                            </c:if>
                        </c:forEach>
                        <c:forEach var="position" items="${positionList}">
                            <option value="${position.getIdP()}">${position.getNameP()}</option>
                        </c:forEach>
                    </select><br>
                    <select name="classIdE">
                        <c:forEach var="educationDegree" items="${educationDegreeList}">
                            <c:if test="${educationDegree.idED==employee.getIdEducation().getIdED()}">
                                <option value="${educationDegree.getIdED()}">${educationDegree.nameED}</option>
                            </c:if>
                        </c:forEach>
                        <c:forEach var="educationDegree" items="${educationDegreeList}">
                            <option value="${educationDegree.getIdED()}">${educationDegree.getNameED()}</option>
                        </c:forEach>
                    </select><br>
                    <select name="classIdD">
                        <c:forEach var="division" items="${divisionList}">
                            <c:if test="${division.idD==employee.getIdDivision().getIdD()}">
                                <option value="${division.getIdD()}">${division.nameD}</option>
                            </c:if>
                        </c:forEach>
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
