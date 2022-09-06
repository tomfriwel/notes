### Generate random string

```python
import uuid
filename = str(uuid.uuid4())
```

[Best way to generate random file names in Python](https://stackoverflow.com/a/10501355/6279975)

### Delete dict key

`my_dict.pop('key', None)`

[How to remove a key from a Python dictionary?](https://stackoverflow.com/a/11277439/6279975)

### TypeError: the JSON object must be str, bytes or bytearray, not 'TextIOWrapper'

change `json.loads` to `json.load`


[python中读取json文件时报错，TypeError：the Json object must be str, bytes or bytearray，not ‘TextIOWrapper’](https://blog.csdn.net/not_guy/article/details/80954328)


### [How do I check whether a module is installed in Python, and install it if needed?](https://askubuntu.com/a/588392/707430)

```shell
$ python -c "import math"
$ echo $?
0                                # math module exists in system

$ python -c "import numpy"
Traceback (most recent call last):
  File "<string>", line 1, in <module>
ImportError: No module named numpy
$ echo $?
1                                # numpy module does not exist in system
```

### About time

```python
from datetime import date, timedelta

# Let's say it's Monday
today = date.today()
# datetime.date(2020, 6, 15)

last_week_start = today - timedelta(days=today.weekday()+7)
# today.weekday() = 0
# datetime.date(2020, 6, 8)
# last_week_start.weekday() = 0
# str(last_week_start) = '2020-06-08'

last_week_end = today - timedelta(days=today.weekday()+1)
# datetime.date(2020, 6, 14)
# last_week_end.weekday() = 6
```

[datetime — Basic date and time types](https://docs.python.org/3/library/datetime.html)


### [gzip — Support for gzip files](https://docs.python.org/3/library/gzip.html)

Example of how to GZIP compress an existing file:

```python
import gzip
import shutil
with open('/home/joe/file.txt', 'rb') as f_in:
    with gzip.open('/home/joe/file.txt.gz', 'wb') as f_out:
        shutil.copyfileobj(f_in, f_out)
```

### [Python 判断文件/目录是否存在](https://www.runoob.com/w3cnote/python-check-whether-a-file-exists.html)

```python
import os.path

# 检测文件是否存在：
os.path.isfile(fname)

if my_file.is_dir():
    # 指定的目录存在

# 如果要检测路径是一个文件或目录可以使用 exists() 方法：
if my_file.exists():
    # 指定的文件或目录存在
```

### View moudel version

`$  python -c "import sqlalchemy; print(sqlalchemy.__version__)"`

[How to check version of python modules?](https://stackoverflow.com/questions/20180543/how-to-check-version-of-python-modules)


### sort list

`sort`: change original list

`sorted`: keep original list and return sorted list


[Python列表排序方法reverse、sort、sorted详解](https://www.cnblogs.com/jsdd/p/11654860.html)

### Ternary operator

`b =  a > 1? "Greater thant 1":"Less than or equal to 1"`

[python中的三元表达式（三目运算符）](https://www.cnblogs.com/ellisonzhang/p/10242626.html)


### Remove dulplicate items in list

[python：对list去重](https://www.cnblogs.com/gcgc/p/11474369.html)


### InsecureRequestWarning: Unverified HTTPS request is being made.

[解决Python3 控制台输出InsecureRequestWarning的问题](https://www.cnblogs.com/ernana/p/8601789.html)


### compare list

```
print set(a) & set(b) # 交集, 等价于set(a).intersection(set(b))
print set(a) | set(b) # 并集, 等价于set(a).union(set(b))
print set(a) - set(b) # 差集，在a中但不在b中的元素, 等价于set(a).difference(set(b))
print set(b) - set(a) # 差集，在b中但不在a中的元素, 等价于set(b).difference(set(a))
```

[[Python] 比较两个数组的元素的异同](https://www.cnblogs.com/bymo/p/7376363.html)

### Safe cast

```python
def safe_cast(val, to_type, default=None):
    try:
        return to_type(val)
    except (ValueError, TypeError):
        return default

safe_cast('tst', int) # will return None
safe_cast('tst', int, 0) # will return 0
```

- [Safe casting in python](https://stackoverflow.com/a/6330109/6279975)


### UnicodeDecodeError: 'ascii' codec can't decode byte 0x90 in position 614: ordinal not in range(128)

`cPickle.load(f)` to `cPickle.load(f, encoding='bytes')`

- [成功解决Python3版UnicodeDecodeError: ‘ascii‘ codec can‘t decode byte 0x90 in position 614: ordinal not in](https://blog.csdn.net/qq_41185868/article/details/79039604#:~:text=UnicodeDecodeError%3A%20%27ascii%27%20codec%20can%27t%20decode%20byte%200x90%20in,in%20position%20614%3A%20ordinal%20not%20in%20range%20%28128%29)

### TypeError: object of type 'zip' has no len()

`net.SGD(training_data, 30, 10, 3.0, test_data=test_data)` to `net.SGD(list(training_data), 30, 10, 3.0, test_data=list(test_data))`

- [object of type ‘zip‘ has no len()](https://blog.csdn.net/duohuanxi/article/details/109704121)


### NameError: name 'xrange' is not defined

replace `xrange` to `range`

- [NameError: name 'xrange' is not defined报错的原因](https://www.cnblogs.com/xiaogangblog/p/13437497.html#:~:text=NameError%3A%20name%20%27xrange%27%20is%20not%20defined报错的原因,xrange%20%28%29函数时在python%202.x中的一个函数，在Python%203中，range%20%28%29的实现方式与xrange%20%28%29函数相同，所以就不存在专用的xrange%20%28%29，因此，当遇到这种问题时，有两种方法可以解决这个问题%E3%80%82)