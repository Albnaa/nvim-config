return {
  "neovim/nvim-lspconfig",
  dependencies = { 'saghen/blink.cmp' },
  
  config = function()
    local capabilities = require('blink.cmp').get_lsp_capabilities()

    vim.lsp.config('rust_analyzer', {
      capabilities = capabilities,
      settings = {
        ['rust-analyzer'] = {
          -- The fix is right here: we use 'check' instead of 'checkOnSave'
          check = {
            command = "clippy",
          },
        }
      }
    })

    vim.lsp.enable('rust_analyzer')
  end,
}

