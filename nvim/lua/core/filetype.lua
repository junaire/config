local cmd = vim.cmd
local ncmd = vim.api.nvim_command

ncmd('filetype plugin indent on')
cmd([[ autocmd FileType c,cpp setlocal tabstop=2 shiftwidth=2 softtabstop=2 textwidth=80 expandtab ]])
cmd([[ autocmd FileType solidity,lua,python setlocal tabstop=4 shiftwidth=4 softtabstop=4 textwidth=80 expandtab ]])
cmd([[ autocmd FileType json setlocal tabstop=2 shiftwidth=2 softtabstop=2 expandtab ]])
