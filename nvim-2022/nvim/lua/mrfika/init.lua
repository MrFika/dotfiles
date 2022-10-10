vim.g.mapleader = " "
vim.g.loaded = 1
vim.g.loaded_netrwPlugin = 1

-- File tree to the left.
require("nvim-tree").setup({
  open_on_setup = false,
  open_on_tab = false,
  diagnostics = {
    enable = false
  },
  view = {
    adaptive_size = true,
  },
  renderer = {
    indent_markers = {
      enable = true,
    }
  },
  git = {
    enable = true,
    ignore = true,
    timeout = 500,
  },
})

-- Statusline at the bottom of the screen.
require('lualine').setup {
  options = {
    theme = 'auto'
  },
  global_status = true
}

-- Buffer tabs at the top of the screen.
require('bufferline').setup {
  options = {
    offsets = {
      filetype = "NvimTree",
      text = "File explorer",
      highlight = "Directory",
      text_align = "left"
    },
    diagnostics = "nvim_lsp"
  }
}

require("mason").setup()

require('telescope').setup {
  defaults = {
    prompt_prefix = "$ ",
    -- Developer configurations: Not meant for general override
    buffer_previewer_maker = require 'telescope.previewers'.buffer_previewer_maker
  }
}
require('telescope').load_extension('fzf')

require('nvim-treesitter.configs').setup {
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
}

require('Comment').setup()
require('gitsigns').setup()

require('lint').linters_by_ft = {
  python = { 'pylint', 'pycodestyle', 'pydocstyle', },
  lua = { 'luacheck' }
}

local pycodestyle = require('lint.linters.pycodestyle')
pycodestyle.args = {
  '--line-length=120',
  '--format=%(path)s:%(row)d:%(col)d:%(code)s:%(text)s',
  '-',
}
local luacheck = require('lint.linters.luacheck')
luacheck.args = {'--read-globals','vim', '--globals', 'vim.g', '--formatter', 'plain', '--codes', '--ranges', '-' }

local pylint = require('lint.linters.pylint')
pylint.args = {
  '-f', 'json',
  -- '-pylintrc', vim.fs.dirname(vim.fs.find({'pyproject.toml', 'setup.py'}, { upward = true })[1])
  -- "--init-hook='import sys; sys.path.append(\".\")'",
}
-- let g:ale_python_pylint_options = "--init-hook='import sys; sys.path.append(\".\")'"

vim.api.nvim_create_autocmd({ "BufWritePost" }, {
  callback = function()
    require("lint").try_lint()
  end,
})
