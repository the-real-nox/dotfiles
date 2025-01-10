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
    'nvim-lua/plenary.nvim',

    -- LSP
    'williamboman/mason.nvim',
    'williamboman/mason-lspconfig.nvim',
    'neovim/nvim-lspconfig',

    -- Auto-complete
    'neovim/nvim-lspconfig',
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-path',
    'hrsh7th/cmp-cmdline',
    'hrsh7th/nvim-cmp',

    -- Snippets
    'L3MON4D3/LuaSnip',
    'saadparwaiz1/cmp_luasnip',

    -- Autopairing
    {
        'windwp/nvim-autopairs',
        event = "InsertEnter",
        config = true
    },
}

vim.list_extend(lazy,rocks)
return lazy
