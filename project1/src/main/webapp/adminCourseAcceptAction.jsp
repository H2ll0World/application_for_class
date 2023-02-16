<%--
  adminCourseAccept.jsp에서 받은 정보를 처리해주는 페이지
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="user.*" %>
<html>
<head>
    <title>수강허용 처리</title>
</head>
<body>
    <%
        String class_Id = request.getParameter("class_id");
        String studentId = request.getParameter("student_id");

        UserDAO userDAO = new UserDAO();
        //수강신청시에 제약조건 확인에 쓰인 userDAO.getInfo2(class_id)를 써줌
        //0을 return 할 경우 수강정원 초과이므로 수강정원 1추가
        //1을 return 할 경우 그냥 수강허용해줌
        int checkPersonNum = userDAO.getInfo2(class_Id);
        ArrayList<Check3> max = userDAO.getPersonMax(class_Id);//해당과목의 최대수강인원을 뽑아냄
        int maxNum = 0;//최대수강인원
        for(int i = 0; i < max.size(); i++){
            maxNum = max.get(i).getCredits();
        }
        if(checkPersonNum == 0){//수강정원이 다 찬경우
            userDAO.increaseMax(class_Id, maxNum);//수강정원 1늘려줌
        } else if (checkPersonNum == 1) {//수강가능인원이 남아있는 경우
        }else{//해당하는 class_id가 없는경우
            PrintWriter script = response.getWriter();
            script.println("<script>");
            script.println("alert('해당하는 class_ID 를 가진 과목이 없습니다')");
            script.println("history.back()");
            script.println("</script>");
        }
        //해당하는 student_id를 가진 학생이 있는지 확인
        ArrayList<Student> checkStudent = userDAO.StudentIdCheck(studentId);
        if(checkStudent.size() == 0) {//해당하는 student_id를 가진 학생이 없는 경우
            PrintWriter script = response.getWriter();
            script.println("<script>");
            script.println("alert('해당하는 student_id 를 가진 학생이 없습니다')");
            script.println("history.back()");
            script.println("</script>");
        }

        //겹치는 시간이 있는지 확인
        //현재 수강중인 시간표 뽑아냄 뒤에 현재 수강신청하고자 하는 과목과 시간비교
        ArrayList<TimeTable> tlist= userDAO.getTimetable(studentId);
        int[][] timeTable = new int[5][49];
        for(int i = 0 ; i < tlist.size(); i++){
            if(tlist.get(i).getStart() != "NO"){
                String start = tlist.get(i).getStart();
                String end = tlist.get(i).getEnd();
                String c_id = tlist.get(i).getClass_id();
                String start1 = start.substring(9,10) + start.substring(11,13) + start.substring(14,16);
                String end1 = end.substring(9,10) + end.substring(11,13) + end.substring(14,16);
                int day = start1.charAt(0);
                day = day -49;//char과 int의 차이 만큼 빼줌
                int stime = Integer.parseInt(start1.substring(1));
                int etime = Integer.parseInt(end1.substring(1));
                int classId = Integer.parseInt(c_id);

                if(stime >= 1800 || day == 6) {//6시넘거나 토요일인 경우 사이버 강의이므로 시간이 상관x
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
        int result4 = userDAO.timeCheck(timeTable, class_Id);
        if(result4 == 1){//겹치는 시간이 있는 경우
            PrintWriter script = response.getWriter();
            script.println("<script>");
            script.println("alert('동일 시간대에 수강중인 강의가 있습니다.')");
            script.println("history.back()");
            script.println("</script>");
        }
        //이제 넣어 //학생의 수강신청(course_register.jsp)의 코드 재활용

        //credits Table에 수강정보를 넣어줌
        ArrayList<Check3> maxIdList = userDAO.maxCreditsId();//credits에서 id가 primary key이므로 새로운 record를 만들때 1을 더해서 넣어주면 중복되는 게 없음
        int maxId = -1;
        for(int i = 0; i < maxIdList.size(); i++){
            maxId = maxIdList.get(i).getCredits();
        }
        if(maxId == -1){//max_id를 가져오지 못한 경우
            PrintWriter script = response.getWriter();
            script.println("<script>");
            script.println("alert('adminCourseAcceptAction maxId error!')");
            script.println("history.back()");
            script.println("</script>");
        }
        //여기까진 됨
        ArrayList<Check3> personCur = userDAO.getPersonCur(class_Id);//해당하는 수업의 현재수강인원을 가져옴
        int person_cur = -2;
        for(int i = 0; i < personCur.size(); i++){
            person_cur = personCur.get(i).getCredits();
        }
        if(person_cur == -1){//현재수강인원을 가져오는데 오류가남
            PrintWriter script = response.getWriter();
            script.println("<script>");
            script.println("alert('person_cur error1')");
            script.println("history.back()");
            script.println("</script>");
        }
        ArrayList<Student> course_ID = userDAO.getCourseId(class_Id);
        String CourseId = null;
        for(int i = 0; i < course_ID.size(); i++){
            CourseId = course_ID.get(i).getStudent_id();
        }
        userDAO.insertIntoCredits(studentId, CourseId, class_Id, maxId);//해당하는 학생의 수업정보를 넣어줌
        //class Table의 person_cur에 1을 더해줌
        userDAO.updatePerson_cur(class_Id, person_cur);
        if(true){
            PrintWriter script = response.getWriter();
            script.println("<script>");
            script.println("alert('수강허용 완료!')");
            script.println("location.href = 'adminCourseAccept.jsp'");
            script.println("</script>");
        }
    %>

</body>
</html>
