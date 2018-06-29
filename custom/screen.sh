function right-screen() {
    xrandr --auto
    xrandr --output DP-1 --right-of eDP-1
    xrandr --output DP-1 --rotate left
}
