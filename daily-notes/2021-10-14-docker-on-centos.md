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

### References

- [10 Commands to Collect System and Hardware Info in Linux](https://www.tecmint.com/commands-to-collect-system-and-hardware-information-in-linux/)