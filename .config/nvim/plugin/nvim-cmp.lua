vim.o.completeopt = 'menuone,noselect'

local check_back_space = function()
  local col = vim.fn.col '.' - 1
  return col == 0 or vim.fn.getline('.'):sub(col, col):match '%s' ~= nil
end

local t = function(str)
    return vim.api.nvim_replace_termcodes(str, true, true, true)
end

local cmp = require 'cmp'

cmp.setup {
  mapping = {
    ["<Tab>"] = function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      else
        fallback()
      end
    end,
    ["<S-Tab>"] = function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      else
        fallback()
      end
    end,
  },
  formatting = {
    format = function(entry, vim_item)
      -- set a name for each source
      vim_item.menu = ({
        buffer = "[BUF]",
        nvim_lsp = "[LSP]",
        nvim_lua = "[Lua]",
        path = "[Path]",
        rg = "[RG]",
      })[entry.source.name]
      return vim_item
    end,
  },
  sources = {
    {
        name = 'nvim_lsp',
        priority = 1000,
        max_item_count = 3,
        entry_filter = function(entry, ctx)
          return require('cmp.types').lsp.CompletionItemKind[entry:get_kind()] ~= 'File'
        end
    },
    {
        name = 'buffer',
        priority = 800,
        max_item_count = 3,
    },
    {
        name = 'rg',
        priority = 600,
        max_item_count = 3,
    },
    {
        name = 'path',
        priority = 400,
        max_item_count = 3,
    },
  },
}
