local map = require('utils').map

-- Key bindings
map('i', '<c-h>', '<c-o>h')
map('i', '<c-l>', '<c-o>l')
map('i', '<c-j>', '<c-o>j')
map('i', '<c-k>', '<c-o>k')
map('c', '<c-h>', '<Left>')
map('c', '<c-l>', '<Right>')
map('c', '<c-b>', '<Left>')
map('c', '<c-f>', '<Right>')

map('n', 'H', '^')
map('n', 'L', '$')

-- double leader to switch between buffers
map('', '<leader><leader>', '<cr><c-^>')

map('n', 'n', 'nzz')
map('n', 'N', 'Nzz')
map('n', '*', '*zz')
map('n', '#', '#zz')
map('n', 'g*', 'g*zz')

-- close highlighting search
map('n', '<leader>h', ":noh<cr>")
