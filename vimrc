" All system-wide defaults are set in $VIMRUNTIME/debian.vim (usually just
" /usr/share/vim/vimcurrent/debian.vim) and sourced by the call to :runtime
" you can find below.  If you wish to change any of those settings, you should
" do it in this file (/etc/vim/vimrc), since debian.vim will be overwritten
" everytime an upgrade of the vim packages is performed.  It is recommended to
" make changes after sourcing debian.vim since it alters the value of the
" 'compatible' option.


filetype off

" Vim5 and later versions support syntax highlighting. Uncommenting the nextsyntax on
" line enables syntax highlighting by default.                              
syntax on

set nocompatible

if isdirectory( expand("~/.vim/bundle/Vundle.vim") )
	set rtp+=~/.vim/bundle/Vundle.vim

	call vundle#begin()
		"let vundle manage Vundle self, require
		Plugin 'VundleVim/Vundle.vim'
		Plugin 'majutsushi/tagbar'
		Plugin 'scrooloose/nerdtree'
		Plugin 'kien/ctrlp.vim'
		Plugin 'brookhong/cscope.vim'
		Plugin 'honza/vim-snippets'
		Plugin 'SirVer/ultisnips'
		Plugin 'OmniCppComplete'
		Plugin 'mark.vim'
	call vundle#end()
endif
filetype plugin indent on


scriptencoding utf-8
syntax on
syntax enable
set background=dark
set mouse=a                 " Automatically enable mouse usage
set mousehide               " Hide the mouse cursor while typing
set cursorline                  " Highlight current line
set showmode                    " Display the current mode
set backspace=indent,eol,start  " Backspace for dummies
set linespace=0                 " No extra spaces between rows
set number                      " Line numbers on
set showmatch                   " Show matching brackets/parenthesis
set incsearch                   " Find as you type search
set hlsearch                    " Highlight search terms
set winminheight=0              " Windows can be 0 line high
set ignorecase                  " Case insensitive search
set smartcase                   " Case sensitive when uc present
set wildmenu                    " Show list instead of just completing
set wildmode=list:longest,full  " Command <Tab> completion, list matches, then longest common part, then all.
set whichwrap=b,s,h,l,<,>,[,]   " Backspace and cursor keys wrap too
set scrolljump=5                " Lines to scroll when cursor leaves screen
set scrolloff=3                 " Minimum lines to keep above and below cursor

set autoindent                  " Indent at the same level of the previous line
set smartindent
set cindent
set shiftwidth=4                " Use indents of 4 spaces
set expandtab                   " Tabs are spaces, not tabs
set tabstop=4                   " An indentation every four columns
set softtabstop=4               " Let backspace delete indent
set showcmd                     " show the cmd you input
set ruler                       " show the current position

set laststatus=2
set foldmethod=marker
set updatetime=1000

" Source a global configuration file if available
"if filereadable("/etc/vim/vimrc.local")
"  source /etc/vim/vimrc.local
"endif

"映射caplock为Esc
au VimEnter * !xmodmap -e 'clear Lock' -e 'keycode 0x42 = Escape'
au VimLeave * !xmodmap -e 'clear Lock' -e 'keycode 0x42 = Caps_Lock'

autocmd BufNewFile *.cpp,*.[ch] exec ":call SetTitle()"

func SetTitle()
	call setline(1,           "/***********************************************************/" )
	call append(line("."),    "//     File Name   : ".expand("%") )
	call append(line(".") + 1,"//     Author      : Donald Zhuang")
	call append(line(".") + 2,"//     E-Mail      : ")
	call append(line(".") + 3,"//     Create Time : ".strftime("%c")) 
	call append(line(".") + 4,"/**********************************************************/" )
	call append(line(".") + 5,"")    

	if &filetype == 'c'
		call append(line(".")+6, "#include <stdio.h>")
		call append(line(".")+7, "")
		call append(line(".")+8, "int main(int argc,char *argv[])")
		call append(line(".")+9, "{")
		call append(line(".")+10, "")
		call append(line(".")+11, "    return 0;")
		call append(line(".")+12, "}")
	elseif &filetype == 'sh'
		call append(line(".")+6, "\#!/bin/bash"))
	elseif &filetype == 'cpp'
		call append(line(".")+6, "#include <iostream>")
		call append(line(".")+7, "")
		call append(line(".")+8, "using namespace std;")
		call append(line(".")+9, "")
	endif
endfunc
autocmd BufNewFile * normal G

" 映射全选+复制 ctrl+a
map  <C-A> ggVGY
map! <C-A> <Esc>ggVGY
map  <F12> gg=G
" 选中状态下 Ctrl+c 复制
vmap <C-c> "+y
"去空行  
nnoremap <F2> :g/^\s*$/d<CR> 

let mapleader = ' '
nnoremap <silent> <leader><leader>/ :nohlsearch<CR>

" mark.vim
nnoremap <leader>c :MarkClear<cr>

" tagbar
nnoremap <silent> <leader>t :TagbarToggle<CR>
let g:tagbar_autofocus = 1
set updatetime=1000

" NERDTree
nnoremap <silent> <leader>nt :NERDTreeToggle<CR>
nnoremap <silent> <leader>nf :NERDTreeFind<CR>

let OmniCpp_NamespaceSearch = 2 "search namespaces in the current buffer and in include files

" tag
set tags=tags;
nmap <leader>j :tn<cr>
nmap <leader>k :tp<cr>
"nmap <leader>ts :ts<cr>

" ctrlp
let g:ctrlp_map = '<leader>p'
let g:ctrlp_by_filename = 1
let g:ctrlp_working_path_mode = 'rw'
let g:ctrlp_root_markers = ["tags", "cscope.out"]
let g:ctrlp_clear_cache_on_exit = 0
set wildignore=*.o,*.obj,*.d,*/.git/*,*.a,*.so
nnoremap <leader>b :CtrlPBuffer<cr>
nnoremap <leader>u :CtrlPMRUFiles<cr>

" ycm
let g:ycm_confirm_extra_conf = 0
let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/youCompleteMe/.ycm_extra_conf.py'
nnoremap <leader>jd :YcmCompleter GoToDefinitionElseDeclaration<CR>
nnoremap <leader>jg :YcmCompleter GoTo<CR>

" cscope
set cspc=3
let g:cscope_auto_update = 1
"set csprg=/usr/local/bin/cscope
set csto=0
set nocst
let g:cscope_silent = 1
let g:cscope_interested_files = '\.c$\|\.cpp$\|\.h$\|\.java$'
nnoremap <leader>fa :call CscopeFindInteractive(expand('<cword>'))<CR>
nnoremap <leader>l :call ToggleLocationList()<CR>
nnoremap <leader>fs :call CscopeFind('s', expand('<cword>'))<CR>
nnoremap <leader>fg :call CscopeFind('g', expand('<cword>'))<CR>
nnoremap <leader>fd :call CscopeFind('d', expand('<cword>'))<CR>
nnoremap <leader>fc :call CscopeFind('c', expand('<cword>'))<CR>
nnoremap <leader>ft :call CscopeFind('t', expand('<cword>'))<CR>
nnoremap <leader>fe :call CscopeFind('e', expand('<cword>'))<CR>
nnoremap <leader>ff :call CscopeFind('f', expand('<cword>'))<CR>
nnoremap <leader>fi :call CscopeFind('i', expand('<cword>'))<CR>
