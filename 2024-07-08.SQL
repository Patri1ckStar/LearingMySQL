create table student (sno varchar(7),sname varchar(10) not null,ssex varchar(2),sage int,dept varchar(20));

ALTER TABLE student ADD CONSTRAINT pk_student PRIMARY KEY(sno);


INSERT INTO student (sno, sname, ssex,sage,dept) VALUES (0811101, '李勇', '男',21,'计算机系');
INSERT INTO student (sno, sname, ssex,sage,dept) VALUES (0811102, '刘晨', '男',20,'计算机系');
INSERT INTO student (sno, sname, ssex,sage,dept) VALUES (0811103, '王敏', '女',20,'计算机系');
INSERT INTO student (sno, sname, ssex,sage,dept) VALUES (0811104, '张小红', '女',19,'计算机系');
INSERT INTO student (sno, sname, ssex,sage,dept) VALUES (0821101, '张立', '男',20,'信息管理系');
INSERT INTO student (sno, sname, ssex,sage,dept) VALUES (0821102, '吴宾', '女',19,'信息管理系');
INSERT INTO student (sno, sname, ssex,sage,dept) VALUES (0821103, '张海', '男',20,'信息管理系');
INSERT INTO student (sno, sname, ssex,sage,dept) VALUES (0831101, '钱小平', '女',21,'通信工程系');
INSERT INTO student (sno, sname, ssex,sage,dept) VALUES (0831102, '王大力', '男',20,'通信工程系');
INSERT INTO student (sno, sname, ssex,sage,dept) VALUES (0831103, '张姗姗', '女',19,'通信工程系');


create table course(cno varchar(10),cname varchar(20) not null,credit int,semester int);

ALTER TABLE course ADD CONSTRAINT pk_course PRIMARY KEY(cno);

INSERT INTO course (cno,cname,credit,semester) VALUES ('C001','高等数学',4,1);
INSERT INTO course (cno,cname,credit,semester) VALUES ('C002','大学英语',3,1);
INSERT INTO course (cno,cname,credit,semester) VALUES ('C003','大学英语',3,2);
INSERT INTO course (cno,cname,credit,semester) VALUES ('C004','计算机文化学',2,2);
INSERT INTO course (cno,cname,credit,semester) VALUES ('C005',' Java',2,3);
INSERT INTO course (cno,cname,credit,semester) VALUES ('C006','数据库基础',4,5);
INSERT INTO course (cno,cname,credit,semester) VALUES ('C007','数据结构',4,4);
INSERT INTO course (cno,cname,credit,semester) VALUES ('C008','计算机网络',4,4);

create table sc(sno varchar(7),cno varchar(10),grade int,primary key(sno,cno));

INSERT INTO sc (sno,cno,grade) VALUES (0811101,'C001',96);
INSERT INTO sc (sno,cno,grade) VALUES (0811101,'C002',80);
INSERT INTO sc (sno,cno,grade) VALUES (0811101,'C003',84);
INSERT INTO sc (sno,cno,grade) VALUES (0811101,'C005',62);
INSERT INTO sc (sno,cno,grade) VALUES (0811102,'C001',92);
INSERT INTO sc (sno,cno,grade) VALUES (0811102,'C002',90);
INSERT INTO sc (sno,cno,grade) VALUES (0811102,'C004',84);
INSERT INTO sc (sno,cno,grade) VALUES (0811102,'C006',76);
INSERT INTO sc (sno,cno,grade) VALUES (0811102,'C003',85);
INSERT INTO sc (sno,cno,grade) VALUES (0811102,'C005',73);
INSERT INTO sc (sno,cno,grade) VALUES (0811102,'C007',null);
INSERT INTO sc (sno,cno,grade) VALUES (0811103,'C001',50);
INSERT INTO sc (sno,cno,grade) VALUES (0811103,'C004',80);
INSERT INTO sc (sno,cno,grade) VALUES (0831101,'C001',50);
INSERT INTO sc (sno,cno,grade) VALUES (0831101,'C004',80);
INSERT INTO sc (sno,cno,grade) VALUES (0831102,'C007',null);
INSERT INTO sc (sno,cno,grade) VALUES (0831103,'C004',78);
INSERT INTO sc (sno,cno,grade) VALUES (0831103,'C005',65);
INSERT INTO sc (sno,cno,grade) VALUES (0831103,'C007',null);






