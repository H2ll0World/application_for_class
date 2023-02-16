<%--
  Created by IntelliJ IDEA.
  User: hyunyongchoi
  Date: 2022/11/05
  Time: 7:47 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.io.PrintWriter"%>
<html>
<head>
    <title>student_id를 세션에 저장</title>
</head>
<body>
<%
    String student_id = request.getParameter("student_id");
    session.setAttribute("student_id", student_id);
    if(true){
        PrintWriter script = response.getWriter();
        script.println("<script>");
        script.println("location.href = 'adminStudentAction.jsp'");
        script.println("</script>");
    }
%>

</body>
</html>
