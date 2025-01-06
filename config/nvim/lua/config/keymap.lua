local map = vim.keymap.set

-- Harpoon
map('n', '<leader>a', require('harpoon.mark').add_file)
map('n', '<leader>f', require('harpoon.ui').toggle_quick_menu)
