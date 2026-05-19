return {
  "neovim/nvim-lspconfig",
  dependencies = { 'saghen/blink.cmp' },
  
  config = function()
    local capabilities = require('blink.cmp').get_lsp_capabilities()

    vim.lsp.config('rust_analyzer', {
      capabilities = capabilities,
      settings = {
        ['rust-analyzer'] = {
          check = {
            command = "clippy",
          },
        }
      }
    })

    vim.lsp.config('pyright', {
      capabilities = capabilities,
    })

    vim.lsp.config('ruff', {
      capabilities = capabilities,
    })

    vim.lsp.enable('rust_analyzer')
    vim.lsp.enable('pyright')
    vim.lsp.enable('ruff')
  end,
}

