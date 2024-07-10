# 1、按照班级名称统计每个班级成绩最高分和最低分，请编写SQL语句完成此功能。

select classname.cname,max(score) '最高分',min(score) '最低分' 
from student 
join classname on (student.classid = classname.cid) 
group by classname.cname;

# 2、查询每位老师所带班级的平均成绩，请编写SQL语句完成此功能

select avg(score),student.classid,classname.cname,teacher.tname 
from student 
join classname on classname.cid = student.classid 
join teacher on teacher.tid = classname.tid 
where classid in (select cid from classname where tid in (select tid from teacher)) 
group by classname.cname;

# 3、查询哪些班级及格学生人数在10以上，显示出班级名称和人数，请编写SQL语句完成此功能。

select classname.cname,count(sid) 
from classname 
join student on student.classid = classname.cid 
where score > 60 
group by student.classid 
having count(sid) > 10;

# 4、查询软件工程1班的成绩前3名的学生信息，请编写SQL语句完成此功能。

select sid,sname,ssex,birthday,score,classid 
from student 
where classid = (select cid from classname where cname = '软件工程1班') 
order by score 
desc limit 3;

# 5、查询软件工程2班成绩最高的学生是谁，请编写SQL语句完成此功能。

select sname,score 
from student 
where classid = (select cid from classname where cname = '软件工程2班') 
order by score 
desc limit 1;

# 6、查询每一位讲师所带每个班级中成绩最高的学生是谁，请编写SQL语句完成此功能

select teacher.tid,teacher.tname,student.sname,max(score),classname.cname
from student 
join classname on student.classid = classname.cid 
join teacher on teacher.tid = classname.tid 
where classid in (select cid 
									from classname 
									where tid in (select tid from teacher))group by classid
									
# 7、哪位老师所带班级平均成绩是最高的，请编写SQL语句完成此功能

select teacher.tname,student.sname,avg(score),classname.cname 
from student 
join classname on student.classid = classname.cid 
join teacher on teacher.tid = classname.tid
where classid in (select cid from classname where tid in (select tid from teacher)) group by classname.cname;