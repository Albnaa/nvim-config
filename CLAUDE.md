# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## What This Is

A personal Neovim configuration built on [lazy.nvim](https://github.com/folke/lazy.nvim), targeting Rust, Python, and Lua development.

## Architecture

```
init.lua               # Entry point — loads config.lazy, config.keymaps, config.options
lua/
  config/
    lazy.lua           # Bootstraps lazy.nvim and sets leader keys (Space / Backslash)
    keymaps.lua        # Global keybindings
    options.lua        # Editor options (line numbers, etc.)
  plugins/             # One file per plugin or plugin group
    theme.lua          # Catppuccin Mocha
    lsp.lua            # nvim-lspconfig (rust_analyzer, pyright, ruff)
    telescope.lua      # Fuzzy finder + fzf-native
    blink.lua          # Completion (blink.cmp v1.*)
    treesitter.lua     # Syntax + indent (rust, python, lua parsers)
after/ftplugin/        # Per-filetype overrides (indent width, treesitter indent expr)
  python.lua           # 4-space indent
  lua.lua              # 2-space indent
  rust.lua
```

`init.lua` calls `require` for the three `config.*` modules in order. lazy.nvim then scans `lua/plugins/` to discover plugin specs — every file returned from that directory is auto-imported.

## Adding a New Plugin

Create a new file under `lua/plugins/`. Return a valid lazy.nvim plugin spec table (or a list of tables). lazy.nvim picks it up automatically on next startup.

## Adding a New LSP Server

Edit `lua/plugins/lsp.lua`. Add the server name as a key inside the `servers` table (following the existing pattern for `rust_analyzer`, `pyright`, `ruff`). Pass `capabilities = capabilities` to inherit blink.cmp completions.

## Key Bindings Reference

Leader key is **Space**.

| Key | Action |
|-----|--------|
| `<leader>fd` | Telescope: find files |
| `<leader>fg` | Telescope: live grep |
| `<leader>fb` | Telescope: buffers |
| `<leader>ff` | Telescope: fuzzy find in current buffer |
| `<leader>fe` | Telescope: diagnostics |
| `<leader>ca` | LSP: code action |
| `Alt+j / Alt+k` | Move current line down/up |

## Completion

blink.cmp is configured with the `enter` keymap preset — **Enter** accepts a completion. Sources: LSP → path → snippets → buffer.

## No Build/Test Commands

This is a config-only repository with no build system, test suite, or linter. Changes are validated by launching Neovim and observing behavior.
