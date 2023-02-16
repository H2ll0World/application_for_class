package user;
import java.util.ArrayList;
//수강신청 가능여부를 확인하기 위한 정보를 가져오는 클래스
public class Class_apply_info {

    private int check = 0;
    public int getCheck() {return check;}
    public void setCheck(int input){check = input;}

    private ArrayList<String> timetable = new ArrayList<String>();
    public void setTimetable(String _input) {
        timetable.add(_input);
    }
    public ArrayList<String> getTimetable() {return timetable;}
    private int credit;//이 과목의 학점
    public int getCredit() {return credit;}
    public void setCredit(int credit) {this.credit = credit;}
    private double grade;//여러게 구할 필요x max성적만 구하면
    public double getGrade() {return grade;}
    public void setGrade(double grade) {this.grade = grade;}
    private int max;
    public int getMax() {return max;}
    public void setMax(int max) {this.max = max;}

    private int cur;
    public int getCur() {return cur;}
    public void setCur(int cur) {this.cur = cur;}

}
