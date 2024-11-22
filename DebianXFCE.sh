#!/bin/bash
#
# DEBIAN 12 BOOKWORM + XFCE
# =========================
#
# XFCE Musthaves:
# ===============
# Network File Tools/System Events
sudo apt install -y dialog mtools acpi acpid gvfs-backends
#
#
# Essentials:
# ===========
sudo apt install -y nala neovim rsync curl git pandoc zsh ranger gparted openssh-server bpytop neofetch kdeconnect mpv ffmpeg samba gnome-disk-utility gimp hunspell-en-ca plank kate exa evince avahi-daemon gvfs-backends scrot i3lock tar unzip zip p7zip zram-tools systemd-zram-generator stow netselect-apt ffmpegthumbnailer 
#
#
# Printing and bluetooth (if needed):
# ===================================
sudo apt install -y cups bluez blueman
#
#
# Fonts:
# ======
sudo apt install -y fonts-font-awesome fonts-powerline fonts-liberation2 fonts-liberation fonts-terminus fonts-sil-gentium fonts-firacode fonts-recommended
#
#
# Greeter & Settings:
# ====================
sudo apt install -y lightdm-gtk-greeter-settings slick-greeter
#
#
# Flatpak & Enable Flathub:
# =================================
sudo apt install flatpak -y && flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
#
#
# Flatpaks:
# ====================
flatpak install Brave Chromium Chrome Bitwarden Flatseal Zoom trustedqsl
#
# Theming:
# ========
# theme: arc-theme
# icons: papirus-icon-theme
# cursor: breeze-cursor-theme
# kde: kde-style-breeze (for kate editor)
#
sudo apt install -y arc-theme papirus-icon-theme breeze-cursor-theme kde-style-breeze

# ===================
# OPTIONAL INSTALLS:
# ===================
#
# Latex:
# ======
# sudo apt install -y texlive-full texlive-lang-all texlive-luatex texlive-xetex texlive-fonts-extra
#
#
# Ham Radio:
# ==========
# sudo apt install -y flrig fldigi wsjtx wsjtx-data wsjtx-doc js8call ax25-apps ax25-tools ax25mail-utils libax25 libax25-dev talkd
#
# *Get GridTracker*: curl https://debian.gridtracker.org/gridtracker_deb_install.sh | sudo bash
#
# Other Sources:
# ==============
# OhMyZsh: sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
# ytdlp: https://github.com/yt-dlp/yt-dlp
#
# =====================
# POST-INSTALL CONFIGS:
# =====================
#
# Enable the Greeter
# ==================
# sudo systemctl enable lightdm
#
# Use Slick Greeter
# =================
# cd /etc/lightdm
# sudo nvim lightdm.conf
# find #greeter-session= and make it greeter-session=slick-greeter
# Line below should be greeter-hide-users=false
# Change the background: sudo cp picture.jpg /usr/share/backgrounds/slickback.jpg
# cd /etc/lightdm && sudo nvim slick-greeter.conf
# [Greeter]
# draw-user-backgrounds=false
# background=/usr/share/backgrounds/slickback.jpg
#
# Enable the Network Stuff
# ========================
# sudo systemctl enable avahi-daemon && sudo systemctl enable acpid
#
# Make Lightdm Remember User Name
# ===============================
# sudo nvim /etc/lightdm/lightdm.conf  Remove hashtag on this line: #greeter-hide-users=false
#
# Remove Grub timeout*:(Set GRUB_TIMEOUT=0)
# =========================================
# sudo nvim /etc/default/grub && sudo update-grub
#
# Add User to the Dialout Group
# =============================
# sudo usermod -aG dialout jason
#
# Add user to Sudoers
# ===================
# sudo adduser jason sudo
#
# EXA installation (a better version of ls) replace ls command in .zshrc file with line below
# alias ls='exa --color=always --group-directories-first'
