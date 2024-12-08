#!/bin/bash
#
# DEBIAN 12 BOOKWORM + XFCE
# =========================
#
# ESSENTIALS:
# ===========
7zip arc-theme asunder at audacity ax25-apps ax25-xtools bat blueman bluez bpytop breeze btop calibre chromium cmatrix curl cutycapt darktable duf emacs espeak evince exa ffmpeg ffmpegthumbnailer filezilla finger firefox-esr flatpak fonts-jetbrains-mono fonts-liberation fonts-powerline fonts-recommended fonts-terminus fonts-ubuntu fonts-ubuntu-console fonts-ubuntu-title fzf galculator gdebi git gnome-disk-utility gparted gpick gpsd gpsd-clients gsfonts-other gvfs-backends gvfs-fuse htop hunspell-en-ca i3lock img2pdf k3b kate lame libavcodec59 libavcodec-extra libdvd-pkg libopusenc0 libopusenc-dev libopusenc-doc lightdm-gtk-greeter-settings linkchecker lsd menulibre micro mlocate moreutils most mpv musescore3 neofetch neovim netselect-apt nfs-kernel-server ngspice opus-tools oregano pandoc paper-icon-theme papirus-icon-theme pdftk powerline python-greenlet-dev python-greenlet-doc qalculate-gtk qrencode qt5-style-kvantum ranger rclone ripgrep rsync samba screenfetch scrot simple-scan slick-greeter spell stow systemd-zram-generator tealdeer telegram-desktop texlive-fonts-extra texlive-full texlive-lang-all texlive-luatex texlive-xetex timeshift tmux trustedqsl ttf-mscorefonts-installer universal-ctags vim vim-scripts vlc webp-pixbuf-loader whois xlog xnec2c xpdf yubikey-manager-qt yubioath-desktop zram-tools zsh
#
# PRINTING AND BLUETOOTH:
# =======================
sudo apt install -y bluez blueman cups
#
# FONTS:
# ======
sudo apt install -y fonts-firacode fonts-font-awesome fonts-liberation fonts-liberation2 fonts-powerline fonts-recommended fonts-sil-gentium fonts-terminus
#
# GREETER & SETTINGS:
# ===================
sudo apt install -y lightdm-gtk-greeter-settings slick-greeter
#
# FLATPAK & ENABLE FLATHUB:
# =========================
sudo apt install flatpak -y && flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
#
#
# INSTALL FLATPAKS:
# =================
flatpak install flathub org.chromium.Chromium
flatpak install flathub com.brave.Browser
flatpak install flathub com.bitwarden.desktop
flatpak install flathub com.github.tchx84.Flatseal
flatpak install flathub us.zoom.Zoom
flatpak install flathub org.arrl.trustedqsl
flatpak install flathub com.makemkv.MakeMKV
flatpak install flathub fr.handbrake.ghb
flatpak install flathub io.gitlab.librewolf-community
flatpak install flathub org.inkscape.Inkscape
flatpak install flathub org.keepassxc.KeePassXC
flatpak install flathub org.libreoffice.LibreOffice
flatpak install flathub org.localsend.localsend_app
flatpak install flathub org.musescore.MuseScore
flatpak install flathub org.shotcut.Shotcut
flatpak install flathub org.raspberrypi.rpi-imager
flatpak install flathub org.gnome.gitlab.YaLTeR.VideoTrimmer
flatpak install flathub org.gtk.Gtk3theme.Adwaita-dark
#
# THEMING:
# ========
# theme: arc-theme or adapta
# icons: papirus-icon-theme
# cursor: breeze-cursor-theme
# kde: kde-style-breeze (for kate editor)
#
sudo apt install -y adapta-gtk-theme-colorpack arc-theme breeze-cursor-theme kde-style-breeze papirus-icon-theme
#
# ===================
# OPTIONAL INSTALLS:
# ===================
#
# LATEX:
# ======
# sudo apt install -y texlive-full texlive-lang-all texlive-luatex texlive-xetex texlive-fonts-extra
#
#
# HAM RADIO:
# ==========
# sudo apt install -y flrig fldigi wsjtx wsjtx-data wsjtx-doc js8call ax25-apps ax25-tools ax25mail-utils libax25 libax25-dev talkd
#
# *Get GridTracker*: curl https://debian.gridtracker.org/gridtracker_deb_install.sh | sudo bash
#
# LAPTOP BATTERY OPTIMIZATION:
# ============================
# sudo apt install tlp tlp-rdw smartmontools
# enable & start: sudo systemctl enable tlp.service 
#
# OTHER SOURCES:
# ==============
# OhMyZsh: 
# sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
# ytdlp: https://github.com/yt-dlp/yt-dlp
#
# =======================
# =POST-INSTALL CONFIGS:=
# =======================
#
# ENABLE THE GREETER:
# ===================
# sudo systemctl enable lightdm
#
# USE SLICK GREETER:
# ==================
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
# ENABLE THE NETWORK STUFF:
# =========================
# sudo systemctl enable avahi-daemon && sudo systemctl enable acpid
#
# GREETER REMEMBER USER NAME:
# ===========================
# sudo nvim /etc/lightdm/lightdm.conf  Remove hashtag on this line: #greeter-hide-users=false
#
# REMOVE GRUB TIMEOUT: (Set GRUB_TIMEOUT=0)
# =========================================
# sudo nvim /etc/default/grub && sudo update-grub
#
# ADD USER TO DIALOUT GROUP:
# ==========================
# sudo usermod -aG dialout jason
#
# ADD USER TO SUDOERS:
# ====================
# sudo adduser jason sudo
