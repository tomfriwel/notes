# nginx

#### reload config

`$ nginx -s reload`

[nginx的启动、停止、重载配置、验证配置](https://www.cnblogs.com/sea-stream/p/10201195.html)

#### IP

```conf
location / {
    allow 123.34.12.123;
    allow 11.22.33.1/100;
    deny  all;
}
```

[Nginx配置IP白名单和黑名单](https://www.cnblogs.com/xiaozong/p/5683638.html)