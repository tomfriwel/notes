# mongoDB

```
show dbs
demo # for example

use 
show collections
test # for example
```

### find filter: contains string

`$ db.test.find({key: {$regex: /someString/}})`


### filter key value in sub object

`$ db.test.find({'key.subObjectKey': 'someString'})`

### sort asc/desc

`$ db.collection.find({'key1':'123', 'key2':'abc'}).sort({'key1':1})`

`$ db.collection.find({'key1':'123', 'key2':'abc'}).sort({'key2':-1})`

### limit

`$ db.collection.find({'key1':'123', 'key2':'abc'}).limit(2)`


### References

- [mongoDB - tutorialspoint](https://www.tutorialspoint.com/mongodb/index.htm)
- [MongoDB 教程](https://www.runoob.com/mongodb/mongodb-tutorial.html)