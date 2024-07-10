# MySQL数据库

## 一、数据库描述

​		1、关系型数据库贴点：

​			使用二维表来存储数据，格式统一，便于维护。

​			使用SQL语句操作数据库，标准统一，使用方便。

​			数据存储在磁盘中，相对安全。

​		2、重点掌握

​				DML ：

​				DQL ：

​				TCL：

​		3、DBMS、数据库和表的关系

​			![image-20240708160752805](C:\Users\Administrator\AppData\Roaming\Typora\typora-user-images\image-20240708160752805.png)

​			DBMS包含数据库，数据库包含表。

​		4、课后习题

1. 关系型数据库的特点？
2. DBMS、数据库和表的关系？
3. 以下哪种数据库不是关系型数据库（   ）

​		A. ORACLE

​		B. MySQL

​		C. SQLServer

​		D. Redis

1. 以下关于连接MySQL数据库方式"mysql -hxxx -Pxxx -uxxx -pxxx"说法错误的是（   ）

​		A. -h表示要连接的主机IP

​		B. -P表示MySQL数据库端口号

​		C. -u表示使用哪个用户进行连接

​		D. -ps表示用户的密码

1. 关于MySQL数据库服务操作，以下说法错误的是（  ）

​		A. 使用MySQL数据库前一定要启动服务，否则将无法使用

​		B. 启动服务和停止服务只能通过window操作系统中的管理服务进行设置

​		C. 启动服务可以通过 net start 数据库服务名 命令来进行设置

​		D.启动服务和停止服务都有两种操作方式

## 二、结构化查询语言

​		1、什么是SQL：

​					结构化查询语言(Structured Query Language)。SQL是**用于存取数据以及查询、更新和			管理关系数据库系统的标准语言**

​		2.SQL语言分类

​			![image-20240708161641689](C:\Users\Administrator\AppData\Roaming\Typora\typora-user-images\image-20240708161641689.png)

  **DDL**改变表结构     **DML**改变表的数据

​		2、课后题

​			1、以下哪项不是SQL语言的分类（   ）

​				A. DDL 	B. DQL	C. DLL	D. DML



​			2、以下关于SQL书写规范错误的是（   ）

​				A. SQL语句可以单行书写，也可以多行书写

​				B. SQL语句不区分大小写，表名和字段名也不区分大小写

​				C. SQL语句关键子可以缩写或者简写，简化SQL编写

​				D. 适当增加缩进或者换行，可以提高SQL语句的可读性



​			3、关于DML语言的用途，以下说法正确的是（   ）

​				A. 用来定义数据库、表及其它对象的结构

​				B. 用来增加、修改、删除表中的数据

​				C. 用来查询表中的数据

​				D. 用来授予和收回权限

## 三、DQL简单查询

​		1、查询语句

```mysql
SELECT  *  FROM  dept;
```

​				或者

```mysql
SELECT deptno,dname,loc FROM dept;
```

​		2、查询指定行

```mysql
SELECT deptno,loc FROM dept;
```

​		3、算术运算符

| 运算符 | 作用 |
| :----: | :--: |
|   +    |  加  |
|   -    |  减  |
|   *    |  乘  |
|   /    |  除  |

​			例：查询每个员工的姓名，工资，以及工资增加300后的金额。

```mysql
		SELECT ename, sal, sal+300  FROM    emp;
```

​		4、别名

​				SELECT   列名1 | 表达式1 **[as]  [列别名1]，**

​             	 列名2 | 表达式2  **[as]   [列别名2]，**

​	..列名n | 表达式n  **[as]   [列别名n]**

​	FROM    table;

```mysql
SELECT　NAME , SAL , SAL*12 [as] YearSal FROM　EMP;
```

![image-20240708202953999](C:\Users\Administrator\AppData\Roaming\Typora\typora-user-images\image-20240708202953999.png)