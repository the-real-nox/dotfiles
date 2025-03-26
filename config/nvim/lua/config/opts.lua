-- disable mouse
vim.opt.mouse = ''

-- colorscheme
vim.o.background = 'dark'
colorscheme = 'melange'
vim.o.termguicolors = true
local isOK = pcall(vim.cmd, 'colorscheme ' .. colorscheme)
if not isOK then
    vim.notify('Colorscheme ' .. colorscheme .. ' not working')
end

-- tabs
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.softtabstop = 4
vim.opt.list = true

vim.api.nvim_create_autocmd('BufEnter', {
    pattern = '*',
    callback = function()
        if vim.api.nvim_buf_get_name(vim.api.nvim_get_current_buf()) == '' then
            vim.opt_local.list = false
        end
    end,
})

-- enable line numbers
vim.opt.number = true

-- clipboard
vim.opt.clipboard = "unnamedplus"

-- disable line wrap
vim.opt.wrap = false
