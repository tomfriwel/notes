# sqlalchemy(python)

#### [How to increase a counter in SQLAlchemy](https://stackoverflow.com/a/2334917/6279975)


#### MYSQL TIMESTAMPDIFF

`sa.func.timestampdiff(text('second'), datetime1, datetime2)  # datetime2 - datetime1`


#### [How to close sqlalchemy connection in MySQL](https://stackoverflow.com/questions/8645250/how-to-close-sqlalchemy-connection-in-mysql)

```python
db = create_engine('mysql://root@localhost/test_database')
for i in range(1,2000):
    conn = db.connect()
    #some simple data operations
    conn.close()
db.dispose()
```

#### funcs

```python
.sort_by()
.group_by()

# group concat & concat
func.group_concat(func.concat(table.c.column1, '-', table.c.column2).distinct()).label('otherName'),

```

#### LIMIT

``python
query.limit(limit).offset(offset)
```

[Applying LIMIT and OFFSET to all queries in SQLAlchemy](https://stackoverflow.com/questions/13258934/applying-limit-and-offset-to-all-queries-in-sqlalchemy)