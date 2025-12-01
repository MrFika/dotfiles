return {
	"nvim-tree/nvim-tree.lua",
	version = "*",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	opts = {
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
	},
	keys = {
		{ "<leader>n", "<cmd>NvimTreeToggle<cr>", desc = "Toggle NvimTree" },
		{ "<F4>", "<cmd>NvimTreeToggle<cr>", desc = "Toggle NvimTree" },
  }
}
