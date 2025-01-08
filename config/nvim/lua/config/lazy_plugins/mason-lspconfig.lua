local ensure_installed = {
    "lua_ls"
} 

require("mason-lspconfig").setup {
    ensure_installed = ensure_installed,
}
