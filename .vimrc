let mapleader=";"                               "定义Leader键
filetype on                                     "侦测文件类型
filetype plugin on                              "侦测类型开启插件
filetype indent on                              "侦测语言的智能缩

call plug#begin('~/.vim/plugged')
Plug 'rking/ag.vim'
Plug 'ludovicchabant/vim-gutentags'
Plug 'voldikss/vim-floaterm'                    " 浮动终端
Plug 'nanotech/jellybeans.vim'                  " 主题
Plug 'mhinz/vim-startify'                       " 首页
Plug 'liuchengxu/vista.vim'
Plug 'scrooloose/nerdtree'                      " 资源管理树
Plug 'vim-airline/vim-airline'                  " 状态栏
Plug 'vim-airline/vim-airline-themes'           " 状态栏主题
Plug 'easymotion/vim-easymotion'                " 超级跳转
Plug 't9md/vim-choosewin'                       " 窗口选择
Plug 'luochen1990/rainbow'                      " 彩虹括号
Plug 'ybian/smartim'                            " 解决中文输入法无法输入命令
Plug 'lfv89/vim-interestingwords'               " 变量彩色凸显
Plug 'brooth/far.vim'                           " 替换
Plug 'Yggdroot/indentLine'                      " 缩进线
Plug 'tpope/vim-commentary'                     " 注释
Plug 'jiangmiao/auto-pairs'                     " 自动补全引号、圆括号、花括号等
" Plug 'itchyny/vim-cursorword'                   " 变量下划线
Plug 'neoclide/coc.nvim', {'branch': 'release'} " 补全工具
Plug 'davidhalter/jedi-vim'                     " python补全工具
Plug 'junegunn/vim-easy-align'                  " 文本对齐
Plug 'dyng/ctrlsf.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'Yggdroot/LeaderF', { 'do': './install.sh'  }
Plug 'voldikss/vim-translator'                  " 翻译插件
Plug 'voldikss/vim-browser-search'              " 搜索插件
" Git
Plug 'rhysd/git-messenger.vim'                  " git提交查询
Plug 'tpope/vim-fugitive'                       " git命令封装
Plug 'airblade/vim-gitgutter'                   " 显示git更改标示
Plug 'junegunn/gv.vim'                          " git提交树
call plug#end()

nnoremap <Leader><Leader>i :PlugInstall<CR>     "安装插件
nnoremap <Leader><Leader>u :PlugUpdate<CR>      "更新插件
nnoremap <Leader><Leader>c :PlugClean<CR>       "删除插件
nnoremap <Leader><Leader>p :PlugUpgrade<CR>    "更新插件管理器

"+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

" kite
let g:kite_supported_languages = ['python', 'vimrc']

" liuchengxu/vista.vim
nnoremap vs :Vista<CR>
let g:vista_echo_cursor_strategy ='scroll'       " 启用悬浮窗预览
let g:vista_sidebar_width = 30                   " 宽度
let g:vista_close_on_jump = 1                    " 跳转到一个符号时，自动关闭vista窗口.
let g:vista_stay_on_open = 1                     " 打开vista窗口后移动到它.
let g:vista#executive#ctags#support_json_format = 1
let g:vista#executives = ['ale', 'coc', 'ctags', 'lcn', 'vim_lsc', 'vim_lsp']
let g:vista#finders = ['LeaderF']
let g:vista#renderer#ctags = 'default'
let g:vista#renderer#default#vlnum_offset = 3
let g:vista#renderer#enable_icon = 1
let g:vista#renderer#kind_default_icon = ['╰─▸ ', '├─▸ ']
let g:vista_fold_toggle_icons = ['▸', '▾']
let g:vista#renderer#icons = {'subroutine': '洛', 'method': '', 'func': '', 'variables': '', 'namespace': '', 'field': '綠', 'interface': '禍', 'type': '', 'packages': '', 'property': '襁', 'implementation': '', 'default': '', 'augroup': 'פּ', 'macro': '', 'enumerator': '', 'const': '', 'macros': '', 'map': 'פּ', 'fields': '綠', 'functions': '', 'enum': '', 'function': '', 'target': '', 'typedef': '', 'variable': '', 'modules': '', 'constant': '', 'struct': 'פּ', 'types': '', 'module': '', 'typeParameter': '', 'package': '', 'class': '', 'member': '', 'var': '', 'union': '鬒'}

" voldikss/vim-translator
let g:translator_history_enable = 1
let g:translator_default_engines = ['bing']
nmap <silent> ,t <Plug>Translate
vmap <silent> ,t <Plug>TranslateV 
nmap <silent> ,w <Plug>TranslateW
vmap <silent> ,w <Plug>TranslateWV
nmap <silent> ,r <Plug>TranslateR
vmap <silent> ,r <Plug>TranslateRV

" voldikss/vim-browser-search
vmap <silent> <Leader>sb <Plug>SearchVisual

" Yggdroot/indentLine
let g:indentLine_char = '|'
let g:indentLine_enabled = 1
let g:indentLine_color_term = 238
let g:indentLine_fileTypeExclude = ['startify', 'coc-explorer', 'json']

" voldikss/vim-floaterm
let g:floaterm_position = 'center'
hi FloatermNF guibg=black
hi FloatermBorderNF guibg=red guifg=cyan
tnoremap <ESC> <C-\><C-n> :q<CR>
nnoremap <silent> fn :FloatermNew<CR>
nnoremap <silent> ft :FloatermToggle<CR>
nnoremap <silent> fnn :FloatermNext<CR>
nnoremap <silent> fpp :FloatermPrev<CR>

" neoclide/coc.nvim
"  安装依赖
set hidden         " 如果没有设置，TextEdit可能失效
set cmdheight=2    " 更好显示消息
set shortmess+=c   " 不要完成菜单消息
set signcolumn=yes " 始终显示信号
" 补全设置
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction
" 完成补全
inoremap <silent><expr> <c-space> coc#refresh()
" 导航到诊断
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)
" 文档展示
nnoremap <silent> <space>k :call <SID>show_documentation()<CR>
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction
" 凸显符号
autocmd CursorHold * silent call CocActionAsync('highlight')
" 状态栏显示函数
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

nnoremap <silent> <space>d  :<C-u>CocList diagnostics<cr>
nnoremap <silent> <space>p  :<C-u>CocList extensions<cr>
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
nnoremap <silent> <space>e :CocCommand explorer<CR>
" coc-extensions
let g:coc_global_extensions = [
  \ 'coc-snippets',
  \ 'coc-floaterm',
  \ 'coc-todolist',
  \ 'coc-spell-checker',
  \ 'coc-bookmark',
  \ 'coc-python',
  \ 'coc-diagnostic',
  \ 'coc-browser',
  \ ]
" coc-floaterm
nnoremap ,cf :CocCommand floaterm.new<CR>
nnoremap ,cn :CocCommand floaterm.next<CR>
nnoremap ,cp :CocCommand floaterm.prev<CR>
nnoremap ,ct :CocCommand floaterm.toggle<CR>
" coc-bookmark
nmap ,clb :CocList bookmark<CR>
nmap ,b :CocCommand bookmark.toggle<CR>
nmap ,a :CocCommand bookmark.annotate<CR>
nmap ,gh :CocCommand bookmark.prev<CR>
nmap ,gl :CocCommand bookmark.next<CR>
" coc-todolist
nmap ,ctc :CocCommand todolist.create<CR>
nmap ,ctu :CocCommand todolist.upload<CR>
nmap ,ctd :CocCommand todolist.download<CR>
nmap ,ctn :CocCommand todolist.clearNotice<CR>
nmap ,cl :CocList todolist<CR>

" junegunn/vim-easy-align
xmap <Leader>ga <Plug>(EasyAlign)
nmap <Leader>ga <Plug>(EasyAlign)

" dyng/ctrlsf  #install -y ack-grep 依赖ack/ag/pt/rg之一
nnoremap <Leader>cf :CtrlSF<Space>
nnoremap <Leader>cfc :CtrlSFClose<CR>
nmap <silent>cfs <Plug>CtrlSFCCwordPath<CR>
let g:ctrlsf_ackprg = 'ag'     " 搜索引擎
let g:ctrlsf_position = "right" " 左右打开Linux用let g:ctrlsf_open_left = 0

" Yggdroot/LeaderF
let g:Lf_ReverseOrder = 0   "自下而上显示
let g:Lf_WindowPosition = 'popup'
let g:Lf_PreviewInPopup = 1
let g:Lf_StlSeparator = { 'left': "\ue0b0", 'right': "\ue0b2", 'font': "DejaVu Sans Mono for Powerline" }
let g:Lf_PreviewResult = {'Function': 0, 'BufTag': 0 }
nnoremap lf :LeaderfFile<CR>
nnoremap lb :LeaderfBuffer<CR>
nnoremap lm :LeaderfMru<CR>
nnoremap lft :LeaderfFunction<CR>
nnoremap le :LeaderfLine<CR>

" Git相关
" vim-fugitive
nnoremap <Leader>gw :Gwrite<cr>
nnoremap <Leader>gc :Gcommit<cr>
nnoremap <Leader>gb :Gblame<cr>
nnoremap <Leader>gd :Gvdiff<cr>
nnoremap <Leader>gs :Gstatus<cr>
nnoremap <Leader>gm :Gmerge<cr>
nnoremap <Leader>gu :Gpush<cr>
nnoremap <Leader>gl :Glog<cr>
nnoremap <Leader>gv :GV<CR>
"rhysd/git-messenger
nnoremap <Leader>gm :GitMessenger<CR>
" vim-gitgutter
let g:gitgutter_max_signs = 800     "更改显示标示行数限制

" lfv89/vim-interestingwords
nnoremap <silent> <Leader>iw :call InterestingWords('n')<CR>
nnoremap <silent> <Leader>IW :call UncolorAllWords()<CR>
nnoremap <silent> <Leader>n :call WordNavigation('forward')<CR>
nnoremap <silent> <Leader>N :call WordNavigation('backward')<CR>

" t9md/vim-choosewin
nmap - <Plug>(choosewin)
let g:choosewin_overlay_enable = 0

" vim-easymotion 
let g:EasyMotion_smartcase = 1      "忽略大小写
map <Leader>ss <Plug>(easymotion-s2)
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)
map <leader>h <Plug>(easymotion-linebackward)
map <leader>l <Plug>(easymotion-lineforward)
map <leader>r <Plug>(easymotion-repeat)

" luohen199/rainbow
let g:rainbow_active = 1

" vim-airline/vim-airline
nnoremap <silent> <C-D> :bprevious<CR>:bdelete #<CR>
nnoremap <silent> <C-N> :bn<CR>
nnoremap <silent> <C-P> :bp<CR>
let g:airline_powerline_fonts = 1                 " 这个是安装字体后必须设置此项
let g:airline_theme='ubaryd'                      " luna,term,tomorrow,ubaryd,zenburn
let g:airline#extensions#tabline#enabled=1        " 用顶部tabline
let g:airline#extensions#tabline#buffer_nr_show=0 " 显示buffer编号

" startify
let g:webdevicons_enable_startify = 1
noremap <Leader>si :Startify<CR>
let g:startify_bookmarks = [
  \ {'c': '~/dotfiles/.vimrc' },
  \ ]

" scrooloose/nerdtree
nnoremap nt :NERDTreeToggle<CR>
nnoremap ntf :NERDTreeFind<CR>
let NERDTreeShowHidden=0                        "是否显示隐藏文件
let NERDTreeWinSize=25                          "设置宽度
let NERDTreeShowBookmarks=1                     "显示书签列表
let NERDTreeIgnore=['\.pyc','\~$','\.swp']      "忽略一下文件的显示
let g:NERDTreeDirArrowExpandable = '▸'          "修改默认箭头'▸' '▾'
let g:NERDTreeDirArrowCollapsible = '▾'
let NERDTreeAutoDeleteBuffer=1                  "删除文件时自动删除文件对应 buffer
let NERDTreeMinimalUI=1                         "不显示冗余帮助信息
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif   ""当NERDTree为剩下的唯一窗口时自动关闭

"通用设置 ------
" set fillchars+=vert:\ 
" set fillchars=vert:\ ,stl:\ ,stlnc:\ 
set t_Co=256                                            " 开启256色支持
set guifont=Monaco:h16                                  " 默认字体和大小
set showtabline=0                                       " 隐藏顶部标签栏
set guioptions-=r                                       " 隐藏右侧滚动条
set guioptions-=L                                       " 隐藏左侧滚动条
set guioptions-=b                                       " 隐藏底部滚动条
set laststatus=2                                        " 显示状态栏
set ruler                                               " 显示光标位置
set cursorline                                          " 高亮行
set background=dark                                     " 背景色
colorscheme jellybeans
set splitbelow                                          " 允许在下部分割布局
set splitright                                          " 允许在右侧分隔布局
syntax enable                                           " 开启语法高亮
syntax on                                               " 自动语法高亮
set showmatch                                           " 高亮显示匹配的括号
set matchtime=1                                         " 匹配括号高亮的时间（单位是十分之一秒）
set noeb                                                " 关闭错误的提示
set nocompatible                                        " 不兼容原始vi模式
set cmdheight=2                                         " 命令行的高度
set showcmd                                             " select模式下显示选中的行数
set whichwrap+=<,>,h,l                                  " 光标键跨行
set ttimeoutlen=0                                       " <ESC>键响应时间
set virtualedit=block,onemore                           " 允许光标出现在最后一个字符的后面
set magic                                               " 设置魔术
set clipboard=unnamed                                   " 共享粘贴板
set numberwidth=4                                       " 默认占据4空间,超过999行时更改
set smartindent                                         " 智能的选择对齐方式
set expandtab                                           " 将制表符扩展为空格
set nu smarttab autoindent sw=4 ts=4 sts=4 et tw=78 shiftwidth=4 tabstop=4 softtabstop=4
set nowrap                                              " 禁止折行
set backspace=2                                         " 使用回车键正常处理indent,eol,start等
set sidescroll=10                                       " 向右滚动字符数
set nobackup                                            " 不要备份
set nowritebackup                                       " 不要写入备份
set noswapfile                                          " 禁止生成临时文件交换文件
set confirm                                             " 在处理未保存或只读文件的时候，弹出确认
set langmenu=zh_CN.UTF-8        
set helplang=cn
set encoding=utf-8                                      " 新文件的编码为 UTF-8
set termencoding=utf-8                                  " 只影响普通模式 (非图形界面) 下的 Vim
set fileencodings=utf8,ucs-bom,gbk,cp936,gb2312,gb18030 " 自动编码依次尝试
set fileformat=unix                                     " unix的格式保存文件
set updatetime=30                                       " 30毫秒更新
set belloff=all                                         " 所有事件下（包括错按esc，错按backspace）不发出声音
set autoread                                            " 设置当文件被改动时自动载入
set completeopt=preview,menu                            " 代码补全
set scrolloff=6                                         " 光标移动到buffer的顶部和底部时保持3行距离
set undofile
set undodir=~/.vim/undo/

" 快捷键
"" 窗口选择与移动
inoremap kj <esc>
nnoremap H ^
nnoremap L $
" 窗口跳转
noremap <Leader>cc <C-w>c
noremap <Leader>hh <C-w>h
noremap <Leader>jj <C-w>j
noremap <Leader>kk <C-w>k
noremap <Leader>ll <C-w>l
noremap <Leader>ww <C-w>w
" 窗口分屏
nnoremap sl :set splitright<CR>:vsplit<CR>
nnoremap sj :set splitbelow<CR>:split<CR>
" 移动分屏
nnoremap svs <C-w>t<C-w>H                                  
nnoremap svh <C-w>t<C-w>K
" 窗口通知
nnoremap <Leader>m :messages<CR>
nnoremap <Leader>t :TabMessage messages<CR>
" 命令模式移动
cnoremap <C-a> <Home>
cnoremap <C-e> <End>
cnoremap <C-p> <Up>
cnoremap <C-n> <Down>
cnoremap <C-b> <S-Left>
cnoremap <C-f> <S-Right>
cnoremap <C-h> <Left>
cnoremap <C-l> <Right>
" 文件相关
nnoremap fs :w<CR>
nnoremap W :wa<CR>
nnoremap q :q<CR>
nnoremap Q :qa!<CR>
nnoremap rn :set relativenumber!<CR>
nnoremap ev :edit $MYVIMRC<CR>
nnoremap sm :source $MYVIMRC<CR>
