#! /bin/bash
set -e

echo "Post Install Script by: Physis19"
sudo apt update
sudo apt upgrade -y

# Lista de programas para instalar via apt
Program_List_apt=(
    nala
    neofetch
    vlc
    zsh
)

# Instalação via apt
for i in "${Program_List_apt[@]}"; do
    if ! dpkg -l | grep -q "$i"; then 
        sudo apt install "$i" -y
    else
        echo "[INSTALADO] - $i"
    fi
done

# Instalação via Flatpak
read -p "Install Flatpak? [y/n]: " flatpak_is_install
if [ "$flatpak_is_install" == "y" ]; then
    sudo apt install flatpak -y
    flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
fi

flatpak install -y flathub com.bitwarden.desktop
flatpak install -y flathub com.spotify.Client
flatpak install -y flathub org.telegram.desktop
flatpak install -y flathub com.valvesoftware.Steam
flatpak install -y flathub com.heroicgameslauncher.hgl
flatpak install -y flathub org.qbittorrent.qBittorrent

# Limpeza do sistema
sudo apt update
sudo apt upgrade -y
flatpak update -y
sudo apt autoclean
sudo apt autoremove -y
