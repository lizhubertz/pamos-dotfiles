set nocp
runtime bundle/pathogen/autoload/pathogen.vim
execute pathogen#infect()
filetype plugin indent on
call pathogen#infect()

set directory=~/.vim/tmp

set t_Co=256
if has('gui_running')
  set guifont=Input Mono:h12
endif

let g:spellfile_URL = 'http://ftp.vim.org/vim/runtime/spell'
set spelllang=en_us,es_es
autocmd BufRead,BufNewFile *.md set spell

set tabstop=2
set shiftwidth=2
set smarttab
set expandtab
set autoindent

set number
set wrap
set backspace=indent,eol,start  " backspace over everything in insert mode
set nobackup
set nowritebackup
set history=50

set ruler                   " show the cursor position at all times
set showcmd                 " display incomplete commands
set nohlsearch              " don't highlight searched phrases
set ignorecase              " case-insensitive search
set smartcase
set incsearch               " but do highlight as you type search phrase

set autoread                " update files changed outside of vim
set clipboard=unnamed       " yank and paste with system clipboard
set pastetoggle=<F2>

set list                    " show trailing white space
set listchars=tab:▸\ ,trail:▫

" Fold Defaults
set foldmethod=indent
set foldnestmax=10
set foldlevel=2

set visualbell
set noerrorbells
set noswapfile
" Disable help menu
inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>

" Disable arrows
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>

map <F7> mzgg=G`z " re-indent file
noremap <F8> :Autoformat<CR>

" Move cursor down a single row
nmap j gj
nmap k gk

" Enable basic mouse behavior such as resizing buffers.
set mouse=a

if exists('$TMUX')  " Support resizing in tmux
  set ttymouse=xterm2
endif

" Vim-Javascript
let g:javascript_enable_domhtmlcss = 1
let g:jsx_ext_required = 0

" Vim-CoffeeScript
let coffee_indent_keep_current = 1
autocmd BufNewFile,BufReadPost *.coffee setl foldmethod=indent nofoldenable

" Beautify / EditorConfig
let g:EditorConfig_exclude_patterns = ['fugitive://.*', 'scp://.*']
let g:editorconfig_Beautifier='~/.editorconfig'
autocmd FileType javascript noremap <buffer>  <c-f> :call JsBeautify()<cr>
autocmd FileType json noremap <buffer> <c-f> :call JsonBeautify()<cr>
autocmd FileType jsx noremap <buffer> <c-f> :call JsxBeautify()<cr>
autocmd FileType html noremap <buffer> <c-f> :call HtmlBeautify()<cr>
autocmd FileType css noremap <buffer> <c-f> :call CSSBeautify()<cr>

"""
" Custom mappings
"""
" Move focus to splits
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" <Leader>r -- Cycle through relativenumber + number, number (only), and no
" numbering (mnemonic: relative).
nnoremap <silent> <Leader>r :call mappings#cycle_numbering()<CR>

" <Leader>zz -- Zap trailing whitespace in the current buffer.
" As this one is somewhat destructive and relatively close to the
" oft-used <leader>a mapping, make this one a double key-stroke.
nnoremap <silent> <Leader>zz :call mappings#zap()<CR>
:au FocusLost * :wa " Autosave but warn of untitled buffers

if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
        \| exe "normal! g'\"" | endif
endif

runtime vimrc.d/airline.vim
runtime vimrc.d/auto-commands.vim
runtime vimrc.d/ctrlp.vim
runtime vimrc.d/mappings.vim
runtime vimrc.d/syntastic.vim
runtime vimrc.d/nerdtree.vim

let vim_markdown_preview_github=1
let vim_markdown_preview_browser='Google Chrome'

set runtimepath^=~/.vim/bundle/ag
