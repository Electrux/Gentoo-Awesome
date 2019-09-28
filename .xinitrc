xrdb -merge ~/.Xresources
xrandr -s 2880x1800
xrandr --dpi 220
xset -dpms s off
xset r rate 190 50 # set keyboard speed
xbacklight -set 20
xbacklight -ctrl smc::kbd_backlight -set 20
exec qtile
