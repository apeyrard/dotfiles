#!/bin/sh

pacman -Sy archlinux-keyring
pacman -Syu

# adding user
useradd -m -G wheel -s /bin/bash alex
passwd alex

echo "Add yourself to sudoers"
visudo

# adding archlinuxfr and yaourt
cp /etc/pacman.conf /etc/pacman.conf.back

echo "Adding archlinuxfr"
echo "[archlinuxfr]" >> /etc/pacman.conf
echo "SigLevel = Never" >> /etc/pacman.conf
echo "Server = http://repo.archlinux.fr/\$arch" >> /etc/pacman.conf

echo "Installing yaourt"
pacman -Syu yaourt

# cloning into dotfiles
su alex
cd
echo "cloning into dotfiles"

# linking config files

# installing everything else
yaourt -S zsh xorg-server xorg-xinit wget bspwm compton sxhkd qterminal deluge feh base-devel polybar universal-ctags-git tmux rofi rfkill openssh
