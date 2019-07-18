call plug#begin('~/.local/share/nvim/plugged')

Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'airblade/vim-gitgutter'
Plug 'nbouscal/vim-stylish-haskell'
Plug 'neomake/neomake'
Plug 'ervandew/supertab'
Plug 'itchyny/vim-haskell-indent'
Plug 'autozimu/LanguageClient-neovim', { 'branch': 'next', 'do': 'bash install.sh' }
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'Shougo/neoinclude.vim'
Plug 'rhysd/vim-clang-format'
Plug 'tpope/vim-fugitive'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'othree/xml.vim'
Plug 'christoomey/vim-tmux-navigator'
Plug 'Valloric/YouCompleteMe'
Plug 'johnsyweb/vim-makeshift'

call plug#end()

" TMux Compatibility
set guicursor=
:autocmd OptionSet guicursor noautocmd set guicursor=

" Status
set laststatus=1
set modeline

" Hidden
set hidden

" Theme
set t_Co=256
colorscheme badwolf
set number
set showmode
set nowrap
set sidescroll=1
highlight clear SignColumn
set fillchars+=vert:\│
hi VertSplit cterm=NONE

" Airline
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='base16'

" Intuitive Splits
set splitright
set splitbelow

" Tabs
set softtabstop=0 expandtab
set tabstop=2
set shiftwidth=2
set smarttab
set autoindent
set smartindent

" Code Folding
hi! Folded ctermbg=233 ctermfg=247
set fillchars+=fold:\ 

" Search
hi Search cterm=NONE ctermfg=black ctermbg=yellow
set incsearch
set hlsearch
set ignorecase
set smartcase

" Path
set path+=~/build/trunk.gcc/tibra/trunk/
set path+=~/repos/trunk/
set path+=~/build/trunk.gcc/packages/boost/1.68.0g-src/boost

" Saving
com! WQ wq
com! Wq wq
com! W w
com! Q q
com! SudoWrite w !sudo tee %

" Pretty Error Message
function! Error(msg)
  :echohl ErrorMsg
  :echom "Error: "
  :echohl None
  :echon a:msg
endfunction

" Better keybindings
noremap ; :

" Terminal Escape
augroup Terminal
    au!
    autocmd TermOpen * setlocal nonumber norelativenumber
    tnoremap <Leader><Esc> <C-\><C-n>
augroup END

" Menu
set wildmenu

" Quickfix Wrap
augroup quickfix
  autocmd!
  autocmd FileType qf setlocal wrap
augroup END

" Clang Format
let g:clang_format#detect_style_file=1
function! Format()
  let l:formatdiff = 1
  pyf /package/clang-6.0.0/share/clang/clang-format.py
endfunction

" Completion
highlight Pmenu ctermbg=black ctermfg=white
highlight PmenuSel ctermbg=gray  ctermfg=white
let g:SuperTabDefaultCompletionType = "<c-n>"
let g:SuperTabCrMapping = 1
let g:SuperTabLongestHighlight = 1
inoremap <expr> <CR> (pumvisible() ? "\<c-y>\<cr>" : "\<CR>")

" Python
let g:python_host_prog  = "python2.7"
let g:python3_host_prog = "python3.4"

" Whitespace Highlighting
highlight ExtraWhitespace ctermbg=red
match ExtraWhitespace /\s\+$/

" Buffers
nnoremap <C-p> :bprevious<CR>
nnoremap <C-n> :bnext<CR>
nnoremap <C-\> :e #<CR>

" Windows
nnoremap <C-w>. <C-w>25>
nnoremap <C-w>, <C-w>25<

" FZF
nnoremap <C-b> :Buffers<CR>
nnoremap <C-f> :Files<CR>

" Splits in Insert Mode (wow)
inoremap <C-l> <esc><C-w>l
inoremap <C-h> <esc><C-w>h
inoremap <C-j> <esc><C-w>j
inoremap <C-k> <esc><C-w>k

" Deoplete
let g:deoplete#enable_at_startup = 1
let g:deoplete#enable_refresh_always = 1
call deoplete#custom#option('auto_complete', v:false)

" GitGutter
hi! GitGutterAdd ctermbg=black ctermfg=green
hi! GitGutterChange ctermbg=black ctermfg=11
hi! GitGutterDelete ctermbg=black ctermfg=red
hi! GitGutterChangeDelete ctermbg=black ctermfg=11
let g:gitgutter_sign_added='+'
let g:gitgutter_sign_changed='~'
let g:gitgutter_sign_removed='-'
let g:gitgutter_sign_modified_removed='~'
let g:gitgutter_enabled=0

" Omnifuncs
let g:haskellmode_completion_ghc = 0
augroup omnifuncs
    autocmd!
    autocmd FileType haskell setlocal omnifunc=necoghc#omnifunc
augroup end

augroup CursorLine
    au!
    au VimEnter * setlocal cursorline
    au WinEnter * setlocal cursorline
    au BufWinEnter * setlocal cursorline
    au WinLeave * setlocal nocursorline
augroup END

" Languages
augroup haskell
    autocmd!
    let g:LanguageClient_autoStart = 1
    autocmd FileType haskell nnoremap <buffer> gd :call LanguageClient_textDocument_definition() <CR>
    autocmd FileType haskell nnoremap <buffer> <Leader>hi :call LanguageClient_textDocument_hover() <CR>
    autocmd FileType haskell nnoremap <buffer> <Leader>ht :call LanguageClient_textDocument_hover() <CR>
    autocmd FileType haskell nnoremap <buffer> <Leader>hh :call LanguageClient_textDocument_hover() <CR>
    autocmd FileType haskell nnoremap <buffer> <Leader>hr :call LanguageClient_textDocument_references() <CR>
    autocmd FileType haskell nnoremap <buffer> <Leader>hf :call LanguageClient_textDocument_formatting() <CR>
    autocmd FileType haskell highlight ColorColumn ctermbg=235
    autocmd FileType haskell let &colorcolumn="80,".join(range(120,999),",")
augroup end

augroup cpp
    autocmd!
    autocmd FileType cpp nnoremap <buffer> gd :YcmCompleter GoToImprecise <CR>
    autocmd FileType cpp nnoremap <buffer> <Leader>gt :YcmCompleter GetTypeImprecise <CR>
    autocmd FileType cpp set tabstop=4
    autocmd FileType cpp set shiftwidth=4
    autocmd FileType cpp set matchpairs+=<:>
    autocmd FileType cpp nnoremap <buffer> <Leader>gi :YcmCompleter GoToInclude<CR>
    autocmd FileType cpp nnoremap <buffer> <Leader>gfi :e %:r.ipp<CR>
    autocmd FileType cpp nnoremap <buffer> <Leader>gfc :e %:r.cpp<CR>
    autocmd FileType cpp nnoremap <buffer> <Leader>gfh :e %:r.hpp<CR>
    autocmd FileType cpp set nocscopeverbose
    autocmd FileType cpp cs add /home/winnt/TIBRA/james.anastasiou/repos/trunk/cscope.out
    autocmd FileType cpp nnoremap <buffer> <Leader>fs :cs find s <C-R><C-W><CR>
    autocmd FileType cpp nnoremap <buffer> <Leader>fsc :cs find s 
    autocmd FileType cpp nnoremap <buffer> <Leader>fi :cs find i %:t<CR>
    autocmd FileType cpp nnoremap <buffer> <Leader>fd :cs find g <C-R><C-W><CR>
    autocmd FileType cpp nnoremap <buffer> <Leader>fdc :cs find g 
    autocmd FileType cpp nnoremap <buffer> <Leader>ff :cs find d <C-R><C-W><CR>
    autocmd FileType cpp if expand('%:p') =~ "trunk" | cd ~/repos/trunk | endif
    autocmd FileType cpp highlight ColorColumn ctermbg=235
    autocmd FileType cpp let &colorcolumn="100,".join(range(120,999),",")
    autocmd Filetype cpp nnoremap <buffer> <Leader>ff :call Format()<CR>
    autocmd Filetype cpp let g:makeshift_root="${HOME}/build/trunk.gcc"
    autocmd Filetype cpp autocmd Syntax * syn match ExtraWhitespace /\s\+$\| \+\ze\t/
augroup end

augroup xml
    autocmd!
    autocmd FileType xml,xsd set tabstop=2
    autocmd FileType xml,xsd set shiftwidth=2
    autocmd FileType xml,xsd set matchpairs+=<:>
augroup end

augroup javascript
    autocmd!
    autocmd FileType javascript set tabstop=2
    autocmd FileType javascript set shiftwidth=2
    autocmd FileType javascript set matchpairs+=<:>
    autocmd FileType javascript highlight ColorColumn ctermbg=235
    autocmd FileType javascript let &colorcolumn="100,".join(range(120,999),",")
augroup end

" Haskell IDE Engine
let g:LanguageClient_serverCommands = {
  \ 'haskell': ['hie', '--lsp', '-r', '${HOME}/repos/hardware/haskell/'],
  \ 'python': ['pyls'],
  \ }

" Undofile
set undofile
set undodir=~/.local/share/nvim/undodir
