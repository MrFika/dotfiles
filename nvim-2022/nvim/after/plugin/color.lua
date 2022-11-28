-- vim.g.catppuccin_flavour = "latte" -- latte, frappe, macchiato, mocha
--
-- local catppuccin = require("catppuccin")
-- catppuccin.setup({
-- 	integrations = {
-- 		telescope = true,
-- 		-- lualine = true,
-- 		mason = true,
-- 		-- bufferline = true,
-- 		treesitter = true,
-- 		gitsigns = true,
-- 		native_lsp = {
-- 			enabled = true,
-- 			virtual_text = {
-- 				errors = { "italic" },
-- 				hints = { "italic" },
-- 				warnings = { "italic" },
-- 				information = { "italic" },
-- 			},
-- 			underlines = {
-- 				errors = { "underline" },
-- 				hints = { "underline" },
-- 				warnings = { "underline" },
-- 				information = { "underline" },
-- 			},
-- 		},
-- 	},
-- })

-- Buffer tabs at the top of the screen.
require("bufferline").setup({
	options = {
		offsets = {
			filetype = "NvimTree",
			text = "File explorer",
			highlight = "Directory",
			text_align = "left",
		},
		-- highlights = require("catppuccin.groups.integrations.bufferline").get(),  -- Supposed to get colorscheme look nice...
		diagnostics = "nvim_lsp",
	},
})
-- vim.cmd([[colorscheme catppuccin]])
vim.cmd([[colorscheme nightfox]])
