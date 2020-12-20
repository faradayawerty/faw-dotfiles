" basic configuration
	set path+=**
	set showtabline=2
	set foldignore=
	set laststatus=1
	set tabstop=8
	set shiftwidth=8
	set smarttab
	set autoindent
	set number
	set relativenumber
	set noswapfile 
	set hlsearch
	set incsearch
	set linebreak
	set background=dark
	set foldmethod=indent
	set nofoldenable
	set cursorline
	set paste
	set noexpandtab
	set nocompatible
	syntax on

" shortcuts
	noremap K <nop>
	noremap J <nop>
 
	let mapleader=","
	noremap <leader>s :set spell! spelllang=en,ru<CR>
	noremap <leader>w :set list!<cr>
	noremap <leader>n :norm 
	noremap <leader>f :find 
	noremap <leader>p :set paste!<cr>
	noremap <leader>c :execute "set colorcolumn=" . (&colorcolumn == "" ? "80" : "")<cr>

	autocmd FileType cpp noremap <leader>r :!clear; g++ % && ./a.out<cr>
	autocmd FileType go noremap <leader>r :!clear; go run %<cr>
	autocmd FileType tex noremap <leader>r :!clear; pdflatex % && zathura %:r.pdf <cr>

	" tabs
	noremap tn :tabnew<cr>
	noremap te :tabedit 
	noremap tl :tabnext<cr>
	noremap th :tabprevious<cr>

	" clipboard
	vnoremap <c-c> "yy <Bar> :call system('xclip -selection clipboard', @y)<cr>
	vnoremap <c-x> "dd <Bar> :call system('xclip -selection clipboard', @y)<cr>

" general configuration
	" show whitespaces
	set listchars=tab:>-,space:·,eol:~

	" Unicode characters support
	set fileencoding=utf-8
	set encoding=utf-8
	set termencoding=utf-8

	" Russian language support
	set langmap=ФИСВУАПРШОЛДЬТЩЗЙКЫЕГМЦЧНЯ;ABCDEFGHIJKLMNOPQRSTUVWXYZ,фисвуапршолдьтщзйкыегмцчня;abcdefghijklmnopqrstuvwxyz

	" rename tmux window to the name of an open file
	"autocmd BufReadPost,FileReadPost,BufNewFile * call system('tmux rename-window ' . expand('%:t'))
	"autocmd BufLeave,VimLeave * call system('tmux rename-window ' . expand('shell'))

	" return to the same line you left off at
		augroup line_return
			au!
			au BufReadPost *
				\ if line("'\"") > 0 && line("'\"") <= line("$") |
				\	execute 'normal! g`"zvzz' |
				\ endif
		augroup END

" appearance
	highlight normal ctermfg=none
	highlight visual ctermfg=black ctermbg=blue

	highlight nontext ctermfg=blue
	highlight specialkey ctermfg=blue

	highlight search cterm=underline ctermfg=cyan ctermbg=none
	highlight incsearch cterm=underline ctermfg=cyan ctermbg=none

	highlight linenr term=none cterm=none ctermfg=none ctermbg=none
	highlight cursorlinenr ctermfg=none ctermbg=none cterm=underline

	highlight cursorline ctermfg=none ctermbg=none cterm=underline
	highlight cursorcolumn ctermfg=none ctermbg=none cterm=none

	highlight colorcolumn ctermbg=cyan
	highlight folded ctermfg=blue ctermbg=none

	highlight TabLine ctermbg=none ctermfg=blue cterm=none
	highlight TabLineFill ctermbg=none ctermfg=blue cterm=none
	highlight TabLineSel ctermbg=blue ctermfg=black cterm=none

