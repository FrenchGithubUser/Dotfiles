call plug#begin('~/.config/nvim/autoload/plugged')

    " Better Syntax Support
    Plug 'sheerun/vim-polyglot'
    " Stable version of coc
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    " quickly comment lines
    Plug 'preservim/nerdcommenter'

call plug#end()
