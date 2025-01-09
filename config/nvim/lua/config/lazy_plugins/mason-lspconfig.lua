local capabilities = require('cmp_nvim_lsp').default_capabilities()

local handlers = {
    function (name)
        require('lspconfig')[name].setup({capabilities = capabilities})
    end
}

local ensure_installed = {
    "lua_ls"
}

require("mason-lspconfig").setup {
    ensure_installed = ensure_installed,
    handlers = handlers,
}
