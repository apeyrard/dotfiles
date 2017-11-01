#!/bin/sh

# useful if date might be wrong, like on virtual machines
timedatectl set-ntp true

pacman -Sy archlinux-keyring
pacman -Syu
pacman -S zsh git

# adding user
useradd -m -G wheel -s /bin/zsh alex
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
cd /home/alex
echo "cloning into dotfiles"
su alex -c "git clone https://github.com/apeyrard/dotfiles.git"

# linking config files
su alex -c "ln -s /home/alex/dotfiles /home/alex/.config"
su alex -c "ln -s /home/alex/dotfiles/misc/.xinitrc /home/alex/.xinitrc"
su alex -c "ln -s /home/alex/dotfiles/misc/.profile /home/alex/.profile"

# installing everything else
su alex -c "yaourt -S xorg-server xorg-xinit wget bspwm compton sxhkd qterminal deluge feh base-devel polybar universal-ctags-git tmux rofi rfkill openssh"
