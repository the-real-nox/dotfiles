local map = vim.keymap.set
-- Nvim-Tree
vim.keymap.set('n', '<leader>pf', function () vim.cmd('NvimTreeToggle') end )

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

map('n', '<leader>ha', function ()
    if vim.loop.fs_stat(vim.fn.expand('%:p')) ~= nil then
        harpoon_mark.add_file()
        initTabbar()
    else
        vim.notify('Save file before adding it to harpoon!')
    end
end)
map('n', '<leader>hr', function ()
    harpoon_mark.rm_file(harpoon_mark.get_current_index())
    initTabbar()
end)
map('n', '<leader>hf', require('harpoon.ui').toggle_quick_menu)
map('n', '<leader>hc', function ()
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

-- Telescope
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })
