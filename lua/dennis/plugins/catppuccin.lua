return {
  "catppuccin/nvim",
  name = "catppuccin",
  priority = 1000,
  config = function()
    local catppuccin = require("catppuccin")

    catppuccin.setup({
      flavour = "mocha", -- latte, frappe, macchiato, mocha
      background = {
        light = "latte",
        dark = "mocha",
      },
      transparent_background = false, -- disables setting the background color.
      show_end_of_buffer = false, -- shows the '~' characters after the end of buffers
      term_colors = true, -- sets terminal colors (e.g. `g:terminal_color_0`)
      dim_inactive = {
        enabled = false, -- dims the background color of inactive window
        shade = "dark",
        percentage = 0.15, -- percentage of the shade to apply to the inactive window
      },
      no_italic = false, -- Force no italic
      no_bold = false, -- Force no bold
      no_underline = false, -- Force no underline
      styles = { -- Handles the styles of general hi groups (see `:h highlight-args`):
        comments = { "italic" }, -- Change the style of comments
        conditionals = { "italic" },
        loops = {},
        functions = {},
        keywords = {},
        strings = {},
        variables = {},
        numbers = {},
        booleans = {},
        properties = {},
        types = {},
        operators = {},
      },
      color_overrides = {
        mocha = {
          base = "#1E1E1E",
          mantle = "#252526",
          crust = "#37373C",
          -- surface0 = "#",
          -- surface1 = "#",
          -- surface2 = "#",
          overlay0 = "#6A9955",
          -- overlay1 = "#",
          overlay2 = "#FFD602",
          text = "#D4D4D4",
          subtext0 = "#808080",
          -- subtext1 = "#",
          mauve = "#B67FFF",
          green = "#ce9178",
          peach = "#3DA7FF",
          sky = "#D67797",
          blue = "#E0C256",
          maroon = "#8AE1FF",
          red = "#8AE1FF",
          yellow = "#4EC9B0",
          lavender = "#8AE1FF",
          flamingo = "#2FB7E4",
          teal = "#3688CC",
          rosewater = "#DA70D6",
        },
      },
      highlight_overrides = {
        mocha = function(mocha)
          return {
            ["@punctuation.delimiter"] = { fg = mocha.text },
            ["@punctiation.special"] = { fg = mocha.teal },

            ["@type.definition"] = { fg = mocha.yellow },
            ["@type.qualifier"] = { fg = mocha.teal },
            ["@keyword.return"] = { fg = mocha.sky },
            ["@variable"] = { fg = mocha.flamingo },
            ["@tag"] = { fg = mocha.teal },
            ["@tag.delimiter"] = { fg = mocha.subtext0 },
            ["@label.json"] = { fg = mocha.lavender },

            -- Typescript
            ["@include.typescript"] = { fg = mocha.sky },
            ["@type.typescript"] = { fg = mocha.maroon },
            ["@lsp.type.interface.typescript"] = { fg = mocha.yellow },
            ["@lsp.mod.static.typescript"] = { fg = mocha.flamingo },
            ["@attribute.typescript"] = { fg = mocha.text },
            ["@constructor.typescript"] = { fg = mocha.mauve },
            ["@variable.builtin.typescript"] = { fg = mocha.teal },
            -- TSX
            ["@keyword.coroutine.tsx"] = { fg = mocha.sky },
            ["@constructor.tsx"] = { fg = mocha.yellow },
            ["@tag.attribute.tsx"] = { fg = mocha.maroon },
            ["@punctuation.bracket.tsx"] = { fg = mocha.overlay2 },
            ["@conditional.tsx"] = { fg = mocha.sky },
            ["@include.tsx"] = { fg = mocha.sky },
            ["@type.tsx"] = { fg = mocha.maroon },

            -- HTML
            ["@tag.attribute.html"] = { fg = mocha.maroon },

            -- rainbow
            -- RainbowDelimiterRed = { fg = mocha.overlay2 },
            -- RainbowDelimiterYellow = { fg = mocha.sky },
            -- RainbowDelimiterBlue = { fg = mocha.peach },
            -- RainbowDelimiterOrange = { fg = mocha.overlay2 },
            -- RainbowDelimiterGreen = { fg = mocha.sky },
            -- RainbowDelimiterViolet = { fg = mocha.peach },
            -- RainbowDelimiterCyan = { fg = mocha.overlay2 },

            -- nvimtree
            NvimTreeCursorLine = { fg = mocha.text, bg = mocha.crust },
            NvimTreeStatusLine = { fg = mocha.teal, bg = mocha.mantle },
            NvimTreeStatusLineNC = { fg = mocha.teal, bg = mocha.mantle },
            NvimTreeWinSeparator = { fg = mocha.crust },
            NvimTreeGitDirty = { fg = mocha.flamingo },
            NvimTreeGitNew = { fg = mocha.yellow },
            NvimTreeGitDeleted = { fg = mocha.sky },
            NvimTreeOpenedFile = { fg = mocha.maroon },
          }
        end,
      },
      integrations = {
        cmp = true,
        gitsigns = true,
        nvimtree = true,
        treesitter = true,
        notify = false,
        mini = {
          enabled = true,
          indentscoPe_color = "",
        },
        -- For more plugins integrations please scroll down (https://github.com/catppuccin/nvim#integrations)
      },
    })

    -- setup must be called before loading
    -- vim.cmd.colorscheme "catppuccin"
  end,
}
