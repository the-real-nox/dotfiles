require('dashboard').setup({
    theme = 'hyper', --  theme is doom and hyper default is hyper
    config = {
        header = require('ascii').art.text.neovim.sharp, -- type is table def 
        shortcut = {
            { desc = '󰊳 Update', group = '@property', action = 'Lazy update', key = 'u' },
            { desc = ' Quit', group = '@property', action = ':qa!', key = 'q' },
        },
        packages = { enable = true }, -- show how many plugins neovim loaded
        footer = { tostring(vim.version()), },
     },   --  config used for theme 
})

vim.api.nvim_create_autocmd('BufEnter', {
    pattern = '*',
    callback = function()
        if vim.api.nvim_buf_get_name(vim.api.nvim_get_current_buf()) == '' then
            vim.cmd([[
                highlight DashboardHeader guifg=#D08E55
                highlight DashboardShortCut guifg=#7ca98b
            ]])

        end
    end,
})
