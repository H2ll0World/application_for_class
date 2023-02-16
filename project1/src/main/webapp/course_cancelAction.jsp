<%--
  Created by IntelliJ IDEA.
  User: hyunyongchoi
  Date: 2022/11/05
  Time: 2:52 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="user.UserDAO" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="user.c_user" %>
<%@ page import="user.Check3" %>
<%@ page import="java.io.PrintWriter"%>

<html>
<head>
    <title>수강신청 취소처리</title>
</head>
<body>
    <%=request.getParameter("classId")%>
    <%
        // 수강취소 처리해주는 페이지
        //8872	GEN5026	테크노경영학	3	4	25	김동준	자연과학관	186
        UserDAO userDAO = new UserDAO();
        String s_classId = request.getParameter("classId");

        userDAO.deleteCredits(session.getAttribute("student_id").toString(), s_classId);
        ArrayList<Check3> curList = userDAO.getPersonCur(s_classId);
        int cur = 0;
        for(int i = 0; i < curList.size(); i++){
            cur = curList.get(i).getCredits();
        }
        userDAO.decrementPerson_cur(s_classId, cur);//수강 취소해줬으므로 해당과목의 수강인원 1 줄여줌
        if(true){
            PrintWriter script = response.getWriter();
            script.println("<script>");
            script.println("alert('수강취소 성공')");
            script.println("location.href = 'courseList.jsp'");
            script.println("</script>");
        }
    %>
</body>
</html>
