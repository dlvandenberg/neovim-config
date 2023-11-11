return {
  "ellisonleao/gruvbox.nvim",
  priority = 1000,
  config = function()
    local gruvbox = require("gruvbox")
    gruvbox.setup({})

    vim.o.background = "dark" -- or "light" for light mode
    vim.cmd([[colorscheme gruvbox]])
  end,
}
