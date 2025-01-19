local null_ls = require('null-ls')

local formatters = {
    stylua = {
        extra_args = { "--indent-type", "Spaces" },
    },
    prettier = {
        extra_args = { "--use-tabs", "false" },
    },
}


local mason_registry = require('mason-registry')
for k, v in pairs(formatters) do
    local tool = mason_registry.get_package(k)

    if not tool:is_installed() then
        vim.notify('Installing ' .. k .. '...')
        tool:install()
        vim.notify('Done')
    end
end

local sources = {}


for k, v in pairs(formatters) do
    table.insert(sources, null_ls.builtins.formatting[k].with(v)) 
end

null_ls.setup({
    sources = sources
})
