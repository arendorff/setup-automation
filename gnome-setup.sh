
#!/bin/usr/bash

# move workspace left needs to be unbound before being bound again.


######
## don't forget to setup color profile with icm file
#####

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
ddcutil \
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

# adw-gtk3 theme
sudo dnf copr enable -y nickavem/adw-gtk3
sudo dnf install -y adw-gtk3
flatpak install -y org.gtk.Gtk3theme.adw-gtk3 org.gtk.Gtk3theme.adw-gtk3-dark

# dconf gnome config

## general
dconf write /org/gnome/desktop/interface/clock-show-weekday true
dconf write /org/gnome/desktop/interface/font-antialiasing "'rgba'"
dconf write /org/gnome/desktop/interface/font-hinting "'slight'"
dconf write /org/gnome/desktop/interface/gtk-theme "'adw-gtk3'"
dconf write /org/gnome/desktop/interface/monospace-font-name "'Source Code Pro 14'"

## Laptop specific
# dconf write org/gnome/desktop/interface/text-scaling-factor "'1.25'"
# dconf write org/gnome/desktop/interface/show-battery-percentage true
# dconf write /org/gnome/desktop/peripherals/touchpad/tap-to-click true
# dconf write /org/gnome/desktop/peripherals/touchpad/two-finger-scrolling-enabled true
# dconf write /org/gnome/desktop/input-sources/xkb-options "['altwin:swap_alt_win']"


## tilix
dconf write /com/gexperts/Tilix/prompt-on-close false
dconf write /com/gexperts/Tilix/terminal-title-style "'none'"
dconf write /com/gexperts/Tilix/theme-variant "'system'"

dconf write /com/gexperts/Tilix/keybindings/app-new-session "'<Alt>Return'"
dconf write /com/gexperts/Tilix/keybindings/session-add-auto "'<Shift><Alt>Return'"
dconf write /com/gexperts/Tilix/keybindings/session-switch-to-next-terminal "'<Alt>j'"
dconf write /com/gexperts/Tilix/keybindings/session-switch-to-previous-terminal "'<Alt>k'"
dconf write /com/gexperts/Tilix/keybindings/terminal-close "'<Alt>q'"
dconf write /com/gexperts/Tilix/keybindings/win-switch-to-next-session "'<Alt>l'"
dconf write /com/gexperts/Tilix/keybindings/win-switch-to-previous-session "'<Alt>h'"

# keyboard layout
dconf write /org/gnome/desktop/input-sources/show-all-sources true
dconf write /org/gnome/desktop/input-sources/sources "[('xkb', 'de+neo_qwertz')]"
# dconf write /org/gnome/desktop/input-sources/sources "[('xkb', 'de')]"

# gnome search
dconf write /org/gnome/desktop/search-providers/disabled "['org.gnome.Contacts.desktop', 'org.gnome.Boxes.desktop', 'org.gnome.Calculator.desktop', 'org.gnome.Calendar.desktop', 'org.gnome.Characters.desktop', 'org.gnome.Epiphany.desktop', 'org.gnome.Terminal.desktop', 'org.gnome.Software.desktop', 'org.gnome.Photos.desktop', 'firefox.desktop', 'org.gnome.clocks.desktop']"

# gnome keybindings/shortcuts
dconf write /org/gnome/desktop/wm/keybindings/close "['<Super>q']"
dconf write /org/gnome/desktop/wm/keybindings/move-to-workspace-left "['<Shift><Super>h']"
dconf write /org/gnome/desktop/wm/keybindings/move-to-workspace-right "['<Shift><Super>l']"
dconf write /org/gnome/desktop/wm/keybindings/switch-to-workspace-left "['<Super>h']"
dconf write /org/gnome/desktop/wm/keybindings/switch-to-workspace-right "['<Super>l']"
dconf write /org/gnome/desktop/wm/keybindings/toggle-fullscreen "['<Shift><Super>f']"
dconf write /org/gnome/desktop/wm/keybindings/toggle-maximized "['<Super>f']"

# gnome-tweaks
dconf write /org/gnome/desktop/wm/preferences/resize-with-right-button true
dconf write /org/gnome/mutter/center-new-windows true
dconf write /org/gnome/mutter/dynamic-workspaces false

# nightlight
dconf write /org/gnome/settings-daemon/plugins/color/night-light-enabled true
dconf write /org/gnome/settings-daemon/plugins/color/night-light-last-coordinates "'(53.06901803988481, 8.8621750000000006)'"
dconf write /org/gnome/settings-daemon/plugins/color/night-light-schedule-automatic false

# these custom keybindings don't seem to work
dconf write /org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/binding "'<Super>Return'"
dconf write /org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/command "'tilix'"
dconf write /org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/name "'tilix'"
dconf write /org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1/binding "'<Super>w'"
dconf write /org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1/command "'firefox'"
dconf write /org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1/name "'firefox'"
dconf write /org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom2/binding "'<Super>r'"
dconf write /org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom2/command "'nautilus'"
dconf write /org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom2/name "'nautilus'"
dconf write /org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom3/binding "'<Super>t'"
dconf write /org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom3/command "'flatpak run org.telegram.desktop'"
dconf write /org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom3/name "'telegram'"
dconf write /org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom4/binding "'<Super>e'"
dconf write /org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom4/command "'flatpak run org.gnome.Geary'"
dconf write /org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom4/name "'geary'"
