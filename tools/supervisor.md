# supervisor

[Configuration File](http://supervisord.org/configuration.html?highlight=stderr_logfile_maxbytes)

### [supervisor "unix:///var/run/supervisor/supervisor.sock no such file" 解决方法](https://blog.csdn.net/weixin_34380948/article/details/94330426)

```
sudo touch /var/run/supervisor.sock
sudo chmod 777 /var/run/supervisor.sock
sudo service supervisor restart
```

### Reload configuration

```
supervisorctl reread
supervisorctl update
```

[Supervisor not loading new configuration files](https://serverfault.com/a/479754/414805)


### Config log
```conf
logfile = /tmp/supervisord.log
logfile_maxbytes = 50MB
logfile_backups=10

stdout_logfile=/a/path
stdout_logfile_maxbytes=1MB
stdout_logfile_backups=10

stderr_logfile=/a/path
stderr_logfile_maxbytes=1MB
stderr_logfile_backups=10
```

### Docs

- [Configuration File](http://supervisord.org/configuration.html?highlight=startsecs)