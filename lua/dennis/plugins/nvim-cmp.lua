return {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
        "hrsh7th/cmp-buffer", -- source for text in buffer
        "hrsh7th/cmp-path", -- source for file system paths
        "hrsh7th/cmp-nvim-lsp",
        "L3MON4D3/LuaSnip", -- snippet engine
        "saadparwaiz1/cmp_luasnip", -- for autocompletion
        "rafamadriz/friendly-snippets", -- useful snippets
    },
    config = function()
        local cmp = require('cmp')
        local cmp_select = { behavior = cmp.SelectBehavior.Select }
        local luasnip = require('luasnip')

        -- loads vscode style snippets from installed plugins
        require('luasnip.loaders.from_vscode').lazy_load()

        cmp.setup({
            completion = {
                completeopt = "menu,menuone,preview,noselect",
            },
            snippet = { -- configure how nvim-cmp interacts with snippet engine
                expand = function(args)
                    luasnip.lsp_expand(args.body)
                end,
            },
            -- custom mappings
            mapping = cmp.mapping.preset.insert({
                ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select), -- previous suggestion
                ['<C-n>'] = cmp.mapping.select_next_item(cmp_select), -- next suggestion
                ['<C-b>'] = cmp.mapping.scroll_docs(-4), -- scroll preview backwards
                ['<C-f>'] = cmp.mapping.scroll_docs(4), -- scroll preview forwards
                ['<C-Space>'] = cmp.mapping.complete(), -- show completion suggestions
                ['<C-e>'] = cmp.mapping.abort(), -- close completion window
                ['<CR>'] = cmp.mapping.confirm({ select = true }), -- confirm selection
            }),
            -- sources for autocompletion
            sources = cmp.config.sources({ -- order of the sources will determine priorities
                { name = 'luasnip' }, -- snippets
                { name = 'buffer' }, -- text within current buffer
                { name = 'nvim_lsp' }, -- lsp suggestions
                { name = 'nvim_lua' },
                { name = 'path' }, -- file system paths
            }),
        })
    end,
}
