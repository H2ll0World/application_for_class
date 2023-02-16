<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="user.UserDAO" %>
<%@ page import="java.io.PrintWriter" %>
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html"; charset="UTF-8">
    <meta name="viewport" content="width=device-width">
    <link rel="stylesheet" href="css/bootstrap.css">
    <title>로그인 액션</title>
</head>
<body>
    <%=request.getParameter("studentID")%>
<%
    String studentID = null;
    //로그인된 상태
    if(session.getAttribute("student_id") != null)
    {
        studentID = (String) session.getAttribute("student_id");
    }
    //로그인된 상태
    if(studentID != null)
    {
        PrintWriter script = response.getWriter();
        script.println("<script>");
        script.println("alert('이미 로그인이 되어있습니다.')");
        script.println("location.href = 'main.jsp'");
        script.println("</script>");
    }

    UserDAO userDAO = new UserDAO();
    int result = userDAO.studentLogin(request.getParameter("studentID"), request.getParameter("pw"));

    if(result == 1)//일반 학생 로그인
    {
        session.setAttribute("student_id", request.getParameter("studentID"));
        PrintWriter script = response.getWriter();
        script.println("<script>");
        script.println("alert('사용자 로그인.')");
        script.println("location.href = 'main.jsp'");
        script.println("</script>");
    }
    else if(result == 5){//관리자 로그인
        session.setAttribute("student_id", request.getParameter("studentID"));
        PrintWriter script = response.getWriter();
        script.println("<script>");
        script.println("alert('관리자 로그인.')");
        script.println("location.href = 'admin.jsp'");
        script.println("</script>");
    }
    else if(result == 0)//비밀번호가 틀린경우
    {
        PrintWriter script = response.getWriter();
        script.println("<script>");
        script.println("alert('비밀번호가 틀립니다.')");
        script.println("history.back()");
        script.println("</script>");
    }
    else if(result == -1)//존재하지 않는 아이디
    {
        PrintWriter script = response.getWriter();
        script.println("<script>");
        script.println("alert('존재하지 않는 아이디입니다.')");
        script.println("history.back()");
        script.println("</script>");
    }
    else if(result == -2)//DB오류
    {
        PrintWriter script = response.getWriter();
        script.println("<script>");
        script.println("alert('데이터베이스 오류가 발생했습니다.')");
        script.println("history.back()");
        script.println("</script>");
    }
%>

</body>
</html>