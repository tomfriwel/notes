
### Install Docker Desktop

`$ docker login`

```
$ docker pull xxx/test
Using default tag: latest
Error response from daemon: manifest for xxx/test:latest not found: manifest unknown: manifest unknown
```



### References

- [Docker Documentation](https://docs.docker.com)

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
docker rm --force bb
```

`--publish` asks Docker to forward traffic incoming on the host’s port ***8000***, to the container’s port ***8080***. Containers have their own private set of ports, so if you want to reach one from the network, you have to forward traffic to it in this way. Otherwise, firewall rules will prevent all network traffic from reaching your container, as a default security posture.

For exmaple, host's(http://localhost in above example) port ***8000*** > container's port ***8080***

`--detach` asks Docker to run this container in the background.

`--name` specifies a name with which you can refer to your container in subsequent commands, in this case bb.

The `--force` option removes the running container. If you stop the container running with `docker stop bb` you do not need to use `--force`.

![](https://github.com/tomfriwel/notes/blob/master/tools/assets/docker/s0.png)

### Part3: Share images on Docker Hub

```sh
docker tag bulletinboard:1.0 <Docker ID>/bulletinboard:1.0
docker push <Docker ID>/bulletinboard:1.0
```

### Practice: MySQL

```sh
docker run mysql
```


### [Docker hub Docs](https://docs.docker.com/docker-hub/)

```sh
docker build -t <your_username>/my-first-repo .
```
