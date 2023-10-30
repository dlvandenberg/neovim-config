
vim.g.mapleader = " "
vim.keymap.set('n', '<leader>pv', vim.cmd.Ex, { desc = '[P]roject [V]iewer' })

-- Moves selection up and down
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv", { desc = 'Move selection up' })
vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv", { desc = 'Move selection down' })

-- Keep cursor centered on half-page jumping
vim.keymap.set('n', '<C-d>', '<C-d>zz')
vim.keymap.set('n', '<C-u>', '<C-u>zz')

-- Keep search terms in the middle when browsing results
vim.keymap.set('n', 'n', 'nzzzv')
vim.keymap.set('n', 'N', 'Nzzzv')

vim.keymap.set('x', '<leader>p', "\"_dP")

-- Yank code into system clipboard
vim.keymap.set('n', '<leader>y', '\"+y', { desc = '[Y]ank to clipboard' })
vim.keymap.set('v', '<leader>y', '\"+y', { desc = '[Y]ank to clipboard' })
vim.keymap.set('n', '<leader>Y', '\"+Y', { desc = '[Y]ank to clipboard' })

-- Delete into the void
vim.keymap.set('n', '<leader>d', '\"_d', { desc = '[D]elete into void' })
vim.keymap.set('v', '<leader>d', '\"_d', { desc = '[D]elete into void' })

-- Don't press Q
vim.keymap.set('n', 'Q', '<nop')

-- Quickfix list
vim.keymap.set('n', '<C-k>', '<cmd>cnext<CR>zz')
vim.keymap.set('n', '<C-j>', '<cmd>cprev<CR>zz')
vim.keymap.set('n', '<leader>k', '<cmd>lnext<CR>zz', { desc = 'Quickfix List Next' })
vim.keymap.set('n', '<leader>j', '<cmd>lprev<CR>zz', { desc = 'Quickfix List Previous' })

-- Quickly substitute current word
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], { desc = '[S]ubstitute current word' })

