### clone
`$ git clone https://github.com/tomfriwel/programming-notes.git`

### pull unrelated histories
`$ git pull origin master --allow-unrelated-histories`

### create and switch to new branch
`$ git checkout -b iss53`

### remove files in a folder from version control withou deleting them from the filesystem

`$ git rm -r --cached folder/*`

`-r` means recursively

### delete branch

[](https://stackoverflow.com/questions/2003505/how-do-i-delete-a-git-branch-both-locally-and-remotely)

```
$ git push -d <remote_name> <branch_name>
$ git branch -d <branch_name>
```