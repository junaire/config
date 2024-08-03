local cmd = vim.cmd
local ncmd = vim.api.nvim_command

ncmd('filetype plugin indent on')
cmd([[ autocmd FileType c,cpp setlocal tabstop=2 shiftwidth=2 softtabstop=2 expandtab ]])
cmd([[ autocmd FileType solidity,lua,python setlocal tabstop=4 shiftwidth=4 softtabstop=4 expandtab ]])
cmd([[ autocmd FileType json setlocal tabstop=2 shiftwidth=2 softtabstop=2 expandtab ]])
cmd(
    [[ autocmd FileType javascript,javascript.jsx,javascriptreact,typescript,typescriptreact setlocal tabstop=2 shiftwidth=2 softtabstop=2 expandtab ]])
