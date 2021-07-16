source $HOME/.config/nvim/vim-plug/plugins.vim
source $HOME/.config/nvim/plug-config/coc.vim

nnoremap <space>e :CocCommand explorer<CR>

" comments the selected lines
vmap ee <plug>NERDCommenterToggle
nmap ee <plug>NERDCommenterToggle

" to run python scripts with f5
autocmd FileType python map <buffer> <F5> :w<CR>:exec '!python3' shellescape(@%, 1)<CR>
autocmd FileType python imap <buffer> <F5> <esc>:w<CR>:exec '!python3' shellescape(@%, 1)<CR>

" recompile LaTeX document
autocmd FileType tex map <buffer> <F5> :w<CR>:exec '!lualatex' shellescape(@%, 1)<CR>
autocmd FileType tex imap <buffer> <F5> <esc>:w<CR>:exec '!lualatex' shellescape(@%, 1)<CR>




set number relativenumber

set cmdheight=1
