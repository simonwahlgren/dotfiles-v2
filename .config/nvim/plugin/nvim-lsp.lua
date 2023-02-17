-- must be setup before any language servers
require("nvim-lsp-installer").setup({
    ensure_installed = {
        "jedi_language_server",
        "sumneko_lua",
        "bashls",
        "dockerls",
        "jsonls",
        "tsserver",
        "terraformls",
        "vimls",
        "yamlls"
    },
    automatic_installation = true,
    ui = {
        icons = {
            server_installed = "✓",
            server_pending = "➜",
            server_uninstalled = "✗"
        }
    }
})

-- nvim-lsp
vim.diagnostic.config({
  virtual_text = false,
  signs = true,
  underline = false,
  update_in_insert = false,
  severity_sort = false,
})

-- show line diagnostics automatically in hover window
vim.o.updatetime = 250
vim.cmd [[autocmd CursorHold,CursorHoldI * lua vim.diagnostic.open_float(nil, {focus=false})]]

-- change diagnostic symbols in the sign column (gutter)
local signs = { Error = ">", Warning = ">", Hint = "*", Information = "*" }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

-- nvim-lspconfig
-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local nvim_lsp = require('lspconfig')
local on_attach = function(client, bufnr)

  -- work around for https://github.com/jose-elias-alvarez/null-ls.nvim/issues/1131
  -- basically, make gq work for null-ls sources without formatting support (markdownlint)
  local function is_null_ls_formatting_enabed(bufnr)
    local file_type = vim.api.nvim_buf_get_option(bufnr, "filetype")
    local generators = require("null-ls.generators").get_available(
        file_type,
        require("null-ls.methods").internal.FORMATTING
    )
    return #generators > 0
  end
  if client.server_capabilities.documentFormattingProvider then
    if
      client.name == "null-ls" and is_null_ls_formatting_enabed(bufnr)
      or client.name ~= "null-ls"
    then
      -- use default formatexpr set ny neovim since https://github.com/neovim/neovim/pull/19677
    else
      vim.api.nvim_buf_set_option(bufnr, "formatexpr", "")
    end
  end

  -- disable formatexpr for python to get `gq` mapping working again
  -- https://github.com/jose-elias-alvarez/null-ls.nvim/issues/1259
  if client.name == "jedi_language_server" then
    vim.api.nvim_buf_set_option(bufnr, "formatexpr", "")
  end

  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  local opts = { noremap = true, silent = true }

  vim.cmd [[ command! Format execute 'lua vim.lsp.buf.format { async = true }' ]]
  buf_set_keymap('n', '<leader>n', ':Format<CR>', opts)
  buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
  buf_set_keymap('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
  buf_set_keymap('n', '<leader>q', '<cmd>lua vim.diagnostic.setloclist()<CR>', opts)
end

-- vim.lsp.set_log_level("debug")

-- nvim-cmp supports additional completion capabilities
local capabilities = require("cmp_nvim_lsp").default_capabilities()

-- jedi
require("lspconfig").jedi_language_server.setup({
    on_attach = on_attach,
    capabilities = capabilities,
    -- available options https://github.com/pappasam/jedi-language-server#configuration
    -- disable diagnostics, should be disabled by default since 0.39 but seems to not work
    -- https://github.com/pappasam/jedi-language-server/issues/187
    init_options = {
        diagnostics = {
          enable = false
        }
    }
})

-- null ts
require("null-ls").setup({
    debug = false,
    on_attach = on_attach,
    sources = {
        require("null-ls").builtins.diagnostics.flake8,
        require("null-ls").builtins.diagnostics.luacheck,
        require("null-ls").builtins.diagnostics.markdownlint,
        -- require("null-ls").builtins.diagnostics.mypy,
        require("null-ls").builtins.diagnostics.shellcheck,
        require("null-ls").builtins.diagnostics.yamllint,
        require("null-ls").builtins.formatting.black,
        require("null-ls").builtins.formatting.isort,
        require("null-ls").builtins.formatting.json_tool,
        require("null-ls").builtins.formatting.terraform_fmt,
    }
})

-- terraform-ls
require'lspconfig'.terraformls.setup{}

-- treesitter
require'nvim-treesitter.configs'.setup {
  -- Enable all parsers
  ensure_installed = {
      "python",
      "bash",
      "dockerfile",
      "javascript",
      "json",
      "lua",
      "make",
      "toml",
      "typescript",
      "vim",
      "yaml",
  },

  highlight = {
    enable = true,
    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },

  -- Incremental selection based on the named nodes from the grammar.
  -- incremental_selection = {
  --   enable = true,
  --   keymaps = {
  --     init_selection = "gnn",
  --     node_incremental = "grn",
  --     scope_incremental = "grc",
  --     node_decremental = "grm",
  --   },
  -- },

  -- 2022-08-01: Doesn't work very well, vim-python-pep8-indent is preferred
  -- Indentation based on treesitter for the = operator. NOTE: This is an experimental feature.
  -- indent = {
  --   enable = true,
  -- }
}
