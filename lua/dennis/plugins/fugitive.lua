return {
    'tpope/vim-fugitive',
    config = function()
        vim.keymap.set('n', '<leader>gs', vim.cmd.Git, { desc = '[G]it [S]tatus' })
        vim.keymap.set('n', '<leader>gc', ':G commit<CR>', { desc = '[G]it [C]ommit', noremap = true, silent = true, nowait = true })
        vim.keymap.set('n', '<leader>gp', ':G push<CR>', { desc = '[G]it [P]ush', noremap = true, silent = true, nowait = true })
    end
}

