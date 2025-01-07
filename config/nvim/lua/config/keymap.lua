local map = vim.keymap.set

-- Harpoon
local harpoon_mark = require('harpoon.mark')

function initTabbar()
    vim.cmd('redrawtabline')
    vim.cmd('highlight! HarpoonInactive guibg=NONE guifg=NONE')
    vim.cmd('highlight! TabLineFill guibg=NONE guifg=white')
    vim.cmd('highlight! HarpoonActive guibg=NONE guifg=white')
end

map('n', '<leader>a', function ()
    harpoon_mark.add_file()
    initTabbar()
end)
map('n', '<leader>r', function ()
    harpoon_mark.rm_file(harpoon_mark.get_current_index())
    initTabbar()
end)
map('n', '<leader>f', require('harpoon.ui').toggle_quick_menu)
map('n', '<leader>s', function ()
    vim.ui.input({ prompt ='Close harpooned tabs? ' }, function (input)
        if input == 'y' then
            harpoon_mark.clear_all()
            initTabbar()
        end
    end)
end)
