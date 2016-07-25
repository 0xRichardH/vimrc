set nocompatible               " be iMproved
filetype plugin indent on    " required

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

"let Vundle manage Vundle
" required!
Bundle 'gmarik/vundle'

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

" Tool
Bundle 'easymotion/vim-easymotion'
Bundle 'tomtom/tcomment_vim'


" Tab
set tabstop=2
set shiftwidth=2
set expandtab
set smarttab

" Close backup
set nobackup
set nowritebackup

" Style
colorscheme desert
set guifont=Monaco:h12

syntax on
set number
set autoindent
set ruler
set history=50
set incsearch
set wildmenu
set autoread

"Status
set laststatus=2

" NerdTree
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
let NERDTreeShowHidden=1
let NERDTreeAutoDeleteBuffer=1
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

