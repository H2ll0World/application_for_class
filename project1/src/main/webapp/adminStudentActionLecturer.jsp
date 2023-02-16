<%@ page import="user.UserDAO" %>
<%@ page import="user.Lecturer" %>
<%@ page import="java.util.ArrayList" %>
<%--
  Created by IntelliJ IDEA.
  User: hyunyongchoi
  Date: 2022/11/05
  Time: 4:52 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html"; charset="UTF-8">
    <meta name="viewport" content="width=device-width">
    <link rel="stylesheet" href="./css/bootstrap.min.css">
    <link rel="stylesheet" href="css/bootstrap.css">
    <title>지도교수 조회</title>
    <script type="text/javascript">
        function openTimeTable(){
            window.open("timeTable.jsp","popup","width=600, height=800")
        }
    </script>
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
        <a class="navbar-brand" href="adminStudentAction.jsp"><%=" student ID : "%><%=session.getAttribute("student_id").toString()%></a>
        <a class="navbar-brand" href="javascript:openTimeTable()">금학기 학생 시간표 조회</a>
        <a class="navbar-brand" href="adminStudentActionCredit.jsp">학생 성적조회</a>
        <a class="navbar-brand" href="adminStudentActionLecturer.jsp">지도교수 조회</a>
        <a class="navbar-brand" href="adminStudentActionState.jsp">학생 정보/상태 변경</a>
    </nav>
    <div class="container">
        <div class="row">
            <table class="table">
                <thead>
                <tr>
                    <th style="text-align: center;">  교번 </th>
                    <th style="text-align: center;">  이름   </th>
                    <th style="text-align: center;">  학과번호   </th>
                    <th style="text-align: center;">  학과   </th>
                </tr>
                </thead>
                <tbody>
<%
    UserDAO userDAO = new UserDAO();//지도교수정보를 가져옴
    ArrayList<Lecturer> lec = userDAO.lecturers(session.getAttribute("student_id").toString());

    for(int i = 0; i <lec.size(); i++){
%>
                <tr>
                    <td style="text-align: center"><%=lec.get(i).getLecturer_id()%></td>
                    <td style="text-align: center"><%=lec.get(i).getName()%></td>
                    <td style="text-align: center"><%=lec.get(i).getMajor_id()%></td>
                    <td style="text-align: center"><%=lec.get(i).getDept_name()%></td>
                </tr>
                <%
                    }
                %>
                </tbody>
            </table>
        </div>
    </div>
</body>
</html>
