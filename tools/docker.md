
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
docker image ls
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
The `--force` option removes the running container. If you stop the container running with `docker stop bb` you do not need to use `--force`.


### [Docker hub Docs](https://docs.docker.com/docker-hub/)

```sh
docker build -t <your_username>/my-first-repo .
```
