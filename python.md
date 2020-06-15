#### Generate random string

```python
import uuid
filename = str(uuid.uuid4())
```

[Best way to generate random file names in Python](https://stackoverflow.com/a/10501355/6279975)

#### Delete dict key

`my_dict.pop('key', None)`

[How to remove a key from a Python dictionary?](https://stackoverflow.com/a/11277439/6279975)

#### TypeError: the JSON object must be str, bytes or bytearray, not 'TextIOWrapper'

change `json.loads` to `json.load`


[python中读取json文件时报错，TypeError：the Json object must be str, bytes or bytearray，not ‘TextIOWrapper’](https://blog.csdn.net/not_guy/article/details/80954328)


#### [How do I check whether a module is installed in Python, and install it if needed?](https://askubuntu.com/a/588392/707430)

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

#### About time

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


#### [gzip — Support for gzip files](https://docs.python.org/3/library/gzip.html)

Example of how to GZIP compress an existing file:

```python
import gzip
import shutil
with open('/home/joe/file.txt', 'rb') as f_in:
    with gzip.open('/home/joe/file.txt.gz', 'wb') as f_out:
        shutil.copyfileobj(f_in, f_out)
```

#### [Python 判断文件/目录是否存在](https://www.runoob.com/w3cnote/python-check-whether-a-file-exists.html)

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