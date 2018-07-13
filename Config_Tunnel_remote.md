- Open tunel:
`ssh -Ng -L9898:localhost:80 platzi`

_platzi to be like host in .ssh/config_ 

- Access the local machinen 

* In local machine:
install *openssh-server*
`sudo apt-get install openssh-server`

set in _/etc/ssh/sshd_config_:

PasswordAuthentication yes

GatewayPorts yes

After running the process:
`sudo service ssh start`
or
`sudo systemctl reload ssh`
or
`sudo service ssh reload`

finally:
`ssh -NR 10022:localhost:22 platzi`

* Remote machine:
`ssh -p 10022 usuario@localhos`
