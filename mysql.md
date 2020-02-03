### Change password

`mysql>update user set password=password('xxx') where user='root';`

### update a table's one key equal to another key

UPDATE tb` 
SET tb.key0 = tb.key1


#### 按月、周、日统计

```sql
select DATE_FORMAT(create_time,'%Y%m%d') days,count(caseid) count from tc_case group by days;
select DATE_FORMAT(create_time,'%Y%u') weeks,count(caseid) count from tc_case group by weeks;
select DATE_FORMAT(create_time,'%Y%m') months,count(caseid) count from tc_case group by months;
```

[MySQL按天，按周，按月，按时间段统计【转载】](https://blog.csdn.net/qq_28056641/article/details/78306870)

#### TIMESTAMPDIFF(interval,datetime_expr1,datetime_expr2)

`datetime_expr2 - datetime_expr1 = (interval)result`

#### 累计统计

```sql
SET @i = 0;
SELECT  cc.* ,(@i:=@i+cc.当日注册人数) as 累计注册人数
FROM
  (SELECT DATE_FORMAT(create_time,'%Y-%m-%d') as "日期" , count(*) as "当日注册人数" FROM user_t GROUP BY  日期)cc
  CROSS JOIN (select @i := 0) x;
```

[Mysql 统计每日注册人数和累计注册人数](https://blog.csdn.net/u012440725/article/details/82775178)


#### 序号

[Mysql查询数据时，自动为结果编上序号](https://blog.csdn.net/arbben/article/details/78665389)


#### [ERROR 1205 (HY000): Lock wait timeout exceeded; try restarting transaction的问题解决（备忘）](https://blog.csdn.net/mayor125/article/details/76186661)

Try to delete a record, occur:

`1205 - Lock wait timeout exceeded; try restarting transaction`