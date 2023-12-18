return {
  "ellisonleao/gruvbox.nvim",
  priority = 1000,
  config = function()
    local gruvbox = require("gruvbox")
    gruvbox.setup({
      overrides = {
        ["@lsp.type.typeParameter.typescript"] = { bold = true },
        ["@conditional.angular"] = { link = "GruvboxYellowBold" },
        ["@repeat.angular"] = { link = "GruvboxYellowBold" },
        ["@keyword.coroutine.angular"] = { link = "GruvboxYellowBold" },
        ["@exception.angular"] = { link = "GruvboxYellowBold" },
        ["@attribute.angular"] = { link = "GruvboxAqua" },
        ["@keyword.event.angular"] = { link = "GruvboxRedUnderline" },
      },
    })

    vim.o.background = "dark" -- or "light" for light mode
    vim.cmd([[colorscheme gruvbox]])
  end,
}
