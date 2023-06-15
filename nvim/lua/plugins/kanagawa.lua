return {
	'rebelot/kanagawa.nvim',
	lazy = false,
	priority = 1000,
	init = function()
		require('kanagawa').load('wave')
	end,
	opts = {
		colors = {
			theme = {
				all = {
					ui = {
						bg_gutter = "none",
					},
				},
			},
		},
	},
}
