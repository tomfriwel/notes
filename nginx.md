# nginx

### reload config

`$ nginx -s reload`

[nginx的启动、停止、重载配置、验证配置](https://www.cnblogs.com/sea-stream/p/10201195.html)

### IP

```conf
location / {
    allow 123.34.12.123;
    allow 11.22.33.1/100;
    deny  all;
}
```

[Nginx配置IP白名单和黑名单](https://www.cnblogs.com/xiaozong/p/5683638.html)


### Forbidden access files with specified extension

```conf
location ~* \.(ini|docx|txt|doc)$ { 
     deny all;
} 
location ~* \.html$ {
     deny all;
}
```

### Nginx 502 with Codeigniter

Finally found is pho-fpm version error.

```conf
location ~ \.php$ {
     # ...
     fastcgi_pass unix:/var/run/php/php7.3-fpm.sock;
     # ...
}
```

### Refs

- [Nginx实现URL重写](https://www.cnblogs.com/dalaoyang/p/10264919.html)
- [Ubuntu 18.04系统用Nginx替换Apache的方法](https://www.laozuo.org/14171.html)
- [How to Install Nginx, PHP 7.3 (LEMP stack) on Ubuntu 18.04 | Google Cloud](https://www.cloudbooklet.com/how-to-install-nginx-php-7-3-lemp-stack-on-ubuntu-18-04-google-cloud/)
- [Nginx - Codeigniter](https://www.nginx.com/resources/wiki/start/topics/recipes/codeigniter/)