-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use { 'wbthomason/packer.nvim' }
  use { "catppuccin/nvim", as = "catppuccin" }
  use { 'kyazdani42/nvim-tree.lua',
    requires = {
      'kyazdani42/nvim-web-devicons', -- optional, for file icons
    },
  }
  use {'akinsho/bufferline.nvim',
    tag = "v2.*",
    requires = {
      'kyazdani42/nvim-web-devicons', -- optional, for file icons
    },
  }
  use {
    'nvim-lualine/lualine.nvim',
    requires = {
      'kyazdani42/nvim-web-devicons', opt = true
    }
  }
  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.0',
    requires = { {'nvim-lua/plenary.nvim'} }
  }
  use {'nvim-telescope/telescope-fzf-native.nvim',
    run = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build'
  }
  use { 'fedepujol/move.nvim' }
  use { 'numToStr/Comment.nvim' }
  use { 'tpope/vim-fugitive' }
  use { 'lewis6991/gitsigns.nvim' }
  use {
    'nvim-treesitter/nvim-treesitter',
    run = function() require('nvim-treesitter.install').update({ with_sync = true }) end,
  }
  use { 'nvim-treesitter/nvim-treesitter-context' }
  use { 'nvim-treesitter/playground' }

  use {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig",
  }
  -- use { 'neovim/nvim-lspconfig' }
  use { 'hrsh7th/nvim-cmp'  }
  use { 'hrsh7th/cmp-nvim-lsp'  }
  use { 'hrsh7th/cmp-buffer'  }
  use { 'hrsh7th/cmp-path'  }
  use { 'hrsh7th/cmp-calc'  }
  use { 'hrsh7th/cmp-vsnip'  }
  use { 'hrsh7th/vim-vsnip'  }
  -- use { 'andersevenrud/cmp-tmux' }
  use { 'ray-x/cmp-treesitter' }
  use { 'lukas-reineke/cmp-under-comparator'}
  use { 'f3fora/cmp-spell' }
  -- For nice little icons in the completion popup.
  use { 'onsails/lspkind-nvim' }
  -- Function Signature help.
  use { 'hrsh7th/cmp-nvim-lsp-signature-help' }

  -- " Bracket, parenthesis autocompletion
  use { 'windwp/nvim-autopairs' }


  -- " Undo history

  use { 'mbbill/undotree' }
  use { 'dense-analysis/ale' }
end)
