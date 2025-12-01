return {
	"fedepujol/move.nvim",
	keys = {
		-- Normal Mode
		{ "<A-j>", ":MoveLine(1)<CR>", desc = "Move Line Up" },
		{ "<A-k>", ":MoveLine(-1)<CR>", desc = "Move Line Down" },
		{ "<A-h>", ":MoveHChar(-1)<CR>", desc = "Move Character Left" },
		{ "<A-l>", ":MoveHChar(1)<CR>", desc = "Move Character Right" },
		{ "<leader>wf", ":MoveWord(-1)<CR>", desc = "Move Word Left", mode = { "n" } },
		{ "<leader>wb", ":MoveWord(1)<CR>", desc = "Move Word Right", mode = { "n" } },
		-- Visual Mode
		{ "<A-j>", ":MoveBlock(1)<CR>", desc = "Move Block Up", mode = { "v" } },
		{ "<A-k>", ":MoveBlock(-1)<CR>", desc = "Move Block Down", mode = { "v" } },
		{ "<A-h>", ":MoveHBlock(-1)<CR>", desc = "Move Block Left", mode = { "v" } },
		{ "<A-l>", ":MoveHBlock(1)<CR>", "Move = desc Block Right", mode = { "v" } },
	},
	opts = {
		-- Config here
	},
	config = function()
		require("move").setup()
	end,
}
