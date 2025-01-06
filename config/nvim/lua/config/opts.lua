-- disable mouse
vim.opt.mouse = ''

-- colorscheme
vim.o.background = 'dark'
colorscheme = 'melange'
local isOK = pcall(vim.cmd, 'colorscheme ' .. colorscheme)
if not isOK then
    vim.notify('Colorscheme ' .. colorscheme .. ' not working')
end

-- tabs
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.list = true

-- enable line numbers
vim.opt.number = true
