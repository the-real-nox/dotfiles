local map = vim.keymap.set

-- Harpoon
local harpoon_mark = require('harpoon.mark')
map('n', '<leader>a', harpoon_mark.add_file)
map('n', '<leader>r', function ()
    harpoon_mark.rm_file(harpoon_mark.get_current_index())
    vim.cmd('redrawtabline')
end)
map('n', '<leader>f', require('harpoon.ui').toggle_quick_menu)
map('n', '<leader>s', function ()
    vim.ui.input({ prompt ='Close harpooned tabs?', completion = 'y|n'}, function (input)
        if input == 'y' then
            harpoon_mark.clear_all()
        end
    end)
end)
