# Install python on CentOS

[CentOS安装Python3.7](https://www.jianshu.com/p/dab57c7634e1)

Find source on `https://www.python.org/downloads/release/python-380/`.

```shell
$ wget -c https://www.python.org/ftp/python/3.8.0/Python-3.8.0.tar.xz
$ xz -d Python-3.8.0.tar.xz
$ tar xvf Python-3.8.0.tar
$ cd Python-3.8.0/

# check openssl-devel
$ rpm -aq|grep openssl
openssl-libs-1.0.2k-12.el7.x86_64
openssl-1.0.2k-12.el7.x86_64

# no openssl-devel, install openssl-devel
$ yum install openssl-devel -y
$ rpm -aq|grep openssl
openssl-libs-1.0.2k-19.el7.x86_64
openssl-devel-1.0.2k-19.el7.x86_64
openssl-1.0.2k-19.el7.x86_64

$ ./configure --prefix=/usr/python38 --with-ssl
$ make
$ make install

```

