## DQL对查询结果排序

order by 

   语法

​     SELECT  [ DISTINCT ]  * | 列名 | 表达式 [别名] [,...] 

​	FROM    表名

​	[WHERE  条件]

​	[ORDER BY 列名1  |  列别名1  | 列序号1 [ ASC | DESC ],   列名2  |  列别名2  |  列序号2 [ ASC | DESC ];

​    **asc（默认）**-->升序排列   **desc**-->降序排列 

**例**：

```mysql
SELECT    ename, deptno, sal 
FROM      emp 
ORDER BY  deptno ASC, sal DESC;
```



## DQL-多表查询

**多表连接的语法：**

```mysql
SELECT    table1.column, table2.column
FROM    table1, table2
WHERE    table1.column1 = table2.column2;
```



夺标链接的分类

*按连接条件分*：

​		**等值连接**

​		**非等值连接**

*按其他连接方法分*：

​		**内连接**

​		**外连接**

**笛卡尔积书写方法**：

```mysql
SELECT emp.empno,emp.ename,emp.deptno,dept.deptno, dept.loc 
FROM emp,dept;
```

**等值连接**：

```mysql
SELECT emp.empno,emp.ename,emp.deptno,dept.deptno, dept.loc
FROM emp, dept
WHERE emp.deptno=dept.deptno;


```

使用and运算符增加其他查询条件

```mysql
SELECT emp.empno,emp.ename,emp.deptno,dept.deptno, dept.loc
FROM emp, dept
WHERE emp.deptno=dept.deptno and loc= ‘NEW YORK’;
```

**使用表的别名：**

```mysql
SELECT emp.empno,emp.ename,emp.deptno,dept.deptno,dept.loc
FROM emp, dept
WHERE emp.deptno=dept.deptno;
```

```mysql
SELECT e.empno,e.ename,e.deptno,d.deptno,d.loc
FROM emp e,dept d
WHERE e.deptno= d.deptno;
```

非等值连接

```mysql
SELECT e.ename,e.sal,s.grade
FROM emp e, salgrade s
WHERE e.sal
BETWEEN s.losal AND s.hisal;
```

**自连接：**

```mysql
SELECT worker.ename ‘WNAME’,manager.ename ‘LNAME’
FROM emp worker,emp manager
WHERE worker.mgr = manager.empno;
```

**ANSI SQL：标准的连接语法**：

```mysql
SELECT table1.column,table2.column
FROM table1
JOIN table2  ON(table1.column_name = table2.column_name)]
```

**左外连接写法：**

```mysql
SELECT e.ename,e.deptno,d.loc 
FROM emp e 
LEFT OUTER JOIN dept d 
ON  (e.deptno = d.deptno);
```

**右外连接写法：**

```mysql
SELECT e.ename,e.deptno,d.loc 
FROM emp e 
RIGHT OUTER JOIN dept d 
ON  (e.deptno = d.deptno);
```

**联合查询：**

**UNION [ALL]**						**UNION **区别

**UNION [ALL]**	合并数据不去重

**UNION**			合并数据去重

```mysql
SELECT e.empno,e.ename,d.deptno,d.dname 
FROM emp e LEFT OUTER JOIN dept d ON(e.deptno = d.deptno)
UNION [ALL]
SELECT e.empno,e.ename,d.deptno,d.dname 
FROM emp e RIGHT OUTER JOIN dept d ON(e.deptno = d.deptno);
```

## DQL分组函数

**分组函数**

![image-20240709171409320](C:\Users\Administrator\AppData\Roaming\Typora\typora-user-images\image-20240709171409320.png)

**分组函数语法：**

```mysql
SELECT 列名,分组函数

FROM 表名

WHERE 条件表达式

ORDER BY 列名;
```

**MIN和MAX函数主要是返回每组的最小值和最大值，语法如下：**

**MIN( [ DISTINCT | ALL ] 列名 | 表达式 )**

**MAX( [ DISTINCT | ALL ] 列名 | 表达式 )**

例：

```mysql
SELECT  MIN(hiredate), MAX(hiredate) 
FROM emp;
```

**SUM和AVG函数分别返回每组的总和及平均值，语法如下**：

**SUM( [ DISTINCT | ALL ] 列名 | 表达式 )**

**AVG( [ DISTINCT | ALL ] 列名 | 表达式 )**

例：查询职位以SALES开头的所有员工 工资和、平均工资

```mysql
SELECT SUM(sal),AVG(sal) 
FROM emp 
WHERE job LIKE 'SALES%';
```

**COUNT函数用来返回满足条件的每组记录个数，语法如下：**

COUNT( [ DISTINCT | ALL ] 列名 | 表达式 )：返回满足条件的每组**非空**记录个数。

例：查询部门30有多少个员工有津贴

```mysql
SELECT COUNT(comm) 
FROM emp 
WHERE deptno = 30;
```

