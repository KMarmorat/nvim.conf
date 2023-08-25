return {
    {
        "cljoly/bepo.nvim",
		config = true
        
    },
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        config = function () 
            local configs = require("nvim-treesitter.configs")

            configs.setup({
                ensure_installed = { "c", "lua", "vim", "vimdoc", "julia" },
                sync_install = false,
                highlight = { enable = true },
                indent = { enable = true, disable = { "yaml" } },
                rainbow = {
                    enable = true,
                    -- disable = { "jsx", "cpp" }, list of languages you want to disable the plugin for
                    extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
                    max_file_lines = nil, -- Do not enable for files with more than n lines, int
                    -- colors = {}, -- table of hex strings
                    -- termcolors = {} -- table of colour name strings
                }
            })
        end
    },
    { 
        "catppuccin/nvim",
        priority = 1000,
        config = function ()
            vim.cmd.colorscheme "catppuccin"
        end
    },
    { 
        "lukas-reineke/indent-blankline.nvim",
        config = true
    },
    {
        "akinsho/bufferline.nvim",
        dependencies = "nvim-tree/nvim-web-devicons",
        config = function ()
            require("bufferline").setup{
                options = {
                    hover = {
                        enabled = true,
                        delay = 20,
                        reveal = {'close'}
                    }
                }
            }
        end
    },
}
