# sqlalchemy(python)

#### Documentation

[SQLAlchemy 1.3 Documentation](https://docs.sqlalchemy.org/en/13/index.html)

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

```python
sqlalchemy.select(["""..."""]).select_from(table).limit(limit).offset(offset)
```
[Applying LIMIT and OFFSET to all queries in SQLAlchemy](https://stackoverflow.com/questions/13258934/applying-limit-and-offset-to-all-queries-in-sqlalchemy)

#### SELECT *

```python
sqlalchemy.select([sqlalchemy.text('*')]).select_from(table)
```

[SELECT * in SQLAlchemy?](https://stackoverflow.com/questions/636548/select-in-sqlalchemy)

#### subquery (alias)

```python
subquery = sqlalchemy.select(["""..."""]).select_from(table1).alias()

query = sqlalchemy.select(["""..."""]).select_from(
    subquery.join(
        table2,
        """some condition"""
    )
)
```