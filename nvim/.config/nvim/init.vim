call plug#begin(stdpath('data') . '/plugged')

Plug 'nvim-lualine/lualine.nvim'

" Status line and color themes.
Plug 'gruvbox-community/gruvbox'
Plug 'rakr/vim-one'
Plug 'rafamadriz/neon'
Plug 'EdenEast/nightfox.nvim'
Plug 'sainnhe/gruvbox-material'
Plug 'navarasu/onedark.nvim'


" Buffer lines and file tree with fancy icons.
Plug 'kyazdani42/nvim-web-devicons'
Plug 'akinsho/nvim-bufferline.lua'
Plug 'kyazdani42/nvim-tree.lua'


" Virtualenv and git plugins for airline integraiton.
Plug 'plytophogy/vim-virtualenv'
Plug 'tpope/vim-fugitive'
" Gitsigns for git stuff.
Plug 'lewis6991/gitsigns.nvim'

" Telescope :D
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
" Telescope bonus stuff, fuzzy find. Install ripgrep, via apt install also.
Plug 'nvim-telescope/telescope-fzf-native.nvim', {'do': 'make'}
" Harpoon man, more cool stuff.
Plug 'ThePrimeagen/harpoon'
Plug 'ThePrimeagen/refactoring.nvim'

" Code block moving.
Plug 'fedepujol/move.nvim'

" Code block commenting.
Plug 'numToStr/Comment.nvim'

" Treesitter (shitter)
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-treesitter/playground'

" LSP
" Basic configuration for native lsp.
Plug 'neovim/nvim-lspconfig'
" Quick installation of language servers :LspInstall
Plug 'williamboman/nvim-lsp-installer'
" Autocompletion
" Plug 'hrsh7th/nvim-compe'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/vim-vsnip'

Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-calc'
Plug 'ray-x/cmp-treesitter'
Plug 'f3fora/cmp-spell'
Plug 'lukas-reineke/cmp-under-comparator'


" For nice little icons in the completion popup.
Plug 'onsails/lspkind-nvim'

" Signature hinting.
Plug 'ray-x/lsp_signature.nvim'
" Async Linter for python
Plug 'dense-analysis/ale'

" Bracket, parenthesis autocompletion
Plug 'windwp/nvim-autopairs'

" Undo history
Plug 'mbbill/undotree'

call plug#end()
" Onedark colorscheme settings:
" let g:onedark_style = 'deep'
let g:onedark_config = {'style': 'deep'}
"
" With powerline fonts installed on the system this can be used.
" Custom font: https://github.com/tjdevries/config_manager/tree/master/fonts
" Status line import from other file.
set termguicolors " feline needs termguicolors set before to work?!
lua << EOF
-- require('plugins.skitline')
-- require('feline').setup()
require('lualine').setup()


-- Signature setup 
local lsp_signature_setup = {
  on_attach = function(client, bufnr)
    require "lsp_signature".on_attach({
      bind = true,
      floating_window = false,
      hint_enable = true
    })
  end,
}

local lsp_installer = require("nvim-lsp-installer")

-- Register a handler that will be called for all installed servers.
-- Alternatively, you may also register handlers on specific server instances instead (see example below).
lsp_installer.on_server_ready(function(server)
    -- local opts = {}

    -- (optional) Customize the options passed to the server
    -- if server.name == "tsserver" then
    --     opts.root_dir = function() ... end
    -- end

    -- This setup() function is exactly the same as lspconfig's setup function.
    -- Refer to https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
    server:setup(lsp_signature_setup)
end)

-- Bufferline setup 
require("bufferline").setup{
    options= {
      offsets = {{
            filetype = "NvimTree",
            text = "File explorer",
            highlight = "Directory",
            text_align = "left"
          }},
    diagnostics = "nvim_lsp"
    }
}
-- Gitsigns setup.
require('gitsigns').setup()

-- Comment setup.
require('Comment').setup()

EOF

" Map <leader> key to spacebar.
let mapleader = " "

" Source the init.vim to refresh config changes.
nnoremap <Leader><CR> :so ~/.config/nvim/init.vim<CR>

" Window movement
nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>
nnoremap <silent> <leader>+ :vertical resize +5<CR>
nnoremap <silent> <leader>- :vertical resize -5<CR>

" Navigate quickfix list.
nnoremap <C-j> :cn<CR>
nnoremap <C-k> :cp<CR>

"
" Copy to system clipboard.
nnoremap <leader>y "+y
vnoremap <leader>y "+y
" Copy the whole file to system clipboard.
nnoremap <leader>Y gg"+yG 

" Make Y yank till end of line.
nnoremap Y y$

" Telescope
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>ft <cmd>Telescope git_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope current_buffer_fuzzy_find<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

" TEMPRORARY FIX FOR: https://github.com/neovim/neovim/issues/16416
inoremap <C-c> <Esc>

lua << EOF
require('telescope').setup{
  defaults = {
    prompt_prefix = "$ ",
    -- Developer configurations: Not meant for general override
    buffer_previewer_maker = require'telescope.previewers'.buffer_previewer_maker
  }
}
require('telescope').load_extension('fzf')
EOF

" Undo Tree
nnoremap <leader>u :UndotreeToggle<CR>
nnoremap <F5> :UndotreeToggle<CR>

" NvimTree
nnoremap <leader>n :NvimTreeToggle<CR>
nnoremap <F4> :NvimTreeToggle<CR>
let g:nvim_tree_highlight_opened_files = 1

" Nvim tree config is being migrated to lua. Requires setup to be run AFTER g: settings.
lua << EOF
require'nvim-tree'.setup{
    open_on_setup = false,
    open_on_tab = false,
    diagnostic = {
        enable = false
    },
    git = {
        enable = true,
        ignore = true,
        timeout = 500,
    },
    renderer = {
        indent_markers = {
            enable = true
        }
    },
}

-- TREESITTER SETUP
require'nvim-treesitter.configs'.setup {
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
}

local autopairs = require('nvim-autopairs')
local cmp_autopairs = require('nvim-autopairs.completion.cmp')

autopairs.setup({
  disable_filetype = { "TelescopePrompt" , "vim" },
})

-- CMP Completion
-- Setup nvim-cmp.
local cmp = require'cmp'

cmp.setup({
    snippet = {
        expand = function(args)
        -- For `vsnip` user.
            vim.fn["vsnip#anonymous"](args.body)
        end,
    },
    mapping = {
      ['<C-n>'] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
      ['<C-p>'] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
      ['<Tab>'] = cmp.mapping(cmp.mapping.select_next_item(), { 'i', 's' }),
      ['<S-Tab>'] = cmp.mapping(cmp.mapping.select_prev_item(), { 'i', 's' }),
      ['<Down>'] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }),
      ['<Up>'] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }),
      ['<C-d>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<C-e>'] = cmp.mapping.close(),
      ['<CR>'] = cmp.mapping.confirm({
        behavior = cmp.ConfirmBehavior.Insert,
        select = true,
      })
    },
    sources = {
      { name = 'nvim_lsp' },
      -- For vsnip user.
      { name = 'buffer', options = { keyword_length = 5 }},
      { name = 'path' },
      { name = 'spell' },
      { name = 'calc' },
      { name = 'vsnip' },
      { name = 'treesitter' },
    },
     sorting = {
        comparators = {
            cmp.config.compare.offset,
            cmp.config.compare.exact,
            cmp.config.compare.score,
            require"cmp-under-comparator".under,
            cmp.config.compare.kind,
            cmp.config.compare.sort_text,
            cmp.config.compare.length,
            cmp.config.compare.order,
        },
    },
    formatting = {
      format = require("lspkind").cmp_format({with_text = true, menu = ({
          nvim_lsp = "[LSP]",
          buffer = "[Buffer]",
          path = "[Path]",
          spell = "[Spell]",
          calc = "[Calc]",
          vsnip = "[Vsnip]",
          treesitter = "[Tree]",
        })}),
    },
})

cmp.event:on( 'confirm_done', cmp_autopairs.on_confirm_done({  map_char = { tex = '' } }))
EOF

" Built in LSP functionality.
nnoremap <leader>gd :lua vim.lsp.buf.definition()<CR>
nnoremap <leader>gt :lua vim.lsp.buf.type_definition()<CR>
nnoremap <leader>gi :lua vim.lsp.buf.implementation()<CR>
nnoremap <leader>gc :lua vim.lsp.buf.incoming_calls()<CR>
nnoremap <leader>gr :lua vim.lsp.buf.references()<CR>
nnoremap <leader>r :lua vim.lsp.buf.rename()<CR>
nnoremap <leader>ca :lua vim.lsp.buf.code_action<CR>

nnoremap <C-space> :lua vim.lsp.buf.hover()<CR>
" Find references & definitions.
nnoremap <leader>fr <cmd>Telescope lsp_references<CR>
nnoremap <leader>fd <cmd>Telescope lsp_definitions<CR>

" Cycle through lsp diagnostics popups.
nnoremap <leader>dn :lua vim.diagnostic.goto_next()<CR>
nnoremap <leader>dp :lua vim.diagnostic.goto_prev()<CR>
nnoremap <leader>dq :lua vim.diagnostic.setqflist()<CR>
" Project wide diagnostics fuzzy find.
nnoremap <leader>dl <cmd>Telescope diagnostics<CR>


" Move lines and code blocks with ALT J/K.
nnoremap <silent> <A-j> :MoveLine(1)<CR>
nnoremap <silent> <A-k> :MoveLine(-1)<CR>
vnoremap <silent> <A-j> :MoveBlock(1)<CR>
vnoremap <silent> <A-k> :MoveBlock(-1)<CR>

" ALE Linter Configuration:
" let b:ale_fixers = {'python': ['add_blank_lines_for_python_control_statements', 'autoimport', 'autopep8'], '*': ['remove_trailing_lines']}
let g:ale_linters = {'python': ['pylint', 'pycodestyle', 'pydocstyle', 'pyright']}
let g:ale_python_pycodestyle_options = "--max-line-length=120"
" let g:ale_python_pylint_options = "--init-hook='import sys; sys.path.append(\".\")'"
let g:ale_python_black_options = "--line-length 120"


" Harpoon setup. (EXPERIMENTAL)
" nnoremap <leader>w :lua require("harpoon.mark").add_file()<CR>
" nnoremap <leader>m :lua require("harpoon.ui").toggle_quick_menu()<CR>
" Terminal at <space>0. Very nice!
nnoremap <leader>0 :lua require("harpoon.term").gotoTerminal(1)<CR> 

" Bufferline shortcuts. EXPERIMENTAL?!
nnoremap <silent><leader>1 <Cmd>BufferLineGoToBuffer 1<CR>zz
nnoremap <silent><leader>2 <Cmd>BufferLineGoToBuffer 2<CR>zz
nnoremap <silent><leader>3 <Cmd>BufferLineGoToBuffer 3<CR>zz
nnoremap <silent><leader>4 <Cmd>BufferLineGoToBuffer 4<CR>zz
nnoremap <silent><leader>5 <Cmd>BufferLineGoToBuffer 5<CR>
nnoremap <silent><leader>6 <Cmd>BufferLineGoToBuffer 6<CR>
nnoremap <silent><leader>7 <Cmd>BufferLineGoToBuffer 7<CR>
nnoremap <silent><leader>8 <Cmd>BufferLineGoToBuffer 8<CR>
nnoremap <silent><leader>9 <Cmd>BufferLineGoToBuffer 9<CR>

"""""""""""""""""""""""""""""""""""""""""
" Vimscript specific configuration stuff.
"""""""""""""""""""""""""""""""""""""""""
set completeopt=menu,menuone,noselect
" Make F2 paste-toggle button. Paste without autoindent.
set pastetoggle=<F2>
syntax on
set noerrorbells
set ruler
set relativenumber "Relative line numbering
set number " Current line being shown.
set mouse=a
set showmatch
set incsearch

au BufRead,BufNewFile *.py set expandtab
set expandtab
set textwidth=120
set colorcolumn=120
set tabstop=4
set softtabstop=4
set shiftwidth=4
set autoindent

set termguicolors
set background=dark
colorscheme onedark
set clipboard+=unnamedplus
