local utils = require('utils')

local actions = require('telescope.actions')
require('telescope').setup({
	defaults = {
		layout_config = {
			horizontal = {
				width = 0.9,
				height = 0.75,
			},
		},
		mappings = {
			i = {
				['<esc>'] = actions.close,
				['<C-k>'] = actions.move_selection_previous,
				['<C-j>'] = actions.move_selection_next,
				['<C-l>'] = { '<Right>', type = 'command' },
				['<C-h>'] = { '<Left>', type = 'command' },
				['<C-f>'] = actions.preview_scrolling_down,
				['<C-b>'] = actions.preview_scrolling_up,
			},
		},
	},
})
require('telescope').load_extension('gh')
require('telescope').load_extension('packer')
utils.map('n', '<c-s>', '<cmd>Telescope find_files<cr>')
utils.map('n', '<c-n>', '<cmd>Telescope live_grep<cr>')
utils.map('n', '<c-b>', '<cmd>Telescope buffers<cr>')
utils.map('n', ';', '<cmd>Telescope commands<cr>')
