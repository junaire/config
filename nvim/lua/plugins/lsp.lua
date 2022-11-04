local settings = {
	mappings = {
		gd = 'lua require"telescope.builtin".lsp_definitions()',
		gi = 'lua require"telescope.builtin".lsp_implementations()',
		gr = 'lua require"telescope.builtin".lsp_references()',
		['<space>f'] = 'lua vim.lsp.buf.format()',
	},
	servers = {
		eslint = {},
		pylsp = {},
		jsonls = {},
		bashls = {},
		tsserver = {},
		clangd = require('lsp-setup.clangd_extensions').setup({
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
		sumneko_lua = {}
	},
}

require('lsp-setup').setup(settings)
require('lsp-colors').setup()

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
	vim.lsp.diagnostic.on_publish_diagnostics, {
	virtual_text = true,
	signs = true,
	update_in_insert = true,
}
)
