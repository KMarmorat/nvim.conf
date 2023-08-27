return {
    {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v2.x',
        dependencies = {
            -- LSP Support
            {'neovim/nvim-lspconfig'},             -- Required
            {'williamboman/mason.nvim'},           -- Optional
            {'williamboman/mason-lspconfig.nvim'}, -- Optional

            -- Autocompletion
            {'hrsh7th/nvim-cmp'},         -- Required
            {'hrsh7th/cmp-nvim-lsp'},     -- Required
            {'hrsh7th/cmp-nvim-lua'},     -- Required
            {'hrsh7th/cmp-path'},         -- Required
            {'hrsh7th/cmp-buffer'},       -- Required
            {'saadparwaiz1/cmp_luasnip'},       -- Required
            {'kdheepak/cmp-latex-symbols'},

            -- Snippets
            {'L3MON4D3/LuaSnip'},             -- Required
            
            --autopairs
            {'windwp/nvim-autopairs'},
        },


        config = function()
            local lsp = require('lsp-zero').preset({'recommended'})
            lsp.on_attach(function(client, bufnr)
              lsp.default_keymaps({buffer = bufnr})
            end)

            lsp.setup()

            -- Make sure you setup `cmp` after lsp-zero
            require("nvim-autopairs").setup({
                map_cr = true,
                map_complete = true,
                auto_select = true
            })

            local cmp_autopairs = require('nvim-autopairs.completion.cmp')

            local cmp = require('cmp')
            local cmp_action = require('lsp-zero').cmp_action()

            cmp.setup({
                mapping = {
                    ['tf'] = cmp_action.luasnip_jump_forward(),
                    ['tp'] = cmp_action.luasnip_jump_backward(),
                    ['<CR>'] = cmp.mapping.confirm({select = false}),
                    ['<Tab>'] = cmp.mapping.confirm({select = true}),
                }
            })
            cmp.event:on('confirm_done',cmp_autopairs.on_confirm_done())
        end
        },
    }
