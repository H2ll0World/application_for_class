<%--
  과목과 관련된 처리를 해주기 위한 페이지
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
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
    <nav class="navbar navbar-dark bg-secondary">
        <a class="navbar-brand" href="adminCourseSearch.jsp">과목 조회</a>
        <a class="navbar-brand" href="adminCourseIncrease.jsp">과목 증원</a>
        <a class="navbar-brand" href="adminCourseAccept.jsp">수강 허용 반영</a>
        <a class="navbar-brand" href="adminCourseCreate.jsp">과목 설강</a>
        <a class="navbar-brand" href="adminCourseDelete.jsp">과목 폐강</a>
    </nav>


</body>
</html>
