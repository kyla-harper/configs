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
set relativenumber
set history=1000
set autoread
set hidden
set splitright

" Navigate Between Tabs
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

" Update and reloading nvim init
noremap <leader>c :e ~/.config/nvim/init.vim<CR>
noremap <leader>x :source ~/.config/nvim/init.vim<CR>

" Other keyboard shortcuts
noremap <C-l> :nohl<CR>
noremap <c-x> :%bd!<CR>

""""""""""""""""""""""""""""""
" Plugins START
""""""""""""""""""""""""""""""
call plug#begin('~/.local/share/nvim/plugged')

" General
Plug '907th/vim-auto-save'
Plug 'dense-analysis/ale'
Plug 'jiangmiao/auto-pairs'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'raimondi/delimitmate'
Plug 'vim-ruby/vim-ruby'
Plug 'alvan/vim-closetag'

" Content Insertion
Plug 'preservim/nerdcommenter'
Plug 'ycm-core/YouCompleteMe'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

" Colorschemes
Plug 'arzg/vim-colors-xcode'
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'flaflasun/vim-nightowl'
Plug 'megantiu/true.vim'
Plug 'morhetz/gruvbox'
Plug 'tssm/fairyfloss.vim'
Plug 'sonph/onehalf', { 'rtp': 'vim' }

" UI
Plug 'airblade/vim-gitgutter'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'yggdroot/indentline'

" Syntax Highlighting
Plug 'ap/vim-css-color'
Plug 'pangloss/vim-javascript'
Plug 'sheerun/vim-polyglot'

" Tpope
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-rvm'
Plug 'tpope/vim-rbenv'
Plug 'tpope/vim-projectionist'
Plug 'tpope/vim-rake'
Plug 'tpope/vim-bundler'

call plug#end()
""""""""""""""""""""""""""""""
" Plugins END
""""""""""""""""""""""""""""""

" dense-analysis/ale
let g:ale_sign_column_always = 1
let g:ale_fix_on_save = 1
let g:ale_echo_msg_format = '[%severity%] %linter% -- %code%: %s'

inoremap <expr> <C-j> pumvisible() ? "\<C-n>" : "\<C-j>"
inoremap <expr> <C-k> pumvisible() ? "\<C-p>" : "\<C-k>"

nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)

au BufNewFile,BufRead *.js* set filetype=javascript.jsx
au BufNewFile,BufRead *.jsx* set filetype=javascript.jsx

let g:ale_linters = {
  \ 'jsx': ['stylelint', 'eslint', 'prettier'],
  \ 'ruby': ['rubocop', 'solargraph', 'ruby'],
  \ }

let g:ale_fixers = {
  \ 'javascript': ['eslint', 'prettier'],
  \ 'javascript.jsx': ['eslint', 'prettier'],
  \ 'ruby': ['rubocop'],
  \ '*': ['remove_trailing_lines', 'trim_whitespace']
  \ }

augroup CloseLoclistWindowGroup
  autocmd!
  autocmd QuitPre * if empty(&buftype) | lclose | endif
augroup END

" junegunn/fzf
noremap <leader>f :Files<CR>
noremap <leader>g :Rg<CR>
noremap <leader>b :Buffers<CR>
noremap <c-f> :Rg<cword><CR>

" 907th/vim-auto-save
let g:auto_save = 1

" Ultisnips
let g:UltiSnipsExpandTrigger="<c-n>"
let g:UltiSnipsJumpForwardTrigger="<c-n>"
let g:UltiSnipsJumpBackwardTrigger="<c-p>"

" alvan/vim-closetag
let g:closetag_filenames = '*.html,*.xhtml,*.phtml,*.jsx'
let g:closetag_xhtml_filenames = '*.xhtml,*.jsx,*.js'
let g:closetag_filetypes = 'html,xhtml,phtml,jsx,javascript.jsx'
let g:closetag_xhtml_filetypes = 'xhtml,jsx,javascript.jsx'
let g:closetag_emptyTags_caseSensitive = 1
let g:closetag_regions = {
    \ 'typescript.tsx': 'jsxRegion,tsxRegion',
    \ 'javascript.jsx': 'jsxRegion',
    \ 'typescriptreact': 'jsxRegion,tsxRegion',
    \ 'javascriptreact': 'jsxRegion',
    \ }
let g:closetag_shortcut = '>'
let g:closetag_close_shortcut = '<leader>>'

" Colorscheme
set termguicolors
colorscheme gruvbox
