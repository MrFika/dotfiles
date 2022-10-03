-- KEYBINDS
--
-- General (not plugin specific)
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

-- *** *** *** *** *** ***
-- PLUGIN SPECIFIC KEYBINDS

-- TELESCOPE
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
vim.keymap.set('n', '<leader>ft', builtin.git_files, {})
vim.keymap.set('n', '<leader>fd', builtin.diagnostics, {})

-- Undo Tree
vim.keymap.set('n', '<leader>u', ':UndotreeToggle<CR>', {} )
vim.keymap.set('n', '<F5>', ':UndotreeToggle<CR>', {} )

-- NvimTree
vim.keymap.set('n', '<leader>n', ':NvimTreeToggle<CR>', {} )
vim.keymap.set('n', '<F4>', ':NvimTreeToggle<CR>', {} )

-- Move.nvim block and line movement.
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

-- Bufferline shortcuts.
for i=9,1,-1
do
  vim.keymap.set('n', '<leader>' .. i, '<Cmd>BufferLineGoToBuffer ' .. i .. '<CR>zz', { silent = true })
end

-- Måste slänga in bufferN här för att de ska fungera!!!!
vim.keymap.set('n', '<leader>gd', vim.lsp.buf.definition, { buffer = true })
vim.keymap.set('n', '<leader>gt', vim.lsp.buf.type_definition, { buffer = true })
vim.keymap.set('n', '<leader>gi', vim.lsp.buf.implementation, { buffer = true })
vim.keymap.set('n', '<leader>gc', vim.lsp.buf.incoming_calls, { buffer = true })
vim.keymap.set('n', '<leader>gr', vim.lsp.buf.references, { buffer = true })
vim.keymap.set('n', '<leader>r', vim.lsp.buf.rename, { buffer = true })
vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, {})

vim.keymap.set('n', '<C-space>', vim.lsp.buf.hover, { buffer = true })
-- Find references & definitions.
vim.keymap.set('n', '<leader>fr', '<cmd>Telescope lsp_references<CR>', {})
vim.keymap.set('n', '<leader>fd', '<cmd>Telescope lsp_definitions<CR>', {})

-- Cycle through lsp diagnostics popups.
vim.keymap.set('n', '<leader>dn', vim.diagnostic.goto_next, { buffer = true })
vim.keymap.set('n', '<leader>dp', vim.diagnostic.goto_prev, { buffer = true })
vim.keymap.set('n', '<leader>dq', vim.diagnostic.setqflist, { buffer = true })
-- Project wide diagnostics fuzzy find.
vim.keymap.set('n', '<leader>dl', '<cmd>Telescope diagnostics<CR>', {})
