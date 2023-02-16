<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.io.PrintWriter" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html"; charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>메인페이지</title>
	<link rel="stylesheet" href="./css/bootstrap.min.css">
	<link rel="stylesheet" href="css/bootstrap.css">
	<script type="text/javascript">
		function openTimeTable(){
			window.open("timeTable.jsp","popup","width=600, height=800")
		}
	</script>
</head>
<body background="img3.png">
	<%
		String studentID = null;
		if(session.getAttribute("student_id") != null)
		{
			studentID = session.getAttribute("student_id").toString();
		}
	%>
	<%
		if(studentID == null) //로그인 x
		{
	%>
	<nav class="navbar navbar-dark bg-primary">
		<a class="navbar-brand" href="main.jsp"> 한양대학교 | 수강신청</a>
		<a class="navbar-brand" href="studentLogin.jsp">로그인</a>
	</nav>
	<script src="./js/bootstrap.min.js"></script>
	<%
		}
		//일반 학생 로그인
		else
		{
	%>
	<nav class="navbar navbar-dark bg-primary">
		<a class="navbar-brand" href="main.jsp"> 한양대학교 | 수강신청</a>
		<a class="navbar-brand" href="course_search.jsp">수강편람/신청</a>
		<a class="navbar-brand" href="courseList.jsp">신청강좌/수강취소/희망강좌</a>
		<a class="navbar-brand" href="javascript:openTimeTable()">시간표</a>
		<a class="navbar-brand" href="logoutAction.jsp">로그아웃</a>

	</nav>
	<script src="./js/bootstrap.min.js"></script>
	<%
		}
	%>
</body>
</html>