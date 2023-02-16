<%--
  Created by IntelliJ IDEA.
  User: hyunyongchoi
  Date: 2022/11/06
  Time: 12:27 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="user.UserDAO" %>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="user.StudentInfo" %>
<%@ page import="user.Check3" %>
<html>
<head>
    <title>수강인원 증거 처리페이지</title>
</head>
<body>
    <%
        //adminCourseIncrease.jsp에서 정보를 받아 해당하는 과목의 수강가능인원을 증가함
        String classId = request.getParameter("class_id");
        String increaseNum = request.getParameter("increase_num");

        UserDAO userDAO = new UserDAO();
        ArrayList<Check3> maxList = userDAO.getPersonMax(classId);
        int max = -1;
        for(int i = 0; i < maxList.size(); i++){
            max = maxList.get(i).getCredits();
        }
        if(max == -1){//해당하는 class_id가 없는 경우
            PrintWriter script = response.getWriter();
            script.println("<script>");
            script.println("alert('입력하신 class_id에 해당하는 과목이 없습니다!')");
            script.println("history.back()");
            script.println("</script>");
        }
        userDAO.increaseMax(classId, Integer.parseInt(increaseNum) + max);//수강가능인원을 늘려줌

        if(true){
            PrintWriter script = response.getWriter();
            script.println("<script>");
            script.println("alert('과목 증원 완료')");
            script.println("location.href = 'adminCourseIncrease.jsp'");
            script.println("</script>");
        }
    %>
</body>
</html>
