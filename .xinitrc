
eval $(gnome-keyring-daemon --start)
export SSH_AUTH_SOCK

feh -zZ --bg-fill ~/Pictures/Genshin

greenclip daemon &

kbdd

picom -b

polybar -r &

setxkbmap -layout us,br -option grp:win_space_toggle

exec i3

