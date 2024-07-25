-----------------------------------------------------------
-- General Neovim settings and configuration
-----------------------------------------------------------

-- Default options are not included
-- See: https://neovim.io/doc/user/vim_diff.html
-- [2] Defaults - *nvim-defaults*

local g = vim.g -- Global variables
local opt = vim.opt -- Set options (global/buffer/windows-scoped)

-- https://www.lunarvim.org/docs/configuration/settings

-----------------------------------------------------------
-- General
-----------------------------------------------------------
opt.mouse = "a" -- Enable mouse support
-- opt.clipboard = "unnamedplus" -- Copy/paste to system clipboard
opt.swapfile = false -- Don't use swapfile
-- opt.completeopt = "menuone,noinsert,noselect" -- Autocomplete options
opt.completeopt = "menu,menuone,noselect"
vim.opt.spelllang = "en"
vim.opt.spell = true
-- " Make F2 paste-toggle button. Paste without autoindent.
-- opt.pastetoggle = "<F2>"

-----------------------------------------------------------
-- Memory, CPU
-----------------------------------------------------------
opt.hidden = true -- Enable background buffers
opt.history = 100 -- Remember N lines in history
opt.lazyredraw = true -- Faster scrolling
opt.synmaxcol = 240 -- Max column for syntax highlight
opt.updatetime = 250 -- ms to wait for trigger an event

-----------------------------------------------------------
-- Neovim UI
-----------------------------------------------------------
opt.errorbells = false
opt.ruler = true
opt.relativenumber = true
opt.nu = true
opt.showmatch = true
opt.incsearch = true
opt.termguicolors = true
opt.background = "dark"
opt.wrap = false
opt.scrolloff = 8
opt.sidescrolloff = 8
opt.fileencoding = "utf-8"
opt.foldmethod = "manual" -- folding set to "expr" for treesitter based folding
opt.foldexpr = "" -- set to "nvim_treesitter#foldexpr()" for treesitter based folding
opt.laststatus = 3

-----------------------------------------------------------
-- Tabs, indent
-----------------------------------------------------------
-- au BufRead,BufNewFile *.py vim.opt.expandtab
opt.expandtab = true
opt.textwidth = 120
opt.colorcolumn = "120"
opt.tabstop = 4
opt.softtabstop = 4
opt.shiftwidth = 4
opt.autoindent = true

local lua_settings = function()
  opt.expandtab = true
  opt.tabstop = 2
  opt.softtabstop = 2
  opt.shiftwidth = 2
end

local python_settings = function()
  opt.expandtab = true
  -- opt.smartindent = false
end

-----------------------------------------------------------
-- Autocommand functions
-----------------------------------------------------------

-- Define autocommands with Lua APIs
-- See: h:api-autocmd, h:augroup

local augroup = vim.api.nvim_create_augroup -- Create/get autocommand group
local autocmd = vim.api.nvim_create_autocmd -- Create autocommand

vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  pattern = { "*.lua" },
  callback = lua_settings,
})

vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  pattern = { "*.py" },
  callback = python_settings,
})

-- Remove whitespace on save
autocmd("BufWritePre", {
  pattern = "",
  command = ":%s/\\s\\+$//e",
})

-- Don't auto commenting new lines
autocmd("BufEnter", {
  pattern = "",
  command = "set fo-=c fo-=r fo-=o",
})
