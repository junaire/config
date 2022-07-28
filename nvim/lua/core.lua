local g = vim.g
local cmd = vim.cmd
local o, wo, bo = vim.o, vim.wo, vim.bo

local g = vim.g
local cmd = vim.cmd
local o, wo, bo = vim.o, vim.wo, vim.bo
local set = require('utils').set

-- Color scheme
set('termguicolors', true)
vim.cmd([[colorscheme melange]])

-- Leader key
g.mapleader = ' '


-- Settings
local buffer = { o, bo }
local window = { o, wo }

set('encoding', 'utf-8')
set('fileencoding', 'utf-8')

set('bs', 'eol,start,indent')

set('autoindent', true)

set('cindent', true)

set('ttimeout', true)

set('ttimeoutlen', 50)

set('ruler', true)

set('number', true)

set('cursorline', true)

set('ignorecase', true)

set('smartcase', true)

set('hlsearch', true)

set('incsearch', true)

set('mouse', 'a')

set('undofile', true)

set('signcolumn', 'yes')

set('showtabline', 1)

set('list', true)

set('showcmd', true)

set('splitright', true)

set('splitbelow', true)

set('showmatch', true)

set('matchtime', 2)

set('display', 'lastline')

set('wildmenu', true)

set('lazyredraw', true)

set('ffs', 'unix')
set('sw', 4)
set('inccommand', 'nosplit')

local init_lua_augroup = 'init_lua_augroup'
vim.api.nvim_create_augroup(init_lua_augroup, { clear = true })

-- highlight yanked text briefly
vim.api.nvim_create_autocmd('TextYankPost', {
	group = init_lua_augroup,
	callback = function()
		vim.highlight.on_yank({
			higroup = 'IncSearch',
			timeout = 250,
			on_visual = true,
		})
	end,
})

-- reopen last position
vim.api.nvim_create_autocmd('BufReadPost', {
	group = init_lua_augroup,
	callback = function()
		local previous_pos = vim.api.nvim_buf_get_mark(0, '"')[1]
		local last_line = vim.api.nvim_buf_line_count(0)
		if previous_pos >= 1 and previous_pos <= last_line and vim.bo.filetype ~= 'commit' then
			vim.cmd('normal! g`"')
		end
	end,
})
