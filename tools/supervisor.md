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


### 