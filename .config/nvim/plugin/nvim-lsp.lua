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
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  -- Mappings
  local opts = { noremap = true, silent = true }

  buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
  buf_set_keymap('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
  buf_set_keymap('n', '<leader>q', '<cmd>lua vim.diagnostic.setloclist()<CR>', opts)

  vim.cmd [[ command! Format execute 'lua vim.lsp.buf.formatting()' ]]
  buf_set_keymap('n', '<leader>n', ':Format<CR>', opts)

    -- buf_set_keymap('n', '<leader>o', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
  -- vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  -- vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gD', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
  -- vim.api.nvim_buf_set_keymap(bufnr, 'n', 'ga', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  -- vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  -- vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  -- vim.api.nvim_buf_set_keymap(bufnr, 'n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  -- vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  -- vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  -- vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  -- vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  -- vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  -- -- vim.api.nvim_buf_set_keymap(bufnr, 'v', '<leader>ca', '<cmd>lua vim.lsp.buf.range_code_action()<CR>', opts)
  -- vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>so', [[<cmd>lua require('telescope.builtin').lsp_document_symbols()<CR>]], opts)
end

vim.lsp.set_log_level("debug")

-- nvim-cmp supports additional completion capabilities
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

-- pyright
-- require("lspconfig").pyright.setup({
--   on_attach = on_attach,
--   capabilities = capabilities,
--   settings = {
--     python = {
--       analysis = {
--         autoSearchPaths = true,
--         diagnosticMode = "workspace",
--         useLibraryCodeForTypes = true,
--         typeCheckingMode = "off",
--         disableOrganizeImports = true
--       }
--     }
--   }
-- })

-- jedi
require("lspconfig").jedi_language_server.setup({
  on_attach = on_attach,
  capabilities = capabilities,
})

-- efm
-- local python_black = {
--   formatCommand = "black --quiet -",
--   formatStdin = true
-- }
-- local python_isort = {
--   formatCommand = "isort --quiet -",
--   formatStdin = true
-- }
-- local python_flake8 = {
--   lintCommand = "flake8 --stdin-display-name ${INPUT} -",
--   lintStdin = true,
--   lintFormats = {"%f:%l:%c: %m"}
-- }

-- require("lspconfig").efm.setup({
--   init_options = {documentFormatting = true},
--   filetypes = { "python" },
--   settings = {
--     languages = {
--       python = {
--         python_flake8,
--         python_black,
--         python_isort,
--       }
--     }
--   }
-- })

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

-- lsp signatures
-- require "lsp_signature".setup({
--   bind = true,
--   hint_enable = false,
--   handler_opts = {
--     border = "single"
--   }
-- })

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
