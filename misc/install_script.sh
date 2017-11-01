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
su alex -c "mv /home/alex/dotfiles/ /home/alex/.config/"

# linking config files
su alex -c "ln -s /home/alex/.config/misc/.xinitrc /home/alex/.xinitrc"
su alex -c "ln -s /home/alex/.config/misc/.profile /home/alex/.profile"

# installing polybar dependencies
su alex -c "gpg --recv-keys --keyserver hkp://pgp.mit.edu 1EB2638FF56C0C53"
su alex -c "yaourt -S wireless_tools mpd libmpdclient alsa-lib siji-git ttf-unifont cower"

# installing powerline fonts
# clone
git clone https://github.com/powerline/fonts.git --depth=1
# install
cd fonts
./install.sh
# clean-up a bit
cd ..
rm -rf fonts

# installing everything else
su alex -c "yaourt -S xorg-server xorg-xinit wget bspwm compton sxhkd qterminal deluge feh base-devel polybar universal-ctags-git tmux rofi rfkill openssh otf-font-awesome"
