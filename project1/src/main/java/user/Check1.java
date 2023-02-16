package user;
//이전 학점이 C+이하여야 하는 제약조건을 위해 만듬
public class Check1 {
    private double grade_num;
    public double getGrade_num() {return grade_num;}
    public void setGrade_num(double grade_num) {this.grade_num = grade_num;}

    private int year;
    public int getYear() {return year;}
    public void setYear(int year) {this.year = year;}
}
