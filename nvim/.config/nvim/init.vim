call plug#begin(stdpath('data') . '/plugged')

Plug 'kyazdani42/nvim-web-devicons'
Plug 'nvim-lualine/lualine.nvim'

call plug#end()




lua << EOF
require('lualine').setup()
EOF
