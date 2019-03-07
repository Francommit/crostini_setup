# Crostini Setup

Recently bought a Pixelbook and I've discovered lots of news things about the Linux world that I've never been exposed to. Been working in .NET at every job I've had, so I've never actually come across LXC or LXD, or for that matter, ever executed a Shell script. 

I had some fun in the past configuring a Powershell script to bootstrap a new installation of Windows 10 / Windows Server 2016 to 2019 that I still use on the odd occasion, and thought it would be fun to do the same thing for a penguin container!

The end goal is to execute a single script in the Terminal and have everything be magically setup for you in your container. It's really nice the way that ChromeOS syncs everything for you, so you can essentially reformat in minutes. However, with the container functionality being new and breaking, it would be nice to have an all in one script that did it for you.


## Copy and paste this in your Terminal:

`git clone https://github.com/Francommit/crostini_setup.git cd crostini_setup ./bootstrap.sh`


## Miscellaneous pieces

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

#### Configure the LXD client to remotely connect to termina
Using crosh, configure this in termina
````
lxc config set core.https_address :8443
lxc config set core.trust_password some-password
````

Perform the following in penguin/terminal
````
# Find the IP of termina
ip -4 route show
# Remotely connect to the LXD running outside of penguin (you'll need your password)
lxc remote add chromeos 100.115.92.193
# set the lxd client in penguin to always connect
lxc remote set-default chromeos 
# You should now have a list of the containers running in termina
lxc list
````

#### Docker Fun

##### Bamboo Server to go
```
docker volume create --name bambooVolume
docker run -v bambooVolume:/var/atlassian/application-data/bamboo --name="bamboo" --init -d -p 54663:54663 -p 8085:8085 atlassian/bamboo-server
```
Launch via http://penguin.linux.test:8085/
It keeps the db in the bambooVolume, so once you add your evaulation license you're good to go.


##### Portainer
```
docker volume create portainer_data
docker run -d -p 9000:9000 -v /var/run/docker.sock:/var/run/docker.sock -v portainer_data:/data portainer/portainer
```
Launch via http://penguin.linux.test:9000/