# Got

[Documentation](https://git-scm.com/doc)

#### clone
`$ git clone https://github.com/tomfriwel/programming-notes.git`

#### pull unrelated histories
`$ git pull origin master --allow-unrelated-histories`

#### create and switch to new branch
`$ git checkout -b iss53`

#### remove files in a folder from version control without deleting them from the filesystem

`$ git rm -r --cached folder/*`

#### Delete remote

`$ git remote remove origin`

`-r` means recursively

#### undo commit

`$ git reset --soft HEAD^`

#### delete branch

[](https://stackoverflow.com/questions/2003505/how-do-i-delete-a-git-branch-both-locally-and-remotely)

```
$ git push -d <remote_name> <branch_name>
$ git branch -d <branch_name>
```

#### stop track files/ folder

`$ git rm --cached [file name] -r`

#### change remote url

`$ git remote set-url origin git://new.url.here`

#### git change remote url

`$ git remote set-url origin <URL>`

[Changing a remote's URL](https://help.github.com/articles/changing-a-remote-s-url/)

#### git set multiple remote url

`$ git remote set-url origin --push --add <a remote>`
`$ git remote set-url origin --push --add <another remote>`

[pull/push from multiple remote locations](https://stackoverflow.com/questions/849308/pull-push-from-multiple-remote-locations)

#### git@gitlab.com: Permission denied (publickey).

`$ ssh -v git@github.com`
`$ more ~/.ssh/id_rsa.pub`

[使用git push origin master向github推送代码，出现git@github.com: Permission denied (publickey).](https://blog.csdn.net/yjk13703623757/article/details/87882294)

#### Git: Connection to gitlab.com closed by remote host. (It could be the server)

Error Details:

```
Git: Connection to gitlab.com closed by remote host.
```

```
Bad packet length xxx.
ssh_dispatch_run_fatal: Connection to <IP> port 22: message authentication code incorrect
fatal: Could not read from remote repository.

Please make sure you have the correct access rights
and the repository exists.
```

Solution:

Add `<IP> gitlab.com` to `/etc/hosts`

Test: `$ ssh -T git@gitlab.com`

```
sudo launchctl stop com.openssh.sshd
sudo launchctl start com.openssh.sshd

sudo launchctl load -w /System/Library/LaunchDaemons/ssh.plist
sudo launchctl unload -w /System/Library/LaunchDaemons/ssh.plist
```

[git push 时出现Connection closed by remote host](https://blog.csdn.net/qq_27633421/article/details/78343091)

#### See the metadata

`$ git ls-files --debug`

This command will outputs something like below:
```
...
afilepath
  ctime: 1587888319:776648808
  mtime: 1587888319:776648808
  dev: 16777220 ino: 73196524
  uid: 501      gid: 20
  size: 1227    flags: 0
...
```

#### git undo

`$ git reset HEAD~1` keep changes

`$ git reset --hard commit_id` will lose changes, use `$ git log` to view commits histroy and find the `commit_id`, which you want to reset to.

#### [How can I undo the last commit?](https://www.git-tower.com/learn/git/faq/undo-last-commit/)

`$ git reset --soft HEAD~1`

#### View/Change git http.postBuffer

```shell
git config --get http.postBuffer

git config http.postBuffer 524288000

git config --global http.postBuffer 524288000
```
[git clone error: RPC failed; curl 56 OpenSSL SSL_read: SSL_ERROR_SYSCALL, errno 10054](https://stackoverflow.com/a/49728862/6279975)
[http.postBuffer](https://git-scm.com/docs/git-config#Documentation/git-config.txt-httppostBuffer)

[error: RPC failed; curl 56 OpenSSL SSL_read: SSL_ERROR_SYSCALL, errno 54 #7025](https://github.com/CocoaPods/CocoaPods/issues/7025)

### Add ssh key (github)

```shell
ssh-keygen -t rsa -b 4096 -C xxx@xx.com
eval "$(ssh-agent -s)"
open ~/.ssh/config
```

```config
Host *
  AddKeysToAgent yes
  UseKeychain yes
  IdentityFile ~/.ssh/id_ed25519
```

```ssh
ssh-add -K ~/.ssh/id_ed25519
# add to github
pbcopy < ~/.ssh/id_ed25519.pub
```

- [Generating a new SSH key and adding it to the ssh-agent](https://docs.github.com/en/free-pro-team@latest/github/authenticating-to-github/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent)
- [Adding a new SSH key to your GitHub account](https://docs.github.com/en/free-pro-team@latest/github/authenticating-to-github/adding-a-new-ssh-key-to-your-github-account)

### Error exited with 128.

```sh
$ brew install --cask adoptopenjdk/openjdk/adoptopenjdk8                     
Updating Homebrew...
==> Tapping adoptopenjdk/openjdk
Cloning into '/usr/local/Homebrew/Library/Taps/adoptopenjdk/homebrew-openjdk'...
fatal: unable to access 'https://github.com/adoptopenjdk/homebrew-openjdk/': Could not resolve proxy: proxiURL
Error: Failure while executing; `git clone https://github.com/adoptopenjdk/homebrew-openjdk /usr/local/Homebrew/Library/Taps/adoptopenjdk/homebrew-openjdk` exited with 128.
```

`$ git config --global http.proxyAuthMethod 'basic'`

- [git returns http error 407 from proxy after CONNECT](https://stackoverflow.com/a/53956231/6279975)

### reset auth

`$ git config --system --unset credential.helper`

- [How to reset git authentication?](https://stackoverflow.com/questions/51581582/how-to-reset-git-authentication)

### force push

`$ git push --force origin master`

- [How to use git push force the right way](https://www.datree.io/resources/git-push-force)

### global settings

`~/.gitconfig`
```sh
git config --global --list

```

### find content in git hostory

`$ git log -p <file path> | grep <content of searching>`


### sh with git command

```sh
touch test.sh
vi test.sh
chmod +x test.sh

# check changes file
git fetch
git diff --name-only origin/master..master

# set usernmae, passwork cache time
git config --list

格式git clone http://userName:password@链接地址
实例git clone https://用户名:密码@git.coding.net/sample/HelloWorld.git

作者：Yvanna_15
链接：https://www.jianshu.com/p/d29c40145912
来源：简书
著作权归作者所有。商业转载请联系作者获得授权，非商业转载请注明出处。


# 好像没用
git config --global credential.helper 'cache --timeout=360000'
git config --global credential.helper cache  

git config --global credential.helper store
```