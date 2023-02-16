package user;
//course_user
public class c_user{

    private String class_id; // key
    public String getClass_id() {return class_id;}
    public void setClass_id(String class_id) {this.class_id = class_id;}
    private String class_no;
    public String getClass_no(){return class_no;}
    public void setClass_no(String classNo){class_no = classNo;}
    private String course_id;
    public String getCourse_id() {return course_id;}
    public void setCourse_id(String course_id) {this.course_id = course_id;}
    private String c_name;
    public String getC_name() {return c_name;}
    public void setC_name(String c_name) {this.c_name = c_name;}

    private int credit;
    public int getCredit() {return credit;}
    public void setCredit(int credit) {this.credit = credit;}

    private String lecturer;
    public String getLecturer() {return lecturer;}
    public void setLecturer(String lecturer) {this.lecturer = lecturer;}
    private int period;
    public int getPeriod(){return period;}
    public void setPeriod(int num){period = num;}

    private int year;
    public void setYear(int year) {this.year = year;}
    public int getYear(){return year;}
    private String begin;
    public void setBegin(String begin) {this.begin = begin;}
    public String getBegin() {return begin;}

    private String end;
    public void setEnd(String end) {this.end = end;}
    public String getEnd() {return end;}

    private int cur;
    public int getCur(){return cur;}
    public void setCur(int cur) {this.cur = cur;}

    private int Max;
    public int getMax(){return Max;}
    public void setMax(int num){Max = num;}
    private String building;
    public String getBuilding() {return building;}
    public void setBuilding(String building) {this.building = building;}

    private int room_id;
    public int getRoom_id() {return room_id;}
    public void setRoom_id(int room_id) {this.room_id = room_id;}
    //public String time1;
    //public int maxNum;

    //public String building;

    //public String room_num;
}
