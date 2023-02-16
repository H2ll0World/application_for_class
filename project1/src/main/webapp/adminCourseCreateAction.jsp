<%--
  Created by IntelliJ IDEA.
  User: hyunyongchoi
  Date: 2022/11/06
  Time: 2:49 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ page import="user.UserDAO" %>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="user.StudentInfo" %>
<%@ page import="user.User" %>
<%@ page import="user.Check3" %>
<html>
<head>
    <title>과목 설강 처리</title>
</head>
<body>
    <%
        //adminCourseCreate에서 보내준 정보를 받음
        request.setCharacterEncoding("utf-8");
        String class_id = request.getParameter("class_id");
        String class_no = request.getParameter("class_no");
        String course_id = request.getParameter("course_id");
        String course_name = request.getParameter("course_name");
        String year = request.getParameter("year");
        String credit = request.getParameter("credit");

        String day1 = request.getParameter("day1");
        String begin1 = request.getParameter("begin1");
        String end1 = request.getParameter("end1");

        String begin2 = request.getParameter("begin2");
        String end2 = request.getParameter("end2");
        String day2 = request.getParameter("day2");

        String begin3 = request.getParameter("begin3");
        String end3 = request.getParameter("end3");
        String day3 = request.getParameter("day3");

        String begin4 = request.getParameter("begin4");
        String end4 = request.getParameter("end4");
        String day4 = request.getParameter("day4");

        String begin5 = request.getParameter("begin5");
        String end5 = request.getParameter("end5");
        String day5 = request.getParameter("day5");

        String begin6 = request.getParameter("begin6");
        String end6 = request.getParameter("end6");
        String day6 = request.getParameter("day6");

        String lecturer_id = request.getParameter("lecturer_id");
        String person_max = request.getParameter("person_max");
        String room_id = request.getParameter("room_id");

        //제약조건부터 검사
      //class_id, class_no 가 이미 있으면 x
      //course_id 가 존재할 경우 교과목명과 일치해야 함
      //person_max가 room의 수용인원을 넘을 수 x
        UserDAO userDAO = new UserDAO();
        int CHECK = 1;
        int check1 = userDAO.getInfo2(class_id);
        if(check1 == 0 || check1 == 1){ //해당하는 수업이 이미 있는 경우
            PrintWriter script = response.getWriter();
            CHECK = 0;
            script.println("<script>");
            script.println("alert('해당하는 class_ID 를 가진 수업이 이미 있습니다!')");
            script.println("history.back()");
            script.println("</script>");
        }
        int check2 = userDAO.checkClassNo(class_no);
        if(check2 == 1){// 해당한는 class_no을 가진 class가 이미 있는 경우
            CHECK = 0;
            PrintWriter script = response.getWriter();
            script.println("<script>");
            script.println("alert('해당하는 class_no 를 가진 수업이 이미 있습니다!')");
            script.println("history.back()");
            script.println("</script>");
        }
        if(credit == null){//학점을 입력하지 않은 경우
            CHECK = 0;
            PrintWriter script = response.getWriter();
            script.println("<script>");
            script.println("alert('학점을 입력해 주세요')");
            script.println("history.back()");
            script.println("</script>");
        }
        int credit1 = Integer.parseInt(credit);
        if(credit1 <= 0){//학점이 0 또는 음수로 입력된 경우
            CHECK = 0;
            PrintWriter script = response.getWriter();
            script.println("<script>");
            script.println("alert('학점은 0 또는 음수가 될 수 없습니다!')");
            script.println("history.back()");
            script.println("</script>");
        }
        //시작시간이 종료시간보다 큰 경우
        if (begin1 != "" && Integer.parseInt(begin1.substring(0, 2)) > Integer.parseInt(end1.substring(0, 2))) {
            CHECK = 0;
            PrintWriter script = response.getWriter();
            script.println("<script>");
            script.println("alert('시작시간은 종료시간보다 빨라야 합니다.')");
            script.println("history.back()");
            script.println("</script>");
        }
        if (begin2 != "" && Integer.parseInt(begin2.substring(0, 2)) > Integer.parseInt(end2.substring(0, 2))) {
            CHECK = 0;
            PrintWriter script = response.getWriter();
            script.println("<script>");
            script.println("alert('시작시간은 종료시간보다 빨라야 합니다.')");
            script.println("history.back()");
            script.println("</script>");
        }
        if (begin3 != "" && Integer.parseInt(begin3.substring(0, 2)) > Integer.parseInt(end3.substring(0, 2))) {
            CHECK = 0;
            PrintWriter script = response.getWriter();
            script.println("<script>");
            script.println("alert('시작시간은 종료시간보다 빨라야 합니다.')");
            script.println("history.back()");
            script.println("</script>");
        }
        if (begin4 != "" && Integer.parseInt(begin4.substring(0, 2)) > Integer.parseInt(end4.substring(0, 2))) {
            CHECK = 0;
            PrintWriter script = response.getWriter();
            script.println("<script>");
            script.println("alert('시작시간은 종료시간보다 빨라야 합니다.')");
            script.println("history.back()");
            script.println("</script>");
        }
        if (begin5 != "" && Integer.parseInt(begin5.substring(0, 2)) > Integer.parseInt(end5.substring(0, 2))) {
            CHECK = 0;
            PrintWriter script = response.getWriter();
            script.println("<script>");
            script.println("alert('시작시간은 종료시간보다 빨라야 합니다.')");
            script.println("history.back()");
            script.println("</script>");
        }

        //실제로 있는 교수인지 검사
        ArrayList<Check3> ch3 = userDAO.checkLecturer(lecturer_id);
        if(ch3.size() == 0){
            CHECK = 0;
            PrintWriter script = response.getWriter();
            script.println("<script>");
            script.println("alert('11lecturer_id가 잘못됐습니다.')");
            script.println("history.back()");
            script.println("</script>");
        }
        //수강정원이 교실의 정원을 넘으면 안되는 제약조건을 구현
        int checkOccupancy = userDAO.checkOccupy(Integer.parseInt(person_max), room_id);
        if(checkOccupancy == -1){
            CHECK = 0;
            PrintWriter script = response.getWriter();
            script.println("<script>");
            script.println("alert('해당하는 room_id가 없습니다.')");
            script.println("history.back()");
            script.println("</script>");
        }else if(checkOccupancy == 0){
            CHECK = 0;
            PrintWriter script = response.getWriter();
            script.println("<script>");
            script.println("alert('교실수용가능인원을 초과하였습니다!')");
            script.println("history.back()");
            script.println("</script>");
        }
        //실제로 값을 넣어줌
        //우선 class Table에 넣어줌
        int major_id = userDAO.getMajor_id(lecturer_id);
        int maxTimeId = userDAO.getMaxTimeId();
        if(maxTimeId == 0){
            CHECK = 0;
            PrintWriter script = response.getWriter();
            script.println("<script>");
            script.println("alert('getMaxTimeId error!')");
            script.println("history.back()");
            script.println("</script>");
        }
        //만약 course_id가 현재 table에 있는 값과 같다면 coures_name이 같아야함
        int checkCourseName = userDAO.checkCourseName(course_id, course_name);
        if(checkCourseName == -1){
            CHECK = 0;
            PrintWriter script = response.getWriter();
            script.println("<script>");
            script.println("alert('course_name이 입력한 course_id와 대응되지 않습니다!')");
            script.println("history.back()");
            script.println("</script>");
        }
        //제약조건을 모두 통과한 경우 실제 DB에 값을 넣어줌
        if(CHECK == 1){
            userDAO.insertIntoClass(class_id, class_no, course_id, course_name, major_id, year, credit1, lecturer_id, person_max, room_id);
            //time1 Table에 insert
            if(begin1 != ""){
                userDAO.insertIntoTime1(maxTimeId, class_id, "1", day1, begin1, end1);
            }
            if(begin2 != ""){
                userDAO.insertIntoTime1(maxTimeId + 1, class_id, "2", day2, begin2, end2);
            }
            if(begin3 != ""){
                userDAO.insertIntoTime1(maxTimeId + 2, class_id, "3", day3, begin3, end3);
            }
            if(begin4 != ""){
                userDAO.insertIntoTime1(maxTimeId + 3, class_id, "4", day4, begin4, end4);
            }
            if(begin5 != ""){
                userDAO.insertIntoTime1(maxTimeId + 4, class_id, "5", day5, begin5, end5);
            }
            if(begin6 != ""){
                userDAO.insertIntoTime1(maxTimeId + 6, class_id, "6", day6, begin6, end6);
            }
            if(checkCourseName == 0){//일치하는 과목정보가 없기 때문에 course Table에 새로운 record를 넣어줘야함
                userDAO.updateCourse(course_id, course_name, credit1);
            }
            PrintWriter script = response.getWriter();
            script.println("<script>");
            script.println("alert('과목 설강 완료')");
            script.println("location.href = 'adminCourseCreate.jsp'");//완료하고 이동
            script.println("</script>");
        }
    %>
</body>
</html>
