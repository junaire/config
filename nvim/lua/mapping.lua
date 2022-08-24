local map = require('utils').map

-- Leader key
vim.g.mapleader = ' '

-- Key bindings
map('i', '<c-h>', '<c-o>h')
map('i', '<c-l>', '<c-o>l')
map('i', '<c-j>', '<c-o>j')
map('i', '<c-k>', '<c-o>k')

map('n', 'H', '^')
map('n', 'L', '$')
map('v', 'H', '^')
map('v', 'L', '$')

-- double leader to switch between buffers
map('n', '<leader><leader>', '<c-^>')

map('n', 'n', 'nzz')
map('n', 'N', 'Nzz')
map('n', '*', '*zz')
map('n', '#', '#zz')
map('n', 'g*', 'g*zz')

-- close highlighting search
map('n', '<leader>h', ':noh<cr>')
