<%--
  adminStudentActionState.jsp에서 상태정보를 변경하면
  이 페이지에서 처리하고 다시 adminStudentActionState.jsp 로 넘어감
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8"%>
<%@ page import="user.UserDAO" %>
<%@ page import="user.Check3" %>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="java.util.ArrayList" %>

<html>
<head>
    <meta http-equiv="Content-Type" content="text/html"; charset="UTF-8">
    <title>상태퇴정보 변경 처리</title>
</head>
<body>
<%
    //adminStudentActionState.jsp에서 받은 정보를 바탕으로 상태정보를 변경함
    UserDAO userDAO = new UserDAO();
    request.setCharacterEncoding("utf-8");
    int state = Integer.parseInt(request.getParameter("state"));
    String studentId = session.getAttribute("student_id").toString();
    if(state == 0){//재학하는 경우
        userDAO.updateState(studentId, 0);
        PrintWriter script =response.getWriter();
        script.println("<script>");
        script.println("alert('재학')");
        script.println("</script>");
    }else if(state == 1){//휴학하는 경우
        userDAO.updateState(studentId, 1);
        PrintWriter script =response.getWriter();
        script.println("<script>");
        script.println("alert('휴학')");
        script.println("</script>");
    }else if(state == 2){//자퇴하는 경우
        userDAO.updateState(studentId, 2);
        PrintWriter script =response.getWriter();
        script.println("<script>");
        script.println("alert('자퇴')");
        script.println("</script>");
    }
    if(state == 1 || state == 2){//휴학 또는 자퇴의 경우 현재 수강중인 강좌 모두 수강포기
        ArrayList<Check3> classidList = userDAO.getAllClassId(studentId);
        for(int i = 0; i < classidList.size(); i++){
            String classId = Integer.toString(classidList.get(i).getCredits());
            ArrayList<Check3> curList = userDAO.getPersonCur(classId);
            int cur = -1;
            for(int j = 0; j <curList.size(); j++){
                cur = curList.get(j).getCredits();
            }
            userDAO.deleteCredits(studentId, classId);
            userDAO.decrementPerson_cur(classId, cur);
        }
    }

    if(true) {//처리 완료하고 돌아감
        PrintWriter script = response.getWriter();
        script.println("<script>");
        script.println("location.href = 'adminStudentActionState.jsp'");
        script.println("</script>");
    }
%>

</body>
</html>
