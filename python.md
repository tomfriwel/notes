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