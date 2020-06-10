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