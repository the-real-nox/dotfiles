local capabilities = require('cmp_nvim_lsp').default_capabilities()

local handlers = {
    function (name)
        require('lspconfig')[name].setup({capabilities = capabilities})
    end
}

local lsp_server = {
    "lua_ls","clangd", "html", "cssls", "ts_ls"
}

require("mason-lspconfig").setup {
    ensure_installed = lsp_server,
    handlers = handlers,
}
