### Create ssh key 

ssh-keygen -t rsa -b 4096 -C "mail"

### Most used command 

### Create repository: `git init <Repository_Name>`

`git --version`

`git status`

`git clone <link_Clone>`

`git add/rm  <file>` or `git add .` 

`git commit -m <a_good_comment>`

`git push`

`git pull --rebase origin master`

`git push origin master`

`git log` 

###tag

`git tag -a 0.5 -m 'Version_name'`

Listar tag: `git tag -l`

Log: `git log --oneline --graph`

SuperLog: `git config --global alias.superlog "log --graph --abbrev-commit --date=relative --all --format=format:'%C(bold blue)%h%C(reset) %C(auto,magenta)%G? %C(bold green)(%>(18,trunc)%aD)%C(reset) %C(bold blue)[%<(10,trunc)%aN]%Creset - %s%C(reset) %C(bold yellow)%d%C(reset)'"`

Diff: `git diff [SHA 1 Vesion1] [SHA 1 Vesion2]`

Delete last commit (send the files in stage): `git reset -- soft [SHA 1]`

Delete last commit (send the files in working): `git reset -- mixed [SHA 1]`

Delete last commit (delete files): `git reset --hard [SHA 1]`
