
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

`service apache2 restart`

### [Permanently removing apache2](https://askubuntu.com/questions/176964/permanently-removing-apache2)
Follow these steps to remove the `apache2` service using `Terminal`:

 1. First stop the apache2 service if it is running with: `sudo service apache2 stop`
 2. Now remove and cleanup all the apache2 packages with:

        sudo apt-get purge apache2 apache2-utils apache2.2-bin apache2-common
        //or 
        sudo apt-get purge apache2 apache2-utils apache2-bin apache2.2-common


 3. Finally, run `sudo apt-get autoremove` just in case any other cleanup in needed

You can do the following two tests to confirm apache has been removed:

 1. `which apache2` - should return a blank line
 2. `sudo service apache2 start` - should return `apache2: unrecognized service`