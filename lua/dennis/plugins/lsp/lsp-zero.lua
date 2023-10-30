return {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v3.x',
    dependencies = {
        {'williamboman/mason.nvim'},
        {'williamboman/mason-lspconfig.nvim'},

        -- LSP Support
        {'neovim/nvim-lspconfig'},
        -- Autocompletion
        {'hrsh7th/nvim-cmp'},
        {'hrsh7th/cmp-nvim-lsp'},
        {'L3MON4D3/LuaSnip'},
    },
    config = function()
        -- Setup lsp-zero
        local lsp_zero = require('lsp-zero')

        lsp_zero.on_attach(function(client, bufnr)
            local opts = {buffer = bufnr, remap = false}

            vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, { desc = '[G]o to [D]efinition', buffer = bufnr, remap = false })
            vim.keymap.set("n", "H", function() vim.lsp.buf.hover() end, { desc = '[H]over', buffer = bufnr, remap = false })
            vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, { desc = '[V]iew [W]orkspace [S]ymbols', buffer = bufnr, remap = false })
            vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, { desc = '[V]iew [D]iagnostics', buffer = bufnr, remap = false })
            vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
            vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
            vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, { desc = '[V]iew [C]ode [A]ctions', buffer = bufnr, remap = false })
            vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, { desc = '[V]iew [R]efe[r]ences', buffer = bufnr, remap = false })
            vim.keymap.set("n", "<leader>crn", function() vim.lsp.buf.rename() end, { desc = '[C]ode [R]e[n]ame', buffer = bufnr, remap = false })
            vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
        end)

        -- Setup Mason
        -- require('mason').setup({})
        -- require('mason-lspconfig').setup({
        --     ensure_installed = {'tsserver', 'eslint'},
        -- })

        -- Setup Angular Language Service (for monorepo's)

        local config = require('lspconfig')
        local util = require('lspconfig.util')

        config.angularls.setup {
            root_dir = util.root_pattern('angular.json', 'project.json'),
        }
    end
}

