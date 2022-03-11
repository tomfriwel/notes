# 服务器迁移
- 备份文件，代码+数据库
- 更改DNS解析

```sh
du -hs ./* | sort -h

/var
/project
/etc/nginx
/etc/apache2
/usr/ssl_files

--exclude="/var/lib" --exclude="/var/log" --exclude="/var/cache" --exclude="/project/api.tomfriwel.com.nest/node_modules"

tar -zcvf 20220112-3.tar.gz /var /project /etc/nginx /etc/apache2 /usr/ssl_files --exclude="/var/lib" --exclude="/var/log" --exclude="/var/cache" --exclude="/project/api.tomfriwel.com.nest/node_modules"
```

```sh
tar zxvf name.tar.gz
```


CentOS CI4:
```sh
yum -y update
yum install php-cli php-zip wget unzip
php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
HASH="$(wget -q -O - https://composer.github.io/installer.sig)"
php -r "if (hash_file('SHA384', 'composer-setup.php') === '$HASH') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;"
php composer-setup.php --install-dir=/usr/local/bin --filename=composer
composer
php -r "unlink('composer-setup.php');"
```

- [How to Install and Use PHP Composer on CentOS 7](https://phoenixnap.com/kb/how-to-install-and-use-php-composer-on-centos-7)
- [Composer Installation](https://codeigniter.com/user_guide/installation/installing_composer.html#installation-set-up)