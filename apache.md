
#### Ubuntu APACHE_LOG_DIR

`/var/log/apache`

[Where are Apache file access logs stored?](https://unix.stackexchange.com/questions/38978/where-are-apache-file-access-logs-stored)


#### [How to Set Access-Control-Allow-Origin (CORS) Headers in Apache](https://tecadmin.net/set-access-control-allow-origin-cors-in-apache/)

```
<Directory "/path/to/dir">
   <IfModule mod_headers.c>
 Header set Access-Control-Allow-Origin "*"
   </IfModule>
</Directory>
```

```
<FilesMatch "\.(ttf|otf|eot|woff)$">
    <IfModule mod_headers.c>
        Header Set Access-Control-Allow-Origin "*"
    </IfModule>
</FilesMatch>
```

```
<FilesMatch "\.(ttf|otf|eot|woff)$">
    <IfModule mod_headers.c>
        SetEnvIf Origin "http(s)?://(www\.)?(google.com|staging.google.com|development.google.com)$" AccessControlAllowOrigin=$0
        Header add Access-Control-Allow-Origin %{AccessControlAllowOrigin}e env=AccessControlAllowOrigin
    </IfModule>
</FilesMatch>
```