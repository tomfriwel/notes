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