require('nvim-treesitter.configs').setup({
	ensure_installed = { 'c', 'lua', 'rust', 'go', 'python', 'cpp' },
	highlight = {
		enable = true,
	},
	query_linter = {
		enable = true,
		use_virtual_text = true,
		lint_events = { 'BufWrite', 'CursorHold' },
	},
	indent = { enable = true },
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
})
