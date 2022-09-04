#!/bin/usr/bash

# update system
sudo dnf update -y

# rpm fusion

## install rpm fusion repos
sudo dnf install https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm

## install appstream metadata for gnome software
sudo dnf groupupdate core

## intall multimedia codecs
sudo dnf groupupdate multimedia --setop="install_weak_deps=False" --exclude=PackageKit-gstreamer-plugin
sudo dnf groupupdate sound-and-video

# dnf
sudo dnf install -y \\
git \\
curl \\
wget \\
vim \\
neovim \\
tldr \\
fish \\
fzf \\
fd-find \\
ranger \\
neofetch \\
tilix \\
steam \\
gnome-shell-extension-appindicator \\
gnome-tweaks

# install flatpak
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
flatpak update -y

# install flatpaks
flatpak install -y com.calibre_ebook.calibre
flatpak install -y org.qbittorrent.qBittorrent
flatpak install -y com.brave.Browser
flatpak install -y org.gnome.Boxes
flatpak install -y com.github.iwalton3.jellyfin-media-player
flatpak install -y com.github.johnfactotum.Foliate
flatpak install -y com.mattjakeman.ExtensionManager
# flatpak install com.valvesoftware.Steam
flatpak install -y org.gnome.Fractal
flatpak install -y org.gnome.Geary
flatpak install -y org.signal.Signal
flatpak install -y org.telegram.desktop
# flatpak install tv.kodi.Kodi

# dconf gnome config

dconf write org/gnome/desktop/interface/clock-show-weekday true
# dconf write org/gnome/desktop/interface/color-scheme "'default'"
dconf write org/gnome/desktop/interface/font-antialiasing "'rgba'"
dconf write org/gnome/desktop/interface/font-hinting "'slight'"
dconf write org/gnome/desktop/interface/gtk-theme "'adw-gtk3'"
dconf write org/gnome/desktop/interface/monospace-font-name "'Source Code Pro 14'"
dconf write org/gnome/desktop/interface/show-battery-percentage true
dconf write org/gnome/desktop/interface/text-scaling-factor "'1.25'"
# dconf write org/gnome/desktop/interface/toolkit-accessibility false
