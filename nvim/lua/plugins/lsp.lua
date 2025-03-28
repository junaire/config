return {
    'junnplus/lsp-setup.nvim',
    dependencies = {
        'neovim/nvim-lspconfig',
        'williamboman/mason.nvim',
        'williamboman/mason-lspconfig.nvim',
        'folke/neodev.nvim'
    },
    init = function()
        local rounded = { border = 'rounded' }
        vim.diagnostic.config({ float = rounded })
        vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
            vim.lsp.diagnostic.on_publish_diagnostics, {
                virtual_text = true,
                signs = true,
                update_in_insert = true,
            }
        )
    end,
    opts = {
        mappings = {
            gd = function() require('telescope.builtin').lsp_definitions() end,
            gi = function() require('telescope.builtin').lsp_implementations() end,
            gr = function() require('telescope.builtin').lsp_references() end,
            ['<space>f'] = vim.lsp.buf.format,
        },
        servers = {
            pyright = {},
            ts_ls = {
                settings = {
                    typescript = {
                        inlayHints = {
                            includeInlayParameterNameHints = 'all',
                            includeInlayParameterNameHintsWhenArgumentMatchesName = false,
                            includeInlayFunctionParameterTypeHints = true,
                            includeInlayVariableTypeHints = true,
                            includeInlayVariableTypeHintsWhenTypeMatchesName = false,
                            includeInlayPropertyDeclarationTypeHints = true,
                            includeInlayFunctionLikeReturnTypeHints = true,
                            includeInlayEnumMemberValueHints = true,
                        }
                    },
                }
            },
            clangd = {
                extensions = {
                    autoSetHints = false,
                },

            },
            lua_ls = {
                settings = {
                    Lua = {
                        workspace = {
                            checkThirdParty = false,
                        },
                    }
                }
            },
            ['rust_analyzer@nightly'] = {
                settings = {
                    ['rust-analyzer'] = {
                        diagnostics = {
                            disabled = { 'unresolved-proc-macro' },
                        },
                        cargo = {
                            loadOutDirsFromCheck = true,
                        },
                        procMacro = {
                            enable = true,
                        },
                        inlayHints = {
                            closureReturnTypeHints = {
                                enable = true
                            },
                        },
                        cache = {
                            warmup = false,
                        }
                    },
                },
            }
        }
    },
}
