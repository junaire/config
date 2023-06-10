local map = require('utils').map
return {
	'lewis6991/gitsigns.nvim',
	event = 'VeryLazy',
	dependencies = { 'nvim-lua/plenary.nvim' },
	opts = {
		signs = {
			add = { text = '+' },
			change = { text = '~' },
			delete = { text = '-' },
			topdelete = { text = '_' },
			changedelete = { text = '~' },
		},
		keymaps = {
			-- Default keymap options
			noremap = true,
			['n ]c'] = { expr = true, "&diff ? ']c' : '<cmd>lua require\"gitsigns.actions\".next_hunk()<CR>'" },
			['n [c'] = { expr = true, "&diff ? '[c' : '<cmd>lua require\"gitsigns.actions\".prev_hunk()<CR>'" },
		},
		word_diff = false,
		linehl = true,
		numhl = true,
		sign_priority = 6,
		preview_config = {
			border = 'rounded',
		},
	}
}
