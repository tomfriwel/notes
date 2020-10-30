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

This will create a default project, and run `$ yarn start` will listen localhost port 3000. If you want auto reload when you change code, use `$ yarn start:dev`.

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

[How to resolve port 3000 for HTTPS using Nginx and NodeJs/NestJs?](https://stackoverflow.com/questions/57029380/how-to-resolve-port-3000-for-https-using-nginx-and-nodejs-nestjs)

and run `$ nginx -s reload` to reload configure. If every thing is ok, open `http://www.example.com` in browser, you will see `Hello World!` which write in `/projectpath/app.service.ts`. Also you can change function `getHello` in `app.controller.ts`.

nest generate help:
```shell
$ nest g -h
Usage: nest generate|g [options] <schematic> [name] [path]

Generate a Nest element.
  Available schematics:
    ┌───────────────┬─────────────┐
    │ name          │ alias       │
    │ application   │ application │
    │ class         │ cl          │
    │ configuration │ config      │
    │ controller    │ co          │
    │ decorator     │ d           │
    │ filter        │ f           │
    │ gateway       │ ga          │
    │ guard         │ gu          │
    │ interceptor   │ in          │
    │ interface     │ interface   │
    │ middleware    │ mi          │
    │ module        │ mo          │
    │ pipe          │ pi          │
    │ provider      │ pr          │
    │ resolver      │ r           │
    │ service       │ s           │
    │ library       │ lib         │
    │ sub-app       │ app         │
    │ resource      │ res         │
    └───────────────┴─────────────┘

Options:
  -d, --dry-run                      Report actions that would be taken without writing out results.
  -p, --project [project]            Project in which to generate files.
  --flat                             Enforce flat structure of generated element.
  --spec                             Enforce spec files generation. (default: true)
  --no-spec                          Disable spec files generation.
  -c, --collection [collectionName]  Schematics collection to use.
  -h, --help                         Output usage information.
```


[Getting Started with NestJS](https://www.digitalocean.com/community/tutorials/getting-started-with-nestjs)

一些初步的理解：`service`用来处理数据，`module`用来引用`controller`、`service(provider)`，例如：

```ts
import { Module } from '@nestjs/common';
import { AppController } from './app.controller';
import { CatsController } from './cats/cats.controller';
import { CatsModule } from './cats/cats.module';
import { TestController } from './test/test.controller';

@Module({
  imports: [CatsModule],
  controllers: [AppController, CatsController, TestController],
  providers: [],
})
export class AppModule {}
```

and

```ts
import { Module } from '@nestjs/common';
import { CatsService } from './cats.service';

@Module({
  providers: [CatsService]
})
export class CatsModule {}

```

#### 2020 10 29 Global prefix

[Nestjs 增加全局前缀](https://www.cnblogs.com/ajanuw/p/9846603.html)

#### 2020 10 29 Tutorials

Create common files
```shell
# controller
nest g co test

# module
nest g mo test

# service
nest g s test

# interface
nest g interface test
```

Test:

```shell
# module, controller, service, interface
nest g mo book
nest g co book
nest g s book
nest g interface book
```

Change `test.module.ts`:
```
```

`app.setGlobalPrefix('v1');` in `main.ts`.


`$ yarn add module-alias`

#### 2020 10 29 databese

[技术-数据库](https://docs.nestjs.cn/7/techniques?id=数据库)

`$ yarn add @nestjs/typeorm typeorm mysql`

Create `ormconfig.json`
```json
{
  "type": "mysql",
  "host": "localhost",
  "port": 3306,
  "username": "root",
  "password": "root",
  "database": "test",
  "entities": ["dist/**/*.entity{.ts,.js}"],
  "synchronize": true
}
```

If you don't want git track this file, add `ormconfig.json` to your `.gitignore`.

#### 2020 10 29 generate table model from existed database

[Kononnable/typeorm-model-generator](https://github.com/Kononnable/typeorm-model-generator)

`$ yarn global list`

if not install: `$ yarn add typeorm-model-generator`

`$ typeorm-model-generator -h localhost -d tempdb -u sa -x !Passw0rd -e mysql -o .`

```shell
-h, --host             IP address/Hostname for database server      [default: "127.0.0.1"]
-d, --database         Database name(or path for sqlite)            [required]
-u, --user             Username for database server
-x, --pass             Password for database server              [default: ""]
-e, --engine           Database engine
          [choices: "mssql", "postgres", "mysql", "mariadb", "oracle", "sqlite"]
                                                              [default: "mssql"]
-o, --output           Where to place generated models
                            [default: "./output"]
```

For host is default `127.0.0.1`, we can use `$ typeorm-model-generator -d tempdb -u sa -x !Passw0rd -e mysql -o .`

#### 2020 10 30 path alias

[How nestjs configures path aliases in a project](https://stackoverflow.com/questions/57439410/how-nestjs-configures-path-aliases-in-a-project)

[Absolute Imports and Module path aliases](https://nextjs.org/docs/advanced-features/module-path-aliases)