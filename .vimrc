set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'vhda/verilog_systemverilog.vim'

call vundle#end()
filetype plugin indent on


set mouse=a

" Status
set laststatus=2
set modeline

" Theme
set t_Co=256
set bg=dark
colorscheme delek
set number
set cursorline
set showmode
set nowrap
set scrolloff=3
set sidescroll=1
highlight clear SignColumn

" Tabs
set softtabstop=0 expandtab
set smarttab
set autoindent
set smartindent

" Search
hi Search cterm=NONE ctermfg=black ctermbg=yellow
set incsearch
set hlsearch
set ignorecase
set smartcase

" Menu
set wildmenu

" Saving
com! WQ wq
com! Wq wq
com! W w
com! Q q

" Path
set path+=~/build/trunk/tibra/trunk/
set path+=~/repos/trunk/

" Misc
let c_space_errors=1

" CPP Comments
set comments=sl:/*,mb:\ *,elx:\ */

" Switch between header/source with <F4>
map <F4> :e %:p:s,.hpp$,.X123X,:s,.cpp$,.hpp,:s,.X123X$,.cpp,<CR>

" Menu
set wildmenu

" Quickfix Wrap
augroup quickfix
  autocmd!
  autocmd FileType qf setlocal wrap
augroup END

" Whitespace Highlighting
highlight ExtraWhitespace ctermbg=red
match ExtraWhitespace /\s\+$/

" Toggle Line Numbers
nmap <F5> :set invnumber<CR>

" Window and Buffer Commands
nmap <Leader>w<Up> :wincmd k<CR>
nmap <Leader>w<Left> :wincmd h<CR>
nmap <Leader>w<Right> :wincmd l<CR>
nmap <Leader>w<Down> :wincmd j<CR>
nmap <Leader>ws :split<CR>
nmap <Leader>wv :vsplit<CR>
nmap <Leader>b<Right> :bnext<CR>
nmap <Leader>b<Left> :bprevious<CR>
nmap <Leader>bn :enew<CR>
nmap <Leader>bq :bp <BAR> bd #<CR>

" Toggle Paste
set pastetoggle=<F2>

" De-highlight after search
:nnoremap <silent>  :nohl<CR><C-l>

augroup cpp
  autocmd!
  autocmd FileType cpp set tabstop=4
  autocmd FileType cpp set shiftwidth=4
  autocmd FileType cpp set matchpairs+=<:>
augroup end
