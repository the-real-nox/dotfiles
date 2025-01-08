-- function load(name)
  --  local base_path = 'config.lazy_plugins.'
  --  require('_' .. name)
-- end

local base_path = 'config.lazy_plugins.'

require(base_path .. 'lualine')
require(base_path .. 'nvim-tree')
require(base_path .. 'nvim-treesitter')
require(base_path .. 'harpoon')
