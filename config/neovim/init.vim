" basic configuration
" -------------------
set path+=**
set showtabline=1
set foldignore=
set laststatus=1
set tabstop=8
set shiftwidth=8
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
set guicursor=
set clipboard=unnamed,unnamedplus " use xorg clipboard by default - neovim only
syntax on


" shortcuts
" ---------
noremap K <nop>
noremap J <nop>

let mapleader=","
noremap <leader>S :set spell! spelllang=en,ru<CR>
noremap <leader>w :set list!<cr>
noremap <leader>p :set paste!<cr>
noremap <leader>c :execute "set colorcolumn=" . (&colorcolumn == "" ? "80" : "")<cr>

" general configuration
" -------------------------
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

" appearance
" ----------
highlight TabLine ctermbg=none ctermfg=grey cterm=none
highlight TabLineFill ctermbg=none ctermfg=grey cterm=none
highlight TabLineSel ctermbg=black ctermfg=white cterm=none

highlight normal ctermfg=none
highlight visual ctermfg=black ctermbg=blue

highlight nontext ctermfg=blue
highlight specialkey ctermfg=blue

highlight search cterm=underline ctermfg=cyan ctermbg=none
highlight incsearch cterm=underline ctermfg=cyan ctermbg=none

highlight linenr term=none cterm=none ctermfg=none ctermbg=none
highlight cursorlinenr ctermfg=none ctermbg=none cterm=underline

highlight cursorline ctermfg=none ctermbg=none cterm=none
highlight cursorcolumn ctermfg=none ctermbg=none cterm=bold

highlight colorcolumn ctermbg=cyan
highlight folded ctermfg=blue ctermbg=none

" plugins
" -------
call plug#begin(stdpath('data') . '/plugged')
	Plug 'jiangmiao/auto-pairs'
	Plug 'justmao945/vim-clang'
	Plug 'artur-shaik/vim-javacomplete2'
call plug#end()

" clang complete
let g:clang_auto = 0
let g:clang_check_syntax_auto = 1
let g:clang_verbose_pmenu = 1
let g:clang_cpp_completeopt = 'longest,menuone'

" java complete
autocmd Filetype java setlocal omnifunc=javacomplete#Complete
let g:JavaComplete_ClosingBrace = 1


