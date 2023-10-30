return {
    'nvim-telescope/telescope.nvim',
    tag = "0.1.4",
    dependencies = {
        'nvim-lua/plenary.nvim',
        { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
        'nvim-tree/nvim-web-devicons',
    },
    config = function ()
        local telescope = require("telescope")
        local builtin = require('telescope.builtin')
        local keymap = vim.keymap

        telescope.load_extension("fzf");

        -- Custom keymaps
        keymap.set('n', '<leader>pf', builtin.find_files, { desc = '[P]roject [F]iles' })
        keymap.set('n', '<leader>pb', builtin.buffers, { desc = '[P]roject [B]uffers' })
        keymap.set('n', '<leader>ps', function()
            builtin.grep_string({ search = vim.fn.input('Grep > ') })
        end, { desc = '[P]roject [S]earch' })
        keymap.set('n', '<C-p>', builtin.git_files)
        keymap.set('n', '<C-o>', builtin.oldfiles)
    end
}

