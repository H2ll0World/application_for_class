<%--
  Created by IntelliJ IDEA.
  User: hyunyongchoi
  Date: 2022/11/03
  Time: 4:24 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ page import="user.UserDAO" %>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="user.TimeTable" %>
<html>
<style>
  table{
    width: auto;
  }
</style>
<head>
  <title>수업시간표</title>
  <meta http-equiv="Content-Type" content="text/html"; charset="UTF-8">
  <meta name="viewport" content="width=device-width", initial-scale="1">
  <link rel="stylesheet" href="css/bootstrap.css">
</head>
<body>
  <h2 style="text-align: center">수업시간표</h2>
  <div class="container">
    <div class="row">
      <table class="table" style="text-align: center; border: 1px solid #dddddd">
        <thead>
        <tr>
          <th width="100" style="text-align: center"> 시간</th>
          <th width="200" sstyle="text-align: center"> 월</th>
          <th width="200" sstyle="text-align: center"> 화</th>
          <th width="200" sstyle="text-align: center"> 수</th>
          <th width="200" sstyle="text-align: center"> 목</th>
          <th width="200" sstyle="text-align: center"> 금</th>
        </tr>
        </thead>
        <tbody>
        <%
          //시간표 출력해줌
          UserDAO userDAO = new UserDAO();
          ArrayList<TimeTable> tlist= userDAO.getTimetable(session.getAttribute("student_id").toString());
          int[][] timeTable = new int[5][49]; //시간정보를 담을 2차원 배열
          for(int i = 0 ; i < tlist.size(); i++){//시간정보를 담고있는 tlist에서 필요한 부분만 추출
            if(tlist.get(i).getStart() != "NO"){
              String start = tlist.get(i).getStart();
              String end = tlist.get(i).getEnd();
              String c_id = tlist.get(i).getClass_id();
              String start1 = start.substring(9,10) + start.substring(11,13) + start.substring(14,16);
              String end1 = end.substring(9,10) + end.substring(11,13) + end.substring(14,16);
              int day = start1.charAt(0);
              day = day -49;//char과 int의 차이
              int stime = Integer.parseInt(start1.substring(1));
              int etime = Integer.parseInt(end1.substring(1));
              int classId = Integer.parseInt(c_id);

              if(stime >= 1800 || day == 6) {//6시넘거나 토요일인 경우
                continue;
              }else{//평일 and 오후6시 이전에 시작
                timeTable[day][0] += 1;
                int init = 0;
                int endTime = 0;
                if(stime % 100 == 30){
                  init = (stime/100) * 2 + 1;
                }else{
                  init = (stime/100) * 2;
                }
                if(etime % 100 == 30){
                  endTime = (etime/100) * 2 + 1;
                }else{
                  endTime = (etime/100) * 2;
                }
                for(int j = init; j < endTime; j++){
                  timeTable[day][j] = classId;
                }
              }
            }
          }
          for(int i = 18; i < 40; i ++){//시간표 출력해줌
            %>
        <tr>
          <td><%=i/2%><%=" : "%><%=(i%2)*3%><%=0%></td>
            <%for(int j = 0; j < 5; j ++){
          %>
          <td><%=userDAO.getClassName(timeTable[j][i])%></td>
          <%
            }
          %>
        </tr>
        <br>
        <%
          }
        %>
        </tbody>
      </table>
    </div>
  </div>

</body>
</html>
