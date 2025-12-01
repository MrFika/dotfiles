-----------------------------------------------------------
-- Dashboard configuration file
-----------------------------------------------------------

-- Plugin: alpha-nvim
-- url: https://github.com/goolord/alpha-nvim

-- For configuration examples see: https://github.com/goolord/alpha-nvim/discussions/16

local status_ok, alpha = pcall(require, "alpha")
if not status_ok then
	return
end

local dashboard = require("alpha.themes.dashboard")

-- Footer
local function footer()
	local version = vim.version()
	local print_version = "v" .. version.major .. "." .. version.minor .. "." .. version.patch
	local datetime = os.date("%Y/%m/%d %H:%M:%S")

	return print_version .. " - " .. datetime
end

-- Banner
local banner = {
	"                                                    ",
	" ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ",
	" ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ ",
	" ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ ",
	" ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ ",
	" ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ ",
	" ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ ",
	"                                                    ",
}

dashboard.section.header.val = banner

-- Menu
dashboard.section.buttons.val = {
	dashboard.button("g", "  Fuzzy grep", ":Telescope live_grep<CR>"),
	dashboard.button("ff", "  Find file", ":Telescope find_files<CR>"),
	dashboard.button("ft", "  Find Git file", ":Telescope git_files<CR>"),
	dashboard.button("d", "  Diagnostics", ":Telescope diagnostics<CR>"),
	dashboard.button("h", "  Help", ":Telescope help_tags<CR>"),
	dashboard.button("s", "  git status", ":Telescope git_status<CR>"),
	dashboard.button("u", "  Update plugins", ":Lazy sync<CR>"),
	dashboard.button("l", "  Lazy", ":Lazy<CR>"),
	dashboard.button("q", "  Quit", ":qa<CR>"),
}

dashboard.section.footer.val = footer()

alpha.setup(dashboard.config)
