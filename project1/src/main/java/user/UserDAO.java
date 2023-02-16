package user;


import java.sql.*;
import java.util.ArrayList;
import java.io.PrintWriter;

public class UserDAO {
    private Connection conn;
    private PreparedStatement pstmt;
    private ResultSet rs;

    public UserDAO()
    {
        try{
            String dbURL = "jdbc:mysql://localhost:3307/DB2018009216?serverTimezone=Asia/Seoul";
            String dbID = "root";
            String dbPassword = "chlgusdyd1";
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
        } catch (Exception e){
            e.printStackTrace();
        }
    }
    //이거 안씀
    public int login(String userID, String userPassword)
    {
        String SQL = "SELECT userPassword FROM USER WHERE userID = ?";
        try{

            pstmt = conn.prepareStatement(SQL);
            pstmt.setString(1, userID);
            rs = pstmt.executeQuery();
            if(rs.next())
            {
                if(rs.getString(1).equals(userPassword))
                {
                    return 1; //로그인 성공
                }
                else
                {
                    return 0; //비밀번호 불일치
                }
            }
            return -1; // 아이디가 없음
        } catch (Exception e) {
            e.printStackTrace();
        }
        return -2; // 데이터베이스 오류
    }
    //학번으로 로그//학번이 id로 주어졌을때 이에 맞는 pw를 리턴
    public int studentLogin(String studentID, String pw)
    {
        String SQL = "SELECT password FROM STUDENT WHERE student_id = ?";
        try{
            pstmt = conn.prepareStatement(SQL);
            pstmt.setString(1, studentID);
            rs = pstmt.executeQuery();

            //관리자 로그인
            if(studentID.equals("admin")) {
                if (pw.equals("admin")) {
                    return 5;//관리자 로그인
                }else{
                    return 0;//비밀번호 불일치
                }
            }

            if(rs.next())
            {
                if(rs.getString(1).equals(pw))
                {
                    return 1; //로그인 성공
                }
                else
                {
                    return 0; //비밀번호 불일치
                }
            }
            return -1; // 아이디가 없음
        } catch (Exception e) {
            e.printStackTrace();
        }
        return -2; // 데이터베이스 오류
    }

    //안씀
    public int join(User user)
    {
    	String SQL = "INSERT INTO USER VALUES (?, ?, ?, ?, ?)";
    	try
    	{
    		pstmt = conn.prepareStatement(SQL);
    		pstmt.setString(1, user.getUserID());
    		pstmt.setString(2, user.getUserPassword());
    		pstmt.setString(3, user.getUserName());
    		pstmt.setString(4, user.getUserGender());
    		pstmt.setString(5, user.getUserEmail());
    		return pstmt.executeUpdate();
    	} catch (Exception e) {
    		e.printStackTrace();
    	}
    	return -1; // 데이터베이스 오류
    }
    //안씀
    public ArrayList<User> showAll()//모든 사용자 정보//안씀
    {
        String SQL = "SELECT *  FROM USER";
        ArrayList<User> studentList = new ArrayList<User>();
        try
        {
            pstmt = conn.prepareStatement(SQL);
            rs = pstmt.executeQuery();

            while(rs.next())
            {
                User user = new User();
                user.setUserID(rs.getString(1));
                user.setUserPassword(rs.getString(2));
                user.setUserName(rs.getString(3));
                user.setUserGender(rs.getString(4));
                user.setUserEmail(rs.getString(5));
                studentList.add(user);
            }

        } catch (Exception e)
        {
            e.printStackTrace();
        }
        return studentList;
    }

    //수강편람
    //교과목만 입력한 경우 //like로 키워드검색 구현 해당하는 모든 과목정보를 내보내줌
    public ArrayList<c_user> search_courseName(String _course_name){
        String SQL = "select class.class_id, class.class_no, class.course_id, class.name, lecturer.name, class.person_cur, class.person_max, building.name, room.room_id, class.opened\n" +
                "from class, lecturer, room, building\n" +
                "where class.lecturer_id = lecturer.lecturer_id and class.room_id = room.room_id and room.building_id = building.building_id and class.name LIKE ?\n" +
                "order by class.class_id asc";
        ArrayList<c_user> list = new ArrayList<c_user>();
        try{
            pstmt = conn.prepareStatement(SQL);
            pstmt.setString(1, "%"+_course_name+"%");
            rs = pstmt.executeQuery();

            while(rs.next()){
                c_user user = new c_user();
                user.setClass_id(rs.getString(1));
                user.setClass_no(rs.getString(2));
                user.setCourse_id(rs.getString(3));
                user.setC_name(rs.getString(4));
                user.setLecturer(rs.getString(5));
                user.setCur(rs.getInt(6));
                user.setMax(rs.getInt(7));
                user.setBuilding(rs.getString(8));
                user.setRoom_id(rs.getInt(9));
                user.setYear(rs.getInt(10));
                list.add(user);
            }
        }catch (Exception e){
            e.printStackTrace();
        }
        return list;
    }
    //class_no으로 검색한 경우//해당하는 모든 과목정보를 내보내줌
    public ArrayList<c_user> search_courseClassNo(String _class_no, String _course_name){
        String SQL = "SELECT class.class_id, class.class_no, class.course_id, class.name, lecturer.name, class.person_cur, class.person_max, building.name, room.room_id, class.opened\n" +
                "FROM class, lecturer, room, building\n" +
                "WHERE class.lecturer_id = lecturer.lecturer_id and class.room_id = room.room_id and room.building_id = building.building_id and class.name LIKE ? and class.class_no = ?\n" +
                "order by class.class_id asc";
        ArrayList<c_user> list = new ArrayList<c_user>();
        try{
            pstmt = conn.prepareStatement(SQL);
            pstmt.setString(1, "%"+_course_name+"%");
            pstmt.setInt(2, Integer.parseInt(_class_no));
            rs = pstmt.executeQuery();

            while(rs.next()){
                c_user user = new c_user();
                user.setClass_id(rs.getString(1));
                user.setClass_no(rs.getString(2));
                user.setCourse_id(rs.getString(3));
                user.setC_name(rs.getString(4));
                user.setLecturer(rs.getString(5));
                user.setCur(rs.getInt(6));
                user.setMax(rs.getInt(7));
                user.setBuilding(rs.getString(8));
                user.setRoom_id(rs.getInt(9));
                user.setYear(rs.getInt(10));
                list.add(user);
            }
        }catch (Exception e){
            e.printStackTrace();
        }
        return list;
    }
    //course_id로 검색한 경우//해당하는 모든 과목정보를 내보내줌
    public ArrayList<c_user> search_courseCourseId(String _course_id, String _course_name){
        String SQL = "select class.class_id, class.class_no, class.course_id, class.name, lecturer.name, class.person_cur, class.person_max, building.name, room.room_id, class.opened\n" +
                "from class, lecturer, room, building\n" +
                "where class.lecturer_id = lecturer.lecturer_id and class.room_id = room.room_id and room.building_id = building.building_id and class.name LIKE ? and class.course_id = ?\n" +
                "order by class.class_id asc";
        ArrayList<c_user> list = new ArrayList<c_user>();
        try{
            pstmt = conn.prepareStatement(SQL);
            pstmt.setString(1, "%"+_course_name+"%");
            pstmt.setString(2, _course_id);
            rs = pstmt.executeQuery();

            while(rs.next()){
                c_user user = new c_user();
                user.setClass_id(rs.getString(1));
                user.setClass_no(rs.getString(2));
                user.setCourse_id(rs.getString(3));
                user.setC_name(rs.getString(4));
                user.setLecturer(rs.getString(5));
                user.setCur(rs.getInt(6));
                user.setMax(rs.getInt(7));
                user.setBuilding(rs.getString(8));
                user.setRoom_id(rs.getInt(9));
                user.setYear(rs.getInt(10));
                list.add(user);
            }
        }catch (Exception e){
            e.printStackTrace();
        }
        return list;
    }
    //class_id, course_id 둘다 사용한 경우
    public ArrayList<c_user> search_course(String _class_no, String _course_id, String _course_name)//모든 사용자 정보
    {
        String SQL = "select class.class_id, class.class_no, class.course_id, class.name, lecturer.name, class.person_cur, class.person_max, building.name, room.room_id, class.opened\n" +
                "from class , lecturer, room, building\n" +
                "where class.lecturer_id = lecturer.lecturer_id and room.room_id = class.room_id and room.building_id = building.building_id and class.class_no = ? and class.course_id = ? and class.name LIKE ?\n" +
                "order by class.class_id asc";
        ArrayList<c_user> List = new ArrayList<c_user>();
        try
        {
            pstmt = conn.prepareStatement(SQL);
            pstmt.setString(1,_class_no);
            pstmt.setString(2,_course_id);
            pstmt.setString(3,"%"+_course_name+"%");
            rs = pstmt.executeQuery();

            while(rs.next())
            {
                c_user user = new c_user();
                user.setClass_id(rs.getString(1));
                user.setClass_no(rs.getString(2));
                user.setCourse_id(rs.getString(3));
                user.setC_name(rs.getString(4));
                user.setLecturer(rs.getString(5));
                user.setCur(rs.getInt(6));
                user.setMax(rs.getInt(7));
                user.setBuilding(rs.getString(8));
                user.setRoom_id(rs.getInt(9));
                user.setYear(rs.getInt(10));
                List.add(user);
            }

        } catch (Exception e)
        {
            e.printStackTrace();
        }
        return List;
    }

    //학생이 해당 과목을 수강한 적이 있는지 확인
    public int checkCredits(String _student_id, String _course_id){
        String SQL = "SELECT credits_id FROM year < 2022 and credits WHERE course_id = ? and student_id = ?";
        try{
            pstmt = conn.prepareStatement(SQL);
            pstmt.setString(1, _course_id);
            pstmt.setInt(2, Integer.parseInt(_student_id));
            rs = pstmt.executeQuery();

            if(rs.next()){
                int result = rs.getInt(1);
                return result;
            }
        }catch (Exception e){
            e.printStackTrace();
        }
        return 0;
    }


    //class_no이 주어졌을때 class_id를 불러옴
    public ArrayList<Check1> getClassId(String _class_no){
        String SQL ="SELECT class_id FROM class WHERE class_no = ? and opened = 2022";
        ArrayList<Check1> list = new ArrayList<Check1>();
        try{
            pstmt = conn.prepareStatement(SQL);
            pstmt.setInt(1, Integer.parseInt(_class_no));
            rs = pstmt.executeQuery();

            while(rs.next()){
                Check1 ch3 = new Check1();
                ch3.setYear(rs.getInt(1));
                list.add(ch3);
            }
        }catch (Exception e){
            e.printStackTrace();
        }
        return list;
    }


    //class_id가 주어졌을 때 time을 가지고 옴
    public ArrayList<TimeTable> timeTablesList(String _class_id){
        String SQL = "SELECT begin, end FROM time1 WHERE class_id = ?";
        ArrayList<TimeTable> list = new ArrayList<TimeTable>();
        try{
            pstmt = conn.prepareStatement(SQL);
            pstmt.setInt(1, Integer.parseInt(_class_id));
            rs = pstmt.executeQuery();

            while(rs.next()){
                TimeTable time = new TimeTable();
                time.setStart(rs.getString(1));
                time.setEnd(rs.getString(2));
                list.add(time);
            }
        }catch (Exception e){
            e.printStackTrace();
        }
        return list;
    }

    //희망강좌(장바구니)구현
    //wishList Table에 값을 넣어줌
    public void setWishList(String _student_id, String _class_id){
        String SQL = "INSERT INTO wishList(student_id, class_id) VALUES(?, ?)";
        try{
            pstmt = conn.prepareStatement(SQL);
            pstmt.setInt(1, Integer.parseInt(_student_id));
            pstmt.setInt(2, Integer.parseInt(_class_id));
            pstmt.executeUpdate();
        }catch (Exception e){
            e.printStackTrace();
        }
    }

    //희망강좌를 가져옴
    public ArrayList<c_user> getWishList(String _student_id){
        String SQL = "SELECT class.class_id, class.class_no, class.course_id, class.name, class.credit, lecturer.name, class.person_cur, class.person_max, building.name, room.room_id\n" +
                "FROM wishList, class, lecturer, room, building\n" +
                "WHERE wishList.class_id = class.class_id and class.lecturer_id = lecturer.lecturer_id and class.room_id = room.room_id and room.building_id = building.building_id and wishList.student_id = ?";
        ArrayList<c_user> list = new ArrayList<c_user>();
        try{
            pstmt = conn.prepareStatement(SQL);
            pstmt.setInt(1, Integer.parseInt(_student_id));
            rs = pstmt.executeQuery();

            while(rs.next()){
                c_user user = new c_user();
                user.setClass_id(rs.getString(1));
                user.setClass_no(rs.getString(2));
                user.setCourse_id(rs.getString(3));
                user.setC_name(rs.getString(4));
                user.setCredit(rs.getInt(5));
                user.setLecturer(rs.getString(6));
                user.setCur(rs.getInt(7));
                user.setMax(rs.getInt(8));
                user.setBuilding(rs.getString(9));
                user.setRoom_id(rs.getInt(10));
                list.add(user);
            }
        }catch (Exception e){
            e.printStackTrace();
        }
        return list;
    }
    //희망수업 삭제
    public void deleteWishList(String _student_id, String _class_id){
        String SQL = "DELETE FROM wishList WHERE student_id = ? and class_id = ?";
        try{
            pstmt = conn.prepareStatement(SQL);
            pstmt.setInt(1, Integer.parseInt(_student_id));
            pstmt.setInt(2, Integer.parseInt(_class_id));
            pstmt.executeUpdate();
        }catch (Exception e){
            e.printStackTrace();
        }
    }



    //수강신청시 제약조건 검사를 위해 갖고옴 //credits 빼고 grade은 따로 갖고옴
    public ArrayList<Check1> getInfo1(String _student_id, String _course_id){//학점제한조건
        String SQL = "SELECT grade_num, year\n" +
                "FROM credits\n" +
                "WHERE student_id = ? and course_id = ?";
        ArrayList<Check1> list = new ArrayList<Check1>();
        try{
            pstmt = conn.prepareStatement(SQL);
            pstmt.setString(1, _student_id);
            pstmt.setString(2,_course_id);
            rs = pstmt.executeQuery();

            while(rs.next()){
                Check1 check = new Check1();
                check.setGrade_num(rs.getDouble(1));
                check.setYear(rs.getInt(2));
                list.add(check);
            }
        } catch (Exception e){
            e.printStackTrace();
        }
        return list;
    }
    //정원제한
    public int getInfo2(String _class_id){
        String SQL = "select person_max, person_cur\n" +
                "from class\n" +
                "where class_id = ?";
        try{
            pstmt = conn.prepareStatement(SQL);
            pstmt.setInt(1,Integer.parseInt(_class_id));
            rs = pstmt.executeQuery();
            if(rs.next()){
                if(rs.getInt(1) > rs.getInt(2)){
                    return 1;//자리가 남는 경우
                }else{
                    return 0;//자리 x
                }
            }
        }catch (Exception e){
            e.printStackTrace();
        }
        return -1;//error
    }

    //getInfo3 은 최대 18학점을 넘을수 없는 제약조건을 구현
    //getInfo3_3 + getInfo3_4 = 이미 신청한 학점 + 신청할 수업의 학점

    //지금까지 수강신청한 강좌들의 학점합을 리턴
    public ArrayList<Check3> getInfo3_3(String _student_id){
        String SQL = "SELECT SUM(course.credit)\n" +
                "FROM credits join course on credits.course_id = course.course_id\n" +
                "WHERE year = 2022 and credits.student_id = ?";
        ArrayList<Check3> list3 = new ArrayList<Check3>();
        try{
            pstmt = conn.prepareStatement(SQL);
            pstmt.setInt(1, Integer.parseInt(_student_id));
            rs = pstmt.executeQuery();

            while(rs.next()){
                Check3 ch3 = new Check3();
                ch3.setCredits(rs.getInt(1));
                list3.add(ch3);
            }
        }catch (Exception e){
            e.printStackTrace();
        }
        return list3;
    }
    //수강신청할 과목의 학점을 리턴
    public ArrayList<Check3> getInfo3_4(String classId){
        String SQL = "SELECT course.credit\n" +
                "FROM class JOIN course ON class.course_id = course.course_id\n" +
                "WHERE class_id = ?";
        ArrayList<Check3> list3_4 = new ArrayList<Check3>();
        try {
            pstmt = conn.prepareStatement(SQL);
            pstmt.setInt(1, Integer.parseInt(classId));
            rs = pstmt.executeQuery();

            while (rs.next()) {
                Check3 ch3_4 = new Check3();
                ch3_4.setCredits(rs.getInt(1));
                list3_4.add(ch3_4);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list3_4;
    }
    /*
    public ArrayList<Check3> getInfo3(String _student_id){//이미 신청한 수업의 학점 리턴
        String SQL = "SELECT course.credit\n" +
                "FROM student join credits on student.student_id = credits.student_id, course\n" +
                "WHERE credits.course_id = course.course_id and credits.year = 2022 and student.student_id = ?";
        ArrayList<Check3> list3 = new ArrayList<Check3>();
        try{
            pstmt = conn.prepareStatement(SQL);
            pstmt.setString(1, _student_id);
            rs = pstmt.executeQuery();
            while(rs.next()){
                Check3 ch3 = new Check3();
                ch3.setCredits(rs.getInt(1));
                list3.add(ch3);
            }
        } catch (Exception e){
            e.printStackTrace();
        }
        return list3;
    }
    public ArrayList<Check3> getInfo3_1(String _class_id){//신청할 수업의 학점 리턴
        String SQL = "SELECT course.credit\n" +
                "FROM class join course on class.course_id = course.course_id\n" +
                "WHERE class.class_id = ?";
        ArrayList<Check3> list3_1 = new ArrayList<Check3>();
        try{
            pstmt = conn.prepareStatement(SQL);
            pstmt.setInt(1, Integer.parseInt(_class_id));
            rs = pstmt.executeQuery(SQL);

            while(rs.next()){
                Check3 check3 = new Check3();
                check3.setCredits(rs.getInt(1));
                list3_1.add(check3);
            }
        }catch (Exception e){
            e.printStackTrace();
        }
        return list3_1;
    }
     */

    //시간표를 만들기 위해 시간정보를 불러옴
    public ArrayList<TimeTable> getTimetable(String _student_id){
        String SQL = "SELECT time1.begin, time1.end, credits.class_id\n" +
                "FROM credits, time1\n" +
                "WHERE credits.class_id = time1.class_id and time1.begin != 'NO' and credits.student_id = ?";

        ArrayList<TimeTable> list = new ArrayList<TimeTable>();

        try{
            pstmt = conn.prepareStatement(SQL);
            pstmt.setInt(1, Integer.parseInt(_student_id));
            rs = pstmt.executeQuery();

            while(rs.next()) {
                TimeTable time = new TimeTable();
                time.setStart(rs.getString(1));
                time.setEnd(rs.getString(2));
                time.setClass_id(rs.getString(3));
                list.add(time);
            }
        }catch (Exception e){
            e.printStackTrace();
        }
        return list;
    }

    //class_id가 주어졌을 때 그 과목의 이름을 return
    public String getClassName(int _class_id){
        String SQL = "SELECT class.name\n" +
                "FROM class\n" +
                "WHERE class.class_id = ?";
        String result = "";
        try{
            pstmt = conn.prepareStatement(SQL);
            pstmt.setInt(1, _class_id);
            rs = pstmt.executeQuery();

            while(rs.next()){
                result = rs.getString(1);
            }
        }catch (Exception e){
            e.printStackTrace();
        }
        return result;
    }
    //시간표와 수강하고자하는 수업id가 주어졌을 때 시간이 겹치는지 확인
    public int timeCheck(int[][] _timeTable, String _class_id){
        String SQL = "SELECT begin, end\n" +
                "FROM time1\n" +
                "WHERE time1.class_id = ?";
        try{
            pstmt = conn.prepareStatement(SQL);
            pstmt.setInt(1,Integer.parseInt(_class_id));
            rs = pstmt.executeQuery();

            while(rs.next()){
                String start = rs.getString(1);
                String end = rs.getString(2);
                int day = start.charAt(9);
                day = day -49;
                int stime = Integer.parseInt(start.substring(11,13) + start.substring(14,16));
                int etime = Integer.parseInt(end.substring(11,13) + end.substring(14,16));

                if(stime >= 1800 || day == 6) {//6시넘거나 토요일인 경우
                    continue;
                }else{//평일 and 오후6시 이전에 시작
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
                        if(_timeTable[day][j] != 0){
                            return 1;//시간겹치는게 있음
                        }
                    }
                }
            }
        } catch (Exception e){
            e.printStackTrace();
        }
        return 0;//시간겹치는거x
    }

    //제약조건은 위의 메소드에서 검사
    //수강신청을 위해선 class의 person_cur 과 credits에 추가해주면 됨

    //check3 재활용
    public ArrayList<Check3> maxCreditsId(){
        String SQL = "SELECT MAX(credits_id) FROM credits";
        ArrayList<Check3> maxId = new ArrayList<Check3>();
        try{
            pstmt = conn.prepareStatement(SQL);
            rs = pstmt.executeQuery();

            while (rs.next()){
                Check3 id = new Check3();
                id.setCredits(rs.getInt(1));
                maxId.add(id);
            }
        }catch (Exception e){
            e.printStackTrace();
        }
        return maxId;
    }
    //insertIntoCredits은 credits table에 수강신청 정보를 넣어줌
    public void insertIntoCredits(String _student_id,String _course_id, String _class_id, int maxId) {
        String SQL = "INSERT INTO credits(credits_id, student_id, course_id, credits.year, grade, grade_num, class_id)\n" +
                "VALUES(?, ?, ?, ?, ?, ?, ?)";
        try {
            pstmt = conn.prepareStatement(SQL);
            pstmt.setInt(1, maxId + 1);
            pstmt.setInt(2, Integer.parseInt(_student_id));
            pstmt.setString(3, _course_id);
            pstmt.setInt(4, 2022);
            pstmt.setString(5,"N");
            pstmt.setDouble(6, -1.0);
            pstmt.setInt(7,Integer.parseInt(_class_id));
            pstmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    //'8833','10005','CIE3033','건설경제학','1900-01-04T02:00:00.000Z','1900-01-04T03:30:00.000Z'
    //'8833','10005','CIE3033','건설경제학','1900-01-05T01:30:00.000Z','1900-01-05T03:00:00.000Z'

    //class의 person_cur 현재 수강중인 인원을 구해줌
    public ArrayList<Check3> getPersonCur(String _class_id){
        String SQL = "SELECT person_cur FROM class WHERE class_id = ?";
        ArrayList<Check3> person_cur = new ArrayList<Check3>();
        try{
            pstmt = conn.prepareStatement(SQL);
            pstmt.setInt(1,Integer.parseInt(_class_id));
            rs = pstmt.executeQuery();

            while(rs.next()){
                Check3 cur = new Check3();
                cur.setCredits(rs.getInt(1));
                person_cur.add(cur);
            }
        } catch (Exception e){
            e.printStackTrace();
        }
        return person_cur;
    }

    //이 메서드는 class Table의 person_cur 을 1 늘려줌
    public void updatePerson_cur(String _class_id, int _person_cur){
        String SQL = "UPDATE class\n" +
                "SET person_cur = 1 + ?\n" +
                "WHERE class_id = ?";
        try{
            pstmt = conn.prepareStatement(SQL);
            pstmt.setInt(1, _person_cur);
            pstmt.setInt(2, Integer.parseInt(_class_id));
            pstmt.executeUpdate();
        }catch (Exception e){
            e.printStackTrace();
        }
    }

    //현재 수강중인 강좌정보를 불러옴
    public ArrayList<c_user> courseList(String _student_id){
        String SQL = "select class.class_id, class.course_id, class.name, class.credit, class.person_cur, class.person_max, lecturer.name, building.name, room.room_id, class.class_no\n" +
            "from credits join class on credits.class_id = class.class_id, room, building, lecturer\n" +
            "where credits.year = 2022 and credits.student_id = ? and class.room_id = room.room_id and room.building_id = building.building_id and lecturer.lecturer_id = class.lecturer_id";

        ArrayList<c_user> list = new ArrayList<c_user>();
        try{
            pstmt = conn.prepareStatement(SQL);
            pstmt.setInt(1, Integer.parseInt(_student_id));
            rs = pstmt.executeQuery();

            while(rs.next()){
                c_user course = new c_user();
                course.setClass_id(rs.getString(1));
                course.setCourse_id(rs.getString(2));
                course.setC_name(rs.getString(3));
                course.setPeriod(rs.getInt(4));//period에 학점 집어넣음ㅊ
                course.setCur(rs.getInt(5));
                course.setMax(rs.getInt(6));
                course.setLecturer(rs.getString(7));
                course.setBuilding(rs.getString(8));
                course.setRoom_id(rs.getInt(9));
                course.setClass_no(rs.getString(10));
                list.add(course);
            }
        }catch (Exception e){
            e.printStackTrace();
        }
        return list;
    }
    //수강신청 취소 메서드

    //credits Table의 수강중인 강좌를 제거
    public void deleteCredits(String _student_id, String _class_id){
        String SQL = "DELETE FROM credits WHERE student_id = ? and class_id = ?";
        try{
            pstmt = conn.prepareStatement(SQL);
            pstmt.setInt(1,Integer.parseInt(_student_id));
            pstmt.setInt(2,Integer.parseInt(_class_id));
            pstmt.executeUpdate();
        } catch (Exception e){
            e.printStackTrace();
        }
    }
    //class Table의 현재 수강중인 인원을 감소시킴
    public void decrementPerson_cur(String _class_id, int _person_cur){
        String SQL = "UPDATE class\n" +
                "SET person_cur = ? - 1\n" +
                "WHERE class_id = ?";
        try{
            pstmt = conn.prepareStatement(SQL);
            pstmt.setInt(1, _person_cur);
            pstmt.setInt(2, Integer.parseInt(_class_id));
            pstmt.executeUpdate();
        }catch (Exception e){
            e.printStackTrace();
        }
    }

    //관리자 페이지에서 사용할 함수 정의
    //학생 성적조회 메서드
    public ArrayList<adminStudentCredit> getCredits(String _student_id){
        String SQL = "select credits.class_id, credits.course_id, course.name, credits.grade, year \n" +
                "from credits join course on credits.course_id = course.course_id \n" +
                "where credits.student_id = ? and credits.year < 2022 \n" +
                "order by year desc";
        ArrayList<adminStudentCredit> creditsList = new ArrayList<adminStudentCredit>();
        try{
            pstmt = conn.prepareStatement(SQL);
            pstmt.setInt(1,Integer.parseInt(_student_id));
            rs = pstmt.executeQuery();

            while(rs.next()){
                adminStudentCredit credits = new adminStudentCredit();
                credits.setClass_id(rs.getInt(1));
                credits.setCourse_id(rs.getString(2));
                credits.setCourse_name(rs.getString(3));
                credits.setGrade(rs.getString(4));
                credits.setYear(rs.getInt(5));
                creditsList.add(credits);
            }
        }catch (Exception e){
            e.printStackTrace();
        }
        return creditsList;
    }
    //연도별 평균 학점을 리턴함
    public ArrayList<Check1> getCreditsYear(String _student_id){
        String SQL = "SELECT year, sum(grade_num * credit) / sum(credit)\n" +
                "FROM credits join course on credits.course_id = course.course_id\n" +
                "WHERE student_id = ? and year < 2022 GROUP BY year;";
        ArrayList<Check1> list = new ArrayList<Check1>();
        try{
            pstmt = conn.prepareStatement(SQL);
            pstmt.setInt(1, Integer.parseInt(_student_id));
            rs = pstmt.executeQuery();

            while(rs.next()){
                Check1 ch1 = new Check1();
                ch1.setYear(rs.getInt(1));
                ch1.setGrade_num(rs.getDouble(2));
                list.add(ch1);
            }
        }catch (Exception e){
            e.printStackTrace();
        }
        return list;
    }
    //전체 학점 평균을 리턴함
    public double getCreditsAll(String _student_id){
        String SQL = "SELECT sum(grade_num * credit) / sum(credit)\n" +
                "FROM credits join course on credits.course_id = course.course_id\n" +
                "WHERE student_id = ? and year < 2022";
        try{
            pstmt = conn.prepareStatement(SQL);
            pstmt.setInt(1, Integer.parseInt(_student_id));
            rs = pstmt.executeQuery();

            while(rs.next()){
                Check1 ch1 = new Check1();
                return rs.getDouble(1);
            }
        }catch (Exception e){
            e.printStackTrace();
        }
        return 0;
    }


    //지도교수 정보를 리턴함
    public ArrayList<Lecturer> lecturers(String _student_id){
        String SQL = "select lecturer.lecturer_id, lecturer.name, major.major_id, major.name\n" +
                "from student join lecturer on student.lecturer_id = lecturer.lecturer_id, major\n" +
                "where lecturer.major_id = major.major_id and student.student_id = ?";
        ArrayList<Lecturer> list = new ArrayList<Lecturer>();

        try{
            pstmt = conn.prepareStatement(SQL);
            pstmt.setInt(1, Integer.parseInt(_student_id));
            rs = pstmt.executeQuery();

            while(rs.next()){
                Lecturer lec = new Lecturer();
                lec.setLecturer_id(rs.getInt(1));
                lec.setName(rs.getString(2));
                lec.setMajor_id(rs.getInt(3));
                lec.setDept_name(rs.getString(4));
                list.add(lec);
            }
        }catch (Exception e){
            e.printStackTrace();
        }
        return list;
    }
    //학생 상태정보(재학, 휴학, 자퇴) + 정보를 불러옴
    public ArrayList<StudentInfo> getStudentInfo(String _student_id){
        String SQL = "select student.state, student.student_id, student.name, student.sex, major.name, student.year, lecturer.name\n" +
                "from student join lecturer on student.lecturer_id = lecturer.lecturer_id, major\n" +
                "where lecturer.major_id = major.major_id and student.student_id = ?;";
        ArrayList<StudentInfo> list = new ArrayList<StudentInfo>();

        try{
            pstmt = conn.prepareStatement(SQL);
            pstmt.setInt(1, Integer.parseInt(_student_id));
            rs = pstmt.executeQuery();

            while(rs.next()){
                StudentInfo info = new StudentInfo();
                info.setState(rs.getInt(1));
                info.setStudent_id(rs.getInt(2));
                info.setName(rs.getString(3));
                info.setSex(rs.getString(4));
                info.setDept(rs.getString(5));
                info.setYear(rs.getInt(6));
                info.setLecturer(rs.getString(7));
                list.add(info);
            }
        }catch (Exception e){
            e.printStackTrace();
        }
        return list;
    }
    //학생상태정보(재학, 휴학, 자퇴)를 업데이트 해줌
    public void updateState(String _student_id, int _state){
        String SQL = "UPDATE student SET state = ? WHERE student_id = ?";

        try{
            pstmt = conn.prepareStatement(SQL);
            pstmt.setInt(1,_state);
            pstmt.setInt(2,Integer.parseInt(_student_id));
            pstmt.executeUpdate();
        }catch (Exception e){
            e.printStackTrace();
        }
    }
    //해당 학생이 수강하는 모든 수업의 class_id를 리턴함
    public ArrayList<Check3> getAllClassId(String _student_id){
        String SQL = "SELECT class_id FROM credits WHERE year = 2022 and student_id = ?";
        ArrayList<Check3> list = new ArrayList<Check3>();

        try{
            pstmt = conn.prepareStatement(SQL);
            pstmt.setInt(1, Integer.parseInt(_student_id));
            rs = pstmt.executeQuery();

            while(rs.next()){
                Check3 ch = new Check3();
                ch.setCredits(rs.getInt(1));
                list.add(ch);
            }
        }catch (Exception e){
            e.printStackTrace();
        }
        return list;
    }

    //관리자의 과목 정보 조회 및 변경에 관련된 메소드

    //해당하는 수업의 최대수강인원을 리턴
    public ArrayList<Check3> getPersonMax(String _class_id){
        String SQL = "SELECT person_max FROM class WHERE class_id = ?";
        ArrayList<Check3> person_max = new ArrayList<Check3>();
        try{
            pstmt = conn.prepareStatement(SQL);
            pstmt.setInt(1,Integer.parseInt(_class_id));
            rs = pstmt.executeQuery();

            while(rs.next()){
                Check3 cur = new Check3();
                cur.setCredits(rs.getInt(1));
                person_max.add(cur);
            }
        } catch (Exception e){
            e.printStackTrace();
        }
        return person_max;
    }
    //수강인원을 num만큼 증가시켜줌
    public void increaseMax(String _class_id, int num){
        String SQL = "UPDATE class SET person_max = ? WHERE class_id = ?";
        try{
            pstmt = conn.prepareStatement(SQL);
            pstmt.setInt(1, num + 1);
            pstmt.setInt(2, Integer.parseInt(_class_id));
            pstmt.executeUpdate();
        }catch (Exception e){
            e.printStackTrace();
        }
    }
    //해당 class_id에 해당하는 course_id를 리턴함
    public ArrayList<Student> getCourseId(String _class_id){
        String SQL = "SELECT course_id FROM class WHERE class_id = ?";
        ArrayList<Student> list = new ArrayList<Student>();

        try{
            pstmt = conn.prepareStatement(SQL);
            pstmt.setInt(1, Integer.parseInt(_class_id));
            rs = pstmt.executeQuery();

            while(rs.next()){
                Student courseId = new Student();
                courseId.setStudent_id(rs.getString(1));
                list.add(courseId);
            }
        }catch (Exception e){
            e.printStackTrace();
        }
        return list;
    }
    //해당하는 student_id가 있는지 확인
    public ArrayList<Student> StudentIdCheck(String _student_id){
        String SQL = "SELECT student_id FROM student WHERE student_id = ?";
        ArrayList<Student> list = new ArrayList<Student>();

        try{
            pstmt = conn.prepareStatement(SQL);
            pstmt.setInt(1, Integer.parseInt(_student_id));
            rs = pstmt.executeQuery();

            while(rs.next()){
                Student std = new Student();
                std.setStudent_id(Integer.toString(rs.getInt(1)));
                list.add(std);
            }
        }catch (Exception e){
            e.printStackTrace();
        }
        return list;
    }
    //해당하는 class_no이 있는지 검사
    public int checkClassNo(String _class_no){
        String SQL = "SELECT class_no FROM class WHERE class_no = ?";

        try{
            pstmt = conn.prepareStatement(SQL);
            pstmt.setInt(1, Integer.parseInt(_class_no));
            rs = pstmt.executeQuery();
            if(rs.next()){
                return 1;
            }
        }catch (Exception e){
            e.printStackTrace();
        }
        return 0;//없음
    }
    //lecturer_id 가 주어졌을 때, 소속학과 정보를 알기 위해 major_id를 리턴해줌
    public ArrayList<Check3> checkLecturer(String _lecturer_id){
        String SQL = "SELECT major_id FROM lecturer WHERE lecturer_id = ?";
        ArrayList<Check3> list = new ArrayList<Check3>();

        try{
            pstmt = conn.prepareStatement(SQL);
            pstmt.setInt(1, Integer.parseInt(_lecturer_id));
            rs = pstmt.executeQuery();

            while(rs.next()){
                Check3 ch3 = new Check3();
                ch3.setCredits(rs.getInt(1));
                list.add(ch3);
            }
        }catch (Exception e){
            e.printStackTrace();
        }
        return list;
    }

    //수강신청시 남은자리가 있는지 확인하기 위해 정의함
    //자리가 남는경우 1, 자리가 없는 경우 0을 리턴함
    public int checkOccupy(int person_max, String room_id){
        String SQL = "SELECT occupancy FROM room WHERE room_id = ?";

        try{
            pstmt = conn.prepareStatement(SQL);
            pstmt.setInt(1, Integer.parseInt(room_id));
            rs = pstmt.executeQuery();

            if(rs.next()){
                if(rs.getInt(1) < person_max){
                    return 0;//교실수용가능인원이 최대수강인원보다 적은경우
                }else{
                    return 1;//교실수용가능인원이 최대수강인원보다 많은경우
                }
            }
        }catch (Exception e){
            e.printStackTrace();
        }
        return -1;//room_id가 유효x
    }
    //lecturer_id가 주어졌을 때 그 교수가 속하는 학과id를 리턴
    public int getMajor_id(String _lecturer_id){
        String SQL = "SELECT major_id FROM lecturer WHERE lecturer_id = ?";

        try{
            pstmt = conn.prepareStatement(SQL);
            pstmt.setInt(1, Integer.parseInt(_lecturer_id));
            rs = pstmt.executeQuery();
            if(rs.next()){
                return rs.getInt(1);
            }
        }catch (Exception e){
            e.printStackTrace();
        }
        return 0;
    }
    //class Table에 insert
    //9999, 10333, CIE7077, 수강신청테스트, 1, 2, 1, 월, 11:00 ~ 12:00, 2001001001, 5, 1 //정원140명
    public void insertIntoClass(String _class_id, String _class_no, String _course_id, String _course_name, int _major_id, String _year, int _credit, String _lecturer_id, String _person_max, String _room_id){
        String SQL = "INSERT INTO class\n" +
                "VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        try{
            pstmt = conn.prepareStatement(SQL);
            pstmt.setInt(1,Integer.parseInt(_class_id));
            pstmt.setInt(2,Integer.parseInt(_class_no));
            pstmt.setString(3,_course_id);
            pstmt.setString(4, _course_name);
            pstmt.setInt(5, _major_id);
            pstmt.setInt(6, Integer.parseInt(_year));
            pstmt.setInt(7, _credit);
            pstmt.setInt(8, Integer.parseInt(_lecturer_id));
            pstmt.setInt(9, 0);
            pstmt.setInt(10, Integer.parseInt(_person_max));
            pstmt.setInt(11, 2022);
            pstmt.setInt(12, Integer.parseInt(_room_id));
            pstmt.executeUpdate();
        }catch (Exception e){
            e.printStackTrace();
        }
    }
    //time1의 primary key를 설정하기 위해서 max(time_id)를 리턴함
    public int getMaxTimeId(){
        String SQL = "SELECT MAX(time_id) FROM time1";
        try{
            pstmt = conn.prepareStatement(SQL);
            rs = pstmt.executeQuery();
            if(rs.next()){
                int result = rs.getInt(1);
                return result;
            }
        }catch (Exception e){
            e.printStackTrace();
        }
        return 0;
    }

    //time Table에 insert
    public void insertIntoTime1(int maxTimeId, String _class_id, String _period, String _day, String _begin, String _end){
        String SQL = "INSERT INTO time1 VALUES(?, ?, ?, ?, ?)";

        try{
            pstmt = conn.prepareStatement(SQL);
            pstmt.setInt(1, maxTimeId + 1);
            pstmt.setInt(2, Integer.parseInt(_class_id));
            pstmt.setInt(3, Integer.parseInt(_period));
            String begin = "1900-01-0"+ _day +"T"+ _begin + ":00.000Z";
            String end = "1900-01-0"+ _day +"T"+ _end + ":00.000Z";
            pstmt.setString(4, begin);
            pstmt.setString(5, end);
            pstmt.executeUpdate();
        }catch (Exception e){
            e.printStackTrace();
        }
    }
    //course_id, course_name이 주어졌을때 그 course_id와 대응대는 name 과 course_name이 일치하는 지 검사
    public int checkCourseName(String _course_id, String _course_name){
        String SQL = "SELECT name FROM course WHERE course_id = ?";

        try{
            pstmt = conn.prepareStatement(SQL);
            pstmt.setString(1, _course_id);
            rs = pstmt.executeQuery();

            if(rs.next()){
                String c_name = rs.getString(1);
                if(c_name.equals(_course_name)){
                    return 1;//course_id 가 일치할떄 course_name도 일치
                }else{
                    return -1;//course_id 가 일치할떄 course_name도 불일치
                }
            }
        }catch (Exception e){
            e.printStackTrace();
        }
        return 0;//일치하는 course_id가 없음
    }
    //course Table에 새로운 record를 넣어줌
    public void updateCourse(String _course_id, String _course_name, int _credit) {
        String SQL = "INSERT INTO course VALUES(?, ?, ?)";

        try {
            pstmt = conn.prepareStatement(SQL);
            pstmt.setString(1, _course_id);
            pstmt.setString(2, _course_name);
            pstmt.setInt(3, _credit);
            pstmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    //olap통계기능 에서 쓰는 메서드
    public ArrayList<Student> olap(){
        String SQL = "select course.name, avg - grade_num as result\n" +
                "from credits, course, (select credits.student_id as stu_id ,SUM(grade_num * credit)/SUM(credit) as avg from credits join course on credits.course_id = course.course_id group by credits.student_id) as tab\n" +
                "where credits.student_id = tab.stu_id and credits.course_id = course.course_id\n" +
                "order by result desc\n" +
                "limit 10;";
        ArrayList<Student> list = new ArrayList<Student>();
        try{
            pstmt = conn.prepareStatement(SQL);
            rs = pstmt.executeQuery();

            while(rs.next()){
                Student course = new Student();
                course.setStudent_id(rs.getString(1));
                list.add(course);
            }
        }catch (Exception e){
            e.printStackTrace();
        }
        return list;
    }

    //과목폐강하는 메서드
    //class Table에서 record삭제
    public void deleteClass(String _class_id){
        String SQL = "DELETE FROM class WHERE class_id = ?";
        try{
            pstmt = conn.prepareStatement(SQL);
            pstmt.setInt(1, Integer.parseInt(_class_id));
            pstmt.executeUpdate();
        } catch (Exception e){
            e.printStackTrace();
        }
    }

    //time1 Table에서 record삭제
    public void deleteTime1(String _class_id){
        String SQL = "DELETE FROM time1 WHERE class_id = ?";
        try{
            pstmt = conn.prepareStatement(SQL);
            pstmt.setInt(1, Integer.parseInt(_class_id));
            pstmt.executeUpdate();
        }catch (Exception e){
            e.printStackTrace();
        }
    }
    //credits Table에서 record삭제
    public void deleteCredits(String _class_id){
        String SQL = "DELETE FROM credits WHERE class_id = ?";
        try{
            pstmt = conn.prepareStatement(SQL);
            pstmt.setInt(1, Integer.parseInt(_class_id));
            pstmt.executeUpdate();
        }catch (Exception e){
            e.printStackTrace();
        }
    }
}

