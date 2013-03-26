set nocompatible
syntax on
filetype plugin indent on 
" helptags ~/.vim/doc "Rais 플러그인의 도움말 로딩
helptags ~/.vim/doc
"colorscheme vibrantink "둘 중 하나를 고르세요
"colorscheme vividchalk
if has("gui_running")
	colorscheme torte 
endif

set nobackup
set history=50
set ruler
set showcmd
set incsearch
set hlsearch
set smarttab
set number

" Add kernel coding style check when vim starts at kernel directory
if isdirectory("arch") && isdirectory("drivers")
	set tabstop=8
	set softtabstop=8
	set shiftwidth=8
	set noexpandtab
	set tw=80
	set wrap
	if exists('+colorcolumn')
		set colorcolumn=80
	else
		au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>80v.\+', -1)
	endif
else " Not kernel code
	set tabstop=4
	set softtabstop=4
	set shiftwidth=4
	set ts=4 " 이렇게해도 Ruby 파일의 탭은 스페이스 2개가 됩니다
	set sw=4
endif " End of kernel coding style

let g:ctags_statusline=1
let g:ctags_title=1
let generate_tags=1

" Syntastic plugin
call pathogen#infect()
let g:syntastic_c_checker="checkpatch-kernel-only"
"let g:syntastic_c_checker_checkpatch_location='./hardware/intel/linux-2.6/scripts/checkpatch.pl'
"let g:syntastic_c_checker="sparse"
nmap <F12> :SyntasticCheck<CR>

set wildmenu

"taglist options
let Tlist_Show_One_File=1
let Tlist_WinWidth=40

nmap <F5> :TlistToggle<CR>
nmap <F6> :TlistOpen<CR>
nmap <F8> :tabn<CR>

" GVIM
if has("gui_running")
	nmap <C-V> "+gP
	imap <C-V> <ESC><C-V>i
	vmap <C-C> "+y
endif
