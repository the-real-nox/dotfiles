local map = vim.keymap.set

-- Harpoon
local harpoon_mark = require('harpoon.mark')

function initTabbar()
    vim.cmd('redrawtabline')
    vim.cmd('highlight! HarpoonInactive guibg=NONE guifg=#94816e')
    vim.cmd('highlight! TabLineFill guibg=NONE guifg=white')
    vim.cmd('highlight! HarpoonActive guibg=NONE guifg=white')
    vim.cmd('highlight! HarpoonNumberActive guibg=NONE guifg=#e49b5d')
    vim.cmd('highlight! HarpoonNumberInactive guibg=NONE guifg=#94816e')
end
initTabbar()

map('n', '<leader>a', function ()
    harpoon_mark.add_file()
    initTabbar()
end)
map('n', '<leader>r', function ()
    harpoon_mark.rm_file(harpoon_mark.get_current_index())
    initTabbar()
end)
map('n', '<leader>f', require('harpoon.ui').toggle_quick_menu)
map('n', '<leader>ca', function ()
    vim.ui.input({ prompt ='Close harpooned tabs? ' }, function (input)
        if input == 'y' then
            harpoon_mark.clear_all()
            initTabbar()
        end
    end)
end)


-- Terminal
map('t', '<M-q>', [[<C-\><C-n>:ToggleTerm<CR>]])
map('n', '<leader>t', ':ToggleTerm<CR>')
