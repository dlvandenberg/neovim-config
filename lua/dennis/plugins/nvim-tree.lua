return {
	"nvim-tree/nvim-tree.lua",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
    config = function()
        local nvimtree = require("nvim-tree")

        -- recommended settings
        vim.g.loaded_netrw = 1
        vim.g.loaded_netrwPlugin = 1

        -- Configure
        nvimtree.setup({
            view = {
                width = 40,
            },
            update_focused_file = {
                enable = true
            },
            sort_by = 'case_sensitive',
        })
        
        -- set keymaps
        local keymap = vim.keymap

        keymap.set('n', '<C-b>', ':NvimTreeToggle<CR>')
        keymap.set('n', '<leader>tf', ':NvimTreeFocus<CR>', { desc = "[T]ree [F]ocus" })
    end
}
