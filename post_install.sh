#! bin/bash
set -e

echo "Post Install Script by: Physis19"
sudo apt upgrade -y

#App's
Program_List_apt = (
	nala
	neofetch
	vlc
	zsh)

#Apt
for i in ${Program_List_apt[@]}; do
	if ! dpkg -l | grep -q $i; then 
    apt install "$i" -y
  else
    echo "[INSTALADO] - $i"
  fi
done


#Flatpak
read -p "Install Flatpak ? [y/n]" flatpak_is_install
if flatpak_is_install == y:
	sudo apt install flatpak 

flatpak install flathub com.bitwarden.desktop
flatpak install flathub com.spotify.Client
flatpak install flathub org.telegram.desktop
flatpak install flathub com.valvesoftware.Steam
flatpak install flathub com.heroicgameslauncher.hgl
flatpak install flathub org.qbittorrent.qBittorrent

#Clear
sudo apt update -y
sudo apt upgrade -y
flatpak update -y
sudo apt autoclean
sudo apt autoremove -y
