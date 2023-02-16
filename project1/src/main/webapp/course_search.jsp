<%@ page contentType="text/html; charset=UTF-8" language="java"%>
<%
    //수강편람 페이지
    //수업번호 학수번호 교과목으로 검색
    //교과목은 키워드 검색가능
    //신청버튼, 수업번호, 학수번호, 교과목명,
    //교강사이름, 수업시간, 신청인원/수강저원, 강의실(건물+호수)
%>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html"; charset="UTF-8">
    <meta name="viewport" content="width=device-width">
    <link rel="stylesheet" href="./css/bootstrap.min.css">
    <link rel="stylesheet" href="css/bootstrap.css">
    <script type="text/javascript">
        function openTimeTable(){
            window.open("timeTable.jsp","popup","width=600, height=800")
        }
    </script>
    <title>수강편람</title>
</head>
<body background="img3.png">
<nav class="navbar navbar-dark bg-primary">
    <a class="navbar-brand" href="main.jsp">| 한양대학교</a>
    <a class="navbar-brand" href="course_search.jsp">수강편람/신청</a>
    <a class="navbar-brand" href="courseList.jsp">신청강좌/수강취소/희망강좌</a>
    <a class="navbar-brand" href="javascript:openTimeTable()">시간표</a>
    <a class="navbar-brand" href="logoutAction.jsp">로그아웃</a>
</nav>
    <div class="container">
        <form method="post" action="course_searchAction.jsp">
            <h3 style="test-align: center;">수강편람</h3>
            <div class="form-group">
                <input type="text" class="form-control" placeholder="수업번호" name="class_no" maxlength="20">
            </div>
            <div class="form-group">
                <input type="text" class="form-control" placeholder="학수번호" name="course_id" maxlength="20">
            </div>
            <div class="form-group">
                <input type="text" class="form-control" placeholder="교과목" name="c_name" maxlength="20">
            </div>
            <input type="submit" class="btn btn-outline-primary form-control" value="조회">
        </form>
    </div>
</body>
</html>
