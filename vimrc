"""""""""" pathogen setting """""""""""
	runtime bundle/vim-pathogen/autoload/pathogen.vim
	call pathogen#infect()



	"set guifont=Monospace\ 11
	set tabstop=4
	set backspace=2
	set nu! "显示行号
	set nowrap
	set linebreak "整词换行
	set whichwrap=b,s,<,>,[,] "左右光标移动到头时可以自动下移
	"set autochdir "自动设置目录为正在编辑的文件所在目录
	set hidden "没有保存的缓冲区可以自动隐藏
	set scrolloff=7 "设置光标上下保留的最小的行数
	set smartindent "智能对齐方式
	set shiftwidth=4    "换行时行间交错使用4个空格
	set autoindent  "自动对齐
	set ai! "设置自动缩进
	set showcmd     " display incomplete commands
	set wildmenu "增强模式的命令行
	"=========状态栏相关===========
	set laststatus=2    "总是显示状态栏status line
	set ruler   "在编辑过程中，右下角显示光表位置的状态行
	set statusline=[%F]%y%r%m%*%=[Line:%l/%L,Column:%c][%p%%]
	"==========编辑相关============
	" allow backspacing over everything in insert mode
	set backspace=indent,eol,start
	" Don't use Ex mode, use Q for formatting
	"map Q gq
	" In many terminal emulators the mouse works just fine, thus enable it.
	if has('mouse')
	set mouse=v
	endif
	set autowrite "在切换buffer时自动保存当前的文件
	set autoread
	"===========查找替换相关============
	set hlsearch
	set incsearch "" 查询时非常方便，如要查找book单词，当输入到/b时，会自动找到
	" 第一个b开头的单词，当输入到/bo时，会自动找到第一个bo开头的
	" 单词，依次类推，进行查找时，使用此设置会快速找到答案，当你
	" 找要匹配的单词时，别忘记回车
	set gdefault    "替换所有的行内匹配都被替换，而不是第一个
	"=========编程相关===========
	"set completeopt=longest,menu   "关掉只能补全的时的预览窗口
	filetype plugin indent on
	syntax on
	syntax enable
	"========================================"
	"if has("vms")
	"set nobackup      " do not keep a backup file, use versions instead
	"else
	"set backup        " keep a backup file
	"endif
	set nobackup " no back up file *.ext~
	set nowritebackup " no writable back up
	" Put these in an autocmd group, so that we can delete them easily.
	"===================autocmd====================="
	augroup vimrcEx
	au!
	"如果文件类型为text，则设置文本显示的宽度为78,更多参考:h setlocal
	autocmd FileType text setlocal textwidth=78
	" When editing a file, always jump to the last known cursor position.
	" Don't do it when the position is invalid or when inside an event handler
	" (happens when dropping a file on gvim).
	" Also don't do it when the mark is in the first line, that is the default
	" position when opening a file.
	" 如下的autocmd实现打开文件自动跳到上次编辑的位置
	autocmd BufReadPost *
	\ if line("'\"") > 1 && line("'\"") <= line("$") |
	\   exe "normal! g`\"" |
	\ endif
	autocmd! bufwritepost vimrc source ~/.vimrc
	augroup END
	" Convenient command to see the difference between the current buffer and the
	" file it was loaded from, thus the changes you made.
	" Only define it when not defined already.
	if !exists(":DiffOrig")
	command DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis
	\ | wincmd p | diffthis
	endif
