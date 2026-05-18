# Export docker image

```sh
docker commit <容器名称或ID> <新镜像名>:<标签>
# 示例：将名为 my-running-app的容器保存为镜像 my-app-backup:latest
docker commit my-running-app my-app-backup:latest

docker save -o <导出文件名.tar> <镜像名>:<标签>
# 示例：将镜像 my-app-backup:latest导出为文件 my-app-backup.tar
docker save -o my-app-backup.tar my-app-backup:latest
# 也可以直接导出已有的镜像: docker images

# 导出的 .tar文件可以通过 docker load -i 文件名.tar命令在任何安装了 Docker 的机器上导入并恢复成镜像。
```