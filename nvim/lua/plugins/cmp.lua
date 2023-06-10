local function input(keys, mode)
	vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(keys, true, true, true), mode or 'i', true)
end

return {
	'hrsh7th/nvim-cmp',
	event = 'InsertEnter',
	dependencies = {
		'hrsh7th/cmp-nvim-lsp',
		'hrsh7th/cmp-buffer',
		'onsails/lspkind-nvim',
		'windwp/nvim-autopairs',
		'hrsh7th/cmp-cmdline',
	},
	config = function()
		local cmp = require('cmp')
		local types = require('cmp.types')
		local cmp_autopairs = require('nvim-autopairs.completion.cmp')
		local opts = {
			formatting = {
				format = function(entry, vim_item)
					vim_item.kind = require('lspkind').presets.default[vim_item.kind] .. ' ' .. vim_item.kind

					-- set a name for each source
					vim_item.menu = ({
						buffer = '[Buf]',
						nvim_lsp = '[LSP]',
						nvim_lua = '[Lua]',
						latex_symbols = '[Latex]',
					})[entry.source.name]
					return vim_item
				end,
			},
			window = {
				completion = cmp.config.window.bordered(),
				documentation = cmp.config.window.bordered(),
			},
			mapping = cmp.mapping.preset.insert({
				['<C-j>'] = cmp.mapping.select_next_item({ behavior = types.cmp.SelectBehavior.Select }),
				['<C-k>'] = cmp.mapping.select_prev_item({ behavior = types.cmp.SelectBehavior.Select }),
				['<Tab>'] = cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = true }),
				['<CR>'] = function(fallback)
					fallback()
				end,
				['<C-e>'] = function(fallback)
					fallback()
				end,
			}),
			completion = {
				completeopt = 'menu,menuone,noselect',
			},
			preselect = types.cmp.PreselectMode.None,
			sources = {
				{ name = 'nvim_lsp' },
				{ name = 'buffer' },
			},
		}
		cmp.setup(opts)
		cmp.event:on('confirm_done', cmp_autopairs.on_confirm_done({ map_char = { tex = '' } }))
	end,
}
