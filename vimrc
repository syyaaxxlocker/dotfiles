call plug#begin()

Plug 'preservim/nerdtree'
"Plug 'vimsence/vimsence'
Plug 'arcticicestudio/nord-vim'
Plug 'vim-airline/vim-airline'

call plug#end()  

" ctrl + f =  <3 
nnoremap <C-f> :NERDTreeToggle<CR>

"tabs settings
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4
"smart tab
set smarttab
set smartindent


"- CVE-2007-2438
set modelines=0

"search settings
set hlsearch
set incsearch
set ic
set smartcase

"base
set textwidth=60
set number
set numberwidth=4
set nocompatible


"Определение кодировки
set fileencodings=utf8,cp1251

:colorscheme nord
