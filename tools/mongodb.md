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


### References

- [mongoDB - tutorialspoint](https://www.tutorialspoint.com/mongodb/index.htm)