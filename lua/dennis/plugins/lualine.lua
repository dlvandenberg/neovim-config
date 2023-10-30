return {
    "nvim-lualine/lualine.nvim",
    config = function()
        local lualine = require('lualine')
        lualine.setup({
            options = {
                icons_enabled = true,
                theme = 'auto',
                component_separators = '|',
                section_separators = '',
            },
            sections = {
                lualine_c = {
                    { 'filename', path = 1 }
                },
            }
        })
    end
}

