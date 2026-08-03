syntax enable
set number
set ignorecase
set smartcase
set incsearch
set clipboard=unnamedplus
set autoindent
set smartindent
set expandtab
set tabstop=4
set shiftwidth=4

call plug#begin()
	Plug 'https://github.com/vim-airline/vim-airline'
	Plug 'https://github.com/w0ng/vim-hybrid'
	Plug 'https://github.com/preservim/nerdtree'
call plug#end()

set background=dark
colorscheme hybrid

augroup MoonloaderCp1251
    autocmd!
    autocmd BufRead,BufNewFile */moonloader/*.lua setlocal fileencoding=cp1251 | edit ++enc=cp1251
augroup END

nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-n> :NERDTree<CR>
