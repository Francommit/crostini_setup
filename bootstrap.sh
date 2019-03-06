# Upgrade existing packages
sudo apt-get -y update && sudo apt-get -y dist-upgrade \
  && sudo apt -y install git bash-completion

# Install flatpak
sudo apt install flatpak -y
sudo flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

# Install snap package support
sudo apt -y install snapd

# LXD client so we can interact with other containers outside of penguin but inside of termina
sudo snap install lxd

# Install Gitg 
sudo flatpak install -y flathub org.gnome.gitg

# Sublime Text
wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add -
echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list
sudo apt-get update
sudo apt-get install sublime-text
# Set the user scaling to 2.0, it looks terrible on a pixelbook without it
cd ~/.config/sublime-text-3/Packages/User
curl -LJO https://github.com/Francommit/crostini_setup/Preferences.sublime-settings

# Tilix (Terminal alternative)
echo 'deb http://ftp.debian.org/debian stretch-backports main' | sudo tee /etc/apt/sources.list.d/stretch-backports.list
sudo apt update
sudo apt -y install tilix
sudo ln -s /etc/profile.d/vte-2.91.sh /etc/profile.d/vte.sh
# Add to path
if [ $TILIX_ID ] || [ $VTE_VERSION ]; then
    source /etc/profile.d/vte.sh
fi

# Powershell 6.0 - pwsh
sudo apt install -y curl gnupg apt-transport-https liblttng-ust-ctl2 liblttng-ust0 libunwind8 liburcu4 wget
curl https://packages.microsoft.com/keys/microsoft.asc | sudo apt-key add -
sudo sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/microsoft-debian-stretch-prod stretch main" > /etc/apt/sources.list.d/microsoft.list'
sudo apt-get update
sudo apt-get install -y powershell
sudo apt-get install -f

# Docker installation
curl -L https://gist.githubusercontent.com/upbeta01/3b968320b3a579c326ab6cd2a195b10d/raw/196eb33a6e4b5ef9abae98d9e221ebd62a61fd65/install-docker-deb9.sh | bash