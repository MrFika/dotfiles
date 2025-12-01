return {
	"nvimtools/none-ls.nvim",
	lazy = true,
	event = "VeryLazy",
	-- Ensure you have mason.nvim installed if you're using builtins that rely on it
	dependencies = { "mason.nvim" },
	opts = function()
		local null_ls = require("null-ls")
		local builtins = null_ls.builtins -- Access builtins through the loaded null_ls module

		return {
			sources = {
				-- Formatting
				builtins.formatting.stylua,
				builtins.formatting.prettier.with({
					filetypes = { "html", "json", "yaml", "markdown" },
				}),
				builtins.formatting.black,
				builtins.diagnostics.pylint,
				builtins.diagnostics.mypy,
			},
			temp_dir = "/tmp",
		}
	end,
}
