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
            {'kdheepak/cmp-latex-symbols'},     -- Required

            -- Snippets
            {'L3MON4D3/LuaSnip'},             -- Required
        },


        config = function()
            local lsp = require('lsp-zero').preset()

            lsp.on_attach(function(client, bufnr)
                -- see :help lsp-zero-keybindings
                -- to learn the available actions
                lsp.default_keymaps({buffer = bufnr})
            end)

            -- (Optional) Configure lua language server for neovim
            require('lspconfig').lua_ls.setup(lsp.nvim_lua_ls())
            local cmp = require('cmp')
            cmp.setup({
                mapping = {
                    ['<CR>'] = cmp.mapping.confirm({select = false}),
                },
                window = {
                    completion = cmp.config.window.bordered(),
                    documentation = cmp.config.window.bordered(),
                },
                sources =  cmp.config.sources({
                    {name = "latex_symbols",}
                })
            })

            require('mason').setup()
            require('mason-lspconfig').setup({
                -- Replace the language servers listed here
                -- with the ones you want to install
                ensure_installed = {'rust_analyzer',"julials"},
                handlers = {
                    lsp.default_setup,
                }
            })
            lsp.setup()
        end
        },
    }
