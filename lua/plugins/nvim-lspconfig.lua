local on_attach = function(client, bufnr)
  local opts = { noremap = true, silent = true, buffer = bufnr }

  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
  vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
  vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
  vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
  vim.keymap.set('n', '<space>wl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, opts)
  vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)
  vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)
  vim.keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, opts)
  vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
  vim.keymap.set('n', '<space>f', function()
    vim.lsp.buf.format { async = true }
  end, opts)
end

local config = function()
  require('neoconf').setup {}

  local lspconfig = require 'lspconfig'
  local capabilities = vim.lsp.protocol.make_client_capabilities()
  capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

  -- lua
  lspconfig.lua_ls.setup {
    capabilities = capabilities,
    on_attach = on_attach,
    settings = {
      Lua = {
        diagnostics = { globals = { 'vim' } },
        workspace = {
          library = {
            [vim.fn.expand '$VIMRUNTIME/lua'] = true,
            [vim.fn.stdpath 'config' .. '/lua'] = true,
          },
        },
      },
    },
  }

  -- python
  lspconfig.pyright.setup {
    capabilities = capabilities,
    on_attach = on_attach,
    settings = {
      pyright = {
        disableOrganizeImports = false,
        analysis = {
          useLibraryCodeForTypes = true,
          autoSearchPaths = true,
          diagnosticMode = 'workspace',
          autopImportCompletions = true,
          extraPaths = {
            '~/codebase/all-the-things/chameleon/cli', '~/codebase/all-the-things/chameleon/client', '~/codebase/all-the-things/chameleon/http', '~/codebase/all-the-things/chameleon/integration_tests', '~/codebase/all-the-things/chameleon/service', }, },
      },
    },
  }

  -- local luacheck = require 'efmls-configs.linters.luacheck'
  -- local stylua = require 'efmls-configs.formatters.stylua'
  require 'efmls-configs.linters.flake8'
  require 'efmls-configs.formatters.black'

  -- configure efm server
  lspconfig.efm.setup {
    filetypes = {
      'lua',
      'python',
    },
    init_options = {
      documentFormatting = true,
      documentRangeFormatting = true,
      hover = true,
      documentSymbol = true,
      codeAction = true,
      completion = true,
    },
    settings = {
      languages = {
        -- lua = { luacheck, stylua },
        lua = {
          require 'efmls-configs.linters.luacheck',
          require 'efmls-configs.formatters.stylua',
        },
        python = {
          {
            lintCommand = 'flake8 --max-line-length 120 --format "%(row)d:%(col)d:%(code)s:%(text)s"',
            lintFormats = { '%f:%l:%c:%t%n%n%n %m' },
            lintStdin = true,
            lintIgnoreExitCode = true,
            formatCommand = 'black --quiet --line-length 120 -',
            formatStdin = true,
          },
        },
      },
    },
  }

  -- autoformat on save
  local lsp_fmt_group = vim.api.nvim_create_augroup('LspFormattingGroup', {})
  vim.api.nvim_create_autocmd('BufWritePost', {
    group = lsp_fmt_group,
    callback = function()
      local efm = vim.lsp.get_active_clients { name = 'efm' }

      if vim.tbl_isempty(efm) then
        return
      end

      vim.lsp.buf.format { name = 'efm' }
    end,
  })
end

return {
  'neovim/nvim-lspconfig',
  config = config,
  lazy = false,
  dependencies = {
    'williamboman/mason.nvim',
    'williamboman/mason-lspconfig.nvim',
    { 'j-hui/fidget.nvim', opts = {} },
    'folke/neodev.nvim',
    'creativenull/efmls-configs-nvim',
  },
}
