# start fcitx
export XMODIFIERS=@im=fcitx
# export GTK_IM_MODULE=xim
# export GTK_IM_MODULE=/etc/gtk-2.0/gtk.immodules
export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=xim

# set default encodeing to zh_CN.UTF-8 when start X
export LANG=zh_CN.UTF-8

fcitx &

# start xbindkeys
xbindkeys

# load Xresource for rxvt
xrdb -load ~/.Xresource
# close the urxvt beep
/usr/bin/xset b off

# use gnome desktop resource
# gnome-settings-daemon &
# show the NIC icon
# nm-applet --sm-disable &

# start awesome
exec awesome

# start fvwm
# exec fvwm
