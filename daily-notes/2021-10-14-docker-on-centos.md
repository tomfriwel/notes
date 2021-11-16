`$ cat /etc/*elease`

```sh
CentOS Linux release 7.6.1810 (Core) 
NAME="CentOS Linux"
VERSION="7 (Core)"
ID="centos"
ID_LIKE="rhel fedora"
VERSION_ID="7"
PRETTY_NAME="CentOS Linux 7 (Core)"
ANSI_COLOR="0;31"
CPE_NAME="cpe:/o:centos:centos:7"
HOME_URL="https://www.centos.org/"
BUG_REPORT_URL="https://bugs.centos.org/"

CENTOS_MANTISBT_PROJECT="CentOS-7"
CENTOS_MANTISBT_PROJECT_VERSION="7"
REDHAT_SUPPORT_PRODUCT="centos"
REDHAT_SUPPORT_PRODUCT_VERSION="7"

CentOS Linux release 7.6.1810 (Core) 
CentOS Linux release 7.6.1810 (Core) 
```

- [Install Docker Engine on CentOS](https://docs.docker.com/engine/install/centos/)

```sh
sudo yum remove docker \
                  docker-client \
                  docker-client-latest \
                  docker-common \
                  docker-latest \
                  docker-latest-logrotate \
                  docker-logrotate \
                  docker-engine
```


### Install using the repository

```sh
# Set up the repository
$ sudo yum install -y yum-utils
$ sudo yum-config-manager \
    --add-repo \
    https://download.docker.com/linux/centos/docker-ce.repo

# Install Docker Engine
$ sudo yum install docker-ce docker-ce-cli containerd.io

# Start Docker.
$ sudo systemctl start docker

# Verify that Docker Engine is installed correctly by running the hello-world image.
$ sudo docker run hello-world

# Configure Docker to start on boot
$ sudo systemctl enable docker.service
$ sudo systemctl enable containerd.service
```

### Tutorials

- [Orientation and setup](https://docs.docker.com/get-started/)

```sh
# Start a docker tutorial web page on your server by listen port 80
$ docker run -dp 80:80 docker/getting-started
```

You can access this page in broswer by `<your ip address>` or `localhost`(if local).

`docker run ...`:
```sh
Usage:  docker run [OPTIONS] IMAGE [COMMAND] [ARG...]

Run a command in a new container
```

If the container is created before, you can use `docker ps -a` view all created containers(running and not running). And use `docker start <CONTAINER ID>` to start the container.

`-a`, --all    Show all containers (default shows just running)

`docker start <CONTAINER ID>`:
```sh
Usage:  docker start [OPTIONS] CONTAINER [CONTAINER...]

Start one or more stopped containers
```

If you just want start a exist container other than create a new container, use `start`, `run` will create a new container.

### docker run -d -p 80:80 docker/getting-started

The latest [Download the App contents](https://docs.docker.com/get-started/02_our_app/)

#### Dcokerfile

```dockerfile
# syntax=docker/dockerfile:1
FROM node:12-alpine
RUN apk add --no-cache python3 g++ make
WORKDIR /app
COPY . .
RUN yarn install --production
CMD ["node", "src/index.js"]
```

When I build there will occor an error: `ERROR: unable to select packages:  python (no such package):...`, I download latest [App contents](https://docs.docker.com/get-started/02_our_app/).

There is an error again: `error /app/node_modules/sqlite3: Command failed.`. This related to an 403 error. I deleted the `yarn.lock` and run `yarn` to regenerate it and deleted `node_modules` folder.

Still go wrong!!!!

[`FROM`](https://docs.docker.com/engine/reference/builder/#from):
```dockerfile
# Set the baseImage to use for subsequent instructions. FROM must be the first instruction in a Dockerfile.

FROM baseImage
FROM baseImage:tag
FROM baseImage@digest
```

[`RUN`](https://docs.docker.com/engine/reference/builder/#run):
```dockerfile
# Execute any commands on top of the current image as a new layer and commit the results.

RUN apt-get update && apt-get install -y curl
```

[`WORKDIR`](https://docs.docker.com/engine/reference/builder/#workdir):
```dockerfile
# Set the working directory for any subsequent ADD, COPY, CMD, ENTRYPOINT, or RUN instructions that follow it in the Dockerfile.

WORKDIR /path/to/workdir
WORKDIR relative/path
```

[`COPY`](https://docs.docker.com/engine/reference/builder/#copy):
```dockerfile
# Copy files or folders from source to the dest path in the image's filesystem.

COPY hello.txt /absolute/path
COPY hello.txt relative/to/workdir
```

[`CMD`](https://docs.docker.com/engine/reference/builder/#cmd):
```dockerfile
# Provide defaults for an executing container. If an executable is not specified, then ENTRYPOINT must be specified as well. There can only be one CMD instruction in a Dockerfile.

CMD [ "/bin/ls", "-l" ]
```


`docker build -t <manual name> .`

`-t` define a human-readable name for the final image.

### References

- [10 Commands to Collect System and Hardware Info in Linux](https://www.tecmint.com/commands-to-collect-system-and-hardware-information-in-linux/)