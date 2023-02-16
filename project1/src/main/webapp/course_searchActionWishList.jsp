<%--
  Created by IntelliJ IDEA.
  User: hyunyongchoi
  Date: 2022/11/07
  Time: 10:38 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ page import="user.*" %>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.sql.*" %>
<html>
<head>
    <title>희망강좌담기 처리</title>
    <meta http-equiv="Content-Type" content="text/html"; charset="UTF-8">
    <meta name="viewport" content="width=device-width">
</head>
<body>
    <%
        //장바구니 기능 구현
        UserDAO userDAO = new UserDAO();
        String class_id = request.getParameter("class_id");
        userDAO.setWishList(session.getAttribute("student_id").toString(), class_id);//장바구니에 너어줌
        if(true){
            PrintWriter script = response.getWriter();
            script.println("<script>");
            script.println("alert('희망강좌 담기 성공')");
            script.println("location.href = 'course_searchAction.jsp'");
            script.println("</script>");
        }
    %>

</body>
</html>
