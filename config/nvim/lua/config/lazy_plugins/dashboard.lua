require('dashboard').setup({
    theme = 'hyper', --  theme is doom and hyper default is hyper
    config = {
        header = require('ascii').art.text.neovim.sharp, -- type is table def
        packages = { enable = true }, -- show how many plugins neovim loaded
        footer = vim.version()
     },   --  config used for theme 
})
