<%--
  adminStudent1.jsp에서 받은 정보를 세션에 저장
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html"; charset="UTF-8">
    <meta name="viewport" content="width=device-width">
    <link rel="stylesheet" href="./css/bootstrap.min.css">
    <link rel="stylesheet" href="css/bootstrap.css">
    <title>admin login</title>
    <script type="text/javascript">
        function openTimeTable(){
            window.open("timeTable.jsp","popup","width=600, height=800")
        }
    </script>
</head>
<body background="img3.png">
    <%
        String student_id = session.getAttribute("student_id").toString();//  adminStudent1.jsp에서 받은 정보를 세션에 저장
    %>
    <nav class="navbar navbar-dark bg-primary">
        <a class="navbar-brand" href="admin.jsp"> 한양대학교 | 관리자페이지</a>
        <a class="navbar-brand" href="adminStudent.jsp">학생 정보 조회 및 변경</a>
        <a class="navbar-brand" href="adminCourse.jsp">과목 정보 조회 및 변경</a>
        <a class="navbar-brand" href="adminOlap.jsp">통계기능/OLAP</a>
        <a class="navbar-brand" href="logoutAction.jsp">로그아웃</a>
    </nav>
    <nav class="navbar navbar-dark bg-secondary">
        <a class="navbar-brand" href="adminStudentAction.jsp"><%=" student ID : "%><%=student_id%></a>
        <a class="navbar-brand" href="javascript:openTimeTable()">금학기 학생 시간표 조회</a>
        <a class="navbar-brand" href="adminStudentActionCredit.jsp">학생 성적조회</a>
        <a class="navbar-brand" href="adminStudentActionLecturer.jsp">지도교수 조회</a>
        <a class="navbar-brand" href="adminStudentActionState.jsp">학생 정보/상태 변경</a>
    </nav>
</body>
</html>
