XDG_CONFIG_HOME="$HOME/.config"
export XDG_CONFIG_HOME
# mpd daemon start
[ ! -s ~/.config/mpd/pid ] && mpd

export PATH="$HOME/.cargo/bin:$PATH"
