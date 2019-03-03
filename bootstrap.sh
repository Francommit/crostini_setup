# Upgrade existing packages
sudo apt-get -y update && sudo apt-get -y dist-upgrade \
  && sudo apt -y install git bash-completion \
  && git config --global user.email francommit@gmail.com \
  && git config --global user.name "Francommit"


# Sublime Text
wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add -
echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list
sudo apt-get update
sudo apt-get install sublime-text
# TO-DO: figured out how to change the scaling to 2.0 on the fly


# Tilix (Terminal alternative)
echo 'deb http://ftp.debian.org/debian stretch-backports main' | sudo tee /etc/apt/sources.list.d/stretch-backports.list
sudo apt update
sudo apt -y install tilix
sudo ln -s /etc/profile.d/vte-2.91.sh /etc/profile.d/vte.sh
# Add to path
if [ $TILIX_ID ] || [ $VTE_VERSION ]; then
    source /etc/profile.d/vte.sh
fi
