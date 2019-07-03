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