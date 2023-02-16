<%--
  class
  time1
  credits 에서 삭제
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ page import="user.*" %>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.sql.*" %><html>
<head>
    <title>과목폐강</title>
</head>
<body>
<%
    //adminCourseDelete1.jsp에서 폐강할 강의의 정보를 받아서 폐강함
    String classId = request.getParameter("class_id");
    UserDAO userDAO = new UserDAO();
    userDAO.deleteClass(classId);//class Table에서 삭제
    userDAO.deleteTime1(classId);//time1 Table에서 삭제
    userDAO.deleteCredits(classId);//credits Table에서 삭제

    if(true){
        PrintWriter script = response.getWriter();
        script.println("<script>");
        script.println("alert('폐강 성공')");
        script.println("location.href = 'adminCourseDelete.jsp'");
        script.println("</script>");
    }
%>

</body>
</html>
