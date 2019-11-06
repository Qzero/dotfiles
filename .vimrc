let mapleader=";"                               "定义Leader键
filetype on                                     "侦测文件类型
filetype plugin on                              "侦测类型开启插件
filetype indent on                              "侦测语言的智能缩

call plug#begin('~/.vim/plugged')
Plug 'levelone/tequila-sunrise.vim'    " 主题
Plug 'mhinz/vim-startify'              " 首页
Plug 'majutsushi/tagbar'               " 文件大纲工具
Plug 'scrooloose/nerdtree'             " 资源管理树
Plug 'vim-airline/vim-airline'         " 状态栏
Plug 'vim-airline/vim-airline-themes'  " 状态栏主题
" 效率
Plug 'easymotion/vim-easymotion'       " 超级跳转
Plug 't9md/vim-choosewin'              " 窗口选择
Plug 'luochen1990/rainbow'             " 彩虹括号
Plug 'ybian/smartim'                   " 解决中文输入法无法输入命令
Plug 'lfv89/vim-interestingwords'      " 变量彩色凸显
Plug 'brooth/far.vim'                  " 替换
Plug 'nathanaelkane/vim-indent-guides' " 显示缩进
Plug 'tpope/vim-commentary'            " 注释
Plug 'jiangmiao/auto-pairs'            " 自动补全引号、圆括号、花括号等
Plug 'itchyny/vim-cursorword'          " 变量下划线
Plug 'Shougo/neocomplcache.vim'        " 补全工具
Plug 'junegunn/vim-easy-align'         " 文本对齐
Plug 'pacha/vem-tabline'               " 显示标签
Plug 'sillybun/vim-repl'               " 调试插件
" 文件搜索
Plug 'dyng/ctrlsf.vim'
" Plug 'Yggdroot/LeaderF', { 'do': './install.sh' }
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
" Git
Plug 'tpope/vim-fugitive'              " git命令封装
Plug 'airblade/vim-gitgutter'          " 显示git更改标示
Plug 'junegunn/gv.vim'                 " git提交树
Plug 'mbbill/undotree'                 " 文件版本回溯
call plug#end()

" ------ pacha/vem-tabline
" set hidden
let g:vem_tabline_show = 2
nmap <leader>tbl <Plug>vem_move_buffer_left-
nmap <leader>tbr <Plug>vem_move_buffer_right-
nmap <leader>pp <Plug>vem_prev_buffer-
nmap <leader>nn <Plug>vem_next_buffer-

" ------ sillybun/vim-repl
"  调试:REPLDebug 断点:REPLDebugStopAtCurrentLine 运行代码:REPLPDBC
"  单步执行:REPLPDBN 进入函数:REPLPDBS 进入上一个栈:REPLPDBU
let g:repl_position = 3
let g:repl_program = {
            \   'python': 'python',
            \   'default': 'zsh'
            \   }
let g:repl_predefine_python = {
            \   'numpy': 'import numpy as np',
            \   'matplotlib': 'from matplotlib import pyplot as plt'
            \   }
nnoremap <leader>rl :REPLToggle<Cr>
autocmd Filetype python nnoremap <Leader>rld <Esc>:REPLDebugStopAtCurrentLine<Cr>
autocmd Filetype python nnoremap <Leader>rln <Esc>:REPLPDBN<Cr>
autocmd Filetype python nnoremap <Leader>rlb <Esc>:REPLPDBS<Cr>

" ------ junegunn/vim-easy-align
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

" ----- junegunn/fzf
nnoremap <Leader>fl :Files<CR>
nnoremap <Leader>fb :Buffers<CR>
nnoremap <Leader>fle :Lines<Space>

" ------ Yggdroot/LeaderF
" let g:Lf_ReverseOrder = 1   "自下而上显示
" nnoremap <leader>lf :LeaderfFile<CR>
" nnoremap <leader>lb :LeaderfBuffer<CR>
" nnoremap <leader>lm :LeaderfMru<CR>
" nnoremap <leader>lft :LeaderfFunction<CR>
" nnoremap <leader>le :LeaderfLine<CR>

" ------ dyng/ctrlsf  #install -y ack-grep 依赖ack/ag/pt/rg之一
nnoremap <Leader>cf :CtrlSF<Space>
nnoremap <Leader>cfc :CtrlSFClose<CR>
nmap <silent><leader>cfs <Plug>CtrlSFCCwordPath<CR>
let g:ctrlsf_ackprg = 'ag'     " ag引擎
let g:ctrlsf_position = "right" " 左右打开Linux用let g:ctrlsf_open_left = 0

"------ Git相关
" vim-fugitive
nnoremap <silent><leader>gw :Gwrite<cr>
nnoremap <silent><leader>gc :Gcommit<cr>
nnoremap <silent><leader>gb :Gblame<cr>
nnoremap <silent><leader>gd :Gvdiff<cr>
nnoremap <silent><leader>gs :Gstatus<cr>
nnoremap <Leader>gv :GV<CR>

let g:gitgutter_max_signs = 800     "更改显示标示行数限制

" ------ mbbill/undotree
nnoremap <Leader>ut :UndotreeToggle<cr>
if has("persistent_undo")
    set undodir=$HOME."/.undodir"
        set undofile
    endif

" ------ lfv89/vim-interestingwords
nnoremap <silent> <leader>k :call InterestingWords('n')<CR>
nnoremap <silent> <leader>K :call UncolorAllWords()<CR>
nnoremap <silent> n :call WordNavigation('forward')<CR>
nnoremap <silent> N :call WordNavigation('backward')<CR>

" ------ t9md/vim-choosewin
nmap <Leader>vv <Plug>(choosewin)
let g:choosewin_overlay_enable = 0

" ------ vim-easymotion 
let g:EasyMotion_smartcase = 1      "忽略大小写
map ss <Plug>(easymotion-s2)
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)
map <leader>h <Plug>(easymotion-linebackward)
map <leader>l <Plug>(easymotion-lineforward)
map <leader>r <Plug>(easymotion-repeat)

" ------ nathanaelkane/vim-indent-guides
let g:indent_guides_enable_on_vim_startup = 1 " vim启动时启用
let g:indent_guides_start_level = 2           " 第二层缩进开始显示
let g:indent_guides_guide_size = 1            " 色块宽度
let g:indent_guides_tab_guides = 1            " 对tab对齐的禁用
let g:indent_guides_auto_colors = 0           " 自定义关联可视化颜色
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=#009A65 ctermbg=4
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=#8ECCCB ctermbg=3

" ------ luochen199/rainbow
let g:rainbow_active = 1

" ------ Shougo/neocomplcache.vim
set completeopt-=preview                   " 关闭预览
let g:neocomplcache_enable_at_startup = 1  " 系统启动时自动启动
let g:neocomplcache_enable_auto_select = 1 " 默认选择第一个选项,设置为0每次就需要自行选择
let g:neocomplcache_min_keyword_length = 3 " 从第三个字符开始语法提示

" ------ vim-airline/vim-airline
let g:airline_powerline_fonts = 0                 " 这个是安装字体后必须设置此项
let g:airline_theme='ubaryd'                      " luna,term,tomorrow,zenburn
let g:airline#extensions#tabline#buffer_nr_show=1 " 显示buffer编号
let g:airline#extensions#tabline#enabled=1        " 用顶部tabline
let g:airline#extensions#tabline#left_sep = ' '   " 顶部tabline显示方式
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#formatter = 'default'

" ------ Tagbar 安装依赖 : install ctags
nnoremap <Leader>tb :TagbarToggle<CR>
let g:tagbar_ctags_bin = 'ctags'        "tagbar依赖ctags插件
let g:tagbar_compact = 1                  "tagbar 子窗口中不显示冗余帮助信息
" let g:tagbar_left = 1                   "让tagbar在页面左侧显示，默认右DTree快捷键
let g:tagbar_width = 25                 "设置tagbar的宽度
let g:tagbar_autofocus = 1              "tagbar一打开，光标即在tagbar页面内
let g:tagbar_sort = 0                   "设置标签不排序，默认排序
let g:tagbar_autoshowtag = 1            "当编辑代码时，在Tagbar自动追踪变量
let g:tagbar_iconchars = ['+', '-']     "修改默认剪头'▸', '▾'

" ------ scrooloose/nerdtree
nnoremap <Leader>nt :NERDTreeToggle<CR>
nnoremap <Leader>ntf :NERDTreeFind<CR>
" let NERDTreeWinPos="right"                      "显示位置
let NERDTreeShowHidden=0                        "是否显示隐藏文件
let NERDTreeWinSize=25                          "设置宽度
let NERDTreeShowBookmarks=1                     "显示书签列表
let NERDTreeIgnore=['\.pyc','\~$','\.swp']      "忽略一下文件的显示
let g:NERDTreeDirArrowExpandable = '+'          "修改默认箭头'▸' '▾'
let g:NERDTreeDirArrowCollapsible = '-'
" autocmd vimenter * NERDTree                   "打开vim时自动打开NERDTree
let NERDTreeAutoDeleteBuffer=1                  "删除文件时自动删除文件对应 buffer
let NERDTreeMinimalUI=1                         "不显示冗余帮助信息
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif   ""当NERDTree为剩下的唯一窗口时自动关闭

"+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
"通用设置 ------
set t_Co=256                    "开启256色支持
set guifont=Monaco:h16    		"默认字体和大小
set showtabline=0               "隐藏顶部标签栏
set guioptions-=r               "隐藏右侧滚动条
set guioptions-=L               "隐藏左侧滚动条
set guioptions-=b               "隐藏底部滚动条
set laststatus=2                "显示状态栏
set ruler                       "显示光标位置
set background=dark             "背景色
colorscheme tequila-sunrise     "主题
set splitbelow               	"允许在下部分割布局
set splitright               	"允许在右侧分隔布局
syntax enable                   "开启语法高亮
syntax on                       "自动语法高亮
set showmatch                   "高亮显示匹配的括号
set matchtime=1                 "匹配括号高亮的时间（单位是十分之一秒）
set noeb                        "关闭错误的提示
set nocompatible                "不兼容原始vi模式
set cmdheight=2                 "命令行的高度
set showcmd                     "select模式下显示选中的行数
set whichwrap+=<,>,h,l          "光标键跨行
set ttimeoutlen=0               "<ESC>键响应时间
set virtualedit=block,onemore   "允许光标出现在最后一个字符的后面
set magic						"设置魔术
set clipboard=unnamed           "共享粘贴板
set numberwidth=5               "默认占据4空间,超过999行时更改
set smartindent                 "智能的选择对齐方式
set expandtab                   "将制表符扩展为空格
set nu smarttab autoindent sw=4 ts=4 sts=4 et tw=78 shiftwidth=4 tabstop=4 softtabstop=4
set nowrap                      "禁止折行
set backspace=2                 "使用回车键正常处理indent,eol,start等
set sidescroll=10               "向右滚动字符数
set nobackup                    "备份地址
set noswapfile                  "禁止生成临时文件
set confirm                     "在处理未保存或只读文件的时候，弹出确认
set langmenu=zh_CN.UTF-8        
set helplang=cn
set encoding=utf-8              "新文件的编码为 UTF-8
set termencoding=utf-8          "只影响普通模式 (非图形界面) 下的 Vim
set fileencodings=utf8,ucs-bom,gbk,cp936,gb2312,gb18030     "自动编码依次尝试
set fileformat=unix             "unix的格式保存文件
set updatetime=100              "100毫秒更新
" set belloff=all                         "所有事件下（包括错按esc，错按backspace）不发出声音
set autoread                            "设置当文件被改动时自动载入
set completeopt=preview,menu            "代码补全
set scrolloff=3                         "光标移动到buffer的顶部和底部时保持3行距离
autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | execute "normal! g'\"" | endif

"快捷键 ------ 
"" 窗口选择与移动
imap kj <esc>
imap KJ <esc>
noremap H ^
noremap L $
noremap <Leader>cc <C-w>c
noremap <Leader>hh <C-w>h
noremap <Leader>jj <C-w>j
noremap <Leader>kk <C-w>k
noremap <Leader>ll <C-w>l
noremap <Leader>vw <C-w>w
map sr :set splitright<CR>:vsplit<CR>
map sl :set nosplitright<CR>:vsplit<CR>
map sk :set nosplitbelow<CR>:split<CR>
map sj :set splitbelow<CR>:split<CR>
map <C-k> :res +3<CR>
map <C-j> :res -5<CR>                                
map <C-h> :vertical resize+5<CR>                     
map <C-l> :vertical resize-5<CR>                    
map svs <C-w>t<C-w>H                                  
map svh <C-w>t<C-w>K                                  
"使用tab补全
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
map <Leader>w :w<CR>
map <Leader>q :q<CR>
nnoremap <Leader>rn :set relativenumber!<CR>                    "显示相对行号
nnoremap <Leader>vc :edit $MYVIMRC<CR>                          "编辑vimrc文件
map <Leader>s :source $MYVIMRC<CR>                         "重新加载vimrc文件
" 插件与调试
nnoremap <Leader><Leader>i :PlugInstall<CR>     "安装插件
nnoremap <Leader><Leader>u :PlugUpdate<CR>      "更新插件
nnoremap <Leader><Leader>c :PlugClean<CR>       "删除插件
nnoremap <Leader><Leader>pu :PlugUpgrade<CR>    "更新插件管理器
nnoremap <Leader>is iimport ipdb; ipdb.set_trace()
nnoremap <Leader>tm :belowright term<CR>
