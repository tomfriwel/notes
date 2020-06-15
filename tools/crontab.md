# crontab(linux)

This tool can run task every time when you setting up.


### Install

`$ yum install cronie`

### Examples

```shell
# Command is executed every Monday at 9:55 a.m
55 9 * * 1 python exec.py
```

### Tips

Every five minutes  */5 * * * *

Every hour     0 * * * *

Every day        0 0 * * *

Every week       0 0 * * 0

Every month        0 0 1 * *

Every year       0 0 1 1 *

### View task list

`$ crontab -l`

### Edit task

`$ crontab -e`


### View online

[Online tool](https://tool.lu/crontab/)