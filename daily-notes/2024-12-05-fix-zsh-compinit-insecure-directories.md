# 解决Mac命令行提示: zsh compinit: insecure directories

当我在Mac上，打开一个新的命令窗口的时候，总是会提示：
```sh
zsh compinit: insecure directories, run compaudit for list.
Ignore insecure directories and continue [y] or abort compinit [n]?
```

两步解决：

### 1. 命令行运行`compaudit`命令会得到两个路径：
```sh
There are insecure directories:
/opt/homebrew/share/zsh/site-functions
/opt/homebrew/share/zsh
```

### 2. 然后执行下面的命令，再打开命令行就没有了
```sh
sudo chmod -R 755 /opt/homebrew/share/zsh/site-functions
sudo chmod -R 755 /opt/homebrew/share/zsh
sudo chown -R root:staff /opt/homebrew/share/zsh
```