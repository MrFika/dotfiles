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
  ensure_installed = {
    'bash', 'c', 'cpp', 'css', 'html', 'javascript', 'json', 'lua', 'python',
    'rust', 'typescript', 'vim', 'yaml',
  },
}

-- local lint = require('lint')
-- lint.linters_by_ft = {
--   python = { 'pylint', 'pycodestyle', 'pydocstyle', },
--   lua = { 'luacheck' }
-- }
--
-- local pycodestyle = lint.linters.pycodestyle
-- pycodestyle.args = {
--   '--line-length=120',
--   '--format=%(path)s:%(row)d:%(col)d:%(code)s:%(text)s',
--   '-',
-- }
-- local luacheck = lint.linters.luacheck
-- luacheck.args = { '--read-globals', 'vim', '--globals', 'vim.g', '--formatter', 'plain', '--codes', '--ranges', '-' }
--
-- -- local proj_dir = vim.fs.dirname(vim.fs.find({'pylintrc', 'setup.py'}, { upward = true })[1])
-- local pylint = lint.linters.pylint
-- pylint.args = {
--   '-f', 'json',
--   -- '-pylintrc', proj_dir,
--   -- "--init-hook='import sys; sys.path.append(\".\")'",
-- }
-- -- let g:ale_python_pylint_options = "--init-hook='import sys; sys.path.append(\".\")'"
--
-- vim.api.nvim_create_autocmd({ "BufWritePost" }, {
--   callback = function()
--     lint.try_lint()
--   end,
-- })

-- Provides the Format, FormatWrite, FormatLock, and FormatWriteLock commands
-- https://github.com/mhartington/formatter.nvim
-- local format_utils = require("formatter.util")
-- -- format_utils.get_current_buffer_file_name()
-- require("formatter").setup {
--   -- Enable or disable logging
--   logging = true,
--   -- Set the log level
--   log_level = vim.log.levels.WARN,
--   -- All formatter configurations are opt-in
--   filetype = {
--     -- Formatter configurations for filetype "lua" go here
--     -- and will be executed in order
--     python = {
--       -- require("formatter.filetypes.python").black,
--       require("formatter.filetypes.python").isort,
--       require("formatter.filetypes.python").docformatter,
--     },
--     lua = {
--       require("formatter.filetypes.lua").stylua,
--     },
--
--     -- Use the special "*" filetype for defining formatter configurations on
--     -- any filetype
--     ["*"] = {
--       -- "formatter.filetypes.any" defines default configurations for any
--       -- filetype
--       require("formatter.filetypes.any").remove_trailing_whitespace
--     }
--   }
-- }
--

-- require('dap-python').setup('~/.local/share/nvim/mason/packages/debugpy/venv/bin/python')
require('dap-python').setup('python')
require("dapui").setup()

local dap, dapui = require("dap"), require("dapui")
dap.listeners.after.event_initialized["dapui_config"] = function()
  dapui.open({})
end
dap.listeners.before.event_terminated["dapui_config"] = function()
  dapui.close({})
end
dap.listeners.before.event_exited["dapui_config"] = function()
  dapui.close({})
end
