
# Install Nginx on CentOS

### Info

Platform: CentOS

`$ cat /etc/redhat-release`:
CentOS Linux release 7.5.1804 (Core)


### Install Steps

[RHEL/CentOS](http://nginx.org/en/linux_packages.html#RHEL-CentOS)

`$ yum install yum-utils`

Add `/etc/yum.repos.d/nginx.repo`:

```
[nginx-stable]
name=nginx stable repo
baseurl=http://nginx.org/packages/centos/$releasever/$basearch/
gpgcheck=1
enabled=1
gpgkey=https://nginx.org/keys/nginx_signing.key
module_hotfixes=true

[nginx-mainline]
name=nginx mainline repo
baseurl=http://nginx.org/packages/mainline/centos/$releasever/$basearch/
gpgcheck=1
enabled=0
gpgkey=https://nginx.org/keys/nginx_signing.key
module_hotfixes=true
```

`$ yum install nginx`

Verify that the installation was successful:

`$ nginx -t`

#### Default nginx related files' location

`/etc/nginx/nginx.conf`, in this file:

```conf
error_log /var/log/nginx/error.log
pid /var/run/nginx.pid
include /etc/nginx/mime.types
access_log /var/log/nginx/access.log
include /etc/nginx/conf.d/*.conf
```


In `/etc/nginx/conf.d/default.conf`:

```conf
#access_log  /var/log/nginx/host.access.log  main;

location / {
    root   /usr/share/nginx/html;
    index  index.html index.htm;
}

#error_page  404              /404.html;

# redirect server error pages to the static page /50x.html
#
error_page   500 502 503 504  /50x.html;
location = /50x.html {
    root   /usr/share/nginx/html;
}

```


### [Beginner’s Guide](http://nginx.org/en/docs/beginners_guide.html)

Run nginx: `$ nginx`

`$ nginx -s reload`

Configuration:

```conf
http {
  # ...
  server {
    # ...
    location {
      # ...
    }
  }
}
```

You can use `include` to reference other configuration files like:

```
http {
  include /etc/nginx/conf.d/*.conf;
}
```


This will include all `.conf` files in `/etc/nginx/conf.d`. And these files like:

```conf
server {
  # ...
}
```

[Configuration Directives](http://nginx.org/en/docs/http/ngx_http_core_module.html#directives)

[Configuration Directives: index](http://nginx.org/en/docs/http/ngx_http_index_module.html#index)

[Configuration Directives: root](http://nginx.org/en/docs/http/ngx_http_core_module.html#root)

[Nginx中proxy_pass的斜杠问题](https://www.jianshu.com/p/c751250a5112)

### Words & Terminology

CGI: Common Gateway Interface

[CGI与FastCGI](https://www.jianshu.com/p/ed1be12030a9)