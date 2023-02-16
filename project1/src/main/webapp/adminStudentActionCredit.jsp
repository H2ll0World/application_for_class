<%--
  학생의 학점정보를 가져옴
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ page import="user.UserDAO" %>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="user.adminStudentCredit"%>
<%@ page import="user.TimeTable" %>
<%@ page import="user.Check1" %>
<%@ page import="user.Check3" %>
<%@ page import="java.lang.reflect.Array" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html"; charset="UTF-8">
    <meta name="viewport" content="width=device-width">
    <link rel="stylesheet" href="./css/bootstrap.min.css">
    <link rel="stylesheet" href="css/bootstrap.css">
    <title>학생성적 정보</title>
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
    <%
        UserDAO userDAO = new UserDAO();//학생의 학점정보를 가져옴
        ArrayList<adminStudentCredit> creditList = userDAO.getCredits(session.getAttribute("student_id").toString());
    %>
    <div class="container">
        <div class="row">
            <table class="table">
                <thead>
                <tr>
                    <th style="text-align: center;">  학수번호   </th>
                    <th style="text-align: center;">  교과목명   </th>
                    <th style="text-align: center;">  학점   </th>
                    <th style="text-align: center;">  년도   </th>
                </tr>
                </thead>
                <tbody>
                <%
                    for(int i = 0; i < creditList.size(); i++){
                %>
                <tr>
                    <td style="text-align: center"><%=creditList.get(i).getCourse_id()%></td>
                    <td style="text-align: center"><%=creditList.get(i).getCourse_name()%></td>
                    <td style="text-align: center"><%=creditList.get(i).getGrade()%></td>
                    <td style="text-align: center"><%=creditList.get(i).getYear()%></td>
                </tr>
                <%
                    }
                %>
                </tbody>
            </table>
            <table class="table">
                <thead>
                <tr>
                    <td style="text-align: center">YEAR</td>
                    <td style="text-align: center">평균 평점</td>
                </tr>
                </thead>
                <tbody>
                <%
                    ArrayList<Check1> yearList = userDAO.getCreditsYear(session.getAttribute("student_id").toString());
                    for(int i = 0; i < yearList.size(); i++){ //년도별 평균 학점 정보를 가져옴
                %>
                <tr>
                    <td style="text-align: center"><%=yearList.get(i).getYear()%></td>
                    <td style="text-align: center"><%=yearList.get(i).getGrade_num()%></td>
                </tr>
                <%
                    }
                %>
                </tbody>
            </table>
            <table class="table">
                <thead>
                <tr>
                    <td style="text-align: center">전체 평균 평점</td>
                </tr>
                </thead>
                <tbody>
                <tr>
                    <td style="text-align: center"><%=userDAO.getCreditsAll(session.getAttribute("student_id").toString())%></td>
                </tr>
                </tbody>
            </table>
        </div>
    </div>

</body>
</html>
