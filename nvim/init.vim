" Tabs
set expandtab
set tabstop=2
set softtabstop=2
set shiftwidth=2
set smarttab

" Searching
set incsearch
set hlsearch
set ignorecase
set smartcase

" Other Options
set scrolloff=999
set autoread
set number
set history=1000

"""""""""""""""""""""""""""""""""
" Keyboard Shortcuts
"""""""""""""""""""""""""""""""""

" Clear searching highlights
noremap <C-/> :nohl<CR>

" Navigating tabs
noremap <leader>1 1gt
noremap <leader>2 2gt
noremap <leader>3 3gt
noremap <leader>4 4gt
noremap <leader>5 5gt
noremap <leader>6 6gt
noremap <leader>7 7gt
noremap <leader>8 8gt
noremap <leader>9 9gt
noremap <leader>0 0gt

"#################################
"#################################
call plug#begin('~/.local/share/nvim/plugged')

"""""""""""""""""""""""""""""""""
" Color schemes
"""""""""""""""""""""""""""""""""
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'sonph/onehalf', { 'rtp': 'vim' }
Plug 'flaflasun/vim-nightowl'

"""""""""""""""""""""""""""""""""
" Linting / Fixing
"""""""""""""""""""""""""""""""""
Plug 'dense-analysis/ale'

" misc options
let g:ale_sign_column_always = 1
let g:airline#extensions#ale#enabled = 1
let g:ale_cache_executable_check_failures = 1

" completion
let g:ale_completion_delay = 50
let g:ale_completion_enabled = 0
let g:ale_completion_excluded_words = ['it']

" errors list
let g:ale_cursor_detail = 0
let g:ale_echo_cursor = 0
let g:ale_fix_on_save = 1
let g:ale_open_list = 1
let g:ale_keep_list_window_open = 0
let g:ale_lint_on_text_changed = 'always'
let g:ale_loclist_msg_format = '[%severity%] %linter% -- %code: %%s'

nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)

let g:ale_linter_aliases = {'vue': ['vue', 'javascript']}
let g:ale_linters = {'vue': ['eslint', 'vls']}

let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'javascript': ['eslint'],
\   'ruby': ['rubocop'],
\}

"""""""""""""""""""""""""""""""""
" Syntax Highlighting
"""""""""""""""""""""""""""""""""
" Vue
Plug 'posva/vim-vue'
autocmd FileType vue syntax sync fromstart

" MJML
Plug 'amadeus/vim-mjml'

" CoffeeScript
Plug 'kchmck/vim-coffee-script'

"""""""""""""""""""""""""""""""""
" Statusbar ++
"""""""""""""""""""""""""""""""""
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

let g:airline_solarized_bg='dark'
let g:airline_theme='bubblegum'

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#formatter = 'unique_tail_improved'

"""""""""""""""""""""""""""""""""
" tpope's Stuff
"""""""""""""""""""""""""""""""""
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-vinegar'

"""""""""""""""""""""""""""""""""
" Show indent levels
"""""""""""""""""""""""""""""""""
Plug 'Yggdroot/indentLine'
let g:indentLine_char_list = ['|', '¦', '┆', '┊']

call plug#end()
"#################################
"#################################

colorscheme dracula
