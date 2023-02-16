<%--
  학생정보를 처리해주는 페이지 adminStudent1.jsp로 정보 보내줌
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html"; charset="UTF-8">
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
    <div calss="container">
        <form method="post" action="adminStudent1.jsp">
            <h2>학생 정보 조회 및 변경</h2>
            <div class="form-group">
                <input type="text" class="form-control" placeholder="학번 / student ID" name="student_id" maxlength="20">
            </div>
            <input type="submit" class="btn-outline-primary form-control" value="조회">
        </form>
    </div>
</body>
</html>
