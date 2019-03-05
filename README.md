# Crostini Setup

Recently bought a Pixelbook and I've discovered lots of news things about the Linux world that I've never been exposed to. Been working in .NET at every job I've had, so I've never actually come across LXC or LXD, or for that matter, ever executed a Shell script. 

I had some fun in the past configuring a Powershell script to bootstrap a new installation of Windows 10 / Windows Server 2016 to 2019 that I still use on the odd occasion, and thought it would be fun to do the same thing for a penguin container!

The end goal is to execute a single script in the Terminal and have everything be magically setup for you in your container. It's really nice the way that ChromeOS syncs everything for you, so you can essentially reformat in minutes. However, with the container functionality being new and breaking, it would be nice to have an all in one script that did it for you.


## Copy and paste this in your Terminal:

`git clone https://github.com/Francommit/crostini_setup.git cd crostini_setup ./bootstrap.sh`


## Other un-scriptable pieces

#### SSH Keys
```
# Generate your ssh key
ssh-keygen -t rsa -b 4096 -C pixelbook

# Turn on the ssh agent and add the ssh key
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_rsa

# Copy it and past it to your specified server
cat .ssh/id_rsa.pub
```

#### LXD Daemon fun
````
# get into crosh in chrome
ctrl + alt + t

# get into your termina vm
vmc start termina

# get ubuntu up and running
lxc list
lxc launch ubuntu:18.04 ub
lxc exec ub bash
````
