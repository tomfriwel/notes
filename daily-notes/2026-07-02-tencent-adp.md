```sh
git clone https://github.com/TencentCloudADP/adp-chat-client.git
cd adp-chat-client/
bash ./script/init_env_tencentos.sh
cp server/.env.example deploy/default/.env
vi deploy/default/.env

# TC_SECRET_APPID=
# TC_SECRET_ID=
# TC_SECRET_KEY=
# APP_CONFIGS='[
#     {
#         "Vendor":"Tencent",
#         "ApplicationId":"",
#         "Comment": "测试图表聊天",
#         "AppKey": "",
#         "International": false
#     }
# ]'
# SERVICE_API_URL=

which docker && docker --version
# 配国内镜像源
sudo tee -a /etc/containers/registries.conf << 'EOF'

[[registry]]
prefix = "docker.io"
location = "docker.io"

[[registry.mirror]]
location = "mirror.ccs.tencentyun.com"

[[registry.mirror]]
location = "docker.m.daocloud.io"
EOF

# `sudo make pack` may fail
sudo yum install -y rsync

# 1. 从国内源拉镜像
sudo docker pull docker.m.daocloud.io/library/node:22-bullseye-slim

# 2. 打本地 tag
sudo docker tag docker.m.daocloud.io/library/node:22-bullseye-slim node:22-bullseye-slim

# 3. 确认
sudo docker images | grep node

# 4. 重新 build
sudo make pack

# 失败
# 1. 拉 python 镜像 + 打 tag
sudo docker pull docker.m.daocloud.io/library/python:3.12-slim
sudo docker tag docker.m.daocloud.io/library/python:3.12-slim python:3.12-slim

# 2. 配 Docker 镜像加速，一劳永逸
sudo mkdir -p /etc/docker
sudo tee /etc/docker/daemon.json << 'EOF'
{
  "registry-mirrors": ["https://docker.m.daocloud.io"]
}
EOF

# 3. 重启 Docker
sudo systemctl restart docker

# 4. 确认配置生效
sudo docker info | grep -A 5 "Registry Mirrors"

# 5. 重新 build
sudo make pack


sudo make deploy
# 这个在proxy那台遇到了，在测试服app01没遇到
# sudo podman pull docker.io/library/postgres:17
echo "1" | sudo make deploy
# sudo podman ps


sudo make url

# nginx 配置更新

# 在 app-01 上跑
hostname -I | awk '{print $1}'
location /chat/ {
    proxy_pass http://<app-01的IP>:8000/;
    proxy_set_header Host $host;
    proxy_set_header X-Real-IP $remote_addr;
    proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
    proxy_set_header X-Forwarded-Proto $scheme;
    proxy_set_header X-Forwarded-Prefix /chat;
    proxy_buffering off;
    proxy_read_timeout 600s;
}
location = /chat {
    proxy_pass http://<app-01的IP>:8000/;
    proxy_set_header Host $host;
    proxy_set_header X-Real-IP $remote_addr;
    proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
    proxy_set_header X-Forwarded-Proto $scheme;
    proxy_set_header X-Forwarded-Prefix /chat;
    proxy_buffering off;
}

echo "1" | sudo make url


# 查看当前的 secret key：(用于在CI4中生成链接)
sudo docker exec adp-chat-client-default bash -c "grep CUSTOMER_ACCOUNT_SECRET_KEY /app/.env"

# 如果上面的结果是空的，生成一个随机密钥
openssl rand -hex 32
# 填到 adp-chat-client 的 .env
# 编辑 deploy/default/.env：
vi deploy/default/.env
# # 找到这行，填入生成的 key：
# CUSTOMER_ACCOUNT_SECRET_KEY=刚才生成的密钥

#  重启 adp-chat-client 容器
sudo docker restart adp-chat-client-default
# 验证配置生效
sudo docker exec adp-chat-client-default bash -c "grep CUSTOMER_ACCOUNT_SECRET_KEY /app/.env"

```