#### virtualenv

```shell
virtualenv alpha
cd alpha/
source bin/activate
pip install sqlalchemy pymysql
mkdir code
```

#### inner outter network

```
sudo vim /etc/resolv.conf
find / -name hosts
sudo find / -name hosts
sudo vim /etc/hosts
ping address
```

#### all read

`$ sudo chmod a+r file`


#### DNS hosts解析

DNS将域名解析成IP地址，但如果域名被劫持或者别人没有域名想要借用别人的，这是后可以在hosts添加相应的记录，强制域名解析到指定IP地址。