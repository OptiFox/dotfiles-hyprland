return {
  -- Configure the Catppuccin plugin
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    opts = {
      flavour = "mocha", -- Forces the Mocha palette
      transparent_background = true, -- Set to true so your Hyprland Kawase blur shines through!
      integrations = {
        cmp = true,
        gitsigns = true,
        mini = true,
        treesitter = true,
      },
    },
  },
  -- Tell LazyVim to load it on startup
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin",
    },
  },
}
