# Nest.js

### First step

System: Ubuntu 16.04

[Nest 第一步](https://docs.nestjs.cn/7/firststeps)

```shell
$ curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.34.0/install.sh | bash

$ export NVM_DIR="$HOME/.nvm"
$ [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
$ [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

$ nvm --version

$ nvm install --lts

$ node -v
$ npm -v
```

if yarn:
[yarn 安装](https://yarn.bootcss.com/docs/install/#debian-stable)
```shell
$ curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
$ echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list

$ sudo apt update && sudo apt install yarn

$ yarn -v
```

Continue:
```shell
$ yarn global add @nestjs/cli

# if appear: There appears to be trouble with your network connection. Retrying...
$ yarn config set registry https://registry.npm.taobao.org

$ yarn global add @nestjs/cli

$ nest -v

# create new
$ nest new project-name
```

This will create a default project, and run `$ yarn start` will listen localhost port 3000.

I use `Nginx`, so I need setup like below:
```conf
server {
  listen 80;
  server_name www.example.com;
  root /projectpath/;
  
  access_log /var/log/nginx/www.example.com.access.log;
  error_log /var/log/nginx/www.example.com.error.log;

  location / {
    proxy_pass http://127.0.0.1:3000;
  }
}
```

and run `$ nginx -s reload` to reload configure. If every thing is ok, open `http://www.example.com` in browser, you will see `Hello World!` which write in `/projectpath/app.service.ts`.