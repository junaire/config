local wezterm = require('wezterm')

return {
	font = wezterm.font('Jetbrains Mono'),
	font_size = 14,
	colors = {
		tab_bar = {
			active_tab = {
				bg_color = '#24283b',
				fg_color = '#c0caf5',
			},
		},
	},
	color_scheme = 'tokyonight',
	window_frame = {
		font_size = 14.0,
	},
	window_padding = {
		left = 5,
		right = 5,
		top = 0,
		bottom = 0,
	},
	tab_max_width = 20,
	foreground_text_hsb = {
		hue = 1.0,
		saturation = 1.0,
		brightness = 1.4,
	},
	default_cursor_style = 'BlinkingBlock',
	clean_exit_codes = { 0, 1, 130 },
	quote_dropped_files = 'Posix',
}
