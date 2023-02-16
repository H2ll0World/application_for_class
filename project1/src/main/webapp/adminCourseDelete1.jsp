<%--
  여기서 폐강할 과목을 선택하고 폐강할 과목의 정보를 adminCourseDeleteAction.jsp로 보내, 폐강함
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ page import="user.*" %>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.sql.*" %><html>
<head>
  <meta http-equiv="Content-Type" content="text/html" charset="UTF-8">
  <meta name="viewport" content="width=device-width">
  <link rel="stylesheet" href="./css/bootstrap.min.css">
  <link rel="stylesheet" href="css/bootstrap.css">
  <title>admin login</title>
</head>
<body background="img3.png">
<nav class="navbar navbar-dark bg-primary">
  <a class="navbar-brand" href="admin.jsp"> 한양대학교 | 관리자페이지</a>
  <a class="navbar-brand" href="adminStudent.jsp">학생 정보 조회 및 변경</a>
  <a class="navbar-brand" href="adminCourse.jsp">과목 정보 조회 및 변경</a>
  <a class="navbar-brand" href="adminOlap.jsp">통계기능/OLAP</a>
  <a class="navbar-brand" href="logoutAction.jsp">로그아웃</a>
</nav>
<nav class="navbar navbar-dark bg-secondary">
  <a class="navbar-brand" href="adminCourseSearch.jsp">과목 조회</a>
  <a class="navbar-brand" href="adminCourseIncrease.jsp">과목 증원</a>
  <a class="navbar-brand" href="adminCourseAccept.jsp">수강 허용 반영</a>
  <a class="navbar-brand" href="adminCourseCreate.jsp">과목 설강</a>
  <a class="navbar-brand" href="adminCourseDelete.jsp">과목 폐강</a>
</nav>
<div class="container">
  <div class="row">
    <table class="table" width="800" style="text-align: center; border: 1px solid #dddddd">
      <thead>
      <tr>
        <th style="text-align: center;">  폐강   </th>
        <th style="text-align: center;">  수업번호 </th>
        <th style="text-align: center;">  학수번호   </th>
        <th style="text-align: center;">  교과목명   </th>
        <th style="text-align: center;">  교강사이름   </th>
        <th style="text-align: center;">  수업시간   </th>
        <th style="text-align: center;">  년도   </th>
        <th style="text-align: center;">  신청인원   </th>
        <th style="text-align: center;">  수강정원   </th>
        <th style="text-align: center;">  건물   </th>
        <th style="text-align: center;">  호수   </th>
        <th style="text-align: center;">  class_id   </th>


      </tr>
      <%
        request.setCharacterEncoding("utf-8");
        String _class_no=request.getParameter("class_no");
        session.setAttribute("class_no",_class_no);
        String _course_id=request.getParameter("course_id");
        String _course_name=request.getParameter("c_name");
      %>
      </thead>
      <tbody>
      <%
        UserDAO userDAO = new UserDAO();
        ArrayList<c_user> list;
        //수강편람(course_searchAction.jsp와 똑같음 코드 똑같이 가져다씀)
        if(_class_no == "" && _course_id == ""){//교과목만 검색한 경우
          list = userDAO.search_courseName(_course_name);
          PrintWriter script = response.getWriter();
          script.println("<script>");
          script.printf("alert('course_searchAction.jsp %d ::: 1.')",list.size());
          script.println("</script>");
        } else if (_class_no != "" && _course_id == "") {//class_no으로 검색한 경우
          list = userDAO.search_courseClassNo(_class_no, _course_name);
          PrintWriter script = response.getWriter();
          script.println("<script>");
          script.printf("alert('course_searchAction.jsp %d ::: 2.')",list.size());
          script.println("</script>");
        } else if (_class_no =="") {//course_id로 검색한 경우
          list = userDAO.search_courseCourseId(_course_id, _course_name);
          PrintWriter script = response.getWriter();
          script.println("<script>");
          script.printf("alert('course_searchAction.jsp %d ::: 3')",list.size());
          script.println("</script>");
        } else{//둘다로 검색한 경우
          list = userDAO.search_course(_class_no, _course_id, _course_name);
        }
        //하나의 수업에 시간이 여러개 있을 수 있으므로 이것을 처리하기 위해서 정의
        ArrayList<String> time_list = new ArrayList<String>();
        String key = null;//key는 class table에서의 key를 의미
        if(list.size() > 0){
          key = list.get(0).getClass_id();
        }

        //테이블 다시 만듬

        for(int i = 0; i < list.size(); i++){
          //이거 쓰는거 많았는데 처리해줘야함
          //session.setAttribute("temp", list.get(i).getClass_id());
          //session.setAttribute("temp_courseID", list.get(i).getCourse_id());
      %>
      <tr>
        <%
          if(list.get(i).getYear() == 2022){
        %>
        <td><button type="button" onclick="location.href='adminCourseDeleteAction.jsp?class_id=<%=list.get(i).getClass_id()%>'">폐강</button> </td>
        <%
        }else{
        %>
        <td></td>
        <%
          }
          String course_id1 = list.get(i).getCourse_id();
          int checkPreCourse = userDAO.checkCredits(session.getAttribute("student_id").toString(), course_id1);
        %>
        <td><%= list.get(i).getClass_no()%></td>
        <td><%= list.get(i).getCourse_id()%></td>
        <td><%= list.get(i).getC_name()%></td>
        <td><%= list.get(i).getLecturer()%></td>
        <td><%
          //시간정보를 받아 보여줌//수강편람페이지와 똑같음 코드 그대로 가져다씀
          ArrayList<TimeTable> timelist = userDAO.timeTablesList(list.get(i).getClass_id());
          for(int j = 0; j < timelist.size(); j ++){
            String sStr = timelist.get(j).getStart();
            String eStr = timelist.get(j).getEnd();
            char dnum = sStr.charAt(9);
            String day = null;
            if(dnum == '1') {
              day = "월요일";
            } else if (dnum == '2') {
              day = "화요일";
            } else if (dnum == '3') {
              day = "수요일";
            } else if (dnum == '4') {
              day = "목요일";
            } else if (dnum == '5') {
              day = "금요일";
            } else if (dnum == '6') {
              day = "토요일";
            }
            int stime = Integer.parseInt(sStr.substring(11,13));
            if(stime >= 18 || dnum == '6') {//6시넘거나 토요일인 경우 시간표시x
              continue;
            }
            String result = day + sStr.substring(11,15) + "0 ~ " + eStr.substring(11,15) + "0";
        %>
          <%=result%><br>
          <%
            }
          %></td>
        <td><%= list.get(i).getYear()%></td>
        <td><%= list.get(i).getCur()%></td>
        <td><%= list.get(i).getMax()%></td>
        <td><%= list.get(i).getBuilding()%></td>
        <td><%= list.get(i).getRoom_id()%></td>
        <td><%= list.get(i).getClass_id()%></td>
      </tr>
      <%
        }
      %>
      </tbody>
    </table>
    <p>list size : <%=list.size()%></p>
  </div>
</div>

</body>
</html>
