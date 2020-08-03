

call plug#begin("~/.local/share/nvim/plugged")
  " Plugin Section
Plug 'preservim/nerdtree'
Plug 'preservim/nerdcommenter'
call plug#end()

"Config Section
"
"NERDTree Configs
map <C-n> :NERDTreeToggle<CR>
"autocmd vimenter * NERDTree
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

"Shortcutting split navigation
map <A-h> <C-w>h
map <A-j> <C-w>j
map <A-k> <C-w>k
map <A-l> <C-w>l

let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
let g:NERDTreeDirArrowExpandable = ''
let g:NERDTreeDirArrowCollapsible = ''

" NERDCommenter Configs
let g:NERDSpaceDelims = 1

