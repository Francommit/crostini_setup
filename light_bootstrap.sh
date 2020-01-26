#
# Installations
#

# Upgrade existing packages
sudo apt-get -y update && sudo apt-get -y dist-upgrade \
  && sudo apt -y install git bash-completion

# Ping
sudo apt install iputils-ping -y

# Install flatpak
sudo apt install flatpak -y
sudo flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

# Install Snap packages
# fuse is required
curl http://ftp.us.debian.org/debian/pool/main/s/squashfuse/libsquashfuse0_0.1.103-1_amd64.deb > libsquashfuse0_0.1.103-1_amd64.deb
sudo dpkg -i libsquashfuse0_0.1.103-1_amd64.deb
curl http://ftp.us.debian.org/debian/pool/main/s/squashfuse/squashfuse_0.1.103-1_amd64.deb > squashfuse_0.1.103-1_amd64.deb
sudo dpkg -i squashfuse_0.1.103-1_amd64.deb
sudo apt -y install snapd

# Sublime Text
wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add -
echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list
sudo apt-get update
sudo apt-get install sublime-text

# Set the user scaling to 2.0, it looks terrible on a pixelbook without it
cd ~/.config/sublime-text-3/Packages/User
curl -LJO https://github.com/Francommit/crostini_setup/raw/master/Preferences.sublime-settings