<%--
  Created by IntelliJ IDEA.
  User: hyunyongchoi
  Date: 2022/10/31
  Time: 11:42 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="java.lang.reflect.Array" %>
<%@ page import="user.*" %>

<html>
<head>
    <title>수강신청처리 페이지</title>
</head>
<body>
    <h1>수강신청처리페이지</h1>
    <br>
<%
    //수강신청 제약조건 1.이전 성적 c+이하 2.정원제한 3.동일 시간대 2개x 4.최대 학점은 18학점
    //정보를 불러올 것과, 정보를 update 2개 만들기
    UserDAO userDAO = new UserDAO();
    String class_id = request.getParameter("class_id");

    if(class_id == null){
        PrintWriter script = response.getWriter();
        script.println("<script>");
        script.printf("alert('classIdList == null')",Integer.parseInt(class_id));
        script.println("</script>");
    }
    ArrayList<Student> courseIdList = userDAO.getCourseId(class_id);
    String course_id = null;
    for(int i = 0; i < courseIdList.size(); i ++){
        course_id = courseIdList.get(i).getStudent_id();
        PrintWriter script = response.getWriter();
    }
    if(course_id == null){
        PrintWriter script = response.getWriter();
        script.println("<script>");
        script.println("alert('course_register course_id를 불러오지 못함')");
        script.println("history.back()");
        script.println("</script>");
    }
    session.setAttribute("temp", class_id);
    session.setAttribute("temp_courseID", course_id);

    //이전 학점이 C+이하여야 하는 제약조건을 위해 만듬
    ArrayList<Check1> result1 = userDAO.getInfo1(session.getAttribute("student_id").toString(), session.getAttribute("temp_courseID").toString());
    int check123 = 0;
    for(int i = 0; i < result1.size(); i++){
        if(result1.get(i).getYear() == 2022){
            check123 =1;
            PrintWriter script = response.getWriter();
            script.println("<script>");
            script.println("alert('이미 신청한 강좌입니다.')");
            script.println("history.back()");
            script.println("</script>");
        }else if(result1.get(i).getGrade_num() >= 3.0){
            check123 = 2;
            PrintWriter script = response.getWriter();
            script.println("<script>");
            script.println("alert('학점이 C+ 이하인 강좌만 재수강 가능합니다.')");
            script.println("history.back()");
            script.println("</script>");
        }
    }
    if(check123 == 0){
        PrintWriter script = response.getWriter();
        script.println("<script>");
        script.println("alert('재수강 학점 제한 통과')");
        script.println("</script>");
    }

    //수강인원이 다 찬 경우
    int result2 = userDAO.getInfo2(session.getAttribute("temp").toString());
    if(result2 == 0){
        check123 = 3;
        PrintWriter script = response.getWriter();
        script.println("<script>");
        script.println("alert('수강정원이 다 찼습니다.')");
        script.println("history.back()");
        script.println("</script>");
    }else if(result2 == 1){
        PrintWriter script = response.getWriter();
        script.println("<script>");
        script.println("alert('인원통과.')");
        script.println("</script>");
    }

    //신청학점이 18점을 넘은 경우
    ArrayList<Check3> check3 = userDAO.getInfo3_3(session.getAttribute("student_id").toString());
    ArrayList<Check3> check3_1 = userDAO.getInfo3_4(session.getAttribute("temp").toString());

    int result3_3 = 0;
    for(int i = 0; i < check3.size(); i++){
        result3_3 = check3.get(i).getCredits();
    }
    int result3_4 = 0;
    for(int i = 0; i < check3_1.size(); i++){
        result3_4 = check3_1.get(i).getCredits();
    }
    int result3 = result3_3 + result3_4;
    if(result3 > 18){
        check123 = 4;
        PrintWriter script = response.getWriter();
        script.println("<script>");
        script.println("alert('최대수강 학점은 18점을 초과할 수 없습니다.')");
        script.println("history.back()");
        script.println("</script>");
    }else if(result3 == 0){
        PrintWriter script = response.getWriter();
        script.println("<script>");
        script.println("alert('result3 == 0!')");
        script.println("</script>");
    }else{
        PrintWriter script = response.getWriter();
        script.println("<script>");
        script.println("alert('신청학점 18학점 이하.')");
        script.println("</script>");
    }

    //현재 수강중인 시간표 뽑아냄 뒤에 현재 수강신청하고자 하는 과목과 시간비교
    ArrayList<TimeTable> tlist= userDAO.getTimetable(session.getAttribute("student_id").toString());
    int[][] timeTable = new int[5][49];
    for(int i = 0 ; i < tlist.size(); i++){
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
    //시간겹치는거 있는지 확인
    int result4 = userDAO.timeCheck(timeTable, session.getAttribute("temp").toString());
    if(result4 == 1){
        check123 = 7;
        PrintWriter script = response.getWriter();
        script.println("<script>");
        script.println("alert('동일 시간대에 수강중인 강의가 있습니다.')");
        script.println("history.back()");
        script.println("</script>");
    }else{
        PrintWriter script = response.getWriter();
        script.println("<script>");
        script.println("alert('동일 시간대에 수강중인 다른 강좌가 없습니다.')");
        script.println("</script>");
    }

    //여기까지 왔으면 수강신청 제약조건 모두 통과함
    //이제 수강신청 강좌를 넣어주면 됨

    //credits Table에 수강정보를 넣어줌
    ArrayList<Check3> maxIdList = userDAO.maxCreditsId();
    int maxId = -1;
    for(int i = 0; i < maxIdList.size(); i++){
        maxId = maxIdList.get(i).getCredits();
    }
    if(maxId == -1){
        check123 = 8;
        PrintWriter script = response.getWriter();
        script.println("<script>");
        script.println("alert('maxId error!')");
        script.println("history.back()");
        script.println("</script>");
    }
    //여기까진 됨
    ArrayList<Check3> personCur = userDAO.getPersonCur(session.getAttribute("temp").toString());
    int person_cur = -2;
    for(int i = 0; i < personCur.size(); i++){
        person_cur = personCur.get(i).getCredits();
    }
    if(person_cur == -1){
        check123 = 9;
        PrintWriter script = response.getWriter();
        script.println("<script>");
        script.println("alert('person_cur error1')");
        script.println("history.back()");
        script.println("</script>");
    }
    //class Table의 person_cur에 1을 더해줌
    if(check123 == 0){
        userDAO.insertIntoCredits(session.getAttribute("student_id").toString(), session.getAttribute("temp_courseID").toString(), session.getAttribute("temp").toString(), maxId);
        userDAO.updatePerson_cur(session.getAttribute("temp").toString(), person_cur);
        PrintWriter script = response.getWriter();
        script.println("<script>");
        script.println("alert('수강신청 완료!')");
        script.println("location.href = 'courseList.jsp'");
        script.println("</script>");
    }
%>

</body>
</html>
