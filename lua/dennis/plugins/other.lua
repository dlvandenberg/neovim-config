return {
  "rgroli/other.nvim",
  config = function()
    local other = require("other-nvim")

    other.setup({
      mappings = {
        "angular",
      },
    })

    local keymap = vim.keymap

    keymap.set("n", "<leader>oo", "<cmd>:Other<CR>", { noremap = true, silent = true, desc = "[O]pen [O]ther file" })
    keymap.set(
      "n",
      "<leader>oh",
      "<cmd>:OtherSplit<CR>",
      { noremap = true, silent = true, desc = "[O]pen other file in [H]orizontal split" }
    )
    keymap.set(
      "n",
      "<leader>ov",
      "<cmd>:OtherVSplit<CR>",
      { noremap = true, silent = true, desc = "[O]pen other file in [V]ertical split" }
    )
  end,
}
