xrandr --output DP-2 --mode 2560x1440 --rate 164.83
xrdb ~/.Xresources

picom --experimental-backends --backend glx &
glava --desktop &
dwmstatus &
~/.fehbg &
exec dwm
