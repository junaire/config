return {
	'lukas-reineke/indent-blankline.nvim',
	event = 'BufRead',
	opts = {
		char = '.',
		buftype_exclude = { 'terminal' },
		show_trailing_blankline_indent = false,
		use_treesitter = true,
	},
}
