
### Install Docker Desktop

`$ docker login`

```
$ docker pull xxx/test
Using default tag: latest
Error response from daemon: manifest for xxx/test:latest not found: manifest unknown: manifest unknown
```

### References

- [Docker Documentation](https://docs.docker.com)
- [RUNOOB.COM - Docker 教程](https://www.runoob.com/docker/docker-tutorial.html)
- [RUNOOB.COM - Docker安装MySQL](https://www.runoob.com/docker/docker-install-mysql.html)

### [Quickstart](https://docs.docker.com/get-started/)

#### Part1: Orientation and setup

```sh
docker --version
docker run hello-world

# view images
docker image ls

# view all containers(spawned by the image)
docker ps --all
```

#### Part2: Build and run your image

```sh
git clone https://github.com/dockersamples/node-bulletin-board
cd node-bulletin-board/bulletin-board-app
```
Define a container with Dockerfile:

```sh
# Use the official image as a parent image.
FROM node:current-slim

# Set the working directory.
WORKDIR /usr/src/app

# Copy the file from your host to your current location.
COPY package.json .

# Run the command inside your image filesystem.
RUN npm install

# Inform Docker that the container is listening on the specified port at runtime.
EXPOSE 8080

# Run the specified command within the container.
CMD [ "npm", "start" ]

# Copy the rest of your app's source code from your host to your image filesystem.
COPY . .
```


In the directory `node-bulletin-board/bulletin-board-app`:
```sh
docker build --tag bulletinboard:1.0 .
docker run --publish 8000:8080 --detach --name bb bulletinboard:1.0
docker rm --force <CONTAINER ID>
```

`--publish` asks Docker to forward traffic incoming on the host’s port ***8000***, to the container’s port ***8080***. Containers have their own private set of ports, so if you want to reach one from the network, you have to forward traffic to it in this way. Otherwise, firewall rules will prevent all network traffic from reaching your container, as a default security posture.

For exmaple, host's(http://localhost in above example) port ***8000*** > container's port ***8080***

`--detach` asks Docker to run this container in the background.

`--name` specifies a name with which you can refer to your container in subsequent commands, in this case bb.

The `--force` option removes the running container. If you stop the container running with `docker stop bb` you do not need to use `--force`.

![](https://github.com/tomfriwel/notes/blob/master/tools/assets/docker/s0.png)

name image port

### Part3: Share images on Docker Hub

```sh
docker tag bulletinboard:1.0 <Docker ID>/bulletinboard:1.0
docker push <Docker ID>/bulletinboard:1.0
```

### Practice: MySQL

```sh
docker run mysql
```

Got:
```sh
2020-04-29 02:50:48+00:00 [Note] [Entrypoint]: Entrypoint script for MySQL Server 8.0.20-1debian10 started.
2020-04-29 02:50:48+00:00 [Note] [Entrypoint]: Switching to dedicated user 'mysql'
2020-04-29 02:50:48+00:00 [Note] [Entrypoint]: Entrypoint script for MySQL Server 8.0.20-1debian10 started.
2020-04-29 02:50:48+00:00 [ERROR] [Entrypoint]: Database is uninitialized and password option is not specified
	You need to specify one of MYSQL_ROOT_PASSWORD, MYSQL_ALLOW_EMPTY_PASSWORD and MYSQL_RANDOM_ROOT_PASSWORD
```

After read [Docker hub - mysql](https://hub.docker.com/_/mysql)

Starting a MySQL instance: 

`$ docker run --name mysqltest -e MYSQL_ROOT_PASSWORD=666666 -d mysql:latest`

If you already have a container, you can use `$ docker start mysqltest` or `$ docker start <CONTAINER ID>` to start the container. Using the command `$ docker stop mysqltest/<CONTAINER ID>` to stop container. (Use `$ docker ps -a` to find the container's id)

Connect to the MySQL instance above:

```sh
docker exec -i -t mysqltest /bin/bash

# -i -t equal to -it

# or use command below to find the container's CONTAINER ID
docker ps

docker exec -i -t <CONTAINER ID> /bin/bash

# exit container
exit
```

In container:

```sh
mysql -u root -p
# enter the password specified above. (MYSQL_ROOT_PASSWORD=666666)
```

Here [MySQL Basic Commands](../mysql.md#Commands) are some mysql commands.

Referneces:
- [Docker 进入正在运行的容器的4种方式](https://www.cnblogs.com/Mishell/p/12179000.html)
- [Docker搭建MySQL服务](https://www.cnblogs.com/pwc1996/p/5425234.html)
- [MySQL 8.0 Reference Manual](https://dev.mysql.com/doc/refman/8.0/en/mysql.html)

### Docker Commands

`$ docker search mysql`


### [Docker hub Docs](https://docs.docker.com/docker-hub/)

```sh
docker build -t <your_username>/my-first-repo .
```

### 2021 10 13

persist db & bind mouts

```sh
docker run -dp 3000:3000 \
    -w /app -v "$(pwd):/app" -v todo-db:/etc/todos \
    node:12-alpine \
    sh -c "apk --no-cache --virtual build-dependencies add python make g++ && yarn install && yarn run dev"
```

# Error

### [Using Bind Mounts: error Couldn't find a package.json file in "/app" #76](https://github.com/docker/getting-started/issues/76#issuecomment-702357280)

Run the command inside the `app` directory.

### [docker build command fails on yarn install step with error "gyp ERR! find Python" #124](https://github.com/docker/getting-started/issues/124#issuecomment-782028688)

```sh
docker run -dp 3000:3000 \
    -w /app -v "$(pwd):/app" \
    node:12-alpine \
    sh -c "yarn install && yarn run dev"
```

to 

```sh
docker run -dp 3000:3000 \
    -w /app -v "$(pwd):/app" \
    node:12-alpine \
    sh -c "apk --no-cache --virtual build-dependencies add python make g++ && yarn install && yarn run dev"

```

### [Docker (Apple Silicon/M1 Preview) MySQL "no matching manifest for linux/arm64/v8 in the manifest list entries"](https://stackoverflow.com/a/65592942/6279975)

```
services:
  db:
    platform: linux/x86_64
    image: mysql:5.7
    ...
```

```
services:
  db:
    image: mariadb:10.5.8
    ...
```