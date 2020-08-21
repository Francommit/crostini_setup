#
# Installations
#

# Upgrade existing packages
sudo apt-get -y update && sudo apt-get -y dist-upgrade \
  && sudo apt -y install git bash-completion ansible iputils-ping

# Sublime Text
wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add -
echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list
sudo apt-get update
sudo apt-get install sublime-text

# Tilix (Terminal alternative)
echo 'deb http://ftp.debian.org/debian stretch-backports main' | sudo tee /etc/apt/sources.list.d/stretch-backports.list
sudo apt update
sudo apt -y install tilix
sudo ln -s /etc/profile.d/vte-2.91.sh /etc/profile.d/vte.sh
# Add to path
if [ $TILIX_ID ] || [ $VTE_VERSION ]; then
    source /etc/profile.d/vte.sh
fi

# VSCode Installation
curl -L "https://go.microsoft.com/fwlink/?LinkID=760868" > vscode.deb
sudo apt install ./vscode.deb -y

# Docker installation
curl -L https://gist.githubusercontent.com/upbeta01/3b968320b3a579c326ab6cd2a195b10d/raw/196eb33a6e4b5ef9abae98d9e221ebd62a61fd65/install-docker-deb9.sh | bash

# Remmina
sudo apt install flatpak
sudo flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
sudo flatpak install flathub org.remmina.Remmina -y

#
# Configurations
#

# Set the user scaling to 2.0, it looks terrible on a pixelbook without it
cd ~/.config/sublime-text-3/Packages/User
curl -LJO https://github.com/Francommit/crostini_setup/raw/master/Preferences.sublime-settings
   
