
#!/bin/usr/bash

# update system
sudo dnf update -y

# rpm fusion

## install rpm fusion repos
sudo dnf install -y https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm

sudo dnf update -y

## install appstream metadata for gnome software
sudo dnf groupupdate -y core

## intall multimedia codecs
sudo dnf groupupdate -y multimedia --setop="install_weak_deps=False" --exclude=PackageKit-gstreamer-plugin
sudo dnf groupupdate -y sound-and-video

# install dnf packages
sudo dnf install -y \
git \
curl \
wget \
vim \
neovim \
tldr \
fish \
fzf \
fd-find \
ranger \
neofetch \
tilix \
steam \
gnome-shell-extension-appindicator \
flatpak \
gnome-tweaks


# install flatpak
# adding this doesn't work for some reason. Had to do it with Gnome Software manually.
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
flatpak update -y


# install flatpaks
flatpak install -y com.calibre_ebook.calibre \
org.qbittorrent.qBittorrent \
com.brave.Browser \
org.gnome.Boxes \
com.github.iwalton3.jellyfin-media-player \
com.github.johnfactotum.Foliate \
com.mattjakeman.ExtensionManager \
org.gnome.Fractal \
org.gnome.Geary \
org.signal.Signal \
org.telegram.desktop
# flatpak install tv.kodi.Kodi
# flatpak install com.valvesoftware.Steam

# dconf gnome config

## general
dconf write org/gnome/desktop/interface/clock-show-weekday true
dconf write org/gnome/desktop/interface/font-antialiasing "'rgba'"
dconf write org/gnome/desktop/interface/font-hinting "'slight'"
dconf write org/gnome/desktop/interface/gtk-theme "'adw-gtk3'"
dconf write org/gnome/desktop/interface/monospace-font-name "'Source Code Pro 14'"

## Laptop specific
dconf write org/gnome/desktop/interface/text-scaling-factor "'1.25'"
dconf write org/gnome/desktop/interface/show-battery-percentage true

# dconf write org/gnome/desktop/interface/toolkit-accessibility false
# dconf write org/gnome/desktop/interface/color-scheme "'default'"
