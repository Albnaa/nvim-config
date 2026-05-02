return {
  {
    'nvim-telescope/telescope.nvim', version = '*',
    dependencies = {
        'nvim-lua/plenary.nvim',
        { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
    },
    config = function()
      local builtin = require("telescope.builtin")
      vim.keymap.set("n", "<leader>fd", builtin.find_files, { desc = 'Telescope find files' })
      vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = 'Telescope live grep' })
      vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = 'Telescope buffers' })
      vim.keymap.set("n", "<leader>ff", builtin.current_buffer_fuzzy_find, { desc = 'Telescope buffers' })
    end
  }
}
