require("luasnip.loaders.from_vscode").lazy_load()

local ls = require('luasnip')
local s = ls.snippet
local t = ls.text_node

ls.add_snippets("html", {
  s("test", { t("Hello, this is a test snippet!") }),
})
