# AGENTS.md — Neovim Config Guide

## Config Structure

```
init.lua → lua/config/{lazy,autocmds,keymaps,option}.lua
         → lua/plugins/{lsp,treesitter,telescope,ui,ufo,lazygit,grug-far}.lua
```

- Base distribution: `LazyVim/LazyVim` — provides default keymaps, options, extras (which-key, comment, gitsigns, neo-tree).
- Custom plugins override LazyVim specs via spec import in `lazy.lua`.
- LazyVim plugins auto lazy-loaded; custom plugins default `lazy = false`.

## Common Mistakes to Avoid

1. **`opts` typo** — lazy.nvim only recognizes `opts` (not `otps`, `otp`, `opt`). Double-check spelling.
2. **UFO capabilities** — Must add `textDocument.foldingRange` to LSP capabilities in `lsp.lua` (not in `ufo.lua`). UFO reads folding ranges from LSP client capabilities.
3. **Startup-only LSP highlight changes** — Code running at startup (e.g., `getcompletion("@lsp")`) sees no LSP groups. Use `LspAttach` autocmd instead.
4. **`vim.lsp.buf.*` without guard** — Wrap in `pcall` or check `vim.lsp.get_clients()` to avoid runtime errors.
5. **Clipboard in SSH** — Check `vim.env.SSH_TTY` before setting `clipboard = "unnamedplus"` to preserve OSC 52.
6. **Noice config vs autocmd timing** — Don't check `vim.o.filetype` in `config()`. Use `FileType` autocmd instead.
7. **Telescope extension dependencies** — Avoid hard-loading telescope just for `load_extension`. Use `pcall` to load extension only if telescope is already loaded.

## Key Dependencies (external)

- `rg` (ripgrep), `fd` (fd-find), `gcc` (C compiler), `lazygit`, clipboard manager (xclip, wl-clipboard, etc.)
- Neovim ≥ 0.11 (`vim.lsp.config` API used in lsp.lua)

## Development Commands

- `nvim +Lazy sync` — sync plugins
- `nvim +Lazy update` — update plugins
- `nvim +Lazy check` — check for updates
