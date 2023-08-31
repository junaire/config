return {
	'nvim-treesitter/nvim-treesitter',
	build = ':TSUpdate',
	event = 'VeryLazy',
	dependencies = {
		'nvim-treesitter/nvim-treesitter-textobjects',
	},
	init = function()
		local ncmd = vim.api.nvim_command
		ncmd('set foldmethod=expr')
		ncmd('set foldexpr=nvim_treesitter#foldexpr()')
	end,
	opts = {
		ensure_installed = {
			'c', 'lua', 'rust', 'go', 'python', 'cpp', 'tablegen', 'llvm'
		},
		highlight = {
			enable = true,
		},
		query_linter = {
			enable = true,
			use_virtual_text = true,
			lint_events = { 'BufWrite', 'CursorHold' },
		},
		indent = { enable = false },
		autopairs = { enable = true },
		rainbow = { enable = true },
		autotag = { enable = true },
		context_commentstring = { enable = true },
		-- nvim-treesitter/nvim-treesitter-textobjects
		matchup = {
			enable = true,
		},
		textobjects = {
			select = {
				enable = true,
				lookahead = true,
			},
		},
	},
}
