vim.treesitter.start()

vim.opt_local.shiftwidth = 4
vim.opt_local.tabstop = 4
vim.opt_local.expandtab = true
vim.g.pyindent_open_paren = '0'

-- Default: :make runs the current script
vim.cmd.compiler("pyunit")
vim.opt_local.makeprg = "uv run %:S"

local function run(compiler, prg)
  return function()
    local old_prg, old_efm = vim.bo.makeprg, vim.bo.errorformat

    vim.cmd.compiler(compiler)
    vim.bo.makeprg = prg
    vim.cmd("make")

    vim.bo.makeprg, vim.bo.errorformat = old_prg, old_efm
  end
end

local o = { buffer = 0 }

vim.keymap.set("n", "<leader>mr", "<cmd>make<CR>", o)
vim.keymap.set("n", "<leader>mf", run("ruff", "uv run ruff format --diff"), o)
vim.keymap.set("n", "<leader>ml", run("ruff", "uv run ruff check"), o)
vim.keymap.set("n", "<leader>mt", run("mypy", "uv run mypy ."), o)
