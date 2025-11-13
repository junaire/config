return {
    'junnplus/lsp-setup.nvim',
    dependencies = {
        'neovim/nvim-lspconfig',
        'williamboman/mason.nvim',
        'williamboman/mason-lspconfig.nvim',
        'folke/neodev.nvim'
    },
    init = function()
        vim.diagnostic.config({
            float = { border = 'rounded' },
            virtual_text = true,
            signs = true,
            update_in_insert = true,
            severity_sort = true,
        })

        local diag_float_group = vim.api.nvim_create_augroup('lsp_diagnostics_float', { clear = true })
        vim.api.nvim_create_autocmd('CursorHold', {
            group = diag_float_group,
            callback = function()
                local cursor = vim.api.nvim_win_get_cursor(0)
                local diags = vim.diagnostic.get(0, { lnum = cursor[1] - 1 })
                if #diags == 0 then
                    return
                end
                vim.diagnostic.open_float(nil, { focusable = false, scope = 'line' })
            end,
        })
    end,
    opts = {
        mappings = {
            gd = function() require('telescope.builtin').lsp_definitions() end,
            gi = function() require('telescope.builtin').lsp_implementations() end,
            gr = function() require('telescope.builtin').lsp_references() end,
            ['<space>f'] = vim.lsp.buf.format,
        },
        servers = {
            pylsp = {
                settings = {
                    pylsp = {
                        configurationSources = { 'flake8' },
                        plugins = {
                            autopep8 = {
                                enabled = false,
                            },
                            flake8 = {
                                enabled = true,
                                ignore = { 'F403', 'F405', 'E501', 'W503' },
                            },
                            mccabe = {
                                enabled = false,
                            },
                            pycodestyle = {
                                enabled = false,
                            },
                            pyflakes = {
                                enabled = false,
                            },
                            pylint = {
                                enabled = false,
                            },
                            black = {
                                enabled = true,
                            },
                            yapf = {
                                enabled = false,
                            },
                            rope_autoimport = {
                                enabled = false,
                            },
                        }
                    }
                }
            },
            solidity_ls = {
                settings = {
                    solidity = {
                        compileUsingRemoteVersion = 'latest',
                        defaultCompiler = 'remote',
                        enabledAsYouTypeCompilationErrorCheck = true,
                    }
                }
            },
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
