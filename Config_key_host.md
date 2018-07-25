### Create ssh key 

ssh-keygen -t rsa -b 4096 -C "mail"

In path: `cd /home/user/.ssh`

create file: `vi config`

paste in the file:

`Host Host_Name`

  `HostName ip_host`
  
  `Port 22`
  
  `User user`
  
  `IdentityFile ~/.ssh/anything.key`
