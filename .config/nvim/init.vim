language en_US
filetype off

let g:python3_host_prog = '/usr/local/bin/python2'
let g:python3_host_prog = '/usr/local/bin/python3'
let mapleader = "\<space>"

set autoindent
set autoread
set autowrite
set cc=0
set cmdheight=2
set cursorline
set expandtab
set fdm=manual
set foldlevel=99
set hidden
set hls
set laststatus=2
set lazyredraw
set linebreak
set mouse=a
set nobackup
set noruler
set noshowcmd
set noswapfile
set noswapfile
set nowritebackup
set number
set shiftwidth=2
set shortmess+=c
set signcolumn=yes
set smartcase
set smartindent
set splitbelow
set splitright
set softtabstop=2
set tabstop=2
set termguicolors
set timeoutlen=1000
set ttimeoutlen=0
set updatetime=300
set wrap

let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"

call plug#begin('~/.vim/plugged')
  Plug 'RRethy/vim-illuminate'
  Plug 'arcticicestudio/nord-vim'
  Plug 'ayu-theme/ayu-vim'
  Plug 'cespare/vim-toml'
  Plug 'christoomey/vim-sort-motion'
  Plug 'christoomey/vim-tmux-navigator'
  Plug 'digitaltoad/vim-pug'
  Plug 'dracula/vim', {'as': 'dracula'}
  Plug 'drewtempelmeyer/palenight.vim'
  Plug 'elzr/vim-json'
  Plug 'flrnd/plastic.vim'
  Plug 'haya14busa/incsearch.vim'
  Plug 'hdima/python-syntax'
  Plug 'itchyny/lightline.vim'
  Plug 'junegunn/fzf', {'dir': '~/.fzf', 'do': './install --all'}
  Plug 'junegunn/fzf.vim'
  Plug 'justinmk/vim-sneak'
  Plug 'keitanakamura/neodark.vim'
  Plug 'leafgarland/typescript-vim'
  Plug 'maxmellon/vim-jsx-pretty'
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  Plug 'neovimhaskell/haskell-vim'
  Plug 'pangloss/vim-javascript'
  Plug 'posva/vim-vue'
  Plug 'rakr/vim-one'
  Plug 'rakr/vim-two-firewatch'
  Plug 'sainnhe/edge'
  Plug 'scrooloose/nerdtree'
  Plug 'shmargum/vim-sass-colors'
  Plug 'szw/vim-maximizer'
  Plug 'tmhedberg/simpylfold'
  Plug 'tomtom/tcomment_vim'
  Plug 'tpope/vim-fugitive'
  Plug 'tpope/vim-haml'
  Plug 'tpope/vim-repeat'
  Plug 'tpope/vim-surround'
  Plug 'tpope/vim-unimpaired'
  Plug 'tyrannicaltoucan/vim-deep-space'
  Plug 'yggdroot/indentline'
call plug#end()

let g:incsearch#auto_nohlsearch = 1
let g:python_highlight_all = 1
let g:sort_motion_flags = "ui"
let g:sneak#label = 1

map n  <Plug>(incsearch-nohl-n)
map N  <Plug>(incsearch-nohl-N)
map *  <Plug>(incsearch-nohl-*)
map #  <Plug>(incsearch-nohl-#)
map g* <Plug>(incsearch-nohl-g*)
map g# <Plug>(incsearch-nohl-g#)

" let g:ayucolor='mirage'
" let g:edge_disable_italic_comment = 1
" let g:edge_style = 'neon'
" let g:neodark#background = '#19202d'
" let g:neodark#background = '#1f2734'
" let g:neodark#solid_vertsplit = 0
" let g:one_allow_italics = 1
" let g:palenight_terminal_italics=1
" let g:two_firewatch_italics = 1
let g:deepspace_italics = 1

let g:lightline = {
  \ 'colorscheme': 'deepspace',
  \ 'active': {
  \   'left': [ [ 'mode', 'paste' ],
  \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
  \ },
  \ 'component_function': {
  \   'gitbranch': 'fugitive#head'
  \ }
  \ }

colorscheme deep-space

let g:indentLine_char = '│'
let g:indentLine_fileType = ['python']

" hi Comment cterm=italic gui=italic
" hi Normal guibg=#19202d
hi NonText ctermfg=16 guifg=#3b4048
hi Whitespace ctermfg=16 guifg=#3b4048

" NERDTree
autocmd StdinReadPre * let s:std_in = 1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif

autocmd FileType nerdtree setlocal nolist

let g:NERDTreeDirArrowExpandable = '+'
let g:NERDTreeDirArrowCollapsible = '-'

let g:NERDTreeHighlightCursorline = 0
let g:NERDTreeMinimalUI = 1

autocmd BufEnter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

set listchars=tab:>·,trail:·,space:·,eol:¬
set nolist

let g:vim_json_syntax_conceal = 0
let g:Illuminate_ftblacklist = ['nerdtree']

augroup Fold
  autocmd!

  autocmd FileType javascript,json setlocal foldmethod=syntax
  autocmd FileType css,scss setlocal foldmethod=marker foldmarker={,}
augroup END

augroup Syntax
  autocmd!

  autocmd FileType css,sass,scss setlocal iskeyword+=-
augroup END

autocmd BufNewFile,BufRead *.go setlocal copyindent noexpandtab preserveindent tabstop=4 softtabstop=0 shiftwidth=4
autocmd BufNewFile,BufRead *.html,*.css,*.sass,*.scss,*.swig,*.ihtml setlocal expandtab tabstop=2 shiftwidth=2
autocmd BufNewFile,BufRead *.ihtml setfiletype html
autocmd BufNewFile,BufRead *.js,*.json setlocal expandtab tabstop=2 softtabstop=2 shiftwidth=2
autocmd BufNewFile,BufRead *.py setlocal expandtab tabstop=4 softtabstop=4 shiftwidth=4

" fzf
let g:fzf_colors = { 'fg': ['fg', 'Normal'], 'bg': ['bg', 'Normal'], 'hl': ['fg', 'Comment'], 'fg+': ['fg', 'CursorLine', 'CursorColumn', 'Normal'], 'bg+': ['bg', 'CursorLine', 'CursorColumn'], 'hl+': ['fg', 'Statement'], 'info': ['fg', 'PreProc'], 'border': ['fg', 'Ignore'], 'prompt': ['fg', 'Conditional'], 'pointer': ['fg', 'Exception'], 'marker':  ['fg', 'Keyword'], 'spinner': ['fg', 'Label'], 'header': ['fg', 'Comment'] }
let g:fzf_layout = { 'down': '~25%' }
let g:fzf_buffers_jump = 1
let g:fzf_tags_command = 'ctags -R'
let g:fzf_commits_log_options = '--graph --color=always --format="%C(auto)%h%d %s %C(black)%C(bold)%cr"'

command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --no-ignore --hidden --follow --glob "!.git/*" --color "always" '.shellescape(<q-args>), 1, <bang>0)

nnoremap <F4> :NERDTreeToggle<CR>

nnoremap <leader>b :Buffers<CR>
nnoremap <leader>f :Files<CR>
nnoremap <leader>n :NERDTreeFind<CR> <bar> zz
nnoremap <leader>o :CocList -A --tab outline<CR>
nnoremap <leader>s :source $MYVIMRC<CR>
nnoremap <leader>t :Tags<CR>
nnoremap <leader>y :CocList -A --tab yank<CR>

nnoremap <silent> <esc> :noh<CR>

vmap < <gv
vmap > >gv

vmap <S-left> <gv
vmap <S-right> >gv

nnoremap <S-up> :m .-2<CR>==
nnoremap <S-down> :m .+1<CR>==
inoremap <S-up> <esc>:m .-2<CR>==gi
inoremap <S-down> <esc>:m .+1<CR>==gi
vnoremap <S-up> :m '<-2<CR>gv=gv
vnoremap <S-down> :m '>+1<CR>gv=gv

autocmd FileType * autocmd BufWritePre <buffer> %s/\s\+$//e

" terminal
augroup Term
  autocmd!

  autocmd TermOpen * startinsert
  autocmd TermOpen * set bufhidden=hide
augroup END

tnoremap <C-h> <C-\><C-n><C-w>h
tnoremap <C-j> <C-\><C-n><C-w>j
tnoremap <C-k> <C-\><C-n><C-w>k
tnoremap <C-l> <C-\><C-n><C-w>l

tnoremap <expr> <esc> &filetype == 'fzf' ? "\<esc>" : "\<c-\>\<c-n>"

let g:haskell_enable_quantification = 1   " to enable highlighting of `forall`
let g:haskell_enable_recursivedo = 1      " to enable highlighting of `mdo` and `rec`
let g:haskell_enable_arrowsyntax = 1      " to enable highlighting of `proc`
let g:haskell_enable_pattern_synonyms = 1 " to enable highlighting of `pattern`
let g:haskell_enable_typeroles = 1        " to enable highlighting of type roles
let g:haskell_enable_static_pointers = 1  " to enable highlighting of `static`
let g:haskell_backpack = 1                " to enable highlighting of backpack keywords

" conquer of completion
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

inoremap <silent> <expr> <Tab> pumvisible() ? "\<C-n>" : <SID>check_back_space() ? "\<Tab>" : coc#refresh()
inoremap <silent> <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<C-h>"
inoremap <silent> <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

autocmd CursorHold * silent call CocActionAsync('highlight')

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

nmap <silent> <F2> <Plug>(coc-rename)
nnoremap <silent> K :call <SID>show_documentation()<CR>

hi ExcessLength ctermbg=red ctermfg=white guibg=#592929
match ExcessLength /\%99v.\+/

" golang
autocmd BufWritePre *.go :call CocAction('runCommand', 'editor.action.organizeImport')

" prettier
command! -nargs=0 Prettier :CocCommand prettier.formatFile

nmap <leader>p <Plug>(coc-format-selected)
vmap <leader>p <Plug>(coc-format-selected)
