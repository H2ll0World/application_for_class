<%--
    관리자 페이지
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8"%>
<%@ page import="user.UserDAO" %>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="user.Class_apply_info" %>
<!DOCTYPE html>
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
    <b>관리자 페이지</b>
    <p>
        학생 정보 조회 및 변경<br>
        1.금학기 시간표 조회<br>
        2.성적 조회<br>
        3.지도교수 조회<br>
        4.재학 휴학 자퇴 등 상태 변경<br>
        과목 정보 조회 및 변경<br>
        1.과목 증원 가능<br>
        2.수강 허용 반영<br>
        과목 설강 및 폐강<br>
        OLAP<br>
    </p>
</body>
</html>
