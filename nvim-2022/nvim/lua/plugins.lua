-----------------------------------------------------------
-- Plugin manager configuration file
-----------------------------------------------------------

-- Plugin manager: packer.nvim
-- url: https://github.com/wbthomason/packer.nvim

-- For information about installed plugins see the README:
-- neovim-lua/README.md
-- https://github.com/brainfucksec/neovim-lua#readme

-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Automatically install packer
local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path })
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

return require('packer').startup(function(use)
  -- Packer can manage itself
  use { 'wbthomason/packer.nvim' }
  use { "catppuccin/nvim", as = "catppuccin" }
  use { 'folke/tokyonight.nvim' }
  use { 'kyazdani42/nvim-tree.lua',
    requires = {
      'kyazdani42/nvim-web-devicons',
    },
  }
  use { 'akinsho/bufferline.nvim',
    tag = "v3.*",
    requires = {
      'kyazdani42/nvim-web-devicons',
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
    requires = { { 'nvim-lua/plenary.nvim' } }
  }
  use { 'nvim-telescope/telescope-fzf-native.nvim',
    run = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build'
  }
  use { 'fedepujol/move.nvim' }
  use { 'tpope/vim-fugitive' }
  use {
    'numToStr/Comment.nvim',
    config = function()
      require('Comment').setup()
    end
  }
  use {
    'lewis6991/gitsigns.nvim',
    config = function()
      require('gitsigns').setup()
    end
  }
  use {
    'nvim-treesitter/nvim-treesitter',
    run = function() require('nvim-treesitter.install').update({ with_sync = true }) end,
  }
  use { 'nvim-treesitter/nvim-treesitter-context' }
  use { 'nvim-treesitter/playground' }

  use {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end
  }
  use {
    "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig",
  }
  use { "folke/neodev.nvim" }
  use { 'hrsh7th/nvim-cmp' }
  use { 'hrsh7th/cmp-nvim-lsp' }
  use { 'hrsh7th/cmp-buffer' }
  use { 'hrsh7th/cmp-path' }
  use { 'hrsh7th/cmp-calc' }
  use { 'hrsh7th/cmp-vsnip' }
  use { 'hrsh7th/vim-vsnip' }
  -- use { 'andersevenrud/cmp-tmux' }
  use { 'ray-x/cmp-treesitter' }
  use { 'lukas-reineke/cmp-under-comparator' }
  use { 'f3fora/cmp-spell' }
  -- For nice little icons in the completion popup.
  use { 'onsails/lspkind-nvim' }
  -- Function Signature help.
  use { 'hrsh7th/cmp-nvim-lsp-signature-help' }

  -- " Bracket, parenthesis autocompletion
  use { 'windwp/nvim-autopairs' }

  -- " Undo history
  use { 'mbbill/undotree' }
  use { 'ranelpadon/python-copy-reference.vim' }
  -- use { 'dense-analysis/ale' }
  -- use { 'mfussenegger/nvim-lint' }
  -- use { 'mhartington/formatter.nvim' }
  use { 'jose-elias-alvarez/null-ls.nvim' }

  use { 'simrat39/symbols-outline.nvim',
    config = function()
      require("symbols-outline").setup()
    end
  }

  use {
    'mfussenegger/nvim-dap-python',
    requires = {
      'mfussenegger/nvim-dap',
    },
  }
  use {
    "rcarriga/nvim-dap-ui",
    requires = {
      "mfussenegger/nvim-dap"
    }
  }
  use { "ThePrimeagen/vim-be-good" }
  use {
    'goolord/alpha-nvim',
    requires = { 'kyazdani42/nvim-web-devicons' }
  }


  if packer_bootstrap then
    require('packer').sync()
  end

end)
