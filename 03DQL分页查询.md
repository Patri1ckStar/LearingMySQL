# DQL分页查询

分页查询语法：

```mysql
SELECT 字段列表
FROM 数据源
LIMIT [start,]length;
```

**查询员工表第二页的数据（每页显示4条记录）**

结果：

![image-20240711083024356](C:\Users\Administrator\AppData\Roaming\Typora\typora-user-images\image-20240711083024356.png)

# DQL子查询

子查询语法：

```mysql
SELECT    select_list
FROM    table
WHERE    expr operator
			(	SELECT    select_list
        FROM     table);
```

- expr operator包括比较运算符

- - 单行运算符：>、=、>=、<、<>、<=
  - 多行运算符： IN、ANY、ALL

- 子查询可以嵌于以下SQL子句中：

- - WHERE子句
  - HAVING子句
  - FROM子句

**查询出比JONES为雇员工资高的其他雇员**

```mysql
SELECT ename
FROM   emp
WHERE  sal > 
	(	SELECT sal
 		FROM   emp   
 		WHERE  ename='JONES');
```

![image-20240711083242254](C:\Users\Administrator\AppData\Roaming\Typora\typora-user-images\image-20240711083242254.png)

**单行子查询**

- 子查询只返回一行一列
- 使用单行运算符

![image-20240711083427115](C:\Users\Administrator\AppData\Roaming\Typora\typora-user-images\image-20240711083427115.png)

**显示和雇员7369从事相同工作并且工资大于雇员7876的雇员的姓名和工作。**

```mysql
SELECT   ename, job  
FROM     emp
WHERE    job = 
(SELECT job    FROM  emp WHERE empno = 7369)  
AND  sal > 
(SELECT sal FROM  emp WHERE    empno = 7876);
```

**子查询中使用组函数**

```mysql
SELECT    ename, job, sal
FROM    emp
WHERE    sal = (SELECT  MIN(sal) FROM emp);
```

**HAVING子句中使用子查询**

```mysql
SELECT    deptno, MIN(sal)
FROM    emp
GROUP BY    deptno
HAVING    MIN(sal) >
(SELECT    MIN(sal)
         FROM    emp
         WHERE    deptno = 20);
```

**多行子查询**

- 和多行子查询进行比较时，需要使用多行操作符，多行操作符包括：

- - IN
  - ANY
  - ALL

**IN操作符的使用**

```mysql
SELECT  ename, sal
FROM    emp
WHERE   empno IN (SELECT mgr
                  FROM  emp);
```

![image-20240711083727881](C:\Users\Administrator\AppData\Roaming\Typora\typora-user-images\image-20240711083727881.png)

**ANY操作符的使用**

- ANY：表示和子查询的任意一行结果进行比较，有一个满足条件即可。

- - < ANY：表示小于子查询结果集中的任意一个，即小于最大值就可以。
  - \> ANY：表示大于子查询结果集中的任意一个，即大于最小值就可以。
  - = ANY：表示等于子查询结果中的任意一个，即等于谁都可以，相当于IN。

```mysql
SELECT    ename, sal
FROM    emp
WHERE   empno = ANY (SELECT mgr
                       FROM   emp);
```

**ALL操作符的使用**

- ALL：表示和子查询的所有行结果进行比较，每一行必须都满足条件。

- - < ALL:表示小于子查询结果集中的所有行，即小于最小值。
  - \>ALL:表示大于子查询结果集中的所有行，即大于最大值。
  - = ALL :表示等于子查询结果集中的所有行,即等于所有值，通常无意义。

```mysql
SELECT empno, ename,job, sal
FROM     emp
WHERE     sal > ALL (SELECT sal
                     FROM   emp
                     WHERE  deptno= 20)
AND    deptno <> 20;
```

**在 FROM 子句中使用子查询**

查询比自己部门平均工资高的员工姓名，工资，部门编号，部门平均工资

```mysql
SELECT  a.ename, a.sal, a.deptno, b.salavg
FROM    emp a, (SELECT   deptno, AVG(sal) salavg
                FROM     emp
                GROUP BY deptno) b
WHERE   a.deptno = b.deptno  AND    a.sal > b.salavg;
```

