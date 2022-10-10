local map = require('utils').map

-- Leader key
vim.g.mapleader = ' '

local opts = { noremap = true, silent = true }

-- Key bindings
map('i', '<c-h>', '<c-o>h', opts)
map('i', '<c-l>', '<c-o>l', opts)
map('i', '<c-j>', '<c-o>j', opts)
map('i', '<c-k>', '<c-o>k', opts)

map('n', 'H', '^', opts)
map('n', 'L', '$', opts)
map('v', 'H', '^', opts)
map('v', 'L', '$', opts)

-- double leader to switch between buffers
map('n', '<leader><leader>', '<c-^>', opts)

map('n', 'n', 'nzz', opts)
map('n', 'N', 'Nzz', opts)
map('n', '*', '*zz', opts)
map('n', '#', '#zz', opts)
map('n', 'g*', 'g*zz', opts)

-- close highlighting search
map('n', '<leader>h', ':noh<cr>', opts)

-- format
map('n', '<leader>f', ':lua vim.lsp.buf.formatting()<cr>', opts)

-- diagnostics
map("n", "<leader>xx", "<cmd>TroubleToggle workspace_diagnostics<cr>", opts)
