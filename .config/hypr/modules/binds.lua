---------------------
---- KEYBINDINGS ----
---------------------

local mainMod = "SUPER"

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

--- Enter resize mode with submap ---
hl.bind(mainMod .. " + R", hl.dsp.submap("resize"))

hl.define_submap("resize", function()

    hl.bind("right", hl.resize({ x = 10, y = 0, relative = true}), { repeating = true })
    hl.bind("left", hl.resize({ x = -10, y = 0, relative = true}), { repeating = true })
    hl.bind("up", hl.resize({ x = 0, y = 10, relative = true}), { repeating = true })
    hl.bind("down", hl.resize({ x = 10, y = -10, relative = true}), { repeating = true })

    hl.bind("escape", hl.dsp.submap("reset")) -- reset to leave mode

end)

--- Move focus with mainMod + arrow keys ---
hl.bind(mainMod .. " + left",  hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + right", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + up",    hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + down",  hl.dsp.focus({ direction = "down" }))

--[[ TODO
1. Move window position
2. Add special work space for "minimized"
3. Add toggle floating
4. All the software I use
]]--