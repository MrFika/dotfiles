return {
	{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 9999,
		lazy = false,
		opts = {
			flavour = "auto", -- ("auto"|"frappe"|"latte"|"macchiato"|"mocha")
			background = {
				light = "latte",
				dark = "macchiato",
			},
			float = {
				transparent = false,
				solid = false,
			},
			auto_integrations = true,
      -- Optional: If LazyVim doesn't set it automatically
      -- This 'config' function runs after the plugin is loaded
      config = function()
          -- Only add this line if the colorscheme isn't being applied
          vim.cmd.colorscheme("catppuccin")
      end
    },
		specs = {
			{
				"akinsho/bufferline.nvim",
				optional = true,
				opts = function(_, opts)
					if (vim.g.colors_name or ""):find("catppuccin") then
						opts.highlights = require("catppuccin.special.bufferline").get_theme()
					end
				end,
			},
		},
	},
	{ "folke/tokyonight.nvim" },
}
