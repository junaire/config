local settings = {
	mappings = {
		gd = 'lua require"telescope.builtin".lsp_definitions()',
		gi = 'lua require"telescope.builtin".lsp_implementations()',
		gr = 'lua require"telescope.builtin".lsp_references()',
	},
	servers = {
		eslint = {},
		pylsp = {},
		jsonls = {},
		bashls = {},
		tsserver = {},
		clangd = require('nvim-lsp-setup.clangd_extensions').setup({
			extensions = {
				autoSetHints = false,
			},

		}),
		gopls = {
			settings = {
				golsp = {
					gofumpt = true,
					staticcheck = true,
					useplaceholders = true,
					codelenses = {
						gc_details = true,
					},
				},
			},
		},
		sumneko_lua = require('lua-dev').setup({
			lspconfig = {
				settings = {
					Lua = {
						format = {
							enable = true,
							-- defaultConfig = {
							--     indent_style = "space",
							--     indent_size = "4",
							-- },
						}
					}

				}
			}
		}),
	},
}

require('nvim-lsp-setup').setup(settings)
require('lsp-colors').setup()
