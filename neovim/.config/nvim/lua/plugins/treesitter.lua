return {
	"nvim-treesitter/nvim-treesitter",
	-- Use a build command to automatically update parsers when the plugin is updated
	build = ":TSUpdate",
  lazy = false,
	dependencies = {
		-- Provides context-aware code block highlighting at the top of the screen
		"nvim-treesitter/nvim-treesitter-context",
		-- An interactive tool for exploring the syntax tree, useful for debugging
		"nvim-treesitter/playground",
	},
	-- The main configuration function
	config = function()
		require("nvim-treesitter.configs").setup({
			-- A list of parsers to ensure are installed.
			-- `auto_install = true` will handle other languages automatically.
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
				"toml",
				"go",
			},

			-- Install parsers synchronously (only applied to `ensure_installed`)
			sync_install = false,

			-- Automatically install missing parsers when entering a buffer.
			-- This is a great alternative to a massive `ensure_installed` list.
			auto_install = true,

			-- List of parsers to ignore installing (or "all")
			ignore_install = {},

			-- If you need to change the installation directory of the parsers (see -> Advanced Setup)
			-- parser_install_dir = "/some/path/to/store/parsers", -- Remember to run vim.opt.runtimepath:append("/some/path/to/store/parsers")!

			-- Modules configuration
			modules = {},

			-- Main highlight module
			highlight = {
				enable = true,
				-- Some languages (like HTML) can have issues with this, so it's disabled by default.
				additional_vim_regex_highlighting = false,
        disable = {"gitcommit"}
			},

			-- Enable indentation based on Treesitter for more accurate indenting.
			indent = {
				enable = true,
			},
		})

		-- Configuration for nvim-treesitter-context
		-- Shows the current function/class/scope at the top of the editor
		require("treesitter-context").setup({
			enable = true, -- Enable this plugin
			max_lines = 0, -- No limit on the number of lines to show
			trim_scope = "outer", -- Show the outermost scope
			separator = "─", -- A nice separator
		})
	end,
	-- Keymaps for the playground plugin for easy access
	keys = {
		{ "<leader>tp", "<cmd>TSPlaygroundToggle<cr>", desc = "Toggle Treesitter Playground" },
		{ "<leader>tn", "<cmd>TSNodeUnderCursor<cr>", desc = "Node Under Cursor" },
	},
}
