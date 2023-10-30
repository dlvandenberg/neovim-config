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
        require('mason').setup({})
        require('mason-lspconfig').setup({
            ensure_installed = {'tsserver', 'eslint'},
            handlers = {
                lsp_zero.default_setup,
                lua_ls = function()
                    local lua_opts = lsp_zero.nvim_lua_ls()
                    require('lspconfig').lua_ls.setup(lua_opts)
                end,
            }
        })

        -- Setup autocomplete
        local cmp = require('cmp')
        local cmp_select = {behavior = cmp.SelectBehavior.Select}

        cmp.setup({
            sources = {
                {name = 'path'},
                {name = 'nvim_lsp'},
                {name = 'nvim_lua'},
            },
            formatting = lsp_zero.cmp_format(),
            mapping = cmp.mapping.preset.insert({
                ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
                ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
                ['<C-y>'] = cmp.mapping.confirm({ select = true }),
                ['<C-Space>'] = cmp.mapping.complete(),
            }),
        })

        -- Setup Angular Language Service (for monorepo's)

        local config = require('lspconfig')
        local util = require('lspconfig.util')

        config.angularls.setup {
            root_dir = util.root_pattern('angular.json', 'project.json'),
        }
    end
}

