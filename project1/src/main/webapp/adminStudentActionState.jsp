<%--
  Created by IntelliJ IDEA.
  User: hyunyongchoi
  Date: 2022/11/05
  Time: 4:52 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ page import="user.UserDAO" %>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="user.StudentInfo" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html" charset="UTF-8">
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
    <div class="container">
        <div class="row">
            <table class="table">
                <thead>
                <tr>
                    <th style="text-align: center;">  </th>
                    <th style="text-align: center;">  상태   </th>
                    <th style="text-align: center;">  학번   </th>
                    <th style="text-align: center;">  이름   </th>
                    <th style="text-align: center;">  성별   </th>
                    <th style="text-align: center;">  학과   </th>
                    <th style="text-align: center;">  학년   </th>
                    <th style="text-align: center;">  지도교수   </th>
                </tr>
                </thead>
                <tbody>
                <%
                    UserDAO userDAO = new UserDAO(); //학생 상태 정보를 가져와서 보여줌
                    ArrayList<StudentInfo> Info = userDAO.getStudentInfo(session.getAttribute("student_id").toString());

                    for(int i = 0; i <Info.size(); i++){//학생 상태 정보를 가져와서 보여줌
                %>
                <tr>
                    <td style="text-align: center">
                        <form action="adminStudentActionState1.jsp" method="post" charset="UTF-8">
                            <select name="state">
                                <option value=0>재학</option>
                                <option value=1>휴학</option>
                                <option value=2>자퇴</option>
                            </select>
                            <input type="submit" value="상태변경">
                        </form>
                    </td>
                    <%
                        int state1 = Info.get(i).getState();
                        if(state1 == 0){
                    %>
                    <td style="text-align: center" ><%="재학"%></td>
                    <%
                        }else if(state1 == 1){
                    %>
                    <td style="text-align: center" ><%="휴학"%></td>
                    <%
                        }else if(state1 == 2){
                    %>
                    <td style="text-align: center" ><%="자퇴"%></td>
                    <%
                        }
                    %>
                    <td style="text-align: center"><%=Info.get(i).getStudent_id()%></td>
                    <td style="text-align: center"><%=Info.get(i).getName()%></td>
                    <td style="text-align: center"><%=Info.get(i).getSex()%></td>
                    <td style="text-align: center"><%=Info.get(i).getDept()%></td>
                    <td style="text-align: center"><%=Info.get(i).getYear()%></td>
                    <td style="text-align: center"><%=Info.get(i).getLecturer()%></td>
                </tr>
                <%
                    }
                %>
                </tbody>
            </table>
            <P>상태가 휴학이나 자퇴로 변경시 현재수강중인 강좌는 모두 수강포기</P>
        </div>
    </div>
</body>
</html>
