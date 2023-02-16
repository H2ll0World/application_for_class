package user;
//관리자 영역의 학생 성적조회에서 사용
public class adminStudentCredit {
    private int class_id;
    public int getClass_id() {return class_id;}
    public void setClass_id(int class_id) {this.class_id = class_id;}

    private String course_id;
    public void setCourse_id(String course_id) {this.course_id = course_id;}
    public String getCourse_id() {return course_id;}

    private String course_name;
    public String getCourse_name() {return course_name;}
    public void setCourse_name(String course_name) {this.course_name = course_name;}

    private String grade;
    public String getGrade() {return grade;}
    public void setGrade(String grade) {this.grade = grade;}

    private int year;
    public int getYear() {return year;}
    public void setYear(int year) {this.year = year;}
}
