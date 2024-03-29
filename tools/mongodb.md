# mongoDB

```
show dbs
demo # for example

use 
show collections
test # for example
```

### Installation on macOS

```shell
# use untap to remove
brew tap mongodb/brew
brew install mongodb-community@4.4

# check location
brew --prefix

# check version
mongo --version

# run as a macOS service
brew services start mongodb-community@4.4

# stop running as service
brew services stop mongodb-community@4.4

# run
mongo

# exit mongo
exit
```

[Install MongoDB Community Edition on macOS](https://docs.mongodb.com/manual/tutorial/install-mongodb-on-os-x/)

### find filter: contains string

`$ db.test.find({key: {$regex: /someString/}})`


### filter key value in sub object

`$ db.test.find({'key.subObjectKey': 'someString'})`

### sort asc/desc

`$ db.collection.find({'key1':'123', 'key2':'abc'}).sort({'key1':1})`

`$ db.collection.find({'key1':'123', 'key2':'abc'}).sort({'key2':-1})`

### limit

`$ db.collection.find({'key1':'123', 'key2':'abc'}).limit(2)`

### not equal

`$ db.collection.find({'key1':'123', 'key2': {$ne: 'abc'}})`

### not in

`$ db.collection.find({'key1':'123', 'key2': {$nin: ['abc', 'bcd']}})`

### create index

```js
// db.collection.createIndex(keys, options)
// 后台创建索引
db.collection.createIndex({ userId:1 }, {background: true})

// 查看集合索引
db.col.getIndexes()

// 查看集合索引大小（byte）
db.col.totalIndexSize()

// 删除集合所有索引
db.col.dropIndexes()

// 删除集合指定索引
db.col.dropIndex("索引名称")
```

- [MongoDB 索引](https://www.runoob.com/mongodb/mongodb-indexing.html)

### References

- [mongoDB - tutorialspoint](https://www.tutorialspoint.com/mongodb/index.htm)
- [MongoDB 教程](https://www.runoob.com/mongodb/mongodb-tutorial.html)