return {
	"nvim-telescope/telescope.nvim",
	tag = "v0.1.9",
	lazy = false,
	dependencies = {
		"nvim-lua/plenary.nvim",
		{
			"nvim-telescope/telescope-fzf-native.nvim",
			-- This is the recommended build command for fzf-native
			build = "make",
			-- `cond` is a lazy.nvim feature to only load this plugin when the build tool is available
			cond = function()
				return vim.fn.executable("make") == 1
			end,
		},
		-- Useful for a consistent UI with other plugins
		{ "nvim-telescope/telescope-ui-select.nvim" },
	},
	config = function()
		local telescope = require("telescope")
		local actions = require("telescope.actions")

		telescope.setup({
			defaults = {
				-- A nicer prompt icon, requires a Nerd Font
				prompt_prefix = " ",
				selection_caret = " ",
				-- Ignore heavy directories for better performance
				file_ignore_patterns = { "node_modules", "%.git", "target", "lazy%-lock.json" },

				-- Custom keymappings for a better experience
				mappings = {
					i = {
						["<C-j>"] = actions.move_selection_next,
						["<C-k>"] = actions.move_selection_previous,
						["<esc>"] = actions.close,
					},
				},
				-- A popular layout strategy
				layout_strategy = "horizontal",
				layout_config = {
					horizontal = {
						prompt_position = "bottom",
						preview_width = 0.55,
					},
					vertical = {
						mirror = false,
					},
				},
			},
			extensions = {
				["ui-select"] = {
					require("telescope.themes").get_dropdown({}),
				},
			},
		})

		-- Load extensions
		telescope.load_extension("fzf")
		telescope.load_extension("ui-select")
	end,
	-- Cleaner keymappings without anonymous functions
	keys = {
		{ "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find files" },
		{ "<leader>fg", "<cmd>Telescope live_grep<cr>", desc = "Live grep" },
		{
			"<leader>fG",
			function()
				require("telescope.builtin").live_grep({
					additional_args = { "--hidden", "--no-ignore" },
				})
			end,
			desc = "Live grep (including hidden)",
		},
		{ "<leader>fb", "<cmd>Telescope buffers<cr>", desc = "Find buffers" },
		{ "<leader>fh", "<cmd>Telescope help_tags<cr>", desc = "Help tags" },
		{ "<leader>fo", "<cmd>Telescope oldfiles<cr>", desc = "Find old files" },
		{ "<leader>ft", "<cmd>Telescope git_files<cr>", desc = "Git Files" },
		{ "<leader>fd", "<cmd>Telescope diagnostics<cr>", desc = "Diagnostics" },
		{ "<leader>fk", "<cmd>Telescope keymaps<cr>", desc = "Keymaps" },
		{ "<leader>fc", "<cmd>Telescope commands<cr>", desc = "Commands" },
		{ "<leader>gs", "<cmd>Telescope git_status<cr>", desc = "Git Status" },
		{ "<leader>gs", "<cmd>Telescope git_commits<cr>", desc = "Git Commits" },
		{ "<leader>gb", "<cmd>Telescope git_commits<cr>", desc = "Git Branches" },
	},
}
