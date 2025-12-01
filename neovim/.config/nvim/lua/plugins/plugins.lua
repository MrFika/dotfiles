return {
	{ "tpope/vim-fugitive" },
	{
		"numToStr/Comment.nvim",
		config = function()
			require("Comment").setup()
		end,
	},
	{
		"lewis6991/gitsigns.nvim",
		config = function()
			require("gitsigns").setup()
		end,
	},
	{
		"folke/lazydev.nvim",
		ft = "lua",
		opts = {
			library = {
				-- See the configuration section for more details
				-- Load luvit types when the `vim.uv` word is found
				{ path = "luvit-meta/library", words = { "vim%.uv" } },
			},
		},
	},
	{ "Bilal2453/luvit-meta", lazy = true }, -- optional `vim.uv` typings
	{ "hrsh7th/nvim-cmp" },
	{ "hrsh7th/cmp-nvim-lsp" },
	{ "hrsh7th/cmp-buffer" },
	{ "hrsh7th/cmp-path" },
	{ "hrsh7th/cmp-calc" },
	{ "hrsh7th/cmp-vsnip" },
	{ "hrsh7th/vim-vsnip" },
	-- use { 'andersevenrud/cmp-tmux' }
	{ "ray-x/cmp-treesitter" },
	{ "lukas-reineke/cmp-under-comparator" },
	{ "f3fora/cmp-spell" },
	-- For nice little icons in the completion popup.
	{ "onsails/lspkind-nvim" },
	-- Function Signature help.
	{ "hrsh7th/cmp-nvim-lsp-signature-help" },
	-- " Bracket, parenthesis autocompletion
	{ "windwp/nvim-autopairs" },
	-- " Undo history
	{ "ranelpadon/python-copy-reference.vim" },
	{
		"microsoft/python-type-stubs",
		cond = false,
	},
	-- {
	--   "mfussenegger/nvim-dap-python",
	--   dependencies = {
	--     "mfussenegger/nvim-dap",
	--   },
	-- },
	-- {
	--   "rcarriga/nvim-dap-ui",
	--   dependencies = {
	--     "mfussenegger/nvim-dap",
	--     "nvim-neotest/nvim-nio",
	--   },
	-- },
	{ "ThePrimeagen/vim-be-good" },
}
