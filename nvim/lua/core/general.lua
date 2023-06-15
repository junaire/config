-- Color scheme
vim.o.termguicolors = true

-- Leader key
vim.g.mapleader = ' '

vim.o.encoding = 'utf-8'

vim.o.fileencoding = 'utf-8'

vim.o.bs = 'eol,start,indent'

vim.o.autoindent = true

vim.o.cindent = true

vim.o.ttimeout = true

vim.o.ttimeoutlen = 50

vim.o.ruler = true

vim.o.number = true

vim.o.cursorline = true

vim.o.ignorecase = true

vim.o.smartcase = true

vim.o.hlsearch = true

vim.o.incsearch = true

vim.o.mouse = 'a'

vim.o.undofile = true

vim.o.signcolumn = 'yes'

vim.o.showtabline = 1

vim.o.list = true

vim.o.showcmd = true

vim.o.splitright = true

vim.o.splitbelow = true

vim.o.showmatch = true

vim.o.matchtime = 2

vim.o.display = 'lastline'

vim.o.wildmenu = true

vim.o.lazyredraw = true

vim.o.ffs = 'unix'

vim.o.sw = 4

vim.o.inccommand = 'nosplit'

vim.o.foldenable = false

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
