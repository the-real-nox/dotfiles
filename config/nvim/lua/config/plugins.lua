local rocks = {
--    'lunarmodules/luafilesystem'
}

local lazy = {
    {
        'nvim-lualine/lualine.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons' }
    },
    'nvim-tree/nvim-tree.lua',
    'nvim-treesitter/nvim-treesitter',
    'savq/melange-nvim',
    'ThePrimeagen/harpoon',
    'nvim-lua/plenary.nvim'
}

vim.list_extend(lazy, rocks)

return lazy
