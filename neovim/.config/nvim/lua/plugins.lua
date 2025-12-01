-----------------------------------------------------------
-- Plugin manager configuration file
-----------------------------------------------------------

-- Plugin manager: packer.nvim
-- url: https://github.com/wbthomason/packer.nvim

-- For information about installed plugins see the README:
-- neovim-lua/README.md
-- https://github.com/brainfucksec/neovim-lua#readme

-- This file can be loaded by calling `lua require('plugins')` from your init.vim

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Example using a list of specs with the default options
vim.g.mapleader = " " -- Make sure to set `mapleader` before lazy so your mappings are correct

local plugins = {
  { "catppuccin/nvim",      name = "catppuccin" },
  { "folke/tokyonight.nvim" },
  {
    "nvim-tree/nvim-tree.lua",
    version = "*",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    }
  },
  { "akinsho/bufferline.nvim", version = "*", dependencies = { "nvim-tree/nvim-web-devicons" } },
  {
    "nvim-lualine/lualine.nvim",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
      lazy = true,
    },
  },
  {
    "nvim-telescope/telescope.nvim",
    version = "0.1.8",
    dependencies = { "nvim-lua/plenary.nvim" },
  },
  {
    "nvim-telescope/telescope-fzf-native.nvim",
    build =
    "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build",
  },
  {
    "fedepujol/move.nvim",
    keys = {
      -- Normal Mode
      { "<A-j>", ":MoveLine(1)<CR>", desc = "Move Line Up" },
      { "<A-k>", ":MoveLine(-1)<CR>", desc = "Move Line Down" },
      { "<A-h>", ":MoveHChar(-1)<CR>", desc = "Move Character Left" },
      { "<A-l>", ":MoveHChar(1)<CR>", desc = "Move Character Right" },
      { "<leader>wf", ":MoveWord(-1)<CR>", mode = { "n" }, desc = "Move Word Left" },
      { "<leader>wb", ":MoveWord(1)<CR>", mode = { "n" }, desc = "Move Word Right" },
      -- Visual Mode
      { "<A-j>", ":MoveBlock(1)<CR>", mode = { "v" }, desc = "Move Block Up" },
      { "<A-k>", ":MoveBlock(-1)<CR>", mode = { "v" }, desc = "Move Block Down" },
      { "<A-h>", ":MoveHBlock(-1)<CR>", mode = { "v" }, desc = "Move Block Left" },
      { "<A-l>", ":MoveHBlock(1)<CR>", mode = { "v" }, desc = "Move Block Right" },
    },
    config = function()
      require("move").setup()
    end,
  },
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
    "nvim-treesitter/nvim-treesitter",
    build = function()
      require("nvim-treesitter.install").update({ with_sync = true })
    end,
  },
  { "nvim-treesitter/nvim-treesitter-context" },
  { "nvim-treesitter/playground" },
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig",
  },
  { "folke/neodev.nvim" },
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
  { "mbbill/undotree" },
  { "ranelpadon/python-copy-reference.vim" },
  { "nvimtools/none-ls.nvim" },
  {
    "simrat39/symbols-outline.nvim",
    config = function()
      require("symbols-outline").setup()
    end,
  },
  {
    "mfussenegger/nvim-dap-python",
    dependencies = {
      "mfussenegger/nvim-dap",
    },
  },
  { "rcarriga/nvim-dap-ui", dependencies = {"mfussenegger/nvim-dap", "nvim-neotest/nvim-nio"}
  },
  { "ThePrimeagen/vim-be-good" },
  {
    "goolord/alpha-nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
  },
}
local opts = {}

require("lazy").setup(plugins, opts)
