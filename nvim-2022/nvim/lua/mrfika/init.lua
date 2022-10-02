vim.g.mapleader = " "
vim.g.loaded = 1
vim.g.loaded_netrwPlugin = 1

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
  git= {
    enable = true,
    ignore = true,
    timeout = 500,
  },
})

require("bufferline").setup{
    options= {
      offsets = {{
            filetype = "NvimTree",
            text = "File explorer",
            highlight = "Directory",
            text_align = "left"
          }},
    diagnostics = "nvim_lsp"
    }
}

require("mason").setup()

require('telescope').setup{
  defaults = {
    prompt_prefix = "$ ",
    -- Developer configurations: Not meant for general override
    buffer_previewer_maker = require'telescope.previewers'.buffer_previewer_maker
  }
}
require('telescope').load_extension('fzf')
