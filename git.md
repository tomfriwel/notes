#### clone
`$ git clone https://github.com/tomfriwel/programming-notes.git`

#### pull unrelated histories
`$ git pull origin master --allow-unrelated-histories`

#### create and switch to new branch
`$ git checkout -b iss53`

#### remove files in a folder from version control without deleting them from the filesystem

`$ git rm -r --cached folder/*`

`-r` means recursively

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