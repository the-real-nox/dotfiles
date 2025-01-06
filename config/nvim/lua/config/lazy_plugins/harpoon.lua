require('harpoon').setup({
    tabline = true,
    tabline_prefix = "   ",
    tabline_suffix = "   ",
})
vim.cmd('highlight! HarpoonInactive guibg=NONE guifg=NONE')
vim.cmd('highlight! TabLineFill guibg=NONE guifg=white')
vim.cmd('highlight! HarpoonActive guibg=NONE guifg=white')
