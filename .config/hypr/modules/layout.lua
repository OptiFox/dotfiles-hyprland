----------------
---- LAYOUT ----
----------------

hl.config({
  general = {
    gaps_out = 5,
    gaps_in = 2,
    gaps_workspaces = 0,
    border_size = 2,
    layout = "dwindle"
  },
  decoration = {
    rounding = 0,

    active_opacity   = 1.0,
    inactive_opacity = 1.0,

    shadow = {
      enabled      = true,
      range        = 30,
      render_power = 5,
      color        = "rgba(00000070)",
    },

    blur = {
      enabled   = true,
      size      = 15,
      passes    = 2,

      ignore_opacity = true,
      noise = 0.02,
      contrast = 1.5,

      popups_ignorealpha = 1.0
    },
  },

  animations = {
    enabled = true,
  },

  -- Layout
    dwindle = {
        preserve_split = true
    },
    master = {
        new_status = "master",
    },
    scrolling = {
        fullscreen_on_one_column = true,
    }
})

-- Custom curves
hl.curve("overshot",  { type = "bezier", points = { {0.05, 0.9}, {0.1, 1.1} } })
hl.curve("snappy",    { type = "bezier", points = { {0.4, 0.0},  {0.2, 1.0} } })
hl.curve("smoothOut", { type = "bezier", points = { {0.36, 0},   {0.66, -0.56} } })

-- Animations
hl.animation({ leaf = "windowsIn",     enabled = true, speed = 3, bezier = "default" })
hl.animation({ leaf = "windowsOut",    enabled = true, speed = 3, bezier = "default" })
hl.animation({ leaf = "workspaces",    enabled = true, speed = 5, bezier = "default" })
hl.animation({ leaf = "windowsMove",   enabled = true, speed = 4, bezier = "default" })
hl.animation({ leaf = "fade",          enabled = true, speed = 3, bezier = "default" })
hl.animation({ leaf = "border",        enabled = true, speed = 3, bezier = "default" })

hl.animation({ leaf = "layersIn",      enabled = true, speed = 4, bezier = "overshot" })
hl.animation({ leaf = "layersOut",     enabled = true, speed = 3, bezier = "smoothOut" })

hl.animation({ leaf = "fadeLayersIn",  enabled = true, speed = 3, bezier = "snappy" })
hl.animation({ leaf = "fadeLayersOut", enabled = true, speed = 3, bezier = "smoothOut" })