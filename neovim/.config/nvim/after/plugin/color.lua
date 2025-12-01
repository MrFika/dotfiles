local catppuccin = require("catppuccin")
catppuccin.setup({
  flavour = "auto",
  integrations = {
    telescope = true,
    -- lualine = true,
    mason = true,
    -- bufferline = true,
    treesitter = true,
    gitsigns = true,
    native_lsp = {
      enabled = true,
      virtual_text = {
        errors = { "italic" },
        hints = { "italic" },
        warnings = { "italic" },
        information = { "italic" },
      },
      underlines = {
        errors = { "underline" },
        hints = { "underline" },
        warnings = { "underline" },
        information = { "underline" },
      },
    },
  },
})
-- Buffer tabs at the top of the screen.
require("bufferline").setup({
  highlights = require("catppuccin.groups.integrations.bufferline").get(), -- Supposed to get colorscheme look nice...
  options = {
    diagnostics = "nvim_lsp",
    offsets = {
      {
        filetype = "NvimTree",
        text = "File Explorer",
        highlight = "Directory",
        text_align = "left",
      }
    },
  },
})
vim.cmd.colorscheme("catppuccin")
