# openconnect

```sh
brew install openconnect
# 安装完成后，您可以通过命令行或图形界面使用OpenConnect客户端来连接到VPN服务。对于命令行，您可以使用以下命令格式：
openconnect --user=<username> <vpn_server>

# 其中<username>是您的VPN用户名，<vpn_server>是VPN服务器的地址。如果您的VPN配置文件包含所有必要的信息，您也可以指定配置文件的路径：
openconnect --config /path/to/your/vpnconfig.xml
```


问题fix`brew update`太慢了，github访问不了，想切换git remote origin：

```sh
# 查看配置
brew config
# 查看brew安装目录brew --prefix
/opt/homebrew
# cd到具体目录
cd /opt/homebrew

# 切到其它源
git remote set-url origin https://mirrors.tuna.tsinghua.edu.cn/git/homebrew/brew.git

brew update
brew upgrade
```