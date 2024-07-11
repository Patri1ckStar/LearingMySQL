#（1）查询全体学生的学号与姓名
select sno,sname 
from student;
#（2）查询全体学生的姓名、学号和所在系
select sname,sno,dept 
from student;
#（3）查询全体学生的详细记录
select * 
from student;
#（4）查询全体学生的姓名及其出生年份
select sname,(year(now())-sage) as year 
from student;
#（5）查询计算机系全体学生
select * 
from student 
where dept = '计算机系';
#（6）查询所有年龄20岁以下的学生的姓名及年龄
select sname,sage 
from student 
where sage < 20;
#（7）查询成绩不及格学生的学号
select  s.sno 
from student s 
join sc on s.sno - sc.sno 
where grade < 60;
#（8）查询考试成绩在80～90之间的学生学号、课程号和成绩
select s.sno,c.cno,sc.grade 
from student s 
join sc on s.sno = sc.sno 
join course c on c.cno = sc.cno 
where grade 
between 80 and 90;
#（9）查询考试成绩不在80～90之间的学生学号、课程号和成绩
select s.sno,c.cno,sc.grade 
from student s 
join sc on s.sno = sc.sno 
join course c on c.cno = sc.cno 
where grade 
not between 80 and 90;
#（10）查询信息管理系、通信工程系和计算机系学生的姓名和性别
select sname,ssex,dept 
from student 
order by dept;
#（11）查询信息管理系、通信工程系和计算机系三个系之外的其他系学生的姓名和性别
select sname,ssex 
from student 
where dept 
not in ('信息管理系','通信工程系','计算机系');
#（12）查询姓“张”的学生详细信息
select * 
from student 
where sname 
like '张%';
#（13）查询姓“张”、姓“李”和姓“刘”的学生的详细信息
select * 
from student 
where sname 
like '张%' 
or sname like'李%' 
or sname like '刘%';
#（14）查询名字的第2个字为“小”或“大”的学生的姓名和学号
select * 
from student 
where sname 
like '_小%' 
or sname like'_大%';
#(15) 查询所有不姓“刘”的学生姓名 sname not like '刘%'
select * 
from student 
where sname 
not like '刘%';
#（16）在Student表中查询学号的最后一位不是2、3、5的学生信息
select * 
from student 
where sno 
not like '%2' 
and sno not like '%3' 
and sno not like '%5';
#（17）查询还没有考试的学生的学号和相应的课程号
select sno,cno 
from sc 
where grade is null;
#（18）查询计算机系男生的姓名
select sname 
from student 
where dept = '计算机系' 
and ssex = '男';
#（19）查询C002和C003课程中考试成绩在80～90的学生的学号、课程号和成绩
select sno,cno,grade 
from sc 
where grade between 80 and 90 
and cno in ('C002','C003');
#（20）查询修了“C002”课程的学生的学号及成绩，查询结果按成绩降序排列
select sno,grade 
from sc 
where cno = 'C002' 
order by grade desc;
#（21）查询全体学生详细信息，结果按系名升序排列，同一个系的学生按出生日期降序排列
select * 
from student 
order by dept, (year(now())-sage) desc;
#（22）统计学生总人数
select count(*) 
from student;
#（23）统计选修了课程的学生人数
select count(distinct sno) count
from sc 
where cno is not null;
#（24）计算学号为“0811101”的学生的考试总成绩
select sum(grade) 
from sc 
where sno = '0811101';
#（25）计算“0831103”学生的平均成绩
select avg(grade) 
from sc 
where sno = '0831103';
#（26）查询“C001”课程考试成绩的最高分和最低分
select max(grade),min(grade) 
from sc 
where cno = 'c001';
#（27）统计每门课程的选课人数，列出课程号和选课人数
select count(*),cno 
from sc 
group by cno;
#（28）统计每个学生的选课门数和平均成绩
select sno,count(*),avg(grade) 
from sc 
group by sno;
#（29）统计每个系的女生人数
select count(*) 
from student 
where ssex = '女' 
group by dept;
#（30）统计每个系的男生人数和女生人数以及男生的最大年龄和女生的最大年龄。结果按系名的升序排序
select ssex,count(*),max(sage),min(sage) 
from student 
group by ssex 
order by dept;
#(31) 查询选课门数超过3门的学生的学号和选课门数
select sno,count(*) as count 
from sc 
group by sno 
having count > 3;
 #(32) 查询选课门数大于等于4门的学生学号的和选课门数
select sno,count(*) as count 
from sc 
group by sno 
having count >= 4;
#(33) 查询计算机系和信息管理系每个系的学生人数
select dept,count(*) as count 
from student 
group by dept 
having dept = '计算机系' or dept = '信息管理系' ;