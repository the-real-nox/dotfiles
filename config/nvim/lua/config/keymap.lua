local map = vim.keymap.set

-- Harpoon
local harpoon_mark = require('harpoon.mark')
map('n', '<leader>a', harpoon_mark.add_file)
map('n', '<leader>r', function () harpoon_mark.rm_file(harpoon_mark.get_current_index()) end)
map('n', '<leader>f', require('harpoon.ui').toggle_quick_menu)
