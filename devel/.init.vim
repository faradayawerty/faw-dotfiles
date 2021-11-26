
call plug#begin(stdpath('data') . '/plugged')
	Plug 'fxn/vim-monochrome'
	Plug 'neoclide/coc.nvim', {'branch': 'release'}
call plug#end()

set path+=**
set showtabline=1
set foldignore=
set laststatus=1
set tabstop=6
set shiftwidth=6
set smarttab
set autoindent
set number
set norelativenumber
set noswapfile 
set hlsearch
set incsearch
set linebreak
set background=dark
set foldmethod=indent
set nofoldenable
set cursorline
set noexpandtab
set paste
set clipboard=unnamed,unnamedplus " neovim only
syntax on

noremap K <nop>
noremap J <nop>

let mapleader=","
noremap <leader>s :set spell! spelllang=en,ru<CR>
noremap <leader>w :set list!<cr>
noremap <leader>c :execute "set colorcolumn=" . (&colorcolumn == "" ? "80" : "")<cr>

" show whitespaces
set listchars=tab:>-,space:·,eol:~

" Unicode characters support
set fileencoding=utf-8
set encoding=utf-8
set termencoding=utf-8

" Russian language support
set langmap=ФИСВУАПРШОЛДЬТЩЗЙКЫЕГМЦЧНЯ;ABCDEFGHIJKLMNOPQRSTUVWXYZ,фисвуапршолдьтщзйкыегмцчня;abcdefghijklmnopqrstuvwxyz

" return to the same line you left off at
augroup line_return
	au!
	au BufReadPost *
		\ if line("'\"") > 0 && line("'\"") <= line("$") |
		\	execute 'normal! g`"zvzz' |
		\ endif
augroup END

colorscheme monochrome

highlight cursorline ctermfg=none ctermbg=none cterm=none
highlight cursorcolumn ctermfg=none ctermbg=none cterm=none

highlight colorcolumn ctermbg=red
highlight folded ctermfg=white ctermbg=none

