local rocks = {
    'lunarmodules/luafilesystem'
}

local lazy = {
    'NLKNguyen/papercolor-theme',
    {
        'nvim-lualine/lualine.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons' }
    },
    'nvim-tree/nvim-tree.lua',
    'nvim-treesitter/nvim-treesitter'
}

vim.list_extend(lazy, rocks)

return lazy
