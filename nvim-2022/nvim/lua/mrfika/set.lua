-- https://www.lunarvim.org/configuration/01-settings.html#example-options
vim.opt.completeopt = "menu,menuone,noselect"
-- " Make F2 paste-toggle button. Paste without autoindent.
vim.opt.pastetoggle = "<F2>"
-- syntax on
vim.opt.errorbells = false
vim.opt.ruler = true
vim.opt.relativenumber = true
vim.opt.nu = true
vim.opt.mouse = "a"
vim.opt.showmatch = true
vim.opt.incsearch = true

-- au BufRead,BufNewFile *.py vim.opt.expandtab
vim.opt.expandtab = true
vim.opt.textwidth = 120
vim.opt.colorcolumn = "120"
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.autoindent = true

vim.opt.termguicolors = true
vim.opt.background = "light"

vim.opt.clipboard = "unnamedplus"
vim.opt.wrap = false
vim.opt.scrolloff = 5
vim.opt.sidescrolloff = 5
vim.opt.fileencoding = "utf-8"

vim.opt.foldmethod = "manual" -- folding set to "expr" for treesitter based folding
vim.opt.foldexpr = "" -- set to "nvim_treesitter#foldexpr()" for treesitter based folding

local lua_settings = function()
  vim.opt.expandtab = true
  vim.opt.tabstop = 2
  vim.opt.softtabstop = 2
  vim.opt.shiftwidth = 2
end
local python_settings = function()
  vim.opt.expandtab = true
end

vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  pattern = { "*.py" },
  callback = python_settings
})

vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  pattern = { "*.lua" },
  callback = lua_settings
})

vim.opt.laststatus = 3
