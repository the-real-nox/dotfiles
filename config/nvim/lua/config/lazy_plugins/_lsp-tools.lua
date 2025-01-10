local tools = {
    "stylua"
}

require('mason-tool-installer').setup({
    ensure_installed = tools,
    auto_update = true
})
local null_ls = require('null-ls')

null_ls.setup({
    sources = {
        null_ls.builtins.formatting.stylua,
    }
})

vim.cmd([[
  augroup FormatAutogroup
    autocmd!
    autocmd TextChanged,TextChangedI * lua vim.lsp.buf.formatting_sync(nil, 100)
  augroup END
]])
