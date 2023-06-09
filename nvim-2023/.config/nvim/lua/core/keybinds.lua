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

-- TELESCOPE
local telescope_builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>ff", telescope_builtin.find_files, {})
vim.keymap.set("n", "<leader>fg", telescope_builtin.live_grep, {})
vim.keymap.set("n", "<leader>fb", telescope_builtin.buffers, {})
vim.keymap.set("n", "<leader>fh", telescope_builtin.help_tags, {})
vim.keymap.set("n", "<leader>ft", telescope_builtin.git_files, {})
vim.keymap.set("n", "<leader>fd", telescope_builtin.diagnostics, {})

-- Undo Tree
vim.keymap.set("n", "<leader>u", ":UndotreeToggle<CR>", {})
vim.keymap.set("n", "<F5>", ":UndotreeToggle<CR>", {})

-- NvimTree
vim.keymap.set("n", "<leader>n", ":NvimTreeToggle<CR>", {})
vim.keymap.set("n", "<F4>", ":NvimTreeToggle<CR>", {})

-- Move.nvim block and line movement.
-- Normal-mode commands
vim.keymap.set("n", "<A-j>", ":MoveLine(1)<CR>", opts_noremap_silent)
vim.keymap.set("n", "<A-k>", ":MoveLine(-1)<CR>", opts_noremap_silent)
vim.keymap.set("n", "<A-h>", ":MoveHChar(-1)<CR>", opts_noremap_silent)
vim.keymap.set("n", "<A-l>", ":MoveHChar(1)<CR>", opts_noremap_silent)
-- Visual-mode commands
vim.keymap.set("v", "<A-j>", ":MoveBlock(1)<CR>", opts_noremap_silent)
vim.keymap.set("v", "<A-k>", ":MoveBlock(-1)<CR>", opts_noremap_silent)
vim.keymap.set("v", "<A-h>", ":MoveHBlock(-1)<CR>", opts_noremap_silent)
vim.keymap.set("v", "<A-l>", ":MoveHBlock(1)<CR>", opts_noremap_silent)

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

local dap_python = require("dap-python")
vim.keymap.set("n", "<leader>dm", dap_python.test_method, opts_noremap_silent)
vim.keymap.set("n", "<leader>df", dap_python.test_class, opts_noremap_silent)
vim.keymap.set("v", "<leader>ds", dap_python.debug_selection, opts_noremap_silent)
