<%--
  Created by IntelliJ IDEA.
  User: hyunyongchoi
  Date: 2022/10/31
  Time: 11:25 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ page import="user.*" %>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="user.TimeTable" %>
<%@ page import="user.c_user" %>

<html>
<head>
    <meta http-equiv="Content-Type" content="text/html" charset="UTF-8">
    <meta name="viewport" content="width=device-width">
    <link rel="stylesheet" href="./css/bootstrap.min.css">
    <link rel="stylesheet" href="css/bootstrap.css">
    <title>admin login</title>
</head>
<body background="img3.png">
<nav class="navbar navbar-dark bg-primary">
    <a class="navbar-brand" href="admin.jsp"> 한양대학교 | 관리자페이지</a>
    <a class="navbar-brand" href="adminStudent.jsp">학생 정보 조회 및 변경</a>
    <a class="navbar-brand" href="adminCourse.jsp">과목 정보 조회 및 변경</a>
    <a class="navbar-brand" href="adminOlap.jsp">통계기능/OLAP</a>
    <a class="navbar-brand" href="logoutAction.jsp">로그아웃</a>
</nav>
<%
    UserDAO userDAO = new UserDAO();
    ArrayList<Student> list = userDAO.olap();//통계기능을 수행하는 페이지
    %>
    <table class="table">
        <thead>
        <tr>
            <th style="text-align: center">평균 평점과 특정 과목의 학점 간 차이가 가장 큰 10과목</th>
        </tr>
        </thead>
        <tbody>
        <%
            for(int i = 0; i < list.size(); i++){
        %>
        <tr>
            <td style="text-align: center">
                <%=list.get(i).getStudent_id()%>
            </td>
        </tr>
        <%
            }
        %>
        </tbody>
    </table>
</body>
</html>
