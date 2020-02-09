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
set autoread
set hidden
set splitright

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
" Various Plugins
"""""""""""""""""""""""""""""""""
Plug 'godlygeek/tabular'             " Align text
Plug 'jeetsukumaran/vim-buffergator' " Buffer navigation
Plug 'jiangmiao/auto-pairs'          " Auto-close brackets/parenthesis/etc
Plug 'wellle/context.vim'            " Shows which block of code you're in

" Fuzzy Finding
Plug 'junegunn/fzf.vim'
command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \ 'rg --column --line-number --no-heading --color=always --smart-case '.shellescape(<q-args>), 1,
  \ fzf#vim#with_preview(), <bang>0)

" Indent Levels
Plug 'Yggdroot/indentLine'
let g:indentLine_char_list = ['|', '¦', '┆', '┊']

" tpope's Stuff
Plug 'tpope/vim-fugitive' " Git stuff
Plug 'tpope/vim-endwise'  " Add closing  pairs for Ruby if/do blocks
Plug 'tpope/vim-vinegar'  " Modifies netrw
Plug 'tpope/vim-sensible' " Some default vim settings

"""""""""""""""""""""""""""""""""
" Syntax Highlighting
"""""""""""""""""""""""""""""""""
Plug 'amadeus/vim-mjml'           " MJML
Plug 'kchmck/vim-coffee-script'   " CoffeeScript
Plug 'leafgarland/typescript-vim' " Typescript

" Vue
Plug 'posva/vim-vue'
autocmd FileType vue syntax sync fromstart

" Javascript
Plug 'pangloss/vim-javascript'
Plug 'MaxMEllon/vim-jsx-pretty'
let g:vim_jsx_pretty_colorful_config = 1


"""""""""""""""""""""""""""""""""
" Linting / Fixing
"""""""""""""""""""""""""""""""""
Plug 'dense-analysis/ale'

" misc options
let g:ale_sign_column_always = 1
let g:airline#extensions#ale#enabled = 1

" completion
let g:ale_completion_delay = 50
let g:ale_completion_enabled = 0
let g:ale_completion_excluded_words = ['it']

" errors list
let g:ale_echo_cursor = 1
let g:ale_fix_on_save = 0
let g:ale_open_list = 1
let g:ale_keep_list_window_open = 1
let g:ale_list_window_size = 7
let g:ale_lint_on_text_changed = 'always'
let g:ale_loclist_msg_format = '[%severity%] %linter% -- %code: %%s'

nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)

let g:ale_linter_aliases = {
  \ 'vue': ['vue', 'javascript'],
  \ 'jsx': ['css', 'javascript'],
  \ }

let g:ale_linters = {
  \ 'vue': ['eslint', 'vls'],
  \ 'jsx': ['stylelint', 'eslint', 'prettier'],
  \ 'ruby': ['rubocop']
  \ }

let g:ale_fixers = {
  \ '*': ['remove_trailing_lines', 'trim_whitespace'],
  \ 'javascript': ['eslint', 'prettier', 'remove_trailing_lines', 'trim_whitespace'],
  \ 'ruby': ['rubocop', 'remove_trailing_lines', 'trim_whitespace']
  \ }

" Close the loclist automatically when buffer is closed
augroup CloseLoclistWindowGroup
  autocmd!
  autocmd QuitPre * if empty(&buftype) | lclose | endif
augroup END

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
" Rails Stuff
"""""""""""""""""""""""""""""""""
Plug 'tpope/vim-rails'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-dadbod'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-bundler'

call plug#end()
"#################################
"#################################

colorscheme dracula

" Set filetype for typescriptreact
augroup typescriptreact
  au!
  autocmd BufNewFile, BufRead *.tsx set filetype=typescript
  autocmd BufNewFile, BufRead *.tsx set filetype=javascript
augroup END

"""""""""""""""""""""""""""""""""
" Keyboard Shortcuts
"""""""""""""""""""""""""""""""""

" Update and reloading nvim init
noremap <leader>c :e ~/.config/nvim/init.vim<CR>
noremap <leader>x :source ~/.config/nvim/init.vim<CR>

" Fix Ale Errors
noremap <C-f> :ALEFix<CR>

" Fuzzy Finder
noremap <leader>f :FZF<CR>

" Make buffergator toggle instead of just open
noremap <leader>b :BuffergatorToggle<CR>
noremap <leader>t :BuffergatorTabsToggle<CR>

" Find relative and alternate files
" (for vim-rails and vim-projections)
noremap <leader>r :R<CR>
noremap <leader>a :A<CR>

" Search with ripgrep
noremap <leader>g :Rg<CR>

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
