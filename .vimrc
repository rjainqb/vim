set nocompatible
"set background=dark
colorscheme peaksea
syntax on

" Install pathogen
execute pathogen#infect()

" TODO(rjain): set mouse=c shortcut (for copy pasting)
set mouse=a

" Don't create backup files
set nobackup nowritebackup noswapfile

" Indentation
set ai
set copyindent
set showmatch

set ignorecase  " Ignore case when searching
set smartcase  " Ignore case if pattern is all lowercase, else don't
set hlsearch  " Highlight search items
set incsearch  " jump to search word as you type

" See .vim/plugin/toggle_mouse.vim.
" Press <F3> for mouse toggle

" This will disable the UGLY indent tree that forms while pasting stuff.
set pastetoggle=<F2>

set expandtab  " Insert spaces for tabs
set tabstop=4  " 4 spaces per tab. Will set this separately for shell/make file

set shiftwidth=2  " 2 spaces per indentation

" Special stuff for makefile
autocmd FileType make setlocal noexpandtab
autocmd FileType Makefile setlocal noexpandtab
autocmd FileType makefile setlocal noexpandtab
autocmd VimLeave * macaction terminate:

autocmd FileType sh setlocal shiftwidth=4

" Backspace key amounts to 2 spaces
set softtabstop=2

set wildmode=longest,full
set wildmenu
set wildignore=*.0,*.class,*.jar,core,*.pyc,*.pyo
set showmode showmatch showcmd
set ignorecase ruler smartcase

set fileformat=unix  " displays ^M for dos files

set nowrapscan  " Stop at the last/first search. Don't cycle

"  ctrl-space for auto-completion
imap <C-space> <C-P>

if has("autocmd")
  filetype plugin on
  filetype indent on
endif

vmap / I// <ESC>
vmap # I# <ESC>

" Insert matching paren
:inoremap {<CR> {}<ESC>i<CR><ESC><UP>o

" save the file even in Insert mode.
:inoremap <C-s> <ESC>:w!<CR>

" toggle showing line numbers
map <F6> :set number!<CR>

" indent using tab :)
map <TAB> ==

function! DiffSetup()
  let &columns = &columns * 2 + 1 " make more room
  let &columns = 240
  let &lines = 80
  let &columns = 999
  let &lines = 999
  wincmd =
endfunction

if &diff
  autocmd VimEnter GUIEnter * call DiffSetup()
endif

" For GO programming language
" Some Linux distributions set filetype in /etc/vimrc.
" Clear filetype flags before changing runtimepath to force Vim to reload them.
if exists("g:did_load_filetypes")
  filetype off
  filetype plugin indent off
endif
set runtimepath+=/usr/local/go/misc/vim
filetype plugin indent on
syntax on

inoremap jj <ESC>
