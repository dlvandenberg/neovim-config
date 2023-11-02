return {
    'williamboman/mason.nvim',
    dependencies = {
        'williamboman/mason-lspconfig.nvim',
        'VonHeikemen/lsp-zero.nvim',
        'neovim/nvim-lspconfig',
    },
    config = function()
        local mason = require('mason')
        local mason_lspconfig = require('mason-lspconfig')
        local lsp_zero = require('lsp-zero')
        local lspconfig = require('lspconfig')

        mason.setup({
            ui = {
                icons = {
                    package_installed = "✓",
                    package_pending = "→",
                    package_uninstalled = "✕",
                }
            }
        })

        mason_lspconfig.setup({
            ensure_installed = {
                "tsserver",
                "html",
                "cssls",
                "svelte",
                "lua_ls",
                "graphql",
                "emmet_ls",
                "eslint",
            },
            -- auto install configured servers
            automatic_installation = true,

            handlers = {
                lsp_zero.default_setup,
                lua_ls = function()
                    local lua_opts = lsp_zero.nvim_lua_ls()
                    lspconfig.lua_ls.setup(lua_opts)
                end,
            }
        })
    end
}

