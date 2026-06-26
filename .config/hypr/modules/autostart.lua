-------------------
---- AUTOSTART ----
-------------------

hl.on("hyprland.start", function () 
  hl.exec_cmd("dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP")
  hl.exec_cmd("systemctl --user start hyprland-session.target")
  --hl.exec_cmd("sh -c 'sleep 5 && vesktop --start-minimized'")
  hl.exec_cmd("sleep 2 && swaync &")
  hl.exec_cmd("awww-daemon")
  hl.exec_cmd("waybar")
  hl.exec_cmd("eww daemon")
  hl.exec_cmd("sleep 2 && swayosd-server")
  hl.exec_cmd("wl-paste --type text --watch cliphist store") -- Stores only text data
  hl.exec_cmd("wl-paste --type image --watch cliphist store") -- Stores only image data
  hl.exec_cmd("wl-clip-persist --clipboard regular")
  hl.exec_cmd("nwg-dock-hyprland -x -mb 2 -i 33 -w 5 -c 'rofi -show drun -theme ~/.config/rofi/style-1.rasi' -lp start -ico /usr/share/pixmaps/archlinux-logo.svg")
  hl.exec_cmd("nm-applet")
  --hl.exec_cmd("antimicrox --hidden")
  --hl.exec_cmd("gsr-ui")
  hl.exec_cmd("/usr/lib/polkit-kde-authentication-agent-1")
end)