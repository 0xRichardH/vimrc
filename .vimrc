"git clone http://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
set nocompatible               " be iMproved
filetype plugin indent on    " required

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

"let Vundle manage Vundle
" required!
Bundle 'gmarik/vundle'

" Theme
Bundle 'jpo/vim-railscasts-theme'

" Nerdtree
Bundle 'scrooloose/nerdtree'
Bundle 'Xuyuanp/nerdtree-git-plugin'

" Search
Bundle 'ctrlpvim/ctrlp.vim'
Bundle 'mileszs/ack.vim'

" Ruby Bundle
Bundle 'vim-ruby/vim-ruby'
Bundle 'tpope/vim-rails'

" Status Style
Bundle 'vim-airline/vim-airline'
Bundle 'vim-airline/vim-airline-themes'
Bundle 'tpope/vim-fugitive'

" Tool
Bundle 'easymotion/vim-easymotion'
Bundle 'tomtom/tcomment_vim'

" Theme
colorscheme railscasts
set guifont=Monaco:h13

" Tab
set tabstop=2
set shiftwidth=2
set expandtab
set smarttab

" Close backup
set nobackup
set nowritebackup

syntax on
set number
set autoindent
set smartindent
set ruler
set history=50
set incsearch
set wildmenu
set autoread
set noswapfile
set whichwrap=b,s,h,l,<,>,[,]
set nowrap

"Status
set laststatus=2
set statusline+=fugitive#statusline()

" Search
set hlsearch
set ignorecase
set incsearch

" NerdTree
let g:nerdtree_tabs_open_on_gui_startup=0
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
let NERDTreeShowBookmarks=1
let NERDTreeIgnore=['\.py[cd]$', '\~$', '\.swo$', '\.swp$', '^\.git$', '^\.hg$', '^\.svn$', '\.bzr$']
let NERDTreeChDirMode=0
let NERDTreeQuitOnOpen=1
let NERDTreeMouseMode=2
let NERDTreeShowHidden=1
let NERDTreeKeepTreeInNewTab=1
map <C-e> :NERDTreeToggle<CR>
let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ "Unknown"   : "?"
    \ }

" "EasyMotion
let mapleader=","

"clipboard
if has('clipboard')
  if has('unnamedplus')  " When possible use + register for copy-paste
      set clipboard=unnamed,unnamedplus
  else         " On mac and Windows, use * register for copy-paste
      set clipboard=unnamed
  endif
endif


" Strip trailing whitespace
" function! <SID>StripTrailingWhitespaces()
" Strip trailing whitespace
function! <SID>StripTrailingWhitespaces()
    " Preparation: save last search, and cursor position.
    let _s=@/
    let l = line(".")
    let c = col(".")
    " Do the business:
    %s/\s\+$//e
    " Clean up: restore previous search history, and cursor position
    let @/=_s
    call cursor(l, c)
endfunction
autocmd BufWritePre * :call <SID>StripTrailingWhitespaces()


" CtrlP
let g:ctrlp_working_path_mode = 'ra'
nnoremap <silent> <D-t> :CtrlP<CR>
nnoremap <silent> <D-r> :CtrlPMRU<CR>
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\.git$\|\.hg$\|\.svn$',
  \ 'file': '\.exe$\|\.so$\|\.dll$\|\.pyc$' }
let s:ctrlp_fallback = 'ack %s --nocolor -f'

