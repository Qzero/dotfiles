syntax on           " 自动语法高亮
syntax enable       " 开启语法高亮
filetype plugin indent on
let mapleader = ";" " 定义Leader键

call plug#begin('~/.vim/plugged')
Plug 'scrooloose/nerdtree'                      " 资源管理树
" Plug 'jistr/vim-nerdtree-tabs'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'voldikss/vim-browser-search'              " web搜索

Plug 'tpope/vim-surround'                       " 符号成对修改
Plug 'tpope/vim-repeat'                         " 重复操作

Plug 'gcmt/wildfire.vim'                        " 代码块选择
Plug 'jpo/vim-railscasts-theme'                 " 主题
Plug 'roxma/vim-tmux-clipboard'                 " vim tmux共享剪贴板
" Plug 'farmergreg/vim-lastplace'                 " 打开文件跳转到最后一次位置
Plug 'voldikss/vim-floaterm'                    " 浮动终端
Plug 'mhinz/vim-startify'                       " 首页
Plug 'ryanoasis/vim-devicons'                   " 文件图标

Plug 'vim-airline/vim-airline'                  " 状态栏
Plug 'vim-airline/vim-airline-themes'           " 状态栏主题
Plug 'easymotion/vim-easymotion'                " 超级跳转
" Plug 't9md/vim-choosewin'                       " 窗口选择
Plug 'luochen1990/rainbow'                      " 彩虹括号
Plug 'ybian/smartim'                            " 中文输入法无法输入命令
Plug 'lfv89/vim-interestingwords'               " 单词彩色凸显
" Plug 'brooth/far.vim'                           " 替换
Plug 'Yggdroot/indentLine'                      " 缩进线
Plug 'scrooloose/nerdcommenter'                 " 注释
Plug 'junegunn/vim-easy-align'                  " 文本对齐
Plug 'windwp/nvim-autopairs'                    " 括号配对插件
"Plug 'neoclide/coc.nvim', {'branch': 'release'} " 补全框架
Plug 'neoclide/coc.nvim', {'branch': 'master', 'do': 'npm ci'}
Plug 'junegunn/fzf.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'liuchengxu/vista.vim'                     " 大纲
Plug 'bronson/vim-trailing-whitespace'          " 去除行尾空白
Plug 'liuchengxu/vim-clap', { 'do': ':Clap install-binary!' } "模糊搜索
" Git
Plug 'rhysd/git-messenger.vim'                  " git提交查询
Plug 'tpope/vim-fugitive'                       " git更改标识
Plug 'junegunn/gv.vim'                          " git提交树
Plug 'mbbill/undotree'                          " git本地文件树

" if has('nvim'" )

" Plug 'nvim-neo-tree/neo-tree.nvim'
" Plug 'nvim-lua/plenary.nvim'
" Plug 'nvim-treesitter/nvim-treesitter'
" Plug 'olimorris/codecompanion.nvim'

" endif


call plug#end()

nnoremap <Leader><Leader>i :PlugInstall<CR>     " 安装插件
nnoremap <Leader><Leader>u :PlugUpdate<CR>      " 更新插件
nnoremap <Leader><Leader>c :PlugClean<CR>       " 删除插件
nnoremap <Leader><Leader>p :PlugUpgrade<CR>     " 更新插件管理器
nnoremap <Leader><Leader>s :PlugStatus<CR>

"+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

" junegunn/fzf.vim
nnoremap <Leader>fh :History:<cr>
" 搭配fugitive.vim使用
nnoremap <Leader>fc :Commits<cr>
nnoremap <Leader>fb :BCommits<cr>

" mhinz/vim-startify
nnoremap <Leader>si :Startify<CR>
autocmd vimenter * Startify
let g:webdevicons_enable_startify = 1
let g:startify_bookmarks = [
  \ {'a': '~/hejie.xyz/_config.yml'},
  \ {'b': '~/python/00.py'},
  \ {'c': '~/dotfiles/.vimrc' }
  \ ]
let g:startify_files_number = 9

" scrooloose/nerdtree
nnoremap <Leader>nt :NERDTreeToggle<CR>
nnoremap <Leader>ntf :NERDTreeFind<CR>
let NERDTreeWinPos="right"
let NERDTreeShowHidden=1
let NERDTreeWinSize=26
let g:NERDTreeAutoDeleteBuffer=1
let NERDTreeShowBookmarks=1
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
let NERDTreeAutoDeleteBuffer=1                  "删除文件时自动删除文件对应 buffer
let NERDTreeMinimalUI=1                         "不显示冗余帮助信息
" 当 Vim 启动时没有文件参数时，启动 NERDTree。
" autocmd StdinReadPre * let s:std_in=1
" autocmd VimEnter * if argc() == 0 && !exists('s:std_in') | NERDTree | endif
" nerdtree忽略类型
let g:NERDTreeIgnore = ['\.vim$','\~$','\.beam','elm-stuff','deps','_build','.git','node_modules','tags','.pyc','.swp',]
" 如果 NERDTree 是唯一剩下的窗口，则退出 Vim。
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
" Xuyuanp/nerdtree-git-plugin
let g:NERDTreeGitStatusIndicatorMapCustom = {
                \ 'Modified'  :'✹',
                \ 'Staged'    :'✚',
                \ 'Untracked' :'✭',
                \ 'Renamed'   :'➜',
                \ 'Unmerged'  :'═',
                \ 'Deleted'   :'✖',
                \ 'Dirty'     :'✗',
                \ 'Ignored'   :'☒',
                \ 'Clean'     :'✔︎',
                \ 'Unknown'   :'?',
                \ }
let g:NERDTreeGitStatusUseNerdFonts = 1
let g:NERDTreeGitStatusShowIgnored = 1
let g:NERDTreeGitStatusUntrackedFilesMode = 'all'
let g:NERDTreeGitStatusShowClean = 1
let g:NERDTreeGitStatusConcealBrackets = 1

" liuchengxu/vim-clap
nnoremap <Leader>cf :Clap files<CR>
" nnoremap <leader>cb :Clap buffers<CR>
let g:clap_theme = 'material_design_dark'

" scrooloose/nerdcommenter
" ;c加注释 ;cu解开注释
" 注释的时候自动加个空格, 强迫症必配
let g:NERDSpaceDelims=1

" voldikss/vim-browser-search
nmap <Leader>bs <Plug>SearchNormal
vmap <Leader>bs <Plug>SearchVisual
let g:browser_search_default_engine = 'google'
let g:browser_search_engines =  {
  \ 'github':'https://github.com/search?q=%s',
  \ 'google':'https://google.com/search?q=%s',
  \ 'stackoverflow':'https://stackoverflow.com/search?q=%s',
  \ 'translate': 'https://translate.google.com/?sl=auto&tl=it&text=%s',
  \ 'wikipedia': 'https://en.wikipedia.org/wiki/%s',
\ }

" voldikss/vim-floaterm
nnoremap <Leader>fn :FloatermNew<CR>
nnoremap <Leader>ft :FloatermToggle<CR>
nnoremap <Leader>fr :FloatermNew ranger<CR>
nnoremap <Leader>fg :FloatermNew lazygit<CR>
let g:floaterm_autoclose = 1 " 任务完成自动关闭窗口
let g:floaterm_width = 0.8   " 窗口宽度
let g:floaterm_height = 0.8  " 窗口高度

" scrooloose/nerdcommente
let g:NERDSpaceDelims = 1     " 注释中加空格

" bronson/vm-trailing-whitespace
nnoremap <leader>fw :FixWhitespace<cr>

" liuchengxu/vista.vim
autocmd vimenter * Vista
nnoremap <Leader>vs :Vista!!<CR>
" 打开vista窗口后移动到它
let g:vista_stay_on_open = 0
" 跳转到一个符号时，自动关闭vista窗口
let g:vista_close_on_jump = 0
let g:vist_sidebar_width = '46'
let g:vista_icon_indent = ["╰─▸ ", "├─▸ "]
" let g:vista_fold_toggle_icons = ['▼', '▶']
"可使用echo g:vista#executives查看除ctags其他
let g:vista_default_executive = 'ctags'
" 窗口打开方式 左边打开'vertical topleft' bot top left right
let g:vista_sidebar_position = 'vertical topleft'
" 显示预览窗口
let g:vista_echo_cursor_strategy ='floating_win'
" 大文件超千行性能优化
let g:vista_update_on_text_changed = 1
let g:vista_update_on_text_changed_delay = 1000
" 增量更新
let g:vista_ctags_incremental = 1
" 控制递归深度,大型项目改为3层
let g:vista_ctags_recursive_depth = 5
" 类别符号开关
let g:vista#renderer#enable_icon = 1
let g:vista#renderer#icons = {
      \ 'func': 'ƒ','function': 'ƒ', 'functions': 'ƒ',
      \ 'var': 'ν','variable': 'ν','variables': 'ν',
      \ }

" 配置不同文件的解释器
let g:vista_executive_for = {
    \ 'cpp': 'vim_lsp',
    \ 'php': 'vim_lsp',
    \ '.vimrc': 'vim_lsp',
    \ }

" vim-easymotion
let g:EasyMotion_smartcase = 1      "忽略大小写
map <Leader>ss <Plug>(easymotion-s2)
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)
map <leader>h <Plug>(easymotion-linebackward)
map <leader>l <Plug>(easymotion-lineforward)
map <leader>r <Plug>(easymotion-repeat)

" Git相关
" vim-fugitive
nnoremap gw :Gwrite<cr>
" nnoremap gc :Gcommit -a -v<cr>
nnoremap gc :Git commit<cr>
nnoremap gd :Gvdiff<cr>
nnoremap gs :Gstatus<cr>
nnoremap gm :Gmerge<cr>
" nnoremap gl :Glog<cr>
nnoremap gl :Git log<cr>
nnoremap gv :GV<CR>
" nnoremap gu :Gpush<cr>
" 异步执行gitpush
nnoremap gp :Nrun git push<CR>
command! -complete=file -nargs=* Nrun :call s:Terminal(<q-args>)
function! s:Terminal(cmd)
  execute 'belowright 5new'
  set winfixheight
  call termopen(a:cmd, {
        \ 'on_exit': function('s:OnExit'),
        \ 'buffer_nr': bufnr('%'),
        \})
  call setbufvar('%', 'is_autorun', 1)
  execute 'wincmd p'
endfunction
function! s:OnExit(job_id, status, event) dict
  if a:status == 0
    execute 'silent! bd! '.self.buffer_nr
  endif
endfunction
"rhysd/git-messenger
nnoremap gm :GitMessenger<CR>

"mbbill/undotree
nnoremap ut :UndotreeToggle<CR>
let g:undotree_DiffAutoOpen = 1
let g:undotree_SetFocusWhenToggle = 1
let g:undotree_ShortIndicators = 1
let g:undotree_WindowLayout = 2
let g:undotree_DiffpanelHeight = 8
let g:undotree_SplitWidth = 24
function g:Undotree_CustomMap()
	nmap <buffer> u <plug>UndotreeNextState
	nmap <buffer> e <plug>UndotreePreviousState
	nmap <buffer> U 5<plug>UndotreeNextState
	nmap <buffer> E 5<plug>UndotreePreviousState
endfunc
" 保存路径
if has("persistent_undo")
    set undofile
    set undodir=~/undodir
    set undolevels=1000
    set undoreload=1000
endif

" lfv89/vim-interestingwords
nnoremap <Leader>iw :call InterestingWords('n')<CR>
nnoremap <Leader>IW :call UncolorAllWords()<CR>
nnoremap <Leader>n :call WordNavigation('forward')<CR>

" Yggdroot/indentLine
let g:indentLine_char = '┊'
let g:indentLine_enabled = 1
let g:indentLine_color_term = 238
" let g:indentLine_char_list = ['|', '¦', '┆', '┊']
let g:indentLine_fileTypeExclude = ['startify', 'coc-explorer']

" junegunn/vim-easy-align
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

" t9md/vim-choosewin
nmap - <Plug>(choosewin)
let g:choosewin_overlay_enable = 0

" luohen199/rainbow
let g:rainbow_active = 1

" vim-airline/vim-airline
noremap <leader>b :bd<cr>
nmap <leader>1 <Plug>AirlineSelectTab1
nmap <leader>2 <Plug>AirlineSelectTab2
nmap <leader>3 <Plug>AirlineSelectTab3
nmap <leader>4 <Plug>AirlineSelectTab4
nmap <leader>5 <Plug>AirlineSelectTab5
nmap <leader>6 <Plug>AirlineSelectTab6
nmap <leader>7 <Plug>AirlineSelectTab7
nmap <leader>8 <Plug>AirlineSelectTab8
nmap <leader>9 <Plug>AirlineSelectTab9
let g:airline_powerline_fonts = 1            " 这个是安装字体后必须设置此项
" let g:airline_theme = 'jellybeans'           " luna,term,tomorrow,ubaryd,zenburn
let g:airline_theme = 'luna'
let g:airline#extensions#tabline#enabled = 1 " 顶部tabline
let g:airline#extensions#tabline#buffer_idx_mode = 1

" ryanoasis/vim-devicons
" 需要安装特殊字体Hack或者FiraCode 网站https://www.nerdfonts.com/font-downloads
let g:webdevicons_enable = 1                    " 加载插件
let g:webdevicons_enable_nerdtree = 1           " nerdtree支持
let g:webdevicons_enable_startify = 1           " startify支持
" let g:webdevicons_enable_airline_tabline = 1    " airline tab支持
" let g:webdevicons_enable_airline_statusline = 1 " airline statuslien支持

" neoclide/coc.vim
" set hidden
" 不要将消息传递给 |ins-completion-menu|。
set shortmess+=c
" 始终显示 signcolumn，否则每次都会移动文本
" 诊断出现/解决。
if has("nvim-0.5.0") || has("patch-8.1.1564")
  " 最近 vim 可以将 signcolumn 和 number column 合并成一个
  set signcolumn=number
else
  set signcolumn=yes
endif
" tab键补全
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
"触发Tab补全
function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

inoremap <silent><expr> <Tab>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()

" 显示文档
nnoremap <silent> 'h :call <SID>show_documentation()<CR>
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction
" 诊断面板以及跳转
nnoremap 'd  :<C-u>CocList diagnostics<cr>
nmap [g <Plug>(coc-diagnostic-prev)
nmap ]g <Plug>(coc-diagnostic-next)
" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" 其他
nnoremap 'p  :<C-u>CocList extensions<cr>
nnoremap 'c  :<C-u>CocList commands<cr>
" coc-extensions 插件
let g:coc_global_extensions = [
  \ 'coc-explorer',
  \ 'coc-fzf-preview',
  \ 'coc-diagnostic',
  \ 'coc-spell-checker',
  \ 'coc-git',
  \ 'coc-marketplace',
  \ 'coc-translate'
  \ ]
" coc-marketplace
nnoremap 'm :CocList marketplace<CR>
" coc-fzf-preview
nnoremap // :CocCommand fzf-preview.Lines<CR>
" coc-explorer
nnoremap 'e :CocCommand explorer<cr>
autocmd vimenter * CocCommand explorer

" List all presets
nmap <space>el <Cmd>CocList explPresets<CR>

" coc-git
nmap 'gp <Plug>(coc-git-prevchunk)
nmap 'gn <Plug>(coc-git-nextchunk)
nmap 'gi <Plug>(coc-git-chunkinfo)
nmap 'gu <Plug>(coc-git-chunkUndo)
nmap 'gb :CocCommand git.browserOpen<CR>

" coc-translate
nnoremap 'tw <Plug>(coc-translate-word)
vnoremap 'tw <Plug>(coc-translate-selected)
nnoremap 'lt <Plug>(coc-translate-line)

" 窗口显示配色
set t_Co=256                                            " 开启256色支持
set background=dark                                     " 背景色
colorscheme railscasts                                  " 主题
set guifont=Monaco:h26                                  " 默认字体和大小
set showtabline=2                                       " 显示顶部标签栏
set laststatus=2                                        " 显示状态栏
set guioptions-=r                                       " 隐藏右侧滚动条
set guioptions-=L                                       " 隐藏左侧滚动条
set guioptions-=b                                       " 隐藏底部滚动条
set number                                              " 显示行号
" 插入模式下用绝对行号，普通模式下用绝对行号
augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave,WinEnter * if &nu && mode() != "i" | set rnu   | endif
  autocmd BufLeave,FocusLost,InsertEnter,WinLeave   * if &nu                  | set nornu | endif
augroup END
set ruler                                               " 显示光标位置
set cursorline                                          " 高亮行
set splitbelow                                          " 允许在下部分割布局
set splitright                                          " 允许在右侧分隔布局
set showmatch                                           " 高亮显示匹配括号
set matchtime=1                                         " 匹配括号高亮的时间（单位是十分之一秒）
set noeb                                                " 关闭错误的提示
set nocompatible                                        " 高亮显示匹配括号式
set cmdheight=1                                         " 命令行的高度
set showcmd                                             " 显示没有完成命令
set whichwrap+=<,>,h,l                                  " 光标键跨行
set virtualedit=block,onemore                           " 允许光标出现在最后一个字符的后面
set numberwidth=4                                       " 默认占据4空间,超过999行时更改
set belloff=all                                         " 所有事件下（包括错按esc，错按backspace）不发出声音
set scrolloff=3                                         " 光标移动到buffer的顶部和底部时保持5行距离
set completeopt=menu,preview                            " 代码补全
set fillchars=eob:\                                     " 去除～符号
" 其他
set ttimeoutlen=0                                       " <ESC>键响应时间
set magic                                               " 设置魔术
set clipboard=unnamed                                   " 共享粘贴板
set backspace=2                                         " 使用回车键正常处理indent,eol,start等
set t_ti= t_te=                                         " 退出vim后，内容显示在终端屏幕"
" 编码
set encoding=UTF-8                                      " 新文件的编码为 UTF-8
set fileencoding=UTF-8                                  " 文件输入编码
" set termencoding=utf-8                                  " 只影响普通模式 (非图形界面) 下的 Vim
set fileencodings=utf8,ucs-bom,gbk,cp936,gb2312,gb18030 " 自动编码依次尝试
set fileformat=unix                                     " unix的格式保存文件
set updatetime=300                                      " 30毫秒更新
autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
" 缩进排版
set smartindent                                         " 智能的选择对齐方式
set expandtab                                           " 将制表符扩展为空格
set smarttab                                            " 在行和段使用制表符
set autoindent                                          " 自动缩进
set shiftwidth=4                                        " 格式化时制表符占用空格数
set tabstop=4                                           " 编辑时制表符占用空格数
set softtabstop=4                                       " 设置4个空格为制表符
set sidescroll=1                                        " 向右滚动字符数
set nofoldenable                                        " 禁用折叠代码
set foldlevelstart=99                                   " 默认不折叠代码
set foldmethod=manual                                   " indent方式折叠代码
set nowrap                                              " 长度不够禁止折行
" 缓存
set nobackup                                            " 不要备份
set nowritebackup                                       " 不要写入备份
set noswapfile                                          " 禁止生成临时文件交换文件
set autoread                                            " 文件在vim之外修改过，自动重新读入
set autowrite                                           " 设置自动保存
set confirm                                             " 在处理未保存或只读文件的时候，弹出确认

" " 快捷键
" 窗口跳转
nnoremap <S-j> <C-w>j
nnoremap <S-k> <C-w>k
nnoremap <S-h> <C-w>h
nnoremap <S-l> <C-w>l
nnoremap <Leader>ww <C-w>w
nnoremap <Leader>wc <C-w>c
nnoremap <Leader>ws <C-w>s
nnoremap <Leader>wv <C-w>v
nnoremap <S-up> :res +5<CR>
nnoremap <S-down> :res -5<CR>
nnoremap <S-right> :vertical resize-5<CR>
nnoremap <S-left> :vertical resize+5<CR>
" 文件相关
nnoremap fj <esc>:w<CR>
inoremap fj <esc>:w<CR>
nnoremap q :q<CR>
nnoremap qq :qa!<CR>
nnoremap rn :set relativenumber!<CR>
nnoremap erc :edit $MYVIMRC<CR>
nnoremap ecc :CocConfig<CR>
nnoremap sm :source $MYVIMRC<CR>
" 在插入模式下任意位置直接切到新的一行
inoremap <C-j> <C-o>o
inoremap <C-l> <C-o>A
