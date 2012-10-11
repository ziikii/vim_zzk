" An example for a vimrc file.
"
" Maintainer:	Bram Moolenaar <Bram@vim.org>
" Last change:	2008 Dec 17
"
" To use it, copy it to
"     for Unix and OS/2:  ~/.vimrc
"	      for Amiga:  s:.vimrc
"  for MS-DOS and Win32:  $VIM\_vimrc
"	    for OpenVMS:  sys$login:.vimrc

" When started as "evim", evim.vim will already have done these settings.
if v:progname =~? "evim"
    finish
endif

" Use Vim settings, rather than Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

if has("vms")
    set nobackup		" do not keep a backup file, use versions instead
else
    set backup		" keep a backup file
endif
set history=50		" keep 50 lines of command line history
set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands
set incsearch		" do incremental searching

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
    command DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis
                \ | wincmd p | diffthis
endif



"=================================================================
"个人设置开始
"=================================================================

" -----------------------------------------------------------------        
"更新 vimrc 配置
" -----------------------------------------------------------------        
" Edit the vimrc file
" :echo $MYVIMRC
map <leader>vimrc :source /home/ziikii/.vimrc<cr>
map <leader>ev :e /home/ziikii/.vimrc<CR>
map <leader>sv :so /home/ziikii/.vimrc<CR>




"文件类型自动识别
filetype plugin on
filetype indent on

"语法高亮
syntax on

"设置自动缩进
set ai!

"设置行号
set number

"设置鼠标模式
set mouse=a

"显示模式
set showmode

"搜索忽略大小写 
set ic 

"行线
set cursorline

"modifiable
set modifiable

" 在输入命令时列出匹配项目
set wildmenu
set wildmode=list:longest

"vim的中文双引号问题
set ambiwidth=double 

"自动进入当前编辑文件所在的目录
map <leader>cd :cd %:p:h<cr>

" tab键默认4空格
set tabstop=4
set shiftwidth=4
set expandtab

" compatible is not set
set nocompatible


" -----------------------------------------------------------------        
" 备份
" -----------------------------------------------------------------
"设置无备份文件
set writebackup

"关闭自动备份
set nobackup
"set backup

"不使用swap文件
set noswapfile

"当前 buffer 可放在 bg 而不用写入磁盘
set hidden

" backups
"set backupdir=~/vim_backup_data/backup/
"" swap files
"set directory=~/vim_backup_data/swap/

"set undofile
"set undodir=~/vim_backup_data/undodir/
"set undolevels=1000
"set undoreload=10000






"-----------------------------------------------------------------    
"折叠代码方式
"-----------------------------------------------------------------
" 标签折叠
"set foldmethod=marker

"手动设置折叠
set foldmethod=manual 

"设置语法折叠
"set foldmethod=syntax

"缩进折叠
"set foldmethod=indent

"光标遇到折叠，折叠就打开
"set foldopen=all

"移开折叠时自动关闭折叠
"set foldclose=all

"窗口左边显示一小栏来标识各个折叠 多少列
set foldcolumn=1

" Code folding options
" nmap <leader>f0 :set foldlevel=0<CR>
" nmap <leader>f1 :set foldlevel=1<CR>
" nmap <leader>f2 :set foldlevel=2<CR>
" nmap <leader>f3 :set foldlevel=3<CR>
" nmap <leader>f4 :set foldlevel=4<CR>
" nmap <leader>f5 :set foldlevel=5<CR>
" nmap <leader>f6 :set foldlevel=6<CR>
" nmap <leader>f7 :set foldlevel=7<CR>
" nmap <leader>f8 :set foldlevel=8<CR>
" nmap <leader>f9 :set foldlevel=9<CR>


"-----------------------------------------------------------------    
"XMLFolding setting
"-----------------------------------------------------------------
"需要设置foldmethod=syntax
"map <F4> :so ~/.vim/plugin/XMLFolding.vim<CR>



"-----------------------------------------------------------------    
"设置状态栏
"-----------------------------------------------------------------
""总是显示状态栏status line
set laststatus=2

set statusline=[%<%f]\ [%{&fileformat}]\ [%{&encoding}]\ [%{strlen(&ft)?&ft:'none'}]\ %{VCSCommandGetStatusLine()}\ %h%m%r%=%l,%c%V\ %P

"显示全目录
"set statusline+=[%r%{getcwd()}%h]


"-----------------------------------------------------------------    
"窗口分割操作
"-----------------------------------------------------------------
" 垂直分割当前窗口
nmap wv <C-w>v

" 水平分割当前窗口
nmap ws <C-w>s

" 关闭当前窗口
nmap wc <C-w>c







"-----------------------------------------------------------------    
"copy and paste
"-----------------------------------------------------------------
""实现CTRL-S保存操作
inoremap <C-s> <esc>:w<CR>

""实现了CTRL-C、CTRL-V复制粘贴操作的映射
nmap <C-c> yy
inoremap <C-V> <Esc><Plug>set paste<cr><S-Ins>
" inoremap <c-v> <esc>"+p<CR>i


" -----------------------------------------------------------------
" 显示回车换行符等特殊符号	
" -----------------------------------------------------------------
" 来转换种文件格式
" set fileformat=unix

" 在默认情况下，Vim认为文件是由行组成的，并且文件最后一行是以<EOL>为结束符的。如果你想设置文件以<EOL>结束符结尾，则可以用以下命令：
" set endofline

" 如果你想设置文件不以<EOL>结束符来结尾，则可以使用以下命令：
set noendofline

"如果你使用以下命令进入 <list mode>，那么就可以清楚的看到以“$”表示的换行符和以“^I”表示的制表符。 
" set list

" 你可以使用以下命令退出<list mode>：
set nolist

" :%s/\n//g	"删除换行符
" set textwidth	"设置行宽
" set textwidth	"设置行边距
" join	"合并多行
" J	"合并两行






" -----------------------------------------------------------------        
" nt 打开NERDTree
" -----------------------------------------------------------------        

map nt :NERDTree<CR>
"是否默认显示隐藏文件
let NERDTreeShowHidden=1
"是否默认显示行号
let NERDTreeShowLineNumbers=1
"是否默认显示书签列表
let NERDTreeShowBookmarks = 1
"打开文件后是否关闭NerdTree窗口
let NERDTreeQuitOnOpen = 0
"让Tree把自己给装饰得多姿多彩漂亮点
" let NERDChristmasTree=1
"让注释符与语句之间留一个空格
" let NERDSpaceDelims=1 
"多行注释时样子更好看
let NERDCompactSexyComs=1  





" -----------------------------------------------------------------
"配色方案
" -----------------------------------------------------------------
colorscheme molokai
let g:molokai_original = 1

"enable 256 colors in vim 
set t_Co=256




" -----------------------------------------------------------------
"设置粘贴
" -----------------------------------------------------------------
"set paste
nmap <Leader>sp :set paste<Cr>
nmap <Leader>snp :set nopaste<Cr>



" -----------------------------------------------------------------
"解决中文乱码问题
" -----------------------------------------------------------------
set encoding=utf-8
"if has(“win32″)
"set fileencoding=chinese
"else
set fileencodings=utf-8,chinese,latin-1
" set fileencoding=utf-8
"endif



" -----------------------------------------------------------------
"设置 文件dos格式或者unix 格式
" -----------------------------------------------------------------
"set ff=dos
set ff=unix



" -----------------------------------------------------------------        
"matchit.vim
" -----------------------------------------------------------------        
" plugin - matchit.vim   对%命令进行扩展使得能在嵌套标签和语句之间跳转
" " % 正向匹配      g% 反向匹配
" " [% 定位块首     ]% 定位块尾
let loaded_matchit = 1

"匹配括号的规则，增加针对html的<>
set matchpairs=(:),{:},[:],<:>


" -----------------------------------------------------------------        
"设置自定义的<leader>快捷键
" -----------------------------------------------------------------        
" let mapleader=","
" let g:mapleader=","

"clearing highlighted search
nmap <silent> <leader>/ :nohlsearch<CR>


" -----------------------------------------------------------------
" 搜索函数定义的位置
" Grep or vimgrep serching
" -----------------------------------------------------------------
"Grep
map <C-g> :Grep  <C-R>=expand("<cword>")<CR> **/*.php

"vimgrep 
" map <C-g> :vimgrep  <C-R>=expand("<cword>")<CR> **/*.php




" -----------------------------------------------------------------
"光标横线
" -----------------------------------------------------------------
"highlight CursorLine guibg=lightblue ctermbg=lightgray



" -----------------------------------------------------------------
"AutoComplPop settings
" -----------------------------------------------------------------
let g:acp_behaviorSnipmateLength = 1
let g:acp_behaviorKeywodLength = 1
let g:acp_behaviorHtmlOmniLength = 1
let g:acp_behaviorCssOmniPopetyLength = 1

"auto-popup is enabled at statup.
let g:acp_enableAtStatup = 1








"-----------------------------------------------------------------	
"OmniCppComplete
"-----------------------------------------------------------------	
set nocp
let OmniCpp_NamespaceSeach = 1
let OmniCpp_GlobalScopeSeach = 1
let OmniCpp_ShowAccess = 1
let OmniCpp_ShowPototypeInAbb = 1 " show function paametes
let OmniCpp_MayCompleteDot = 1 " autocomplete afte .
let OmniCpp_MayCompleteAow = 1 " autocomplete afte ->
let OmniCpp_MayCompleteScope = 1 " autocomplete afte ::
let OmniCpp_DefaultNamespaces = ["std", "_GLIBCXX_STD"]
" automatically open and close the popup menu / peview window
au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif 
set completeopt=menuone,menu,longest,preview
autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
autocmd FileType php set omnifunc=phpcomplete#CompletePHP
autocmd FileType c set omnifunc=ccomplete#Complete
au BufNewFile,Bufread,BufEnter *.cpp,*.hpp set omnifunc=omni#cpp#complete#Main
autocmd FileType cpp set omnifunc=cppcomplete#CompleteCPP

" 设置字典 ~/.vim/dict/文件的路径
"autocmd filetype javascipt set dictionay=$VIMFILES/dict/javascipt.dict
"autocmd filetype css set dictionay=$VIMFILES/dict/css.dict
"autocmd filetype php set dictionay=$VIMFILES/dict/php.dict

"打开javascript折叠
"let b:javascript_fold=1



"-----------------------------------------------------------------    
"set filetype
"-----------------------------------------------------------------
"映射转换语法。快捷键：html:,1  php:,2  javascipt,3  css,4 defalu ,5
":set ft=nginx
nmap <leader>seth :set filetype=html<Cr>
nmap <leader>setc :set filetype=css<Cr>
nmap <leader>setj :set filetype=javascipt<Cr>
nmap <leader>setp :set filetype=php<Cr>
nmap <leader>setd :set filetype=default<Cr>
nmap <leader>setx :set filetype=xml<Cr>



"-----------------------------------------------------------------    
"Indent
"-----------------------------------------------------------------
"set g:js_indent = /location/to/javascript.vim

"自动对齐
"set autoindent

""智能对齐方式
set smartindent






" -----------------------------------------------------------------
"zencoding settings
" -----------------------------------------------------------------
"let g:user_zen_expandabbr_key = '<c-y>'
"let g:use_zen_complete_tag = 1



"-----------------------------------------------------------------
"编辑按键映射	
"-----------------------------------------------------------------
":tabclose		Close the current tab page.
":tabdo		Perform a command in every tab page.
":tabedit		Edit a file in a new tab page.
":tabnew		Open a new tab page.
":tabfind		Search for a file and open it in a new tab page.
":tabnext		Go to the next tab page.
":tabprevious		Go to the previous tab page.
":tabNext		Go to the previous tab page.
":tabfirst		Go to the first tab page.
":tabrewind		Go to the first tab page.
":tablast		Go to the last tab page.
":tabmove		Move the current tab page elsewhere.
":tabonly		Close all other tab pages.
":tabs			List the tab pages and the windows they contain.


" Tab操作快捷方式!
nmap <C-TAB> :tabnext<Cr>
nmap <C-S-TAB> :tabpev<Cr>

"关于tab的快捷键
map tn :tabnext<cr>
map tp :tabp<cr>
map td :tabnew <cr>
map te :tabedit<cr>
map tc :tabclose<cr>
map t1 1gt
map t2 2gt
map t3 3gt
map t4 4gt
map t5 5gt
map t6 6gt
map t7 7gt
map t8 8gt
map t9 9gt


"-----------------------------------------------------------------
"窗口跳转
"-----------------------------------------------------------------
"按住ctrl键，按一次w键，再按一次表示方向的h或j或k或l 
"映射光标在窗口间移动的快捷键
nmap <C-h> <C-w>h
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-l> <C-w>l


"-----------------------------------------------------------------
"taglist settings
"-----------------------------------------------------------------
"设置F9键 打开 taglist或者关闭
map <silent> <F9> :TlistToggle<Cr>

"生成一个tags文件
nmap <F10> <Esc>:!ctags - *<Cr> 
let Tlist_Auto_Highlight_Tag = 1
let Tlist_Auto_Open = 1
let Tlist_Auto_Update = 1 

"如果Taglist窗口是最后一个窗口则退出vim
let Tlist_Exit_OnlyWindow=1

"让当前不被编辑的文件的方法列表自动折叠起来
"let Tlist_File_Fold_Auto_Close=1

"只显示当前文件的tag
let Tlist_Show_One_File = 1

"设定linux系统中的ctags cmd 位置
let Tlist_Ctags_Cmd = '/bin/ctags.exe'
let Tlist_Show_Menu = 1

"ctags set
set tags=tags
set tags+=./tags
set tags+=~/tag/tags
set tags+=/cygdive/e/xampplite/htdocs/aitupu/tags

"set tags+=./tags
set autochdir

"在右侧显示taglist窗口
let Tlist_Use_Right_Window = 1   
let g:ctags_statusline=1

" Override how taglist does javascript
let g:tlist_javascript_settings ='javascript;f:function;c:class;m:method;p:property;v:global'
highlight MyTagListTagName guifg=blue ctermfg=blue

"单击打开 tag name
let Tlist_Use_SingleClick = 1

"Tlist_WinHeight 
let Tlist_WinHeight = 20



"-----------------------------------------------------------------
""插入模式的移动
"-----------------------------------------------------------------
imap <C-j> <Down>
imap <C-k> <Up>
imap <C-h> <Left>
imap <C-l> <right>
imap <C-o> <esc>o
imap <C-a> <esc>a




"-----------------------------------------------------------------
"snipMate settings
"-----------------------------------------------------------------
let g:snips_author = 'jack chim <ziikii1@qq.com>'
"set ft=html.eruby
"autocmd FileType python set ft=python.django
"autocmd FileType html set ft=htmldjango.html


"-----------------------------------------------------------------
"phpfolding settings
"-----------------------------------------------------------------
map <F5> <Esc>:EnableFastPHPFolds<Cr>
map <F6> <Esc>:EnablePHPFolds<Cr>
map <F7> <Esc>:DisablePHPFolds<Cr>

"默认不显示 phpfolding
let g:DisableAutoPHPFolding = 1   


" -----------------------------------------------------------------
" bufExplorer插件的设置	
" -----------------------------------------------------------------
" let g:bufExplorerSortBy='mru'
" let g:bufExplorerSplitRight=0     
" let g:bufExplorerSplitVertical=1    .
" let g:bufExplorerSplitVertSize = 30 
" let g:bufExplorerUseCurrentWindow=1 
" autocmd BufWinEnter \[Buf\ List\] setl nonumber


" -----------------------------------------------------------------
" winManager插件的设置	
" -----------------------------------------------------------------
" let g:winManagerWidth = 30
" let winManagerWindowLayout = 'TagList , BufExplorer'
" let g:defaultExplorer = 1
" nmap <silent> <leader>wm :WMToggle<cr> 
" let loaded_winmanager = 1




"-----------------------------------------------------------------
"lookupfile settings
"-----------------------------------------------------------------
"map \lut :LUTags<CR>
"map \lup :LUPath<CR>
"map \lub :LUBufs<CR>
"map \luw :LUWalk<CR> 
"map \lua :LUArgs<CR> 


"-----------------------------------------------------------------
"matchit settings
"-----------------------------------------------------------------
let loaded_matchit = 0 


"-----------------------------------------------------------------
"project settings
"-----------------------------------------------------------------
"禁止载入 project 插件
"let loaded_project = 1


"-----------------------------------------------------------------
"Grep settings 	
"-----------------------------------------------------------------
"map \p :Project<CR> 
"grep settings
"nnoremap <silent> <F3> :Grep<CR>
"let Grep_Cygwin_Find = 1




"-----------------------------------------------------------------
"vcscommand.vim : CVS/SVN/SVK/git/hg/bzr integration plugin 	
"CVSROOT should be set to something like:
":ext:user@host:/path_to_repository
"-----------------------------------------------------------------
"SVN 
let VCSCommandSVNExec = 'svn'
" let b:VCSCommandVCSType='svn'
" let VCSCommandSVNDiffExt = ''
" let VCSCommandSVNDiffOpt = ''
nmap ,sa :VCSAdd
nmap ,sn :VCSAnnotate
nmap ,sN :VCSAnnotate!
nmap ,sc :VCSCommit
nmap ,sD :VCSDelete
nmap ,sd :VCSDiff
nmap ,sg :VCSGotoOriginal
nmap ,sG :VCSGotoOriginal!
nmap ,si :VCSInfo
nmap ,sl :VCSLog
nmap ,sL :VCSLock
nmap ,sr :VCSReview
nmap ,ss :VCSStatus
nmap ,su :VCSUpdate
nmap ,sU :VCSUnlock
nmap ,sv :VCSVimDiff
"SVN HELP
nmap ,svna :! svn add --force *
nmap ,svnc :! svn commit -m "Firt commit!"
nmap ,svnb :! svn blame
nmap ,svncat :!svn cat
nmap ,svn1  :! svn cleanup
nmap ,svn2 :! svn copy
nmap ,svn3 :! svn delete <FILENAME> 
nmap ,svn4 :! svn diff <本地文件的路径> <项目存储库的URL>
nmap ,svn5 :! svn Info
nmap ,svn6 :! svn list 
nmap ,svn7 :! svn log 
nmap ,svn8 :! svn merge
nmap ,svn9 :! svn mkdir <PATH>
nmap ,svn10 :! svn move
nmap ,svn11 :! svn  resolved
nmap ,svn12 :! svn revert
nmap ,svn13 :! svn status
nmap ,svn14 :!svn update


"-----------------------------------------------------------------
"Git 
"-----------------------------------------------------------------
let VCSCommandGitExec='git'
let b:VCSCommandVCSType='git'
" 优先
" let VCSCommandVCSTypeOverride = 'svn'
" let VCSCommandVCSTypePreference = 'svn'
"let VCSCommandDisableMappings=1
nmap ,ga :VCSAdd
nmap ,gn :VCSAnnotate
nmap ,gN :VCSAnnotate!
nmap ,gc :VCSCommit
nmap ,gD :VCSDelete
nmap ,gd :VCSDiff
nmap ,gg :VCSGotoOriginal
nmap ,gG :VCSGotoOriginal!
nmap ,gi :VCSInfo
nmap ,gl :VCSLog
nmap ,gL :VCSLock
nmap ,gr :VCSReview
nmap ,gs :VCSStatus
nmap ,gu :VCSUpdate
nmap ,gU :VCSUnlock
nmap ,gv :VCSVimDiff


"-----------------------------------------------------------------
" My Git help
"-----------------------------------------------------------------
nmap ,git :! git config --list
nmap ,gith :! git help <verb>
nmap ,gitr :! git remote add origin git@github.com:ziikii/n900_bay.git
nmap ,gitp :! git push  origin master
nmap ,gitv :! git remote -v 
nmap ,gitb :! git branch [branch-name]
nmap ,gitc :! git checkout [branch-name]
nmap ,gitm :! git mergy [branch-name]
nmap ,gitssh :! ssh -T git@github.com



" -----------------------------------------------------------------
" AutoCloseTag	
"Make it so AutoCloseTag works for xml and xhtml files as well
" -----------------------------------------------------------------
au FileType xhtml,xml so ~/.vim/ftplugin/html_autoclosetag.vim
" au FileType xhtml,xml ru ftplugin/html/autoclosetag.vim
"空格键折开


" -----------------------------------------------------------------
" Fuzzy Find file, tree, buffer, line	
" -----------------------------------------------------------------
nmap <leader>ff :FufFile **/<CR>
nmap <leader>ft :FufFile<CR>
nmap <leader>fb :FufBuffer<CR>
nmap <leader>fl :FufLine<CR>
nmap <leader>fr	:FufRenewCache<CR>


" -----------------------------------------------------------------
" php-doc commands	
"inoremap <C-P> <ESC>:call PhpDocSingle()<CR>i
"nnoremap <C-P> :call PhpDocSingle()<CR>
"vnoremap <C-P> :call PhpDocRange()<CR> 
" -----------------------------------------------------------------
nmap <leader>pd :call PhpDocSingle()<CR>
vmap <leader>pd :call PhpDocRange()<CR>


" -----------------------------------------------------------------
" JSON	
" -----------------------------------------------------------------
nmap <leader>jt <Esc>:%!python -m json.tool<CR><Esc>:set filetype=json<CR>



" -----------------------------------------------------------------
" quickfix	
" -----------------------------------------------------------------
" :cc                显示详细错误信息 ( :help :cc )
" :cp                跳到上一个错误 ( :help :cp )
" :cn                跳到下一个错误 ( :help :cn )
" :cl                列出所有错误 ( :help :cl )
" :cw                如果有错误列表，则打开quickfix窗口 ( :help :cw )
" :col               到前一个旧的错误列表 ( :help :col )
" :cnew              到后一个较新的错误列表 ( :help :cnew ) 
" " Toggle the quickfix window {{{
" " From Steve Losh,
" http://learnvimscriptthehardway.stevelosh.com/chapters/38.html 
" -----------------------------------------------------------------
" set makeprg=gcc\ -Wall\ -ohello\ hello.c 
" autocmd FileType c,cpp  map <buffer> <leader><space> :w<cr>:make<cr>
" nmap <leader>cn :cn<cr>
" nmap <leader>cp :cp<cr>
" nmap <leader>cw :cw 10<cr> 
nnoremap <C-q> :call <SID>QuickfixToggle()<cr>

let g:quickfix_is_open = 0

function! s:QuickfixToggle()
    if g:quickfix_is_open
        cclose
        let g:quickfix_is_open = 0
        execute g:quickfix_return_to_window . "wincmd w"
    else
        let g:quickfix_return_to_window = winnr()
        copen
        let g:quickfix_is_open = 1
    endif
endfunction
" }}}



" -----------------------------------------------------------------
" Bexec : Execute script in buffer and display output in buffer	
" \bx   or   :Bexec
" \bx   or   :call BexecVisual()
"
" -----------------------------------------------------------------
" nmap <Leader>bx :call Bexec()<CR>
" vmap <Leader>bx :call BexecVisual()<CR>
"let bexec_outputmode='append'




" -----------------------------------------------------------------
" Screen setting! 	
"  1. Edit a python file
" $ vim something.py
" 2. Decide you want to run all or pieces of the code in an interactive python
" shell
" :ScreenShell python
" 3. Send code from a vim buffer to the shell
" :ScreenSend
" 4. Quit the screen session and return to your original vim session
" :ScreenQuit
" or
" :qa
" -----------------------------------------------------------------
function! s:ScreenShellListener()
    if g:ScreenShellActive
        nmap <C-c><C-c> :ScreenSend<cr>
        nmap <C-c><C-x> :ScreenQuit<cr>
    else
        nmap <C-c><C-c> :ScreenShell<cr>
    endif
endfunction
pwd

nmap <C-c><C-c> :ScreenShell<cr>
augroup ScreenShellEnter
    autocmd User * call <SID>ScreenShellListener()
augroup END
augroup ScreenShellExit
    autocmd User * call <SID>ScreenShellListener()
augroup END



" -----------------------------------------------------------------
" bufExplorer setting 	
" To start exploring in the current window, use: >
" \be   or   :BufExplorer
" To start exploring in a newly split horizontal window, use: >
" \bs   or   :BufExplorerHorizontalSplit
" To start exploring in a newly split vertical window, use: >
" \bv   or   :BufExplorerVerticalSplit

" -----------------------------------------------------------------



"-----------------------------------------------------------------
" Quickly  get out of insert mode without your fingers having to leave the
" home row (either use 'jj' or 'jk')
"-----------------------------------------------------------------
inoremap jj <Esc>
inoremap kk <Esc>




" -----------------------------------------------------------------
" vimwiki setting 	
" -----------------------------------------------------------------

" 用法
" :VimWiki2HTML：将当前页面编译成HTML文件
" :VimWikiAll2HTML：将本wiki所有源文件都编译成HTML文件（如果文件很多，将花费较长时间）
" :VimWikiGoTo：转到指定的wiki页面
" :VimWikiIndex：转到wiki首页
" :VimWikiSearch /Ruchee/：搜索指定关键字，:cnext跳到下一个，:cprevious跳到上一个
" :VimWikiTable 3 2：插入一个2行3列的表格。注意，列数在前，行数在后
" :VimWikiDeleteLink：删除当前页面

" 快捷键
" <Leader>ww -- Open default wiki index file.

" <Leader>wt -- Open default wiki index file in a new tab.
" [count]<Leader>wt or <Plug>VimwikiTabIndex

" <Leader>ws -- Select and open wiki index file.
" <Leader>wd -- Delete wiki file you are in.
" <Leader>wr -- Rename wiki file you are in.
" <Enter> -- Folow/Create wiki link
" <Shift-Enter> -- Split and folow/create wiki link
" <Ctrl-Enter> -- Vertical split and folow/create wiki link
" <Backspace> -- Go back to parent(previous) wiki link
" <Tab> -- Find next wiki link
" <Shift-Tab> -- Find previous wiki link 

"Vimwiki 和 snipMate 的 <Tab> 热键冲突，可以将 $VIM/vimfiles/ftplugin/vimwiki.vim 中的第 293 行的 换成其他的热键
"修改399行 更改<tab>键为<C-tab>


" 使用鼠标映射
let g:vimwiki_use_mouse = 1

" 不要将驼峰式词组作为 Wiki 词条
let g:vimwiki_camel_case = 0

let g:vimwiki_list = [{
            \ 'path': '~/vimwiki/',
            \ 'path_html': '~/vimwiki/html/',
            \ 'template_path': '~/vimwiki/template/',
            \ 'template_default': 'def_template_blog',
            \ 'template_ext': '.html',
            \ 'auto_export': 1,
            \ 'nested_syntaxes': {'Clang': 'c', 'Go': 'go', 'Lisp': 'lisp', 'PHP': 'php', 'JS': 'javascript', 'CSS': 'css', 'HTML': 'html', 'XML': 'xml', 'SQL': 'sql', 'Bash': 'sh', 'Vim': 'vim', 'Make': 'make', 'CMake': 'cmake'}}]
" \ 'syntax': 'markdown',
" \ 'ext': '.wiki',

let g:vimwiki_valid_html_tags='b,i,s,u,sub,sup,kbd,br,hr,div,del,code' 

map <S-F11> :VimwikiAll2HTML<cr>
map <M-F12> :exec '!cd /home/ziikii/vimwiki/ && bash sync.sh'<cr>
" nmap <Leader>wd <Plug>VimwikiMakeDiaryNote

" Convert current wiki page to HTML.
nmap <Leader>wc <Plug>Vimwiki2HTML

" Convert current wiki page to HTML and open it in webbrowser.
nmap <Leader>wcc <Plug>Vimwiki2HTMLBrowse

" Follow/create wiki link 
nmap <Leader>wf <Plug>VimwikiFollowLink

" Follow wiki link (create target wiki page if needed), opening in a new tab.
" nmap <Leader>wt <Plug>VimwikiTabnewLink

" Go back to previous wiki page.
nmap <Leader>wb <Plug>VimwikiGoBackLink

" Find next link on the current page.
nmap <Leader>wn <Plug>VimwikiNextLink

" Find previous link on the current page.
nmap <Leader>wp <Plug>VimwikiPrevLink

" Delete wiki page you are in.
nmap <Leader>wdd <Plug>VimwikiDeleteLink

" Toggle list item on/off (checked/unchecked)
nmap <leader>wtt <Plug>VimwikiToggleListItem

" Move current table column to the left.
nmap <Leader>wtl <Plug>VimwikiTableMoveColumnLeft

" Move current table column to the right.
nmap <Leader>wtr <Plug>VimwikiTableMoveColumnRight

" Goto link provided by an argument.
nmap <Leader>wgo :VimwikiGoto  <C-R>=expand("<cword>")<CR> 

nmap <Leader>wse:VimwikiSearch /pattern/
" :VWS /pattern/
" Search for /pattern/ in all files of current wiki.
" To display all matches use |:lopen| command.
" To display next match use |:lnext| command.
" To display previous match use |:lprevious| command.

" Split and follow 
nmap <Leader>we <Plug>VimwikiSplitLink

" Vertical split and follow 
nmap <Leader>wq <Plug>VimwikiVSplitLink

" == diary ==
" Open diary index file 
nmap <Leader>wi <Plug>VimwikiDiaryIndex

" Open diary wiki-file for today 
nmap <Leader>wmd <Plug>VimwikiMakeDiaryNote

" Open diary wiki-file for today 
nmap <Leader>wmdt <Plug>VimwikiTabMakeDiaryNote


" Wiki syntax 
" Links to directories (ending with a "/") are also supported: >
" [[/home/somebody/|Home Directory]]
hi VimwikiHeader1 guifg=#FF0000 ctermbg=DarkBlue ctermfg=white
hi VimwikiHeader2 guifg=#00FF00 ctermbg=Red ctermfg=white
hi VimwikiHeader3 guifg=#0000FF ctermbg=Green ctermfg=white
hi VimwikiHeader4 guifg=#FF00FF ctermbg=DarkCyan ctermfg=white
hi VimwikiHeader5 guifg=#00FFFF ctermbg=DarkMagenta ctermfg=white
hi VimwikiHeader6 guifg=#FFFF00 ctermbg=DarkGrey ctermfg=white

let g:vimwiki_html_header_numbering_sym = '.'
" = Header level 1 =
" == Header level 2 ==
" === Header level 3 ===~
" ==== Header level 4 ====~
" ===== Header level 5 =====~
" ====== Header level 6 ======~

" Add header level. Create if needed.
nmap == <Plug>VimwikiAddHeaderLevel

" Remove header level.
nmap -- <Plug>VimwikiRemoveHeaderLevel




" -----------------------------------------------------------------
" 编译 && 运行	
" -----------------------------------------------------------------
" 编译源文件
func! CompileCode()
    exec "w"
    if &filetype == "c"
        exec "!colorgcc -Wall -std=c99 %<.c -o %<"
    elseif &filetype == "go"
        exec "!gccgo -Wall %<.go -o %<"
    elseif &filetype == "sh"
        exec "!bash %<.sh"
    elseif &filetype == "php"
        exec "!php %<.php"
    elseif &filetype == "make"
        exec "!colormake"
    endif
endfunc

" 运行可执行文件
func! RunCode()
    exec "w"
    if &filetype == "c" || &filetype == "go"
        exec "! ./%<"
    elseif &filetype == "sh"
        exec "!bash %<.sh"
    elseif &filetype == "php"
        exec "!php %<.php"
    elseif &filetype == "make"
        exec "! ./app"
    endif
endfunc


" -----------------------------------------------------------------	
" ConqueTerm 
" -----------------------------------------------------------------
" Usage 
" :ConqueTerm <command>
" :ConqueTermSplit <command>
" :ConqueTermVSplit <command>
" :ConqueTermTab <command> 

" set python versions 
let g:ConqueTerm_PyVersion = 2

" set enable fast mode 
let g:ConqueTerm_FastMode = 0

" terminal colors will always be enabled.
let g:ConqueTerm_Color = 0
let g:ConqueTerm_ColorMode = 'conceal'
" Session support 
let g:ConqueTerm_SessionSupport = 0

"Keep update terminal buffer 
let g:ConqueTerm_ReadUnfocused = 1

"Close buffer when program exits 
let g:ConqueTerm_CloseOnEnd = 0

let g:ConqueTerm_InsertOnEnter = 0
let g:ConqueTerm_StartMessages = 0
let g:ConqueTerm_PromptRegex = '^\w\+@[0-9A-Za-z_.-]\+:[0-9A-Za-z_./\~,:-]\+\$'

let g:ConqueTerm_Syntax = 'conque_term'
let g:ConqueTerm_EscKey = '<Esc>'
let g:ConqueTerm_ToggleKey = '<C-F8>'
let g:ConqueTerm_ExecFileKey = '<C-F11>'
let g:ConqueTerm_SendFileKey = '<C-F10>'
let g:ConqueTerm_SendVisKey = '<C-F9>'
let g:ConqueTerm_TERM = 'xterm'
nmap <F2> :ConqueTermSplit bash<CR>




"-----------------------------------------------------------------    
"vim记忆上次编辑的位置
"-----------------------------------------------------------------

autocmd BufReadPost *
            \ if line("'\"")>0&&line("'\"")<=line("$") |
            \   exe "normal g'\"" |
            \ endif

"-----------------------------------------------------------------    
"PHP 字典 
"-----------------------------------------------------------------
"au FileType php setlocal dict+=~/.vim/dict/php_funclist.txt


"-----------------------------------------------------------------    
"netrw settings
"-----------------------------------------------------------------
"vim scp://root@198.71.90.13//root/
"p    Preview the file 
"o    Enter the file/directory under the cursor  
"t    Enter the file/directory under the cursor in a new tab 
"<cr>   Netrw will enter the directory or read the file 


"不使用netrw
"let g:loaded_netrw       = 1
"let g:loaded_netrwPlugin = 1

"=0 split window 
"=1 vertically split window 
let g:netrw_preview  =1

"cygwin 环境
let g:netrw_cygwin = 0 
let g:netrw_fastbrowse = 2
let g:netrw_hide = 0
let g:netrw_sort_by = "name"

"-----------------------------------------------------------------    
"cscope 
"-----------------------------------------------------------------
"if has("cscope")
    "set csprg=/usr/local/bin/cscope
    "set csto=0
    "set cst
    "set nocsverb
    "" add any database in current directory
    "if filereadable("cscope.out")
        "cs add cscope.out
    "" else add database pointed to by environment
    "elseif $CSCOPE_DB != ""
        "cs add $CSCOPE_DB
    "endif
    "set csverb
"endif

"map <C-_> :cstag <C-R>=expand("<cword>")<CR><CR>
"map g<C-]> :cs find 3 <C-R>=expand("<cword>")<CR><CR>
"map g<C-\> :cs find 0 <C-R>=expand("<cword>")<CR><CR>
"nmap <C-_>s :cs find s <C-R>=expand("<cword>")<CR><CR>
"nmap <C-_>g :cs find g <C-R>=expand("<cword>")<CR><CR>
"nmap <C-_>c :cs find c <C-R>=expand("<cword>")<CR><CR>
"nmap <C-_>t :cs find t <C-R>=expand("<cword>")<CR><CR>
"nmap <C-_>e :cs find e <C-R>=expand("<cword>")<CR><CR>
"nmap <C-_>f :cs find f <C-R>=expand("<cfile>")<CR><CR>
"nmap <C-_>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
"nmap <C-_>d :cs find d <C-R>=expand("<cword>")<CR><CR>


"-----------------------------------------------------------------    
"Scrolling in Insert mode			
"-----------------------------------------------------------------
inoremap <C-E> <C-X><C-E>
inoremap <C-Y> <C-X><C-Y>



"-----------------------------------------------------------------    
"Smooth scrolling					
"-----------------------------------------------------------------
map <C-U> <C-Y><C-Y><C-Y><C-Y><C-Y><C-Y><C-Y><C-Y><C-Y><C-Y><C-Y><C-Y><C-Y><C-Y><C-Y><C-Y>
map <C-D> <C-E><C-E><C-E><C-E><C-E><C-E><C-E><C-E><C-E><C-E><C-E><C-E><C-E><C-E><C-E><C-E>


"=================================================================
"个人配置结束
"=================================================================
