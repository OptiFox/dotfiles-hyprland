-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

local function set_transparent()
  local groups = {
    "Normal",
    "NormalNC",
    "LineNr",
    "Folded",
    "NonText",
    "SpecialKey",
    "VertSplit",
    "SignColumn",
    "EndOfBuffer",
    "NormalFloat",
    "FloatBorder",
  }
  for _, group in ipairs(groups) do
    vim.api.nvim_set_hl(0, group, { bg = "NONE", ctermbg = "NONE" })
  end
end

set_transparent()
-- Re-run if you change colorschemes
vim.api.nvim_create_autocmd("ColorScheme", { callback = set_transparent })

-- Enable line wrapping
vim.opt.wrap = true

-- Don't break words in the middle
vim.opt.linebreak = true

-- Optional: Add a visual indicator for wrapped lines (like a small arrow)
--vim.opt.showbreak = "↳ "
