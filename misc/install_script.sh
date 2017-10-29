#!/bin/sh

pacman-key --init
pacman-key --populate archlinux
pacman -Syu

useradd -m -G wheel -s /bin/zsh alex
passwd alex

echo "Add yourself to sudoers"
visudo
cp /etc/pacman.conf /etc/pacman.conf.back

echo "Adding archlinuxfr"
echo "[archlinuxfr]" >> /etc/pacman.conf
echo "SigLevel = Never" >> /etc/pacman.conf
echo "Server = http://repo.archlinux.fr/\$arch" >> /etc/pacman.conf

echo "Installing yaourt"
pacman -Syu yaourt

su alex
cd
echo "cloning into dotfiles"

yaourt -S xorg-server xorg-xinit wget bspwm compton sxhkd qterminal deluge feh base-devel polybar universal-ctags-git tmux rofi rfkill openssh
