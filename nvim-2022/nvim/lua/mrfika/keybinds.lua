-- KEYBINDS
-- TELESCOPE
local builtin = require('telescope.builtin')
vim.keymap.set('n', 'ff', builtin.find_files, {})
vim.keymap.set('n', 'fg', builtin.live_grep, {})
vim.keymap.set('n', 'fb', builtin.buffers, {})
vim.keymap.set('n', 'fh', builtin.help_tags, {})
vim.keymap.set('n', 'ft', builtin.git_files, {})
vim.keymap.set('n', 'fd', builtin.diagnostics, {})

-- Source the init.vim to refresh config changes.
vim.keymap.set('n', '<leader><CR>', ':so ~/dotfiles/nvim-2022/nvim/init.lua<CR>', {} )

-- Window movement
vim.keymap.set('n', '<leader>h', ':wincmd h<CR>', {} )
vim.keymap.set('n', '<leader>j', ':wincmd j<CR>', {} )
vim.keymap.set('n', '<leader>k', ':wincmd k<CR>', {} )
vim.keymap.set('n', '<leader>l', ':wincmd l<CR>', {} )

vim.keymap.set('n', '<leader>+', ':vertial resize +5<CR>', { silent = true} )
vim.keymap.set('n', '<leader>-', ':vertial resize -5<CR>', { silent = true} )

-- Navigate quickfix list.
vim.keymap.set('n', '<C-j>', ':cn<CR>', {} )
vim.keymap.set('n', '<C-k>', ':cp<CR>', {} )

-- Copy to system clipboard.
vim.keymap.set({'n', 'v'}, '<leader>y', '"+y', {} )
-- Copy the whole file to system clipboard.
vim.keymap.set('n', '<leader>Y', 'gg"+yG', {} )

--" Make Y yank till end of line.
vim.keymap.set('n', 'Y', 'y$', {} )

-- TEMPRORARY FIX FOR: https://github.com/neovim/neovim/issues/16416
vim.keymap.set('i', '<C-c>', '<ESC>', {})

-- Undo Tree
vim.keymap.set('n', '<leader>u', ':UndotreeToggle<CR>', {} )
vim.keymap.set('n', '<F5>', ':UndotreeToggle<CR>', {} )

-- NvimTree
vim.keymap.set('n', '<leader>n', ':NvimTreeToggle<CR>', {} )
vim.keymap.set('n', '<F4>', ':NvimTreeToggle<CR>', {} )

local opts = { noremap = true, silent = true }
-- Normal-mode commands
vim.keymap.set('n', '<A-j>', ':MoveLine(1)<CR>', opts)
vim.keymap.set('n', '<A-k>', ':MoveLine(-1)<CR>', opts)
vim.keymap.set('n', '<A-h>', ':MoveHChar(-1)<CR>', opts)
vim.keymap.set('n', '<A-l>', ':MoveHChar(1)<CR>', opts)

-- Visual-mode commands
vim.keymap.set('v', '<A-j>', ':MoveBlock(1)<CR>', opts)
vim.keymap.set('v', '<A-k>', ':MoveBlock(-1)<CR>', opts)
vim.keymap.set('v', '<A-h>', ':MoveHBlock(-1)<CR>', opts)
vim.keymap.set('v', '<A-l>', ':MoveHBlock(1)<CR>', opts)
