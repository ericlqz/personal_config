" Use Vim settings, rather than Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 			Bundle Setting Start
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
filetype off                   " required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required! 
Bundle 'gmarik/vundle'

" Plugins for Python
Bundle 'klen/python-mode'
Bundle 'davidhalter/jedi-vim'
"Bundle 'VimPdb'
" Plugins for JS
Bundle 'jslint.vim'
Bundle 'jsbeautify'
Bundle 'einars/js-beautify'
Bundle 'JavaScript-syntax'
Bundle 'IndentAnything'
Bundle 'Javascript-Indentation'
Bundle 'git://github.com/othree/javascript-libraries-syntax.vim.git'
" Plugins for Improve Coding
Bundle 'snipMate'
Bundle 'lookupfile'
Bundle 'taglist.vim'
Bundle 'TaskList.vim'
Bundle 'The-NERD-tree'
Bundle 'SuperTab'
Bundle 'Mark--Karkat'
Bundle 'The-NERD-Commenter'
" Plugins for Git
Bundle 'tpope/vim-fugitive'
" Plugins for Wiki
Bundle 'vimwiki'
Bundle 'VimExplorer'
" Plugins for Window Manager
Bundle 'winmanager'
" Plugins for Tabs
Bundle 'git://github.com/fholgado/minibufexpl.vim'
" Plugins for Others
Bundle 'Lokaltog/vim-easymotion'
Bundle 'rstacruz/sparkup', {'rtp': 'vim/'}
Bundle 'L9'
Bundle 'genutils'

 " Brief help
 " :BundleList          - list configured bundles
 " :BundleInstall(!)    - install(update) bundles
 " :BundleSearch(!) foo - search(or refresh cache first) for foo
 " :BundleClean(!)      - confirm(or auto-approve) removal of unused bundles
 "
 " see :h vundle for more details or wiki for FAQ
 " NOTE: comments after Bundle command are not allowed..
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 			Bundle Setting End
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

" if has("vms")
"   set nobackup		" do not keep a backup file, use versions instead
" else
"   set backup		" keep a backup file
" endif
set nobackup		" do not keep a backup file, use versions instead

set history=50		" keep 50 lines of command line history
set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands
set incsearch		" do incremental searching
set fileencodings=utf8,cp936,gb18030,big5

" For Win32 GUI: remove 't' flag from 'guioptions': no tearoff menu entries
" let &guioptions = substitute(&guioptions, "t", "", "g")

" Don't use Ex mode, use Q for formatting
map Q gq

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>

" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
  set mouse=a
endif

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif

" Only do this part when compiled with support for autocommands.
if has("autocmd")

  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  filetype plugin indent on

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  " Also don't do it when the mark is in the first line, that is the default
  " position when opening a file.
  autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif

  augroup END

else

  set autoindent		" always set autoindenting on

endif " has("autocmd")

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r ++edit # | 0d_ | diffthis
		  \ | wincmd p | diffthis
endif

" more subtle popup colors
if has ('gui_running')
    highlight Pmenu guibg=#cccccc gui=bold
endif
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 			Custom Setting
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Set the mapleader
let mapleader = ","

"map <C-j> <C-W>j
"map <C-k> <C-W>k
"map <C-h> <C-W>h
"map <C-l> <C-W>l

" Some common setting for programing
"set tabstop=4
"set softtabstop=4
"set shiftwidth=4
"set expandtab
set number
"set autoindent

set ai
set ts=4
set sts=4
set et
set sw=4
set textwidth=79

" HTML (tab width 2 chr, no wrapping)
autocmd FileType html set sw=2
autocmd FileType html set ts=2
autocmd FileType html set sts=2
autocmd FileType html set textwidth=0
" Python (tab width 4 chr, wrap at 79th char)
autocmd FileType python set sw=4
autocmd FileType python set ts=4
autocmd FileType python set sts=4
autocmd FileType python set textwidth=79
" CSS (tab width 2 chr, wrap at 79th char)
autocmd FileType css set sw=2
autocmd FileType css set ts=2
autocmd FileType css set sts=2
autocmd FileType css set textwidth=79
" JavaScript (tab width 4 chr, wrap at 79th)
autocmd FileType javascript set sw=2
autocmd FileType javascript set ts=2
autocmd FileType javascript set sts=2
autocmd FileType javascript set textwidth=79

" Add system C function tags
"set tags+=~/.vim/sysctags

" Some common mapping
map <leader>ss : source ~/.vimrc<CR>
map <leader>ee : e ~/.vimrc<CR>
" When .vimrc is edited, reload it
autocmd! bufwritepost .vimrc source ~/.vimrc

" 用CTRL+方向键调整窗口大小 
map <C-up> <C-w>+ 
map <C-down> <C-w>- 
map <C-left> <C-w>< 
map <C-right> <C-w>> 
map <C-w>m : res<cr>


" Setting for QuickFix
map <leader>cq :ccl<cr>

" Auto close the Scrath Buffer
" If you prefer the Omni-Completion tip window to close when a selection is
" made, these lines close it on movement in insert mode or when leaving
" insert mode
autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
autocmd InsertLeave * if pumvisible() == 0|pclose|endif

" Setting for CTags
let $Tlist_Ctags_Cmd='/usr/bin/ctags'

" Setting for TaskList
map <leader>tt :TaskList<CR>

" " Setting for TagList
"nnoremap <silent> <leader>tl :TlistToggle<CR>
"let Tlist_WinWidth = 15
let Tlist_Show_One_File = 1  " 不同时显示多个文件的tag, 只显示当前文件
let Tlist_Exit_OnlyWindow = 1  " 如果taglist窗口是最后一个窗口，则退出vim
let Tlist_Use_Right_Window = 0  " 在右侧窗口中显示taglist窗口
let Tlist_WinWidth = 20
let Tlist_Inc_Winwidth = 5
map <leader>tl :TlistToggle<cr>

" Setting for MiniBufExplorer
let g:miniBufExplMapWindowNavVim = 1   
let g:miniBufExplMapWindowNavArrows = 1   
let g:miniBufExplMapCTabSwitchBufs = 1   
let g:miniBufExplModSelTarget = 1  
let g:miniBufExplMoreThanOne=0  

map <Leader>me :MBEOpen<cr>
map <Leader>mc :MBEClose<cr>
map <Leader>mt :MBEToggle<cr>
map <C-h> :MBEbp<cr>
map <C-l> :MBEbn<cr>

" Not work
let g:did_minibufexplorer_syntax_inits = 1
hi MBENormal               guifg=#808080 guibg=fg
hi MBEChanged              guifg=#CD5907 guibg=fg
hi MBEVisibleNormal        guifg=#5DC2D6 guibg=fg
hi MBEVisibleChanged       guifg=#F1266F guibg=fg
hi MBEVisibleActiveNormal  guifg=#A6DB29 guibg=fg
hi MBEVisibleActiveChanged guifg=#F1266F guibg=fg

" Setting for NERDTree
let g:NERDTree_title="[NERDTree]"
let g:NERDTreeWinSize=10
function! NERDTree_Start()  
    exec 'NERDTree'  
endfunction  
  
function! NERDTree_IsValid()  
    return 1  
endfunction

map <leader>no :NERDTree<cr>
map <leader>nc :NERDTreeClose<cr>


" Setting for WinManager
let g:winManagerWindowLayout="NERDTree|TagList"
let g:winManagerWidth = 20
let g:defaultExplorer = 0
nmap <C-W><C-F> :FirstExplorerWindow<cr>
nmap <C-W><C-D> :BottomExplorerWindow<cr>
nmap <silent> <leader>wm :WMToggle<cr>

" Setting for LookupFile
function! SetRootOfTheProject(path)
    " 进入指定目录
   exe 'cd '.a:path
   " 生成文件标签
   exe '!genlookupfiletags'
    " 获取标签文件的路径
   let tagFilePath = genutils#CleanupFileName(a:path.'/filenametags')
   " 设置LookupFile插件的全局变量，使之以上面生成的标签文件作为查找源
    exe "let g:LookupFile_TagExpr='\"".tagFilePath."\"'"
endfunction
" 设置当前位置为工程的根目录
function! SetHereTheRoot()
    call SetRootOfTheProject('.')
endfunction
nmap <leader>root :call SetHereTheRoot()<CR>
" 从用户的输入获取指定路径，并设置为工程的根目录
function! SetSpecifiedPathTheRoot()
    call SetRootOfTheProject(input('请输入工程根目录的路径：'))
endfunction
nmap <leader>xroot :call SetSpecifiedPathTheRoot()<CR>

" 使用LookupFile打开文件
nmap <leader>o :LookupFile<CR>

let g:LookupFile_MinPatLength = 2               "最少输入2个字符才开始查找
let g:LookupFile_PreserveLastPattern = 0        "不保存上次查找的字符串
let g:LookupFile_PreservePatternHistory = 1     "保存查找历史
let g:LookupFile_AlwaysAcceptFirst = 1          "回车打开第一个匹配项目
let g:LookupFile_AllowNewFiles = 0              "不允许创建不存在的文件
let g:LookupFile_SortMethod = ""                "关闭对搜索结果的字母排序

"" Setting for CScope
"if has("cscope")
"    set csprg=/usr/bin/cscope
"    set csto=1
"    set cst
"    set nocsverb
"    " add any database in current directory
"    if filereadable("cscope.out")
"        cs add cscope.out
"    " elseif filereadable("cscope.files")
"    "     exe '!cscope -Rbq'
"    endif
"    set csverb
"endif
"
"nmap <leader>cs : cs find s <C-R>=expand("<cword>")<CR><CR>
"nmap <leader>cg : cs find g <C-R>=expand("<cword>")<CR><CR>
"nmap <leader>cc : cs find c <C-R>=expand("<cword>")<CR><CR>
"nmap <leader>ct : cs find t <C-R>=expand("<cword>")<CR><CR>
"nmap <leader>ce : cs find e <C-R>=expand("<cword>")<CR><CR>
"nmap <leader>cf : cs find f <C-R>=expand("<cfile>")<CR><CR>
"nmap <leader>ci : cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
"nmap <leader>cd : cs find d <C-R>=expand("<cword>")<CR><CR>
"
"set cscopequickfix=s-,c-,d-,i-,t-,e-  

" Setting for javascript.vim HightLight for js
" open javascript folding
let b:javascript_fold=1
" open javascript support for dom、html and css
let javascript_enable_domhtmlcss=1

autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS

let g:tlist_javascript_settings = 'javascript;s:string;a:array;o:object;f:function;m:member'

" "Higlight current line only in insert mode
" autocmd InsertLeave * set nocursorline
" autocmd InsertEnter * set cursorline
" "Highlight cursor
" highlight CursorLine ctermbg=8 cterm=NONE

" Setting for javascript-libraries-syntax.vim
let g:used_javascript_libs = 'angularjs,jquery,requirejs' 

"Incremental search
set incsearch


" " Setting for Python
" autocmd FileType python set omnifunc=pythoncomplete#Complete

" Python-mode
" Activate rope
" Keys:
" K             Show python docs
" <Ctrl-Space>  Rope autocomplete
" <Ctrl-c>g     Rope goto definition
" <Ctrl-c>d     Rope show documentation
" <Ctrl-c>f     Rope find occurrences
" <Leader>b     Set, unset breakpoint (g:pymode_breakpoint enabled)
" [[            Jump on previous class or function (normal, visual, operator modes)
" ]]            Jump on next class or function (normal, visual, operator modes)
" [M            Jump on previous class or method (normal, visual, operator modes)
" ]M            Jump on next class or method (normal, visual, operator modes)
let g:pymode_rope = 0

" Documentation
let g:pymode_doc = 1
let g:pymode_doc_key = 'K'

"Linting
let g:pymode_lint = 1
let g:pymode_lint_checker = "pyflakes,pep8"
let g:pymode_lint_ignore = "W0401"
" Auto check on save
let g:pymode_lint_write = 1
" Support virtualenv
let g:pymode_virtualenv = 1

" Enable breakpoints plugin
let g:pymode_breakpoint = 1
let g:pymode_breakpoint_key = '<leader>b'

" syntax highlighting
let g:pymode_syntax = 1
let g:pymode_syntax_all = 1
let g:pymode_syntax_indent_errors = g:pymode_syntax_all
let g:pymode_syntax_space_errors = g:pymode_syntax_all

" Don't autofold code
let g:pymode_folding = 0

" Format python code
map <leader>fp : PyLintAuto<cr>

" Setting for Vimwiki
nmap <leader>tt <Plug>VimwikiToggleListItem

" Jedi-vim Settings
let g:jedi#use_tabs_not_buffers = 0
let g:jedi#popup_select_first = 1
