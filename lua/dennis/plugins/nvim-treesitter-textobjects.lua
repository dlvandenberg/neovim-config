return {
    'nvim-treesitter/nvim-treesitter-textobjects',
    lazy = true,
    config = function()
        local configs = require("nvim-treesitter.configs")

        configs.setup({
            textobjects = {
                select = {
                    enable = true,

                    -- Automatic jump forward
                    lookahead = true,

                    keymaps = {
                        -- Assignment selectors
                        ["a="] = { query = "@assignment.outer", desc = "Select outer part of an assignment" },
                        ["i="] = { query = "@assignment.inner", desc = "Select inner part of an assignment" },
                        ["l="] = { query = "@assignment.lhs", desc = "Select left hand side of an assignment" },
                        ["r="] = { query = "@assignment.rhs", desc = "Select right hand side of an assignment" },

                        -- Parameter/argument selectors
                        ["aa"] = { query = "@parameter.outer", desc = "Select outer part of a parameter/argument" },
                        ["ia"] = { query = "@parameter.inner", desc = "Select inner part of a parameter/argument" },

                        -- Conditional selectors
                        ["ai"] = { query = "@conditional.outer", desc = "Select outer part of a conditional" },
                        ["ii"] = { query = "@conditional.inner", desc = "Select inner part of a conditional" },

                        -- Loop selectors
                        ["al"] = { query = "@loop.outer", desc = "Select outer part of a loop" },
                        ["il"] = { query = "@loop.inner", desc = "Select inner part of a loop" },

                        -- Function call selectors
                        ["af"] = { query = "@call.outer", desc = "Select outer part of a function call" },
                        ["if"] = { query = "@call.inner", desc = "Select inner part of a function call" },

                        -- Method selectors
                        ["am"] = { query = "@function.outer", desc = "Select outer part of a method" },
                        ["im"] = { query = "@function.inner", desc = "Select inner part of a method" },

                        -- Class selectors
                        ["ac"] = { query = "@class.outer", desc = "Select outer part of a class" },
                        ["ic"] = { query = "@class.inner", desc = "Select inner part of a class" },
                    },
                },

                swap = {
                    enable = true,

                    swap_next = {
                        ["<leader>na"] = "@parameter.inner", -- swap parameter/argument with next
                        ["<leader>nm"] = "@function.outer", -- swap function with next
                    },

                    swap_previous = {
                        ["<leader>pa"] = "@parameter.inner", -- swap parameter/argument with previous
                        ["<leader>pm"] = "@function.outer", -- swap function with previous
                    },
                },
            },
        })
    end
}

