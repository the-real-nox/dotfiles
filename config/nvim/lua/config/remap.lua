vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

local map = vim.keymap.set

-- Window-switching
map('n', '<leader>h', '<C-w>h')
map('n', '<leader>j', '<C-w>j')
map('n', '<leader>k', '<C-w>k')
map('n', '<leader>l', '<C-w>l')

-- Searching
map('n', '<leader>s', ':%s/')
map('v', '<leader>s', ':s/')
map('n', '<Esc>', ':noh<CR>', { silent = true })

-- Undo / redo
map('n', 'u', ':undo<CR>')
map('n', 'r', ':redo<CR>')


