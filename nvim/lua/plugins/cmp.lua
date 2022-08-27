local cmp = require('cmp')
local types = require('cmp.types')
local utils = require('utils')

cmp.setup({
	snippet = {
		expand = function(args)
			vim.fn['vsnip#anonymous'](args.body)
		end,
	},
	mapping = cmp.mapping.preset.insert({
		['<Tab>'] = function(fallback)
			if cmp.visible() then
				cmp.select_next_item()
			else
				fallback()
			end
		end,
		['<S-Tab>'] = function(fallback)
			if cmp.visible() then
				cmp.select_prev_item()
			else
				fallback()
			end
		end,
		['<CR>'] = cmp.mapping.confirm({ select = true }),
		['<Esc>'] = cmp.mapping.close(),
	}),
	completion = {
		completeopt = 'menu,menuone,noselect',
	},
	preselect = types.cmp.PreselectMode.None,
	sources = {
		{ name = 'nvim_lsp' },
		{ name = 'buffer' },
		{ name = 'vsnip' },
	},
})

local cmp_autopairs = require('nvim-autopairs.completion.cmp')
cmp.event:on('confirm_done', cmp_autopairs.on_confirm_done({ map_char = { tex = '' } }))
