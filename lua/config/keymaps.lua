-- Move lines like IntelliJ
vim.keymap.set("n", "<A-j>", ":m .+1<CR>==", { silent = true })
vim.keymap.set("n", "<A-k>", ":m .-2<CR>==", { silent = true })

-- Experimental
vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action)
