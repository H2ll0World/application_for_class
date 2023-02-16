<%--
  Created by IntelliJ IDEA.
  User: hyunyongchoi
  Date: 2022/11/07
  Time: 8:52 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="user.UserDAO" %>
<%@ page import="java.io.PrintWriter"%>

<html>
<head>
    <title>희망수업삭제</title>
</head>
<body>
<%
    UserDAO userDAO = new UserDAO();
    userDAO.deleteWishList(session.getAttribute("student_id").toString(), request.getParameter("classId"));
    //희망수업을 삭제해줌

    if(true){
        PrintWriter script = response.getWriter();
        script.println("<script>");
        script.println("alert('희망취소 성공')");
        script.println("location.href = 'courseList.jsp'");
        script.println("</script>");
    }
%>

</body>
</html>
