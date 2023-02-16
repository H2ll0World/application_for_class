<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ page import="user.UserDAO" %>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="user.c_user" %>
<%@ page import="user.User" %>
<%@ page import="java.sql.Time" %>
<%@ page import="user.TimeTable" %>
<!DOCTYPE html>
<html>
<head>
    <!-- link 뭐의미?-->
    <meta http-equiv="Content-Type" content="text/html"; charset="UTF-8">
    <meta name="viewport" content="width=device-width">
    <link rel="stylesheet" href="./css/bootstrap.min.css">
    <link rel="stylesheet" href="css/bootstrap.css">
    <script type="text/javascript">
        function openTimeTable(){
            window.open("timeTable.jsp","popup","width=600, height=800")
        }
    </script>
    <title>수강편람 액션</title>
</head>
<body background="img3.png">
    <nav class="navbar navbar-dark bg-primary">
        <a class="navbar-brand" href="main.jsp"> 한양대학교 | 수강편람/신청</a>
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
        <div class="row">
            <table class="table" width="800" style="text-align: center; border: 1px solid #dddddd">
                <thead>
                <tr>
                    <th style="text-align: center;">  수강신청   </th>
                    <th style="text-align: center;">  장바구니   </th>
                    <th style="text-align: center;">  수강이력<br>(재수강여부)</th>
                    <th style="text-align: center;">  수업번호 </th>
                    <th style="text-align: center;">  학수번호   </th>
                    <th style="text-align: center;">  교과목   </th>
                    <th style="text-align: center;">  교강사   </th>
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
                        <td><button type="button" onclick="location.href='course_register.jsp?class_id=<%=list.get(i).getClass_id()%>'">수강신청</button> </td>
                        <td><button type="button" onclick="location.href='course_searchActionWishList.jsp?class_id=<%=list.get(i).getClass_id()%>'">희망강좌담기</button> </td>
                        <%
                            }else{
                        %>
                        <td></td>
                        <td></td>
                        <%
                            }
                            String course_id1 = list.get(i).getCourse_id();
                            int checkPreCourse = userDAO.checkCredits(session.getAttribute("student_id").toString(), course_id1);
                            if(checkPreCourse > 0){
                                %>
                        <td>0</td>
                            <%
                            }else{
                                %>
                        <td>"X"</td>
                            <%
                            }
                        %>
                        <td><%= list.get(i).getClass_no()%></td>
                        <td><%= list.get(i).getCourse_id()%></td>
                        <td><%= list.get(i).getC_name()%></td>
                        <td><%= list.get(i).getLecturer()%></td>
                        <td><%
                            //동일 시간에 2과목 이상 들을 수 없으므로 이 제약조건을 검사
                            ArrayList<TimeTable> timelist = userDAO.timeTablesList(list.get(i).getClass_id());
                            for(int j = 0; j < timelist.size(); j ++){//
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
