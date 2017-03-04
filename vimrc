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


" Uncomment the next line to make Vim more Vi-compatible
" NOTE: debian.vim sets 'nocompatible'.  Setting 'compatible' changes numerous
" options, so any other options should be set AFTER setting 'compatible'.
"set compatible

" Uncomment the following to have Vim jump to the last position when
" reopening a file
"if has("autocmd")
"  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
"endif

" The following are commented out as they cause vim to behave a lot
" differently from regular Vi. They are highly recommended though.
"set showcmd		" Show (partial) command in status line.

"set ignorecase		" Do case insensitive matching
"set smartcase		" Do smart case matching
"set incsearch		" Incremental search
"set autowrite		" Automatically save before commands like :next and :make
"set hidden             " Hide buffers when they are abandoned

set mouse=a		" Enable mouse usage (all modes)
set mousehide
set cursorline
set showmode
set backspace=indent,eol,start
set linespace=0
set number
set showmatch		" Show matching brackets.
set incsearch
set hlsearch

scriptencoding utf-8
syntax on
syntax enable
set background=dark

set expandtab tabstop=4 shiftwidth=4
retab
set softtabstop=4
set autoindent cindent
set number
" Source a global configuration file if available
if filereadable("/etc/vim/vimrc.local")
  source /etc/vim/vimrc.local
endif

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

let mapleader = ' '


