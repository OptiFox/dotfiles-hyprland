---------------------
---- KEYBINDINGS ----
---------------------

local mainMod = "SUPER"
local terminal = "kitty"
local fileManager = "thunar"

-- SwayOSD
--- SwayOSD Volume & Brightness ---
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("swayosd-client --output-volume raise"),       { locked = true, repeating = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("swayosd-client --output-volume lower"),       { locked = true, repeating = true })
hl.bind("XF86AudioMute",        hl.dsp.exec_cmd("swayosd-client --output-volume mute-toggle"), { locked = true, repeating = true })
hl.bind("XF86MonBrightnessUp",  hl.dsp.exec_cmd("swayosd-client --brightness raise"),          { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown",hl.dsp.exec_cmd("swayosd-client --brightness lower"),          { locked = true, repeating = true })

--- SwayOSD Media Controls ---
hl.bind("XF86AudioNext",  hl.dsp.exec_cmd("swayosd-client --playerctl next"),       { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("swayosd-client --playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPlay",  hl.dsp.exec_cmd("swayosd-client --playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev",  hl.dsp.exec_cmd("swayosd-client --playerctl previous"),   { locked = true })

--- SwayOSD CapsLock/NumLock ---
hl.bind("CAPS + Caps_Lock",  hl.dsp.exec_cmd("swayosd-client --caps-lock"), { release = true })


-- Workspaces
--- Switch workspaces with mainMod + [0-9] ---
--- Move active window to a workspace with mainMod + SHIFT + [0-9] ---
for i = 1, 10 do
    local key = i % 10 -- 10 maps to key 0
    hl.bind(mainMod .. " + " .. key,             hl.dsp.focus({ workspace = i}))
    hl.bind(mainMod .. " + SHIFT + " .. key,     hl.dsp.window.move({ workspace = i }))
end

--- Scroll through existing workspaces with mainMod + scroll ---
hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + mouse_up",   hl.dsp.focus({ workspace = "e-1" }))

--- Move active window to relative workspace with mainMod + CTRL + scroll ---
hl.bind(mainMod .. " + CTRL + mouse_down", hl.dsp.window.move({ workspace = "e+1" }))
hl.bind(mainMod .. " + CTRL + mouse_up", hl.dsp.window.move({ workspace = "e-1" }))


-- Window Management
--- Move/resize windows with mainMod + LMB/RMB and dragging ---
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(),   { mouse = true }) -- left button
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true }) -- right button

--- Resize window ---
hl.bind(mainMod .. " + equal", hl.dsp.window.resize({ x = 50, y = 0, relative = true}), { repeating = true })
hl.bind(mainMod .. " + minus", hl.dsp.window.resize({ x = -50, y = 0, relative = true}), { repeating = true })
hl.bind(mainMod .. " + SHIFT + equal", hl.dsp.window.resize({ x = 0, y = 50, relative = true}), { repeating = true })
hl.bind(mainMod .. " + SHIFT + minus", hl.dsp.window.resize({ x = 0, y = -50, relative = true}), { repeating = true })

--- Move focus with mainMod + arrow keys ---
hl.bind(mainMod .. " + left",  hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + right", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + up",    hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + down",  hl.dsp.focus({ direction = "down" }))

--- Move window position ---
for i = 1, 4 do
    local arrowkey = { "Left", "Right", "Up", "Down" }
    local focusdir = { "l", "r", "u", "d" }
    hl.bind(mainMod .. " + SHIFT + " .. arrowkey[i], hl.dsp.window.move({ direction = focusdir[i] }),
        { description = "Window: Move " .. arrowkey[i] })
end

--- Toggle floating ---
hl.bind(mainMod .. " + SHIFT + T", hl.dsp.window.float({ action = "toggle" }), { description = "Window: Float/Tile" })

--- Toggle Fullscreen ---
hl.bind("SUPER + F", hl.dsp.window.fullscreen({ mode = "fullscreen", action = "toggle" }), { description = "Window: Fullscreen" })

--- Special workspace for "minimized" ---
hl.bind(mainMod .. " + M",
    hl.dsp.window.move({ workspace = "special:minimized", follow = false }), { description = "Window: Minimize" })
hl.bind(mainMod .. " + SHIFT + M", hl.dsp.workspace.toggle_special("minimized"))

--- Close window ---
hl.bind(mainMod .. " + SHIFT + Q", hl.dsp.window.close(), { description = "Window: Close" })


-- Software
--- Terminal ---
hl.bind(mainMod .. " + Return", hl.dsp.exec_cmd(terminal))

--- File Manager ---
hl.bind(mainMod .. " + E", hl.dsp.exec_cmd(fileManager))

--- Rofi ---
local rofiApp = "pkill rofi || ~/.config/rofi/launcher.sh"
local rofiClipboard = 'pkill rofi || cliphist list | rofi -dmenu -display-columns 2 -p " 󰅍 " -theme ~/.config/rofi/style-2.rasi | cliphist decode | wl-copy'
local rofiWallpaper = "pkill rofi || ~/.config/hypr/scripts/wallpaper-picker.sh"
local rofiEmoji = 'pkill rofi || rofimoji --files all --action type copy --prompt " ⬢ " --selector-args="-theme ~/.config/rofi/style-2.rasi"'

hl.bind(mainMod .. " + D", hl.dsp.exec_cmd(rofiApp))
hl.bind(mainMod .. " + V", hl.dsp.exec_cmd(rofiClipboard))
hl.bind(mainMod .. " + Y", hl.dsp.exec_cmd(rofiWallpaper))
hl.bind(mainMod .. " + period", hl.dsp.exec_cmd(rofiEmoji))

--- Screenshot ---
hl.bind(mainMod .. " + SHIFT + S", hl.dsp.exec_cmd("hyprshot -zm region"), { description = "Screenshot: Select Region" })
hl.bind("Print", hl.dsp.exec_cmd("hyprshot -zm region"))
hl.bind("ALT + Print", hl.dsp.exec_cmd("hyprshot -zm window"), { description = "Screenshot: Select Window" })
hl.bind("CTRL + Print", hl.dsp.exec_cmd("hyprshot -zm output"), { description = "Screenshot: Select Monitor" })

--- Notification ---
hl.bind(mainMod .. " + N", hl.dsp.exec_cmd("swaync-client -t -sw"))

--- Wlogout ---
hl.bind(mainMod .. " + Escape", hl.dsp.exec_cmd("pkill wlogout || wlogout -b 5 -T 400 -B 400"))

--- On-Screen Keyboard ---
hl.bind(mainMod .. " + K", hl.dsp.exec_cmd("pkill wvkbd-mobintl || wvkbd-mobintl -L 400 -H 400 -l full,arabic --landscape-layers full,arabic"))

--- Toggle Dock ---
hl.bind(mainMod .. " + SHIFT + F", hl.dsp.exec_cmd('pkill nwg-dock-hyprla || nwg-dock-hyprland -x -mb 2 -i 33 -w 5 -c "rofi -show drun -theme ~/.config/rofi/style-1.rasi" -lp start -ico /usr/share/pixmaps/archlinux-logo.svg'))