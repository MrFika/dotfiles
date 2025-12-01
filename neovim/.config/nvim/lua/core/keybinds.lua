-- KEYBINDS
--
-- General (not plugin specific)
-- Source the init.vim to refresh config changes. (Not sure how to do this correctly with init.lua)
vim.keymap.set("n", "<leader><CR>", ":so %", {})

local opts_noremap_silent = { noremap = true, silent = true }
-- Window movement
vim.keymap.set("n", "<leader>h", ":wincmd h<CR>", {})
vim.keymap.set("n", "<leader>j", ":wincmd j<CR>", {})
vim.keymap.set("n", "<leader>k", ":wincmd k<CR>", {})
vim.keymap.set("n", "<leader>l", ":wincmd l<CR>", {})

vim.keymap.set("n", "<leader>+", ":vertial resize +5<CR>", { silent = true })
vim.keymap.set("n", "<leader>-", ":vertial resize -5<CR>", { silent = true })

-- Navigate quickfix list.
vim.keymap.set("n", "<C-j>", ":cn<CR>zz", opts_noremap_silent)
vim.keymap.set("n", "<C-k>", ":cp<CR>zz", opts_noremap_silent)

-- Copy to system clipboard.
vim.keymap.set({ "n", "v" }, "<leader>y", '"+y', {})
-- Copy the whole file to system clipboard.
vim.keymap.set("n", "<leader>Y", 'gg"+yG', {})

--" Make Y yank till end of line.
vim.keymap.set("n", "Y", "y$", {})

-- TEMPRORARY FIX FOR: https://github.com/neovim/neovim/issues/16416
vim.keymap.set("i", "<C-c>", "<ESC>", {})
vim.keymap.set("n", "<C-c>", "<ESC>", {})

-- *** *** *** *** *** ***
-- PLUGIN SPECIFIC KEYBINDS

-- -- Undo Tree
-- vim.keymap.set("n", "<leader>u", ":UndotreeToggle<CR>", {})
-- vim.keymap.set("n", "<F5>", ":UndotreeToggle<CR>", {})

-- Bufferline shortcuts.
for i = 1, 9, 1 do
  vim.keymap.set("n", "<leader>" .. i, "<Cmd>BufferLineGoToBuffer " .. i .. "<CR>zz", { silent = true })
end

-- Cycle through lsp diagnostics popups.
vim.keymap.set("n", "<leader>de", vim.diagnostic.open_float, opts_noremap_silent)
vim.keymap.set("n", "<leader>dn", vim.diagnostic.goto_next, opts_noremap_silent)
vim.keymap.set("n", "<leader>dp", vim.diagnostic.goto_prev, opts_noremap_silent)
vim.keymap.set("n", "<leader>dq", vim.diagnostic.setqflist, opts_noremap_silent)

vim.keymap.set("n", "<leader>rp", ":PythonCopyReferencePytest<CR>")
vim.keymap.set("n", "<leader>rd", ":PythonCopyReferenceDotted<CR>")

-- local dap_python = require("dap-python")
-- vim.keymap.set("n", "<leader>dm", dap_python.test_method, opts_noremap_silent)
-- vim.keymap.set("n", "<leader>df", dap_python.test_class, opts_noremap_silent)
-- vim.keymap.set("v", "<leader>ds", dap_python.debug_selection, opts_noremap_silent)
