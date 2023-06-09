local map = require('utils').map

return {
    'nvim-telescope/telescope.nvim',
    event = 'VeryLazy',
    dependencies = {
        'nvim-lua/plenary.nvim',
    },
    opts = {
        defaults = {
            layout_config = {
                horizontal = {
                    width = 0.75,
                    height = 0.75,
                },
            },
            mappings = {
                i = {
                    ['<esc>'] = 'close',
                    ['<C-k>'] = 'move_selection_previous',
                    ['<C-j>'] = 'move_selection_next',
                    ['<C-l>'] = { '<Right>', type = 'command' },
                    ['<C-h>'] = { '<Left>', type = 'command' },
                    ['<C-f>'] = 'preview_scrolling_down',
                    ['<C-b>'] = 'preview_scrolling_up',
                },
            },
        },
    },
    init = function()
        map('n', '<c-p>', '<cmd>Telescope find_files<cr>')
        map('n', '<c-b>', '<cmd>Telescope buffers<cr>')
        map('n', '<c-f>', '<cmd>Telescope live_grep<cr>')
    end,
}
