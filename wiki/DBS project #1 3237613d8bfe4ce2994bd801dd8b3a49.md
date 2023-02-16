# DBS project #1

개발환경

IntelliJ IDEA 2022.2

MySQL 8.0

Tomcat 9.0.65

SDK Amazon Corretto version 15.0.2

Connector mysql-connector-java-8.0.20.jar

macOS Monterey 12.3.1

코드에 대한 설명은 주석으로 써있습니다.

학생로그인의 경우 student table에 있는 student_id 가 id, password가 password입니다.

관리자의 경우 id:  admin, pw: admin으로 로그인하면 자동으로 관리자 

# DESIGN

**SECHEMA 디자인**

![스크린샷 2022-11-08 오전 11.44.01.png](https://github.com/H2ll0World/application_for_class/blob/main/wiki/DBS%20project%20#1%203237613d8bfe4ce2994bd801dd8b3a49/%25EC%258A%25A4%25ED%2581%25AC%25EB%25A6%25B0%25EC%2583%25B7_2022-11-08_%25EC%2598%25A4%25EC%25A0%2584_11.44.01.png?raw=ture)

기본적으로 제공해준 스키마를 사용했지만, 약간의 수정이 있습니다.
https://github.com/H2ll0World/application_for_class/blob/main/wiki/DBS%20project%20%231%203237613d8bfe4ce2994bd801dd8b3a49/%25EC%258A%25A4%25ED%2581%25AC%25EB%25A6%25B0%25EC%2583%25B7_2022-10-31_%25EC%2598%25A4%25ED%259B%2584_4.38.44.png
장바구니 table은 wishList table로 이름을 지었고, 장바구니 기능을 위해 만들었습니다.

CreditsTable에 year가 2022인 강좌를 현재학기에 스강중인 강좌로 보고 진행하였습니다. 그렇기때문에 현재 수강중인 class를 구별하기 위하여 class_id도 추가하였습니다.

Credits table의 grade_num은 성적을 숫자로 바꾼것으로 계산의 편의를 위해 추가햐였습니다. Ex) A0 → 4.0, B+ → 3.5 등

Class table의 person_cur은 해당하는 수업에 현재 듣고있는 학생의 수를 나타낸것립니다. 이도 편의를 위해서 추가하였습니다.

time table은 time1으로 이름을 변경하였고 기존 12시간으로 표시하였던 시간을 24시간으로 표시하도록 변경했습니다.

student table의 state는 학생의 상태정보(재학=0, 휴학=1, 자퇴=2)를 저장하기 위해 추가하였습니다.

**.JSP파일 이름 규칙**

jsp파일이 많아지자 역할을 구별하기 쉽게 이름에 규칙을 정해서 지었습니다. ex) AB.jsp파일을 A.jsp파일의 하위 페이지이고 ABC.jsp파일의 상위 페이지입니다

수업table의 person_cur은 현재 수강신청한 학생의 수를 나타낸 것으로 수강신청 기능을 위해 추가한 속성입니다.

성적 table의 grade_num은 성적통계를 위해 성적을 A0을 4.0 으로, 다시 말해서 숫자로 저장했습니다.

## JSP구조

로그인을 통해서 관리자(admin.jsp)와 학생페이지(main.jsp)로 이동 한다.

### 1번 사진

![스크린샷 2022-11-08 오전 10.44.12.png](DBS%20project%20#1%203237613d8bfe4ce2994bd801dd8b3a49/%25EC%258A%25A4%25ED%2581%25AC%25EB%25A6%25B0%25EC%2583%25B7_2022-11-08_%25EC%2598%25A4%25EC%25A0%2584_10.44.12.png)

관리자 페이지(admin.jsp)

양방양 화살표는 서로 이동할 수 있음을 나타냅니다.

### 2번 사진

![스크린샷 2022-11-08 오전 10.58.47.png](DBS%20project%20#1%203237613d8bfe4ce2994bd801dd8b3a49/%25EC%258A%25A4%25ED%2581%25AC%25EB%25A6%25B0%25EC%2583%25B7_2022-11-08_%25EC%2598%25A4%25EC%25A0%2584_10.58.47.png)

학생로그인시

### 3번 사진

![스크린샷 2022-11-08 오전 10.58.58.png](DBS%20project%20#1%203237613d8bfe4ce2994bd801dd8b3a49/%25EC%258A%25A4%25ED%2581%25AC%25EB%25A6%25B0%25EC%2583%25B7_2022-11-08_%25EC%2598%25A4%25EC%25A0%2584_10.58.58.png)

# IMPLEMENT

어떤 요구사항에 대해서 어떤 SQL문을 작성하였는지 서술

**1번 사진**의 경우 loginAction에서만 SQL문이 사용되었습니다.

```sql
SELECT password FROM student WHERE student_id = ?;
```

ID 인 student_id가 주어진 경우 해당 student_id에 해당하는 password를 가져와서 로그인을 합니다.

단, id 가 admin일 경우 password 또한 admin 이면 admin.jsp로 이동합니다.

**2번 사진/관리자 페이지**

**학생관리**

**시간표**

```sql
SELECT time1.begin, time1.end, credits.class_id
FROM credits, time1
WHERE credits.class_id = time1.class_id and time1.begin != 'NO' and credits.student_id = ?;
```

시간표 생성을 위해선 현재 학생이 수강중인 강좌와 이 강좌의 시간을 알아야 한다.

따라서 현재 수강정보가 있는 credits Table과 시간정보가 있는 time1 Table에서 시간정보를 가져온다.

**학점정보**

```sql
SELECT credits.class_id, credits.course_id, course.name, credits.grade, year
FROM credits join course on credits.course_id = course.course_id
WHERE credits.student_id = ? and credits.year < 2022
ORDER BY year desc;
```

학생의 전체 성적을 보여줌

2022년은 현재 수강중인 강좌이므로 학점정보가x 해당하는 학번에 해당하는 과목정보, 학점을 보여줌

학점정보가 있는  credits과 credits Table에는 과목이름이 없으므로 course Table과 join하여 과목이름도 가져옴

```sql
SELECT year, sum(grade_num * credit) / sum(credit)
FROM credits join course on credits.course_id = course.course_id
WHERE student_id = ? and year < 2022 
GROUP BY year
```

위의 SQL문과 유사하나 학생의 년도별 학점정보를 보여주기 위해서 GROUP BY year를 사용해서 년도별 평균학점을 가져온다.

```sql
SELECT sum(grade_num * credit) / sum(credit)
FROM credits join course on credits.course_id = course.course_id
WHERE student_id = ? and year < 2022;
```

위의 SQL문과 유사하나 GROUP BY를 뺴서 년도별이 아닌 전체 평균학점을 보여준다.

**지도교수**

```sql
SELECT lecturer.lecturer_id, lecturer.name, major.major_id, major.name
FROM student join lecturer on student.lecturer_id = lecturer.lecturer_id, major
WHERE lecturer.major_id = major.major_id and student.student_id = ?;
```

학생의 지도교수 정보를 가져오기 위해서 student Table을 가져온다. 하지만 lecturer_id 만 있으므로 지도교수의 이름과 소속학과 정보를 가져오기 위해서 lecturer Table도 가져와서 lecture_id 로 join해줌

**학생상태 변경**

```sql
UPDATE student SET state = ? WHERE student_id = ?;
```

변경하려는 학생상태정보를 받아서 학생 상태정보가 있는 student table의 값을 변경해줌

학생상태변경의 경우 휴학, 자퇴로 변경할 경우 현재 수강중인 강좌를 모두 수강포기해야 한다.

통계 기능(OLAP)

평균 평점과 특정 과목의 학점 간 차이(평균평점-과목학점)가 가장 큰 top10과목

```sql
select course.name, avg - grade_num as result
from credits, course, (select credits.student_id as stu_id ,SUM(grade_num * credit)/SUM(credit) as avg from credits join course on credits.course_id = course.course_id group by credits.student_id) as tab
where credits.student_id = tab.stu_id and credits.course_id = course.course_id
order by result desc
limit 10;
```

전체 평균평점을 avg 로 구해서 서브쿼리로 넣어주고 특정 과목과 의 차이를 구하고 이를 내림차순으로 정렬해서 차이가 큰 과목으로 정렬됨. limit 10으로 제약조건을 걸어 10과목 추출함

과목 관리

과목조회(수강편람)

과제 명세에 맞게 class_no, course_id 는 완전일치 검색 course.name는 키워드검색을 구현하기 위해서 경우의 수를 나누어 4개의 sql문을 구현 

1. class_no X, course_id X

```sql
SELECT class.class_id, class.class_no, class.course_id, class.name, lecturer.name, class.person_cur, class.person_max, building.name, room.room_id, class.opened
FROM class, lecturer, room, building
WHERE class.lecturer_id = lecturer.lecturer_id and class.room_id = room.room_id and room.building_id = building.building_id and class.name LIKE ?
ORDER BY class.class_id asc
```

1. class_no O, course_id X

```sql
SELECT class.class_id, class.class_no, class.course_id, class.name, lecturer.name, class.person_cur, class.person_max, building.name, room.room_id, class.opened\n" +
        "FROM class, lecturer, room, building\n" +
        "WHERE class.lecturer_id = lecturer.lecturer_id and class.room_id = room.room_id and room.building_id = building.building_id and class.name LIKE ? and class.class_no = ?
        "order by class.class_id asc
```

1. class_no X, course_id O

```sql
SELECT class.class_id, class.class_no, class.course_id, class.name, lecturer.name, class.person_cur, class.person_max, building.name, room.room_id, class.opened
FROM class, lecturer, room, building
WHERE class.lecturer_id = lecturer.lecturer_id and class.room_id = room.room_id and room.building_id = building.building_id and class.course_name LIKE ? and class.course_id = ?
ORDER BY class.class_id asc
```

1. class_no O, course_id X

```sql
SELECT class.class_id, class.class_no, class.course_id, class.name, lecturer.name, class.person_cur, class.person_max, building.name, room.room_id, class.opened
FROM class , lecturer, room, building
WHERE class.lecturer_id = lecturer.lecturer_id and room.room_id = class.room_id and room.building_id = building.building_id and class.class_no = ? and class.course_id = ? and class.name LIKE ?
ORDER BY class.class_id asc
```

수강인원 증원

class table에서 해당과목의 수강정원을 가져오고 늘릴 정원을 더해서 수강인원을 증원해줌

```sql
SELECT person_max FROM class WHERE class_id = ?
```

```sql
UPDATE class SET person_max = ? WHERE class_id = ?
```

수강허용

```sql
select person_max, person_cur
from class
where class_id = ?
```

현재 수강가능 인원이 남았는지 확인하기 위해 정보를 가지고 옴

수강가능인원이 있는경우 credits table에 수강 정보를 넣어주고 class table의 person_cur을 1늘려줌

수강가능인원이 없는 경우 위와 동일하게 동작하는데 더해 class table의 person_max도 1 늘려줌

```sql
UPDATE class SET person_max = ? WHERE class_id = ?
```

수강정원을 늘려주기 위해서 필요한 쿼리

```sql
INSERT INTO credits(credits_id, student_id, course_id, credits.year, grade, grade_num, class_id)
VALUES(?, ?, ?, ?, ?, ?, ?);
```

현재 수강정보가 있는 credits Table에 수강정보를 넣어줌

과목개설

해당하는 course_id와 course.name이 존재하는 경우 class table에만 과목정보를 넣어주고 course table에 해당하는 과목정보가 없는경우 course table에도 넣어준다.

```sql
INSERT INTO class
VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?);
```

과목 정보를 받아서 class 테이블에 넣어준다.

```sql
INSERT INTO time1 VALUES(?, ?, ?, ?, ?)
```

과목 정보중 시간정보를 time1 Table에 넣어줌

과목폐강

```sql
DELETE FROM class WHERE class_id = ?
```

class Table에서 해당 class record를 삭제한다.

```sql
DELETE FROM time1 WHERE class_id = ?
```

time1 Table에서 해당 수업의 시간정보를 삭제한다.

```sql
DELETE FROM credits WHERE class_id = ?
```

해당하는 class를 class table에서 삭제하고 해당 수업을 듣는 학생도 없어야 하므로 credits table에서 해당하는 class를 듣는 학생도 삭제한다.

**3번 사진/학생 페이지**

수강편람

수강편람

2번 사진의 부분에서의 수강편람과 동일

수강신청

1. 제약조건 검사를 위해 같고옴 만약 year == 2022이면 이미 수강신청한 강좌 grade_num이 3.0을 넘는 경우 이전수강이 B0이상이므로 전 페이지로 돌아감

```sql
SELECT grade_num, year
FROM credits
WHERE student_id = ? and course_id = ?
```

1. 수강정원이 다 찼는지 검사하기 위해서 갖고옴 현재인원과 최대인원을 갖고와서 제약조건 검사

```sql
select person_max, person_cur
from class
where class_id = ?
```

1. 최대 수강학점이 18학점을 넘을 수 없는 제약조건을 위해 만듬

```sql
SELECT SUM(course.credit)
FROM credits join course on credits.course_id = course.course_id
WHERE year = 2022 and credits.student_id = ?
```

현재 수강중인 과목의 총 학점을 가져옴

```sql
SELECT course.credit
FROM class JOIN course ON class.course_id = course.course_id
WHERE class_id = ?
```

신청하고자 하는 과목의 학점을 가져옴

현재 수강중인 과목의 총 학점 + 신청하고자 하는 과목의 학점 이 18학점을 넘으면 제약조건에 걸림

1. 동일 시간에 2과목이상 신청x

```sql
SELECT time1.begin, time1.end, credits.class_id
FROM credits, time1
WHERE credits.class_id = time1.class_id and time1.begin != 'NO' and credits.student_id = ?
```

현재 수강중인 강좌의 시간을 갖고옴

```sql
SELECT begin, end
FROM time1
WHERE time1.class_id = ?
```

신청하고자 하는 과목의 시간을 갖고옴

둘의 시간을 비교해서 겹치는 시간이 있으면 제약조건에 걸림

제약조건을 모두 통과한 경우

```sql
INSERT INTO credits(credits_id, student_id, course_id, credits.year, grade, grade_num, class_id)
VALUES(?, ?, ?, ?, ?, ?, ?)
```

수강정보를 저장하고 있는 credits Table에 수강정보를 넣어줌

```sql
UPDATE class
SET person_cur = 1 + ?
WHERE class_id = ?
```

수강중인 인원 1늘려줌

장바구니

```sql
INSERT INTO wishList(student_id, class_id) VALUES(?, ?)
```

희망 수업을 담고 있는 wishList Table에 넣어줌

시간표정보

```sql
SELECT time1.begin, time1.end, credits.class_id
FROM credits, time1
WHERE credits.class_id = time1.class_id and time1.begin != 'NO' and credits.student_id = ?
```

수강정보를 담고있는 credits 과 시간정보를 담고있는 time1을 join하여 시간정보를 가져오고 이를 이용해서 시간표를 얻음

신청강좌/장바구니

수강신청

수강편람의 수강신청과 동일

수강취소

```sql
DELETE FROM credits WHERE student_id = ? and class_id = ?
```

수강정보를 담고 있는 credits에서 수강정보를 삭제

```sql
UPDATE class
SET person_cur = ? - 1
WHERE class_id = ?
```

class table의 person_cur 1줄임

희망강좌 취소

```sql
DELETE FROM wishList WHERE student_id = ? and class_id = ?
```

희망강좌를 담고있는 wishList table에서 삭제

# RESULT

## 일반 학생 로그인

main.jsp페이지 로그인을 통해 main.jsp(학생로그인),  admin.jsp(관리자 페이지)로 갈 수 있다.

![스크린샷 2022-11-08 오후 3.14.54.png](DBS%20project%20#1%203237613d8bfe4ce2994bd801dd8b3a49/%25EC%258A%25A4%25ED%2581%25AC%25EB%25A6%25B0%25EC%2583%25B7_2022-11-08_%25EC%2598%25A4%25ED%259B%2584_3.14.54.png)

studentLogin.jsp 로그인정보를 입력해서 로그인하면 studentLoginActio.jsp에서 로그인을 처리해준다.

![스크린샷 2022-11-08 오후 3.15.02.png](DBS%20project%20#1%203237613d8bfe4ce2994bd801dd8b3a49/%25EC%258A%25A4%25ED%2581%25AC%25EB%25A6%25B0%25EC%2583%25B7_2022-11-08_%25EC%2598%25A4%25ED%259B%2584_3.15.02.png)

![스크린샷 2022-11-08 오후 3.15.10.png](DBS%20project%20#1%203237613d8bfe4ce2994bd801dd8b3a49/%25EC%258A%25A4%25ED%2581%25AC%25EB%25A6%25B0%25EC%2583%25B7_2022-11-08_%25EC%2598%25A4%25ED%259B%2584_3.15.10.png)

![스크린샷 2022-11-08 오후 3.15.18.png](DBS%20project%20#1%203237613d8bfe4ce2994bd801dd8b3a49/%25EC%258A%25A4%25ED%2581%25AC%25EB%25A6%25B0%25EC%2583%25B7_2022-11-08_%25EC%2598%25A4%25ED%259B%2584_3.15.18.png)

course_search.jsp 수강편람기능, 수업번호, 학수번호는 완전일치검색, 교과목은 키워드 검색제공

정보를 입력하고 조회를 누르면 course_searchAction.jsp에서 처리를 해줌

![스크린샷 2022-11-08 오후 3.15.26.png](DBS%20project%20#1%203237613d8bfe4ce2994bd801dd8b3a49/%25EC%258A%25A4%25ED%2581%25AC%25EB%25A6%25B0%25EC%2583%25B7_2022-11-08_%25EC%2598%25A4%25ED%259B%2584_3.15.26.png)

class_no : 10007 으로 검색하는 경우

![스크린샷 2022-11-08 오후 3.15.53.png](DBS%20project%20#1%203237613d8bfe4ce2994bd801dd8b3a49/%25EC%258A%25A4%25ED%2581%25AC%25EB%25A6%25B0%25EC%2583%25B7_2022-11-08_%25EC%2598%25A4%25ED%259B%2584_3.15.53.png)

![스크린샷 2022-11-08 오후 3.16.00.png](DBS%20project%20#1%203237613d8bfe4ce2994bd801dd8b3a49/%25EC%258A%25A4%25ED%2581%25AC%25EB%25A6%25B0%25EC%2583%25B7_2022-11-08_%25EC%2598%25A4%25ED%259B%2584_3.16.00.png)

course_id : CIE4011로 검색

![스크린샷 2022-11-08 오후 3.26.23.png](DBS%20project%20#1%203237613d8bfe4ce2994bd801dd8b3a49/%25EC%258A%25A4%25ED%2581%25AC%25EB%25A6%25B0%25EC%2583%25B7_2022-11-08_%25EC%2598%25A4%25ED%259B%2584_3.26.23.png)

![스크린샷 2022-11-08 오후 3.26.30.png](DBS%20project%20#1%203237613d8bfe4ce2994bd801dd8b3a49/%25EC%258A%25A4%25ED%2581%25AC%25EB%25A6%25B0%25EC%2583%25B7_2022-11-08_%25EC%2598%25A4%25ED%259B%2584_3.26.30.png)

교과목 검색 키워드 검색

course_name : ‘수리’로 검색

![스크린샷 2022-11-08 오후 3.29.09.png](DBS%20project%20#1%203237613d8bfe4ce2994bd801dd8b3a49/%25EC%258A%25A4%25ED%2581%25AC%25EB%25A6%25B0%25EC%2583%25B7_2022-11-08_%25EC%2598%25A4%25ED%259B%2584_3.29.09.png)

![스크린샷 2022-11-08 오후 3.29.17.png](DBS%20project%20#1%203237613d8bfe4ce2994bd801dd8b3a49/%25EC%258A%25A4%25ED%2581%25AC%25EB%25A6%25B0%25EC%2583%25B7_2022-11-08_%25EC%2598%25A4%25ED%259B%2584_3.29.17.png)

수강신청 기능

현재 신청강좌

![스크린샷 2022-11-08 오후 3.57.56.png](DBS%20project%20#1%203237613d8bfe4ce2994bd801dd8b3a49/%25EC%258A%25A4%25ED%2581%25AC%25EB%25A6%25B0%25EC%2583%25B7_2022-11-08_%25EC%2598%25A4%25ED%259B%2584_3.57.56.png)

![스크린샷 2022-11-08 오후 3.58.17.png](DBS%20project%20#1%203237613d8bfe4ce2994bd801dd8b3a49/%25EC%258A%25A4%25ED%2581%25AC%25EB%25A6%25B0%25EC%2583%25B7_2022-11-08_%25EC%2598%25A4%25ED%259B%2584_3.58.17.png)

![스크린샷 2022-11-08 오후 3.58.22.png](DBS%20project%20#1%203237613d8bfe4ce2994bd801dd8b3a49/%25EC%258A%25A4%25ED%2581%25AC%25EB%25A6%25B0%25EC%2583%25B7_2022-11-08_%25EC%2598%25A4%25ED%259B%2584_3.58.22.png)

![스크린샷 2022-11-08 오후 3.58.26.png](DBS%20project%20#1%203237613d8bfe4ce2994bd801dd8b3a49/%25EC%258A%25A4%25ED%2581%25AC%25EB%25A6%25B0%25EC%2583%25B7_2022-11-08_%25EC%2598%25A4%25ED%259B%2584_3.58.26.png)

![스크린샷 2022-11-08 오후 3.58.31.png](DBS%20project%20#1%203237613d8bfe4ce2994bd801dd8b3a49/%25EC%258A%25A4%25ED%2581%25AC%25EB%25A6%25B0%25EC%2583%25B7_2022-11-08_%25EC%2598%25A4%25ED%259B%2584_3.58.31.png)

![스크린샷 2022-11-08 오후 6.44.28.png](DBS%20project%20#1%203237613d8bfe4ce2994bd801dd8b3a49/%25EC%258A%25A4%25ED%2581%25AC%25EB%25A6%25B0%25EC%2583%25B7_2022-11-08_%25EC%2598%25A4%25ED%259B%2584_6.44.28.png)

![스크린샷 2022-11-08 오후 3.58.35.png](DBS%20project%20#1%203237613d8bfe4ce2994bd801dd8b3a49/%25EC%258A%25A4%25ED%2581%25AC%25EB%25A6%25B0%25EC%2583%25B7_2022-11-08_%25EC%2598%25A4%25ED%259B%2584_3.58.35.png)

제약조건을 검사하고 알림이 나오고 신청완료되면 신청완료 알람이 나옵니다.

![스크린샷 2022-11-08 오후 3.58.42.png](DBS%20project%20#1%203237613d8bfe4ce2994bd801dd8b3a49/%25EC%258A%25A4%25ED%2581%25AC%25EB%25A6%25B0%25EC%2583%25B7_2022-11-08_%25EC%2598%25A4%25ED%259B%2584_3.58.42.png)

신청리스트를 보면 정상적으로 신청됬음을 알 수 있습니다.

수강취소

현재 수강 리스트

![스크린샷 2022-11-08 오후 3.58.42.png](DBS%20project%20#1%203237613d8bfe4ce2994bd801dd8b3a49/%25EC%258A%25A4%25ED%2581%25AC%25EB%25A6%25B0%25EC%2583%25B7_2022-11-08_%25EC%2598%25A4%25ED%259B%2584_3.58.42.png)

![스크린샷 2022-11-08 오후 4.02.13.png](DBS%20project%20#1%203237613d8bfe4ce2994bd801dd8b3a49/%25EC%258A%25A4%25ED%2581%25AC%25EB%25A6%25B0%25EC%2583%25B7_2022-11-08_%25EC%2598%25A4%25ED%259B%2584_4.02.13.png)

![스크린샷 2022-11-08 오후 4.02.19.png](DBS%20project%20#1%203237613d8bfe4ce2994bd801dd8b3a49/%25EC%258A%25A4%25ED%2581%25AC%25EB%25A6%25B0%25EC%2583%25B7_2022-11-08_%25EC%2598%25A4%25ED%259B%2584_4.02.19.png)

정상적으로 수강취소 된 것을 알 수 있습니다.

장바구니 기능

현재 희망수업

![스크린샷 2022-11-08 오후 4.02.19.png](DBS%20project%20#1%203237613d8bfe4ce2994bd801dd8b3a49/%25EC%258A%25A4%25ED%2581%25AC%25EB%25A6%25B0%25EC%2583%25B7_2022-11-08_%25EC%2598%25A4%25ED%259B%2584_4.02.19.png)

수업번호 10007 희망수업에 담음

![스크린샷 2022-11-08 오후 4.06.54.png](DBS%20project%20#1%203237613d8bfe4ce2994bd801dd8b3a49/%25EC%258A%25A4%25ED%2581%25AC%25EB%25A6%25B0%25EC%2583%25B7_2022-11-08_%25EC%2598%25A4%25ED%259B%2584_4.06.54.png)

![스크린샷 2022-11-08 오후 4.06.58.png](DBS%20project%20#1%203237613d8bfe4ce2994bd801dd8b3a49/%25EC%258A%25A4%25ED%2581%25AC%25EB%25A6%25B0%25EC%2583%25B7_2022-11-08_%25EC%2598%25A4%25ED%259B%2584_4.06.58.png)

![스크린샷 2022-11-08 오후 4.07.07.png](DBS%20project%20#1%203237613d8bfe4ce2994bd801dd8b3a49/%25EC%258A%25A4%25ED%2581%25AC%25EB%25A6%25B0%25EC%2583%25B7_2022-11-08_%25EC%2598%25A4%25ED%259B%2584_4.07.07.png)

희망수업에 담긴 것을 볼 수 있다.

희망수업 취소

![스크린샷 2022-11-08 오후 4.07.07.png](DBS%20project%20#1%203237613d8bfe4ce2994bd801dd8b3a49/%25EC%258A%25A4%25ED%2581%25AC%25EB%25A6%25B0%25EC%2583%25B7_2022-11-08_%25EC%2598%25A4%25ED%259B%2584_4.07.07%201.png)

![스크린샷 2022-11-08 오후 4.08.43.png](DBS%20project%20#1%203237613d8bfe4ce2994bd801dd8b3a49/%25EC%258A%25A4%25ED%2581%25AC%25EB%25A6%25B0%25EC%2583%25B7_2022-11-08_%25EC%2598%25A4%25ED%259B%2584_4.08.43.png)

![스크린샷 2022-11-08 오후 4.08.47.png](DBS%20project%20#1%203237613d8bfe4ce2994bd801dd8b3a49/%25EC%258A%25A4%25ED%2581%25AC%25EB%25A6%25B0%25EC%2583%25B7_2022-11-08_%25EC%2598%25A4%25ED%259B%2584_4.08.47.png)

희망수업이 취소된 것을 볼 수 있다.

시간표기능

![스크린샷 2022-11-08 오후 4.08.47.png](DBS%20project%20#1%203237613d8bfe4ce2994bd801dd8b3a49/%25EC%258A%25A4%25ED%2581%25AC%25EB%25A6%25B0%25EC%2583%25B7_2022-11-08_%25EC%2598%25A4%25ED%259B%2584_4.08.47.png)

![스크린샷 2022-11-08 오후 4.10.05.png](DBS%20project%20#1%203237613d8bfe4ce2994bd801dd8b3a49/%25EC%258A%25A4%25ED%2581%25AC%25EB%25A6%25B0%25EC%2583%25B7_2022-11-08_%25EC%2598%25A4%25ED%259B%2584_4.10.05.png)

현재 수강중인 강좌와 비교해 보면 정상적으로 시간표가 보이는 것을 알 수 있다.

로그아웃

![스크린샷 2022-11-08 오후 4.08.47.png](DBS%20project%20#1%203237613d8bfe4ce2994bd801dd8b3a49/%25EC%258A%25A4%25ED%2581%25AC%25EB%25A6%25B0%25EC%2583%25B7_2022-11-08_%25EC%2598%25A4%25ED%259B%2584_4.08.47.png)

![스크린샷 2022-11-08 오후 4.11.41.png](DBS%20project%20#1%203237613d8bfe4ce2994bd801dd8b3a49/%25EC%258A%25A4%25ED%2581%25AC%25EB%25A6%25B0%25EC%2583%25B7_2022-11-08_%25EC%2598%25A4%25ED%259B%2584_4.11.41.png)

로그아웃시 logoutAction.jsp에서 처리해주고 main.jsp로 이동함

## 관리자 페이지(admin)

관리자 로그인

![스크린샷 2022-11-08 오후 4.19.16.png](DBS%20project%20#1%203237613d8bfe4ce2994bd801dd8b3a49/%25EC%258A%25A4%25ED%2581%25AC%25EB%25A6%25B0%25EC%2583%25B7_2022-11-08_%25EC%2598%25A4%25ED%259B%2584_4.19.16.png)

![스크린샷 2022-11-08 오후 4.19.20.png](DBS%20project%20#1%203237613d8bfe4ce2994bd801dd8b3a49/%25EC%258A%25A4%25ED%2581%25AC%25EB%25A6%25B0%25EC%2583%25B7_2022-11-08_%25EC%2598%25A4%25ED%259B%2584_4.19.20.png)

![스크린샷 2022-11-08 오후 4.20.26.png](DBS%20project%20#1%203237613d8bfe4ce2994bd801dd8b3a49/%25EC%258A%25A4%25ED%2581%25AC%25EB%25A6%25B0%25EC%2583%25B7_2022-11-08_%25EC%2598%25A4%25ED%259B%2584_4.20.26.png)

관리자로 로그인지 loginAction.jsp에서 처리해서 admin.jsp로 이동함

학생 정보 조회 및 변경

정보를 조회할 학생의 학번을 입력하면 그 학생에 대한 정보를 얻거나 수정할 수 있다.

![스크린샷 2022-11-08 오후 4.21.41.png](DBS%20project%20#1%203237613d8bfe4ce2994bd801dd8b3a49/%25EC%258A%25A4%25ED%2581%25AC%25EB%25A6%25B0%25EC%2583%25B7_2022-11-08_%25EC%2598%25A4%25ED%259B%2584_4.21.41.png)

![스크린샷 2022-11-08 오후 4.21.54.png](DBS%20project%20#1%203237613d8bfe4ce2994bd801dd8b3a49/%25EC%258A%25A4%25ED%2581%25AC%25EB%25A6%25B0%25EC%2583%25B7_2022-11-08_%25EC%2598%25A4%25ED%259B%2584_4.21.54.png)

![스크린샷 2022-11-08 오후 4.21.59.png](DBS%20project%20#1%203237613d8bfe4ce2994bd801dd8b3a49/%25EC%258A%25A4%25ED%2581%25AC%25EB%25A6%25B0%25EC%2583%25B7_2022-11-08_%25EC%2598%25A4%25ED%259B%2584_4.21.59.png)

adminStudent.jsp에서 student_id를 받고 그 학생에 대한 정보를 얻을 수 있는  adminStudentAction.jsp로 이동함

금학기 학생 시간표 조회

![스크린샷 2022-11-08 오후 4.34.50.png](DBS%20project%20#1%203237613d8bfe4ce2994bd801dd8b3a49/%25EC%258A%25A4%25ED%2581%25AC%25EB%25A6%25B0%25EC%2583%25B7_2022-11-08_%25EC%2598%25A4%25ED%259B%2584_4.34.50.png)

학생페이지에서 쓰는 timeTable.jsp를 그대로 씀

adminStudentActionCredit.jsp 학생의 학점을 보여줌

![스크린샷 2022-11-08 오후 4.38.56.png](DBS%20project%20#1%203237613d8bfe4ce2994bd801dd8b3a49/%25EC%258A%25A4%25ED%2581%25AC%25EB%25A6%25B0%25EC%2583%25B7_2022-11-08_%25EC%2598%25A4%25ED%259B%2584_4.38.56.png)

adminStudentActionLecturer.jsp

지도교수 조회

![스크린샷 2022-11-08 오후 4.39.02.png](DBS%20project%20#1%203237613d8bfe4ce2994bd801dd8b3a49/%25EC%258A%25A4%25ED%2581%25AC%25EB%25A6%25B0%25EC%2583%25B7_2022-11-08_%25EC%2598%25A4%25ED%259B%2584_4.39.02.png)

학생 조회/ 상태 변경

현재 재학중 휴학으로 상태 변경

![스크린샷 2022-11-08 오후 4.49.25.png](DBS%20project%20#1%203237613d8bfe4ce2994bd801dd8b3a49/%25EC%258A%25A4%25ED%2581%25AC%25EB%25A6%25B0%25EC%2583%25B7_2022-11-08_%25EC%2598%25A4%25ED%259B%2584_4.49.25.png)

![스크린샷 2022-11-08 오후 4.49.31.png](DBS%20project%20#1%203237613d8bfe4ce2994bd801dd8b3a49/%25EC%258A%25A4%25ED%2581%25AC%25EB%25A6%25B0%25EC%2583%25B7_2022-11-08_%25EC%2598%25A4%25ED%259B%2584_4.49.31.png)

![스크린샷 2022-11-08 오후 4.49.38.png](DBS%20project%20#1%203237613d8bfe4ce2994bd801dd8b3a49/%25EC%258A%25A4%25ED%2581%25AC%25EB%25A6%25B0%25EC%2583%25B7_2022-11-08_%25EC%2598%25A4%25ED%259B%2584_4.49.38.png)

휴학으로 상태가 변경된 것을 알 수 있다.

![스크린샷 2022-11-08 오후 4.50.03.png](DBS%20project%20#1%203237613d8bfe4ce2994bd801dd8b3a49/%25EC%258A%25A4%25ED%2581%25AC%25EB%25A6%25B0%25EC%2583%25B7_2022-11-08_%25EC%2598%25A4%25ED%259B%2584_4.50.03.png)

상태가 휴학으로 변경 됐으므로 수강신청한 강좌가 모두 취소된 것을 알 수 있다.

### 과목 정보 조회 및 변경

과목조회

이것은 학생페이지의 수강편람과 같다.

과목증원

![스크린샷 2022-11-08 오후 7.41.33.png](DBS%20project%20#1%203237613d8bfe4ce2994bd801dd8b3a49/%25EC%258A%25A4%25ED%2581%25AC%25EB%25A6%25B0%25EC%2583%25B7_2022-11-08_%25EC%2598%25A4%25ED%259B%2584_7.41.33.png)

![스크린샷 2022-11-08 오후 7.41.50.png](DBS%20project%20#1%203237613d8bfe4ce2994bd801dd8b3a49/%25EC%258A%25A4%25ED%2581%25AC%25EB%25A6%25B0%25EC%2583%25B7_2022-11-08_%25EC%2598%25A4%25ED%259B%2584_7.41.50.png)

![스크린샷 2022-11-08 오후 7.41.54.png](DBS%20project%20#1%203237613d8bfe4ce2994bd801dd8b3a49/%25EC%258A%25A4%25ED%2581%25AC%25EB%25A6%25B0%25EC%2583%25B7_2022-11-08_%25EC%2598%25A4%25ED%259B%2584_7.41.54.png)

![스크린샷 2022-11-08 오후 7.42.03.png](DBS%20project%20#1%203237613d8bfe4ce2994bd801dd8b3a49/%25EC%258A%25A4%25ED%2581%25AC%25EB%25A6%25B0%25EC%2583%25B7_2022-11-08_%25EC%2598%25A4%25ED%259B%2584_7.42.03.png)

2명이 증원된 것을 알 수 있다.

### 수강 허용 반영

![스크린샷 2022-11-08 오후 8.21.40.png](DBS%20project%20#1%203237613d8bfe4ce2994bd801dd8b3a49/%25EC%258A%25A4%25ED%2581%25AC%25EB%25A6%25B0%25EC%2583%25B7_2022-11-08_%25EC%2598%25A4%25ED%259B%2584_8.21.40.png)

![스크린샷 2022-11-08 오후 8.28.51.png](DBS%20project%20#1%203237613d8bfe4ce2994bd801dd8b3a49/%25EC%258A%25A4%25ED%2581%25AC%25EB%25A6%25B0%25EC%2583%25B7_2022-11-08_%25EC%2598%25A4%25ED%259B%2584_8.28.51.png)

![스크린샷 2022-11-08 오후 8.21.54.png](DBS%20project%20#1%203237613d8bfe4ce2994bd801dd8b3a49/%25EC%258A%25A4%25ED%2581%25AC%25EB%25A6%25B0%25EC%2583%25B7_2022-11-08_%25EC%2598%25A4%25ED%259B%2584_8.21.54.png)

![스크린샷 2022-11-08 오후 8.22.13.png](DBS%20project%20#1%203237613d8bfe4ce2994bd801dd8b3a49/%25EC%258A%25A4%25ED%2581%25AC%25EB%25A6%25B0%25EC%2583%25B7_2022-11-08_%25EC%2598%25A4%25ED%259B%2584_8.22.13.png)

![스크린샷 2022-11-08 오후 8.22.37.png](DBS%20project%20#1%203237613d8bfe4ce2994bd801dd8b3a49/%25EC%258A%25A4%25ED%2581%25AC%25EB%25A6%25B0%25EC%2583%25B7_2022-11-08_%25EC%2598%25A4%25ED%259B%2584_8.22.37.png)

수강허용이 반영된 것을 알 수 있다.

과목설강

![스크린샷 2022-11-08 오후 8.23.16.png](DBS%20project%20#1%203237613d8bfe4ce2994bd801dd8b3a49/%25EC%258A%25A4%25ED%2581%25AC%25EB%25A6%25B0%25EC%2583%25B7_2022-11-08_%25EC%2598%25A4%25ED%259B%2584_8.23.16.png)

![스크린샷 2022-11-08 오후 8.23.19.png](DBS%20project%20#1%203237613d8bfe4ce2994bd801dd8b3a49/%25EC%258A%25A4%25ED%2581%25AC%25EB%25A6%25B0%25EC%2583%25B7_2022-11-08_%25EC%2598%25A4%25ED%259B%2584_8.23.19.png)

수강최대인원은 그 room의 수용량을 초과할 수 없기 때문에 제약조건이 발생한다.

![스크린샷 2022-11-08 오후 8.23.26.png](DBS%20project%20#1%203237613d8bfe4ce2994bd801dd8b3a49/%25EC%258A%25A4%25ED%2581%25AC%25EB%25A6%25B0%25EC%2583%25B7_2022-11-08_%25EC%2598%25A4%25ED%259B%2584_8.23.26.png)

![스크린샷 2022-11-08 오후 8.23.29.png](DBS%20project%20#1%203237613d8bfe4ce2994bd801dd8b3a49/%25EC%258A%25A4%25ED%2581%25AC%25EB%25A6%25B0%25EC%2583%25B7_2022-11-08_%25EC%2598%25A4%25ED%259B%2584_8.23.29.png)

![스크린샷 2022-11-08 오후 8.23.45.png](DBS%20project%20#1%203237613d8bfe4ce2994bd801dd8b3a49/%25EC%258A%25A4%25ED%2581%25AC%25EB%25A6%25B0%25EC%2583%25B7_2022-11-08_%25EC%2598%25A4%25ED%259B%2584_8.23.45.png)

수강정원을 10명으로 바꾸자 과목 설강이 완료되었다.

### 과목 폐강

![스크린샷 2022-11-08 오후 8.23.59.png](DBS%20project%20#1%203237613d8bfe4ce2994bd801dd8b3a49/%25EC%258A%25A4%25ED%2581%25AC%25EB%25A6%25B0%25EC%2583%25B7_2022-11-08_%25EC%2598%25A4%25ED%259B%2584_8.23.59.png)

![스크린샷 2022-11-08 오후 8.24.04.png](DBS%20project%20#1%203237613d8bfe4ce2994bd801dd8b3a49/%25EC%258A%25A4%25ED%2581%25AC%25EB%25A6%25B0%25EC%2583%25B7_2022-11-08_%25EC%2598%25A4%25ED%259B%2584_8.24.04.png)

![스크린샷 2022-11-08 오후 8.24.15.png](DBS%20project%20#1%203237613d8bfe4ce2994bd801dd8b3a49/%25EC%258A%25A4%25ED%2581%25AC%25EB%25A6%25B0%25EC%2583%25B7_2022-11-08_%25EC%2598%25A4%25ED%259B%2584_8.24.15.png)

과목 폐강이 완료된 것을 알 수 있다.

통계 OLAP기능

adminCourseOlap.jsp

![스크린샷 2022-11-08 오후 5.05.37.png](DBS%20project%20#1%203237613d8bfe4ce2994bd801dd8b3a49/%25EC%258A%25A4%25ED%2581%25AC%25EB%25A6%25B0%25EC%2583%25B7_2022-11-08_%25EC%2598%25A4%25ED%259B%2584_5.05.37.png)

로그아웃시 logoutAction.jsp에서 처리하고 main.jsp로 이동

![스크린샷 2022-11-08 오후 5.06.45.png](DBS%20project%20#1%203237613d8bfe4ce2994bd801dd8b3a49/%25EC%258A%25A4%25ED%2581%25AC%25EB%25A6%25B0%25EC%2583%25B7_2022-11-08_%25EC%2598%25A4%25ED%259B%2584_5.06.45.png)

**사이트 디자인 구성 계획**

기본적으로 로그인 기능은 같지만 로그인시 일반 유저와 관리자를 구분해서 이동하는 페이지가 다르게 구성할 계획입니다.

관리자 페이지의 경우 

- 수강 개설 및 삭제
- 학생/과목 상태 조회 및 변경
- 통계 기능(OLAP)

일반 유저일 경우

- 수강 신청 및 취소 기능
- 수업 시간표 생성 기능

사이트 디자인의 경우 한양대학교 수강신청 사이트와 유사하게 디자인 할 계획입니다.

수강편람 및 신청 사이트 계획 예시

![스크린샷 2022-10-31 오후 4.38.44.png](DBS%20project%20#1%203237613d8bfe4ce2994bd801dd8b3a49/%25EC%258A%25A4%25ED%2581%25AC%25EB%25A6%25B0%25EC%2583%25B7_2022-10-31_%25EC%2598%25A4%25ED%259B%2584_4.38.44.png)

********************************************************************************요구사항이 반영된 SQL문******************************************************************************** 

수강 편람 기능 //첫번째 인자는 수업번호, 두번째 인자는 학수번호, 세번째 인자는 수업명

```sql
**select** class.class_id, class.class_no, class.course_id, class.name, lecturer.name, time1.period,time1.begin, time1.end, class.person_cur, class.person_max, building.name, room.room_id
**from** (class left join time1 on class.class_id = time1.class_id), lecturer, room, building
**where** class.lecturer_id = lecturer.lecturer_id and room.room_id = class.room_id and room.building_id = building.building_id and class.class_no = ? and class.course_id = ? and class.name LIKE ?";
```

Admin 의 OLAP 기능

평점 평균과 특정 과목의 학점 간 차이가 가장 큰 10과목 추출

```sql
select [course.name](http://course.name/), avg - grade_num as result
from credits, course, (select credits.student_id as stu_id ,avg(grade_num) as avg from credits group by credits.student_id) as tab
where credits.student_id = tab.stu_id and credits.course_id = course.course_id
order by result desc
limit 10
```

# Trouble shooting

Mac에서는 csv파일로 한글을 사용하지 못하는 문제

→json으로 변환후 넣어주어 해결

페이지 인코딩을 utf-8로 설정했음에도 한글을 다른 페이지로 넘겨줄때 한글이 깨지는 문제 발생

→ request.setCharacterEncoding(”utf-8”)으로 설정해서 문제 해결

프로젝트 파일의 이름을 바꾸었더니 db와의 접속이 끊기는 문제가 발생

→ 다시 처음부터 설정하여 연결

userDAO class에서 함수를 정의하였지만 잘 작동하지 않는 문제가 있었음

→userDAO class는 데이터를 가져오는 용도로만 사용하고 처리하는데 필요한 함수는 jsp파일에서 정의

동작이 정상적이지 않을 때도 기존 컴파일러를 쓸때와 달리 어디에서 문제가 발생하였는지 자세히 알수가 없었음

→오류 개선에 많은 시간을 씀

jsp파일이 너무 많아서 서로 구별하기 힘든 문제가 있었음

→파일 이름에 규칙을 정해서 역할을 구별하기 쉽게 많듬
