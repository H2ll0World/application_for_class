<%--
  class, time1, course Table 수정해줘야 함

  제약조건은 room 의 occupancy

  수업을 개설하는 페이지 여기서 사용자로부터 정보를 받아서 adminCourseCreateAction.jsp로 보내줌 실제 처리는 거기서 해줌
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<html>
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
        <form method="post" action="adminCourseCreateAction.jsp">
        <table class="table">
            <thead>
            <tr>
                <th style="text-align: center;">  class_id   </th>
                <th style="text-align: center;">  class_no </th>
                <th style="text-align: center;">  course_id   </th>
                <th style="text-align: center;">  교과목명   </th>
                <th style="text-align: center;">  학년   </th>
                <th style="text-align: center;">  학점   </th>
                <th style="text-align: center;">  lecturer_id   </th>
                <th style="text-align: center;">  person_max   </th>
                <th style="text-align: center;">  room_id   </th>
            </tr>
            </thead>
            <tbody>
                <tr>
                        <td><input type="text" class="form-control" placeholder="class_id" name="class_id" maxlength="15"> </td>
                        <td><input type="text" class="form-control" placeholder="class_no" name="class_no" maxlength="15"> </td>
                        <td><input type="text" class="form-control" placeholder="course_id" name="course_id" maxlength="15"> </td>
                        <td><input type="text" class="form-control" placeholder="교과목명" name="course_name" maxlength="15"> </td>
                        <td>
                            <select name="year">
                                <option value=1>1</option>
                                <option value=2>2</option>
                                <option value=3>3</option>
                                <option value=4>4</option>
                            </select>
                        </td>
                        <td><input type="text" class="form-control" placeholder="학점" name="credit" maxlength="15"> </td>
                        <td><input type="text" class="form-control" placeholder="lecturer_id" name="lecturer_id" maxlength="15"> </td>
                        <td><input type="text" class="form-control" placeholder="수강정원" name="person_max" maxlength="15"> </td>
                        <td><input type="text" class="form-control" placeholder="room_id" name="room_id" maxlength="15"> </td>
                </tr>
            </tbody>
        </table>
        <table class="table">
            <thead>
                <tr>
                    <th style="text-align: center;"> period </th>
                    <th style="text-align: center;">  요일   </th>
                    <th style="text-align: center;"> 시작시간(24시) </th>
                    <th style="text-align: center;"> 종료시간(24시) </th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td style="text-align: center">1</td>
                    <td>
                        <select name="day1">
                            <option value=1>월</option>
                            <option value=2>화</option>
                            <option value=3>수</option>
                            <option value=4>목</option>
                            <option value=5>금</option>
                            <option value=6>토</option>
                        </select>
                    </td>
                    <td style="text-align: center"><input style="text-align: center" type="text" class="form-control" placeholder="00:00" name="begin1" maxlength="15"> </td>
                    <td style="text-align: center"><input style="text-align: center" type="text" class="form-control" placeholder="00:00" name="end1" maxlength="15"> </td>
                </tr>
                <tr>
                    <td style="text-align: center">2</td>
                    <td>
                        <select name="day2">
                            <option value=1>월</option>
                            <option value=2>화</option>
                            <option value=3>수</option>
                            <option value=4>목</option>
                            <option value=5>금</option>
                            <option value=6>토</option>
                        </select>
                    </td>
                    <td style="text-align: center"><input style="text-align: center" type="text" class="form-control" placeholder="00:00" name="begin2" maxlength="15"> </td>
                    <td style="text-align: center"><input style="text-align: center" type="text" class="form-control" placeholder="00:00" name="end2" maxlength="15"> </td>
                </tr>
                <tr>
                    <td style="text-align: center">3</td>
                    <td>
                        <select name="day3">
                            <option value=1>월</option>
                            <option value=2>화</option>
                            <option value=3>수</option>
                            <option value=4>목</option>
                            <option value=5>금</option>
                            <option value=6>토</option>
                        </select>
                    </td>
                    <td style="text-align: center"><input style="text-align: center" type="text" class="form-control" placeholder="00:00" name="begin3" maxlength="15"> </td>
                    <td style="text-align: center"><input style="text-align: center" type="text" class="form-control" placeholder="00:00" name="end3" maxlength="15"> </td>
                </tr>
                <tr>
                    <td style="text-align: center">4</td>
                    <td>
                        <select name="day4">
                            <option value=1>월</option>
                            <option value=2>화</option>
                            <option value=3>수</option>
                            <option value=4>목</option>
                            <option value=5>금</option>
                            <option value=6>토</option>
                        </select>
                    </td>
                    <td style="text-align: center"><input style="text-align: center" type="text" class="form-control" placeholder="00:00" name="begin4" maxlength="15"> </td>
                    <td style="text-align: center"><input style="text-align: center" type="text" class="form-control" placeholder="00:00" name="end4" maxlength="15"> </td>
                </tr>
                <tr>
                    <td style="text-align: center">5</td>
                    <td>
                        <select name="day5">
                            <option value=1>월</option>
                            <option value=2>화</option>
                            <option value=3>수</option>
                            <option value=4>목</option>
                            <option value=5>금</option>
                            <option value=6>토</option>
                        </select>
                    </td>
                    <td style="text-align: center"><input style="text-align: center" type="text" class="form-control" placeholder="00:00" name="begin5" maxlength="15"> </td>
                    <td style="text-align: center"><input style="text-align: center" type="text" class="form-control" placeholder="00:00" name="end5" maxlength="15"> </td>
                </tr>
                <tr>
                    <td style="text-align: center">6</td>
                    <td>
                        <select name="day6">
                            <option value=1>월</option>
                            <option value=2>화</option>
                            <option value=3>수</option>
                            <option value=4>목</option>
                            <option value=5>금</option>
                            <option value=6>토</option>
                        </select>
                    </td>
                    <td style="text-align: center"><input style="text-align: center" type="text" class="form-control" placeholder="00:00" name="begin6" maxlength="15"> </td>
                    <td style="text-align: center"><input style="text-align: center" type="text" class="form-control" placeholder="00:00" name="end6" maxlength="15"> </td>
                </tr>
            </tbody>
        </table>
            <input type="submit" class="btn-outline-primary form-control" value="수업 생성">
        </form>
    </div>
</div>

</body>
</html>
