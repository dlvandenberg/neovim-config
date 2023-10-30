return {
    "nvim-lualine/lualine.nvim",
    config = function()
        local lualine = require('lualine')
        local lazy_status = require('lazy.status')

        lualine.setup({
            options = {
                icons_enabled = true,
                theme = 'auto',
                component_separators = '|',
                section_separators = '',
            },
            sections = {
                lualine_x = {
                    {
                        lazy_status.updates,
                        cond = lazy_status.has_updates,
                        color = { fg = "#CE9178" },
                    },
                    { "encoding" },
                    { "fileformat" },
                    { "filetype" },
                },
                lualine_c = {
                    { 'filename', path = 1 }
                },
            }
        })
    end
}

