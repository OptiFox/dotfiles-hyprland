---------------
---- RULES ----
---------------

-- Workspace Rules
hl.workspace_rule({ workspace = "1", persistent = true })
hl.workspace_rule({ workspace = "2", persistent = true })
hl.workspace_rule({ workspace = "3", persistent = true })
hl.workspace_rule({ workspace = "4", persistent = true })
hl.workspace_rule({ workspace = "5", persistent = true })

hl.workspace_rule({ workspace = "special:minimized", gaps_out = 30 })


-- Window Rules
hl.window_rule({match = {class = "^(org\\.gnome\\.)"}, rounding = 12})

hl.window_rule({match = {class = "^(gnome-control-center)$"}, tile = true})
hl.window_rule({match = {class = "^(pavucontrol)$"}, tile = true})
hl.window_rule({match = {class = "^(nm-connection-editor)$"}, tile = true})

hl.window_rule({match = {class = "^(gnome-calculator)$"}, float = true})
hl.window_rule({match = {class = "^(galculator)$"}, float = true})

hl.window_rule({match = {class = "^(org\\.gnome\\.Nautilus)$"}, float = true})
hl.window_rule({match = {class = "^(xdg-desktop-portal)$"}, float = true})

hl.window_rule({match = {class = "^(zoom)$"}, float = true})

hl.window_rule({match = {class = "^(nm-connection-editor)$"}, float = true})

--- Steam ---
hl.window_rule({match = {class = "^(steam)$"}, float = true})
hl.window_rule({match = {class = "^(steam)$"}, center = true})
hl.window_rule({match = {class = "^(steam)$", title = "^(Steam)$"}, tile = true})

--- PrismLauncher ---
hl.window_rule({match = {class = "^(org\\.prismlauncher\\.PrismLauncher)$"}, float = true})
hl.window_rule({match = {class = "^([Mm]inecraft.*)$"}, float = true})

hl.window_rule({match = {class = "^(org\\.prismlauncher\\.PrismLauncher)$", title = "^(Prism Launcher.*)$"}, center = true})
hl.window_rule({match = {class = "^(org\\.prismlauncher\\.PrismLauncher)$", title = "^(Prism Launcher.*)$"}, size = {"1080", "720"}})

hl.window_rule({match = {class = "^(org\\.prismlauncher\\.PrismLauncher)$", title = "^(Please wait.*)$"}, center = true})
hl.window_rule({match = {class = "^(org\\.prismlauncher\\.PrismLauncher)$", title = "^(Please wait.*)$"}, size = {"450", "150"}})
hl.window_rule({match = {class = "^(org\\.prismlauncher\\.PrismLauncher)$", title = "^(Please wait.*)$"}, opaque = true})

hl.window_rule({match = {class = "^(org\\.prismlauncher\\.PrismLauncher)$", title = "^(Edit Instance|Console|Settings).*$"}, center = true})
hl.window_rule({match = {class = "^(org\\.prismlauncher\\.PrismLauncher)$", title = "^(Edit Instance|Console|Settings).*$"}, size = {"800", "500"}})

--- Firefox ---
hl.window_rule({match = {class = "^(firefox)$", title = "^(Library)$"}, center = true})
hl.window_rule({match = {class = "^(firefox)$", title = "^(Library)$"}, float = true})
hl.window_rule({match = {class = "^(firefox)$", title = "^(Library)$"}, size = {"800", "500"}})
hl.window_rule({match = {class = "^(firefox)$", title = "^(Picture-in-Picture)$"}, float = true})

--- Thunar, VSCodium ---
hl.window_rule({match = {class = "^(thunar)$"}, opacity = "0.95 override 0.85 override"})
hl.window_rule({match = {class = "^(codium)$"}, opacity = "0.95 override 0.85 override"})


-- Layer Rules
--- Thunar, VSCodium ---
hl.layer_rule({match = {class = "^(thunar)$"}, blur = true})
hl.layer_rule({match = {class = "^(codium)$"}, blur = true})

--- Wlogout ---
hl.layer_rule({match = {class = "^(logout_dialog)$"}, blur = true})
hl.layer_rule({match = {class = "^(logout_dialog)$"}, ignore_alpha = "0.5"})

--- SwayNC ---
hl.layer_rule({match = {class = "^(swaync-control-center)"}, blur = true})
hl.layer_rule({match = {class = "^(swaync-control-center)"}, ignore_alpha = "0.5"})
hl.layer_rule({match = {class = "^(swaync-control-center)"}, animation = "slide right"})

hl.layer_rule({match = {class = "^(swaync-notification-window)"}, blur = true})
hl.layer_rule({match = {class = "^(swaync-notification-window)"}, ignore_alpha = "0.5"})
hl.layer_rule({match = {class = "^(swaync-notification-window)"}, animation = "slide right"})

--- EWW ---
hl.layer_rule({match = {class = "^(gtk-layer-shell)"}, animation = "slide right"})

--- Waybar ---
hl.layer_rule({match = {class = "^(waybar)"}, blur = true})
hl.layer_rule({match = {class = "^(waybar)"}, ignore_alpha = "0.5"})

--- Dock ---
hl.layer_rule({match = {class = "^(nwg-dock-hyprland)"}, blur = true})
hl.layer_rule({match = {class = "^(nwg-dock-hyprland)"}, ignore_alpha = "0.5"})

--- Rofi ---
hl.layer_rule({match = {class = "^(rofi)"}, blur = true})
hl.layer_rule({match = {class = "^(rofi)"}, ignore_alpha = "0.5"})
hl.layer_rule({match = {class = "^(rofi)"}, animation = "popin 80%"})