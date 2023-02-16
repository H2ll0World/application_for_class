<%--
  Created by IntelliJ IDEA.
  User: hyunyongchoi
  Date: 2022/11/05
  Time: 11:01 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="user.UserDAO" %>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="user.TimeTable" %>
<%@ page import="user.c_user" %>

<html>
<head>
  <meta http-equiv="Content-Type" content="text/html"; charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <title>현재 수강강좌</title>
  <link rel="stylesheet" href="./css/bootstrap.min.css">
  <link rel="stylesheet" href="css/bootstrap.css">
  <script type="text/javascript">
    function openTimeTable(){
      window.open("timeTable.jsp","popup","width=600, height=800")
    }
  </script>
</head>
<body background="img3.png">
    <nav class="navbar navbar-dark bg-primary">
      <a class="navbar-brand" href="main.jsp">| 한양대학교</a>
      <a class="navbar-brand" href="course_search.jsp">수강편람/신청</a>
      <a class="navbar-brand" href="courseList.jsp">신청강좌/수강취소/희망강좌</a>
      <a class="navbar-brand" href="javascript:openTimeTable()">시간표</a>
      <a class="navbar-brand" href="logoutAction.jsp">로그아웃</a>

    </nav>
    <%
      //course_searchAction.jsp와 동일함 거기에 설명도 있음
      UserDAO userDAO = new UserDAO();
      ArrayList<c_user> courseList = userDAO.courseList(session.getAttribute("student_id").toString());
    %>
    <div class="container">
      <div class="row">
        <h2 style="text-align: center">신청수업</h2>
        <table class="table">
          <thead>
          <tr>
            <th style="text-align: center;">  수강취소 </th>
            <th style="text-align: center;">  수업번호 </th>
            <th style="text-align: center;">  수강이력<br>(재수강여부)</th>
            <th style="text-align: center;">  학수번호 </th>
            <th style="text-align: center;">  교과목명 </th>
            <th style="text-align: center;">  학점    </th>
            <th style="text-align: center;">  신청인원  </th>
            <th style="text-align: center;">  수강정원  </th>
            <th style="text-align: center;">  교강사 </th>
            <th style="text-align: center;">  수업시간   </th>
            <th style="text-align: center;">  건물   </th>
            <th style="text-align: center;">  호수   </th>
          </tr>
          </thead>
          <tbody>
          <%
            for(int i = 0; i < courseList.size(); i++){
          %>
          <tr>
            <td>
              <button type="button" onclick="location.href='course_cancelAction.jsp?classId=<%=courseList.get(i).getClass_id()%>'">수강취소</button>
            </td>
            <td style="text-align: center"><%=courseList.get(i).getClass_no()%></td>
            <%
              //course_searchAction.jsp와 동일함 거기에 설명도 있음
              String course_id1 = courseList.get(i).getCourse_id();
              int checkPreCourse = userDAO.checkCredits(session.getAttribute("student_id").toString(), course_id1);
              if(checkPreCourse > 0){
            %>
            <td style="text-align: center">0</td>
            <%
            }else{
            %>
            <td style="text-align: center">"X"</td>
            <%
              }
            %>
            <td style="text-align: center"><%=courseList.get(i).getCourse_id()%></td>
            <td style="text-align: center"><%=courseList.get(i).getC_name()%></td>
            <td style="text-align: center"><%=courseList.get(i).getPeriod()%></td>
            <td style="text-align: center"><%=courseList.get(i).getCur()%></td>
            <td style="text-align: center"><%=courseList.get(i).getMax()%></td>
            <td style="text-align: center"><%=courseList.get(i).getLecturer()%></td>
            <td style="text-align: center"><%
              //course_searchAction.jsp와 동일함 거기에 설명도 있음
              ArrayList<TimeTable> timelist = userDAO.timeTablesList(courseList.get(i).getClass_id());
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
            <td style="text-align: center"><%=courseList.get(i).getBuilding()%></td>
            <td style="text-align: center"><%=courseList.get(i).getRoom_id()%></td>
          </tr>
          <%
            }
            //course_searchAction.jsp와 동일함 거기에 설명도 있음
          %>
          </tbody>
        </table>
        <h2 style="text-align: center">희망수업</h2>
        <table class="table">
          <thead>
          <tr>
            <th style="text-align: center;">수강신청</th>
            <th style="text-align: center;">희망취소</th>
            <th style="text-align: center;">  수강이력<br>(재수강여부)</th>
            <th style="text-align: center;">  수업번호 </th>
            <th style="text-align: center;">  학수번호 </th>
            <th style="text-align: center;">  교과목명 </th>
            <th style="text-align: center;">  학점    </th>
            <th style="text-align: center;">  교강사    </th>
            <th style="text-align: center;">  신청인원  </th>
            <th style="text-align: center;">  수강정원  </th>
            <th style="text-align: center;">  수업시간   </th>
            <th style="text-align: center;">  건물   </th>
            <th style="text-align: center;">  호수   </th>
          </tr>
          </thead>
          <tbody>
          <%
            ArrayList<c_user> wishList = userDAO.getWishList(session.getAttribute("student_id").toString());
            for(int i = 0; i < wishList.size(); i++){
          %>
          <tr>
            <td>
              <button type="button" onclick="location.href='course_register.jsp?class_id=<%=wishList.get(i).getClass_id()%>'">수강신청</button>
            </td>
            <td>
              <button type="button" onclick="location.href='courseListDeleteWishList.jsp?classId=<%=wishList.get(i).getClass_id()%>'">희망취소</button>
            </td>
            <%
              String course_id1 = wishList.get(i).getCourse_id();
              int checkPreCourse = userDAO.checkCredits(session.getAttribute("student_id").toString(), course_id1);
              if(checkPreCourse > 0){
            %>
            <td style="text-align: center">0</td>
            <%
            }else{
            %>
            <td style="text-align: center">"X"</td>
            <%
              }
            %>
            <td style="text-align: center"><%=wishList.get(i).getClass_no()%></td>
            <td style="text-align: center"><%=wishList.get(i).getCourse_id()%></td>
            <td style="text-align: center"><%=wishList.get(i).getC_name()%></td>
            <td style="text-align: center"><%=wishList.get(i).getCredit()%></td>
            <td style="text-align: center"><%=wishList.get(i).getLecturer()%></td>
            <td style="text-align: center"><%=wishList.get(i).getCur()%></td>
            <td style="text-align: center"><%=wishList.get(i).getMax()%></td>
            <td style="text-align: center"><%
              //course_searchAction.jsp와 동일함 거기에 설명도 있음
              ArrayList<TimeTable> timelist1 = userDAO.timeTablesList(wishList.get(i).getClass_id());
              for(int j = 0; j < timelist1.size(); j ++){
                String sStr = timelist1.get(j).getStart();
                String eStr = timelist1.get(j).getEnd();
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
            <td style="text-align: center"><%=wishList.get(i).getBuilding()%></td>
            <td style="text-align: center"><%=wishList.get(i).getRoom_id()%></td>
          </tr>
          <%
            }
            //course_searchAction.jsp와 동일함 거기에 설명도 있음
          %>
          </tbody>
        </table>
      </div>
    </div>
</body>
</html>
