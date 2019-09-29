#!/bin/bash

user="Electrux"
base_dir="${HOME}/Git/${user}"
script_dir="${base_dir}/Gentoo-Dots"

# Base

## Create directories
mkdir -p ~/{Documents,Downloads,Movies,Git/${user},.local/share/fonts,.config,.mpd,.ncmpcpp}

# Clone git repositories

git clone https://github.com/Electrux/Gentoo-Dots.git ${script_dir}

# Core settings

## etc
sudo cp ${script_dir}/etc/bluetooth/*.conf /etc/bluetooth/
sudo cp ${script_dir}/etc/dbus-1/system.d/*.conf /etc/dbus-1/system.d/
sudo cp ${script_dir}/etc/modprobe.d/*.conf /etc/modprobe.d/
sudo cp ${script_dir}/etc/modules-load.d/*.conf /etc/modules-load.d/
sudo cp ${script_dir}/etc/conf.d/modules /etc/conf.d/
sudo cp ${script_dir}/etc/pulse/*.pa /etc/pulse/
sudo cp ${script_dir}/etc/sysctl.d/*.conf /etc/sysctl.d/
sudo cp ${script_dir}/etc/udev/rules.d/*.rules /etc/udev/rules.d/
sudo cp ${script_dir}/etc/X11/xorg.conf.d/60-synaptics.conf /etc/X11/xorg.conf.d/
sudo ln -sf ${script_dir}/etc/portage/make.conf /etc/portage/
sudo ln -sf ${script_dir}/etc/fonts/conf.d/99-noto-emoji.conf /etc/fonts/conf.d/

### Auto-login and sleep on flap down
sudo mkdir -p /etc/systemd/system/getty@tty1.service.d
sudo cp ${script_dir}/etc/systemd/system/getty@tty1.service.d/override.conf /etc/systemd/system/getty@tty1.service.d/
sudo cp ${script_dir}/etc/systemd/logind.conf /etc/systemd/

## Binaries
sudo ln -sf ${script_dir}/usr/local/bin/* /usr/local/bin/

## Kernel files
sudo ln -sf ${script_dir}/usr/src/linux/dotconfig /usr/src/linux/.config

## Systemd services
sudo mkdir -p /usr/lib/systemd/system/
sudo cp ${script_dir}/usr/lib/systemd/system/*.service /usr/lib/systemd/system/
sudo cp ${script_dir}/usr/lib/systemd/user/* /usr/lib/systemd/user/
sudo systemctl daemon-reload

## Alsa sound config
sudo mkdir -p /var/lib/alsa
sudo cp ${script_dir}/var/lib/alsa/* /var/lib/alsa/

# Configs

## Core
mkdir -p ~/.ncmpcpp
ln -sf ${script_dir}/dotncmpcpp/* ~/.ncmpcpp/
ln -sf ${script_dir}/dotconfig/{alacritty,qtile,compton,dunst,mpd,ranger,zathura,libinput-gestures.conf} ~/.config/

## Others
ln -sf ${script_dir}/.{asoundrc,gtkrc-2.0,gtkrc-2.0.mine,spacemacs,vimrc,xinitrc,Xresources,zprofile,zshrc} ~/

## For neovim
mkdir -p ~/.config/nvim/
ln -sf ${script_dir}/.vimrc ~/.config/nvim/init.vim

# Enable systemd services

## System services
sudo systemctl enable NetworkManager
#sudo systemctl enable bluetooth
sudo systemctl enable disable_gpe
#sudo systemctl enable hdmi_sound_toggle
#sudo systemctl start NetworkManager
#sudo systemctl start bluetooth
#sudo systemctl start disable_gpe
#sudo systemctl start hdmi_sound_toggle

## User services
systemctl --user enable lowpower.timer
#systemctl --user start lowpower.timer

systemctl --user enable syncthing
#systemctl --user enable mpd
#systemctl --user start syncthing
#systemctl --user start mpd

# Install (Neo)Vim Plug

curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Install spacemacs
#git clone https://github.com/syl20bnr/spacemacs.git ~/.emacs.d

# Install Oh My ZSH
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sed 's:env zsh::g')"
mv ~/.zshrc.pre-oh-my-zsh ~/.zshrc
git clone https://github.com/rupa/z.git ~/Git/z

# spark unicode bars
git clone https://github.com/holman/spark.git ~/Git/spark
sudo ln -sf ~/Git/spark/spark /usr/local/bin/
