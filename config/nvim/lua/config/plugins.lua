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
    {
       'nvim-telescope/telescope.nvim',
        dependencies = { 'nvim-lua/plenary.nvim' }
    },
    {
        'MaximilianLloyd/ascii.nvim',
        dependencies = { 'MunifTanjim/nui.nvim' }
    },
    'nvimdev/dashboard-nvim',

    -- LSP
    'williamboman/mason.nvim',
    'williamboman/mason-lspconfig.nvim',
    'WhoIsSethDaniel/mason-tool-installer.nvim',
    'nvimtools/none-ls.nvim',
    'neovim/nvim-lspconfig',

    -- Auto-complete
    'neovim/nvim-lspconfig',
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-path',
    'hrsh7th/cmp-cmdline',
    'hrsh7th/nvim-cmp',

    -- Snippets
    {
        'L3MON4D3/LuaSnip',
        build = "make install_jsregexp",
        dependencies = { 
            'rafamadriz/friendly-snippets',
            'saadparwaiz1/cmp_luasnip',
        },
    },

    -- Autopairing
    {
        'windwp/nvim-autopairs',
        event = "InsertEnter",
        config = true
    },
    'windwp/nvim-ts-autotag',

    -- Toggle-term
    {
      'akinsho/toggleterm.nvim',
      version = "*"
    },
}

vim.list_extend(lazy,rocks)
return lazy
