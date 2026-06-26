-----------------
---- GENERAL ----
-----------------

hl.monitor({
    output = "",
    mode = "preferred",
    position = "auto",
    scale = 1
})

hl.gesture({
    fingers = 3,
    direction = "horizontal",
    action = "workspace"
})

hl.config({
  gestures = {
    workspace_swipe_distance = 700,
    workspace_swipe_cancel_ratio = 0.2,
    workspace_swipe_min_speed_to_force = 5,
    workspace_swipe_direction_lock = true,
    workspace_swipe_direction_lock_threshold = 10,
    workspace_swipe_create_new = true
  },
  misc = {
    disable_hyprland_logo = true,
    disable_splash_rendering = true,
    vrr = 1,
    middle_click_paste = false
  },
  input = {
    kb_layout = "us",
    numlock_by_default = true,
    accel_profile = "flat",

    touchpad = {
      natural_scroll = true,
      disable_while_typing = true,
      clickfinger_behavior = true
    }
  },
  cursor = {
    inactive_timeout = 10,
    no_hardware_cursors = 0,
    no_warps = true
  },
  xwayland = {
    force_zero_scaling = true
  }
})