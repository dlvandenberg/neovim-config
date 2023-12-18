return {
  "mattkubej/jest.nvim",
  config = function()
    local jest = require("nvim-jest")
    jest.setup({})

    local keymap = vim.keymap

    -- custom keymaps
    keymap.set("n", "<leader>jt", "<cmd>Jest<CR>", { desc = "Run [J]est [T]est complete project" })
    keymap.set("n", "<leader>jc", "<cmd>JestCoverage<CR>", { desc = "Run [J]est [C]overage on complete project" })
    keymap.set("n", "<leader>jf", "<cmd>JestFile<CR>", { desc = "Run [J]est [F]ile test" })
    keymap.set("n", "<leader>js", "<cmd>JestSingle<CR>", { desc = "Run [J]est [S]ingle test under cursor" })
  end,
}
