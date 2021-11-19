source $HOME/.config/nvim/vim-plug/plugins.vim
source $HOME/.config/nvim/plug-config/coc.vim

" basic vim config
set number
set shiftwidth=2
set tabstop=2

" color of the popups
highlight Pmenu ctermbg=gray

" line highlighting


" manage files within nerdTree
set modifiable


let NERDTreeShowHidden=1


" execute commands in the opened file's directory
set autochdir

" shortcuts
nmap <space>e :NERDTreeToggle<CR>
nmap <space>z :NERDTree<CR>

" recompile LaTeX document with f5
autocmd FileType tex map <buffer> <F5> :w<CR>:exec '!pdflatex' shellescape(@%, 1)<CR>
autocmd FileType tex imap <buffer> <F5> <esc>:w<CR>:exec '!pdflatex' shellescape(@%,     1)<CR>


" to run python scripts with f5
autocmd FileType python map <buffer> <F5> :w<CR>:exec '!python3' shellescape(@%, 1)<C    R>
autocmd FileType python imap <buffer> <F5> <esc>:w<CR>:exec '!python3' shellescape(@%    , 1)<CR>

" compile c files with f5
autocmd FileType c map <buffer> <F5> :w<CR>:exec '!gcc' shellescape(@%, 1) '&& ./a.out'<CR>
autocmd FileType c imap <buffer> <F5> <esc>:w<CR>:exec '!gcc' shellescape(@%,     1) '&& ./a.out'<CR>

" Commenting blocks of code.
augroup commenting_blocks_of_code
  autocmd!
  autocmd FileType c,cpp,java,scala let b:comment_leader = '// '
  autocmd FileType sh,ruby,python   let b:comment_leader = '# '
  autocmd FileType conf,fstab       let b:comment_leader = '# '
  autocmd FileType tex              let b:comment_leader = '% '
  autocmd FileType mail             let b:comment_leader = '> '
  autocmd FileType vim              let b:comment_leader = '" '
augroup END
noremap <silent> ,cc :<C-B>silent <C-E>s/^/<C-R>=escape(b:comment_leader,'\/')<CR>/<CR>:nohlsearch<CR>
noremap <silent> ,cu :<C-B>silent <C-E>s/^\V<C-R>=escape(b:comment_leader,'\/')<CR>//e<CR>:nohlsearch<CR>
