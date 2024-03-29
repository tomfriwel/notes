# mysql

- [Linux mysql command](https://www.computerhope.com/unix/mysql.htm#:~:text=The%20mysql%20command%20is%20a%20simple%20shell%20for,run%20a%20batch%20script%20containing%20your%20SQL%20commands.)

### Change password

`mysql>update user set password=password('xxx') where user='root';`

### update a table's one key equal to another key

UPDATE tb` 
SET tb.key0 = tb.key1


### 按月、周、日统计

```sql
select DATE_FORMAT(create_time,'%Y%m%d') days,count(caseid) count from tc_case group by days;
select DATE_FORMAT(create_time,'%Y%u') weeks,count(caseid) count from tc_case group by weeks;
select DATE_FORMAT(create_time,'%Y%m') months,count(caseid) count from tc_case group by months;
```

[MySQL按天，按周，按月，按时间段统计【转载】](https://blog.csdn.net/qq_28056641/article/details/78306870)

### TIMESTAMPDIFF(interval,datetime_expr1,datetime_expr2)

`datetime_expr2 - datetime_expr1 = (interval)result`

### 累计统计

```sql
SET @i = 0;
SELECT  cc.* ,(@i:=@i+cc.当日注册人数) as 累计注册人数
FROM
  (SELECT DATE_FORMAT(create_time,'%Y-%m-%d') as "日期" , count(*) as "当日注册人数" FROM user_t GROUP BY  日期)cc
  CROSS JOIN (select @i := 0) x;
```

[Mysql 统计每日注册人数和累计注册人数](https://blog.csdn.net/u012440725/article/details/82775178)


### 序号

[Mysql查询数据时，自动为结果编上序号](https://blog.csdn.net/arbben/article/details/78665389)


### [ERROR 1205 (HY000): Lock wait timeout exceeded; try restarting transaction的问题解决（备忘）](https://blog.csdn.net/mayor125/article/details/76186661)

Try to delete a record, occur:

`1205 - Lock wait timeout exceeded; try restarting transaction`


### Installing MySQL on macOS

```sh
brew install mysql

# if not run command bellow, will get error: ERROR 2002 (HY000): Can't connect to local MySQL server through socket '/tmp/mysql.sock' (2)
mysql.server start
```

[Can't connect to local MySQL server through socket homebrew](https://stackoverflow.com/a/18090173/6279975)


### Commands

```sh
show databases;
use <database name>
show tables;
show columns from <table name>;
show index from <table name>;
create database <new database name>;

# delete database
drop database <database name>;

CREATE TABLE IF NOT EXISTS `<new table name>`(
   `id` INT UNSIGNED AUTO_INCREMENT,
   `title` VARCHAR(255) NOT NULL,
   `author` VARCHAR(40) NOT NULL,
   `timeCreated` DATE,
   PRIMARY KEY ( `id` )
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

# delete table
drop table <table name>;
```

[MySQL 管理](https://www.runoob.com/mysql/mysql-administration.html)


### INSERT INTO SELECT

```sql
INSERT INTO Websites (name, country)
SELECT app_name, country FROM apps;

-- or

INSERT INTO Websites (name, country)
SELECT app_name, country FROM apps
WHERE id=1;
```

[SQL INSERT INTO SELECT 语句](https://www.runoob.com/sql/sql-insert-into-select.html)

### UPDATE INNER JOIN

```sql
UPDATE T1, T2,
[INNER JOIN | LEFT JOIN] T1 ON T1.C1 = T2. C1
SET T1.C2 = T2.C2, 
    T2.C3 = expr
WHERE condition
```

[[转]MySQL update join语句](https://www.cnblogs.com/dirgo/p/9491777.html)

### GROUP_CONCAT SEPARATOR

```sql

GROUP_CONCAT(<tablecolumn> SEPARATOR '|')

```
[MySQL中使用group_concat()指定分隔符](https://www.cnblogs.com/ljch/p/12205580.html)


### Get week day

```sql
SELECT dayofweek(curdate())-1
```

[mysql 获取星期几，dayofweek()函数](https://www.cnblogs.com/sea-stream/p/11299476.html)


### Date of today and date of yesterday

```sql
-- today
SELECT CURDATE();

-- yesterday
SELECT DATE_ADD(CURDATE(),INTERVAL -1 DAY);
```

[【数据库】MySQL语句获取今天昨天日期、格式化日期](https://blog.csdn.net/m18633778874/article/details/88244539)

### Remote connection

`$ mysql -u root -p'root' -h 127.0.0.1 -P 3306 -D local`

`-D` means database.

### [MySQL Slow Query Log Tutorial](https://www.a2hosting.com/kb/developer-corner/mysql/enabling-the-slow-query-log-in-mysql)


### [Checking Whether a String Contains a Substring](https://www.oreilly.com/library/view/mysql-cookbook/0596001452/ch04s06.html)

### [SELECT list is not in GROUP BY clause and contains nonaggregated column … incompatible with sql_mode=only_full_group_by](https://stackoverflow.com/a/41887627/6279975)

```bash
# mysql command
mysql -u username -p

# Change mode to ONLY_FULL_GROUP_BY
SET GLOBAL sql_mode=(SELECT REPLACE(@@sql_mode,'ONLY_FULL_GROUP_BY',''));

# Reconnect mysql and run the query that previously reported the error
```

### Date formatting
```sql
DATE_FORMAT(`datetime_added`,'%Y-%m')

Specifier   Description
%a  Abbreviated weekday name (Sun..Sat)
%b  Abbreviated month name (Jan..Dec)
%c  Month, numeric (0..12)
%D  Day of the month with English suffix (0th, 1st, 2nd, 3rd, …)
%d  Day of the month, numeric (00..31)
%e  Day of the month, numeric (0..31)
%f  Microseconds (000000..999999)
%H  Hour (00..23)
%h  Hour (01..12)
%I  Hour (01..12)
%i  Minutes, numeric (00..59)
%j  Day of year (001..366)
%k  Hour (0..23)
%l  Hour (1..12)
%M  Month name (January..December)
%m  Month, numeric (00..12)
%p  AM or PM
%r  Time, 12-hour (hh:mm:ss followed by AM or PM)
%S  Seconds (00..59)
%s  Seconds (00..59)
%T  Time, 24-hour (hh:mm:ss)
%U  Week (00..53), where Sunday is the first day of the week
%u  Week (00..53), where Monday is the first day of the week
%V  Week (01..53), where Sunday is the first day of the week; used with %X
%v  Week (01..53), where Monday is the first day of the week; used with %x
%W  Weekday name (Sunday..Saturday)
%w  Day of the week (0=Sunday..6=Saturday)
%X  Year for the week where Sunday is the first day of the week, numeric, four digits; used with %V
%x  Year for the week, where Monday is the first day of the week, numeric, four digits; used with %v
%Y  Year, numeric, four digits
%y  Year, numeric (two digits)
%%  A literal “%” character
%x  x, for any “x” not listed above 
```

[如何让MySQLMonth()使用前导零？](https://cloud.tencent.com/developer/ask/49634)

### 类型转换查询慢

比如表字段类型是`varchar`，查询数据是`int`，尽量保持字段类型一致。