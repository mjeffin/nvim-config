
call plug#begin("~/.local/share/nvim/plugged")
  " Plugin Section
Plug 'preservim/nerdtree'
Plug 'preservim/nerdcommenter'
Plug 'jiangmiao/auto-pairs'
Plug 'Valloric/YouCompleteMe', { 'do': './install.py' }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'davidhalter/jedi-vim'   
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'vim-python/python-syntax'
Plug 'tpope/vim-fugitive'
Plug 'dense-analysis/ale'
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
Plug 'tweekmonster/django-plus.vim'
call plug#end()

colorscheme dracula
"Config Section
"
filetype plugin indent on
let g:python3_host_prog = "~/venvs/nvimenv/bin/python"
let g:ale_python_flake8_executable = "/Users/jma/venvs/nvimenv/bin/flake8"
let g:ale_python_yapf_executable = "/Users/jma/venvs/nvimenv/bin/yapf"

"enable syntax highlighting
syntax enable

let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"

"NERDTree Configs
map <C-n> :NERDTreeToggle<CR>
" open Nerd Tree in folder of file in active buffer
map <Leader>nt :NERDTree %:p:h<CR>

"autocmd vimenter * NERDTree
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
let g:NERDTreeShowHidden=1

"Python configurations
" enable syntax highlighting
syntax enable
" show line numbers
set number
autocmd FileType python set sw=4
autocmd FileType python set ts=4
autocmd FileType python set sts=4
" set tabs to have 4 spaces
set autoindent
" expand tabs into spaces
set expandtab
" when using the >> or << commands, shift lines by 4 spaces
" show a visual line under the cursor's current line
set cursorline
" show the matching part of the pair for [] {} and ()
set showmatch
" enable all Python syntax highlighting features
let python_highlight_all = 1
" recommended YCM settings for python(fro django docs)
let g:ycm_collect_identifiers_from_tags_files = 1 " Let YCM read tags from Ctags file
let g:ycm_use_ultisnips_completer = 1 " Default 1, just ensure
let g:ycm_seed_identifiers_with_syntax = 1 " Completion for programming language's keyword
let g:ycm_complete_in_comments = 1 " Completion in comments
let g:ycm_complete_in_strings = 1 " Completion in string
let g:ale_linters = {
      \   'python': ['flake8', 'pylint'],
      \   'ruby': ['standardrb', 'rubocop'],
      \   'javascript': ['eslint'],
      \}


let g:ale_fixers = {
      \    'python': ['yapf'],
      \}
nmap <F10> :ALEFix<CR>
let g:ale_fix_on_save = 1

" HTML specific configs
autocmd BufRead,BufNewFile *.htm,*.html setlocal tabstop=2 shiftwidth=2 softtabstop=2

"Shortcutting split navigation
map <A-h> <C-w>h
map <A-j> <C-w>j
map <A-k> <C-w>k
map <A-l> <C-w>l
" Nerdree
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
let g:NERDTreeDirArrowExpandable = ''
let g:NERDTreeDirArrowCollapsible = ''
" NERDCommenter Configs
let g:NERDSpaceDelims = 1

" Session Management
set wildmenu
set wildmode=full
let g:session_dir = '~/vim-sessions'
exec 'nnoremap <Leader>ss :mks! ' . g:session_dir . '/*.vim<C-D><BS><BS><BS><BS><BS>'
exec 'nnoremap <Leader>sr :so ' . g:session_dir. '/*.vim<C-D><BS><BS><BS><BS><BS>'

" " Reload vimr configuration fil
nnoremap <Leader>vr :source $MYVIMRC<CR>
set hidden
