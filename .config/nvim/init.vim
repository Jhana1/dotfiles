" Mouse Mode
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

" Airline
let g:airline#extensions#tabline#enabled = 1

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

" Path
set path+=~/build/trunk/tibra/trunk/
set path+=~/repos/trunk/

" Saving
com! WQ wq
com! Wq wq
com! W w
com! Q q

" Menu
set wildmenu

" Quickfix Wrap
augroup quickfix
  autocmd!
  autocmd FileType qf setlocal wrap
augroup END

" Clang Format
let g:clang_format#detect_style_file=1

" Completion
highlight Pmenu ctermbg=black ctermfg=white
highlight PmenuSel ctermbg=gray  ctermfg=white
let g:SuperTabDefaultCompletionType = "<c-n>"
let g:SuperTabCrMapping = 1
let g:SuperTabLongestHighlight = 1
inoremap <expr> <CR> (pumvisible() ? "\<c-y>\<cr>" : "\<CR>")

" Python
let g:python_host_prog  = "python2.7"
let g:python3_host_prog = "python3"

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

" Deoplete
let g:deoplete#enable_at_startup = 1
let g:deoplete#enable_refresh_always = 1
let g:deoplete#auto_complete_delay = 10

" Omnifuncs
let g:haskellmode_completion_ghc = 0
augroup omnifuncs
    autocmd!
    autocmd FileType haskell setlocal omnifunc=necoghc#omnifunc
augroup end

augroup haskell
    autocmd!
    let g:LanguageClient_autoStart = 1
    autocmd FileType haskell nnoremap <buffer> gd :call LanguageClient_textDocument_definition() <CR>
    autocmd FileType haskell nnoremap <buffer> <Leader>hi :call LanguageClient_textDocument_hover() <CR>
    autocmd FileType haskell nnoremap <buffer> <Leader>ht :call LanguageClient_textDocument_hover() <CR>
    autocmd FileType haskell nnoremap <buffer> <Leader>hh :call LanguageClient_textDocument_hover() <CR>
    autocmd FileType haskell nnoremap <buffer> <Leader>hr :call LanguageClient_textDocument_references() <CR>
    autocmd FileType haskell nnoremap <buffer> <Leader>hf :call LanguageClient_textDocument_formatting() <CR>
    autocmd FileType haskell set tabstop=2
    autocmd FileType haskell set shiftwidth=2
augroup end

augroup cpp
    autocmd!
    autocmd FileType cpp nnoremap <buffer> gd :call LanguageClient_textDocument_definition() <CR>
    autocmd FileType cpp nnoremap <buffer> <Leader>hi :call LanguageClient_textDocument_hover() <CR>
    autocmd FileType cpp nnoremap <buffer> <Leader>ht :call LanguageClient_textDocument_hover() <CR>
    autocmd FileType cpp nnoremap <buffer> <Leader>hh :call LanguageClient_textDocument_hover() <CR>
    autocmd FileType cpp nnoremap <buffer> <Leader>hr :call LanguageClient_textDocument_references() <CR>
    autocmd FileType cpp set tabstop=4
    autocmd FileType cpp set shiftwidth=4
augroup end

" Haskell IDE Engine
let g:LanguageClient_serverCommands = {
  \ 'haskell': ['hie', '--lsp'],
  \ 'cpp': ['clangd'],
  \ 'python': ['pyls'],
  \ }

augroup cpp
  autocmd!
  autocmd FileType cpp set tabstop=4
  autocmd FileType cpp set shiftwidth=4
  autocmd FileType cpp set matchpairs+=<:>

  let g:deoplete#sources#clang#libclang_path = "/package/clang-3.9.1/lib/libclang.so"
  let g:deoplete#sources#clang#clang_header = "/package/clang-3.9.1/include/"
  let g:deoplete#sources#clang#clang_complete_database = "~/build/trunk/"
augroup end
