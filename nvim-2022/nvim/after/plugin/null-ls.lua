-----------------------------------------------------------
-- null-ls configuration file
-----------------------------------------------------------

-- Plugin: null-ls
-- url: https://github.com/jose-elias-alvarez/null-ls.nvim

-- local status_ok, null_ls = pcall(require, 'null_ls')
-- if not status_ok then
--   return
-- end

local null_ls = require("null-ls")
local utils = require("null-ls.utils")
local builtins = require("null-ls.builtins")

local my_sources = {
  -- Formatting
  builtins.formatting.stylua,
  builtins.formatting.prettier.with({
    filetypes = { "html", "json", "yaml", "markdown" },
  }),
  builtins.formatting.black.with({
    extra_args = { "-l", "120" }
  }),

  -- Diagnostics
  builtins.diagnostics.luacheck,
  builtins.diagnostics.pylint,
  builtins.diagnostics.mypy,
  builtins.diagnostics.pycodestyle.with({
    extra_args = {"--max-line-length", "120"}
  }),
  builtins.diagnostics.pydocstyle,

  -- Code actions
  -- Hover
}

null_ls.setup({
  sources = my_sources
})
