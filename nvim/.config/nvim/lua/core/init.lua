vim.g.mapleader = " "
vim.g.loaded = 1
vim.g.loaded_netrwPlugin = 1

-- File tree to the left.
require("nvim-tree").setup({
	diagnostics = {
		enable = false,
	},
	view = {
		adaptive_size = true,
	},
	renderer = {
		indent_markers = {
			enable = true,
		},
	},
	git = {
		enable = true,
		ignore = true,
		timeout = 500,
	},
})

-- Statusline at the bottom of the screen.
require("lualine").setup({
	options = {
		theme = "catppuccin",
	},
	global_status = true,
})


require("telescope").setup({
	defaults = {
		prompt_prefix = "$ ",
		-- Developer configurations: Not meant for general override
		buffer_previewer_maker = require("telescope.previewers").buffer_previewer_maker,
	},
})
require("telescope").load_extension("fzf")

require("nvim-treesitter.configs").setup({
	highlight = {
		enable = true,
		additional_vim_regex_highlighting = false,
	},
  -- indent = {
  --   enable = true
  -- },
	ensure_installed = {
		"bash",
		"c",
		"cpp",
		"css",
		"html",
		"javascript",
		"json",
		"lua",
		"python",
		"rust",
		"typescript",
		"vim",
		"yaml",
	},
})

-- require('dap-python').setup('~/.local/share/nvim/mason/packages/debugpy/venv/bin/python')
require("dap-python").setup("python")
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
