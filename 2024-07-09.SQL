create table className (cid integer ,cname varchar(20),classroom varchar(20),tid integer);
insert into className (cid,cname,classroom,tid)
VALUES(101,'软件工程1班','2号教学楼202',20190210),
(102,'软件工程2班','1号教学楼103',20183025),
(103,'软件工程3班','2号教学楼206',20190210),
(104,'计算机1班','3号教学楼303',20200222);

create table teacher (tid integer ,tname varchar(20),teach varchar(20));
insert into teacher (tid,tname,teach)
VALUES(20190210,'李晓','操作系统'),
(20183025,'王峰','数据库原理'),
(20200222,'赵毅','设计模式')

select sname,score,classId,sid
from sd
where score>=60
order by score desc;

select sd.sname,className.cname,className.cid,teacher.tid,teacher.tname
from sd 
join className
on (sd.classId = className.cid)
join teacher
on (className.tid = teacher.tid);

select sd.*,className.classroom
from sd join className
on (sd.classId = className.cid)
where className.classroom like '2%'
and sd.ssex = '男';

select className.cname,className.classroom,teacher.tname,teacher.tid
from teacher
join className
on (teacher.tid = className.tid)
where teacher.teach = '操作系统'
and className.classroom like '2%';

select sd.sname,teacher.tname,className.classroom
from teacher
join className
on (teacher.tid = className.tid)
left outer join sd
on (sd.classId = className.cid);

select teacher.tname,className.classroom
from teacher 
left outer join className
on (teacher.tid = className.tid);



