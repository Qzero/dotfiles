let mapleader = ";"                             " 定义Leader键

call plug#begin('~/.vim/plugged')
Plug 'francoiscabrol/ranger.vim'                " ranger插件
Plug 'rbgrouleff/bclose.vim'
Plug 'tpope/vim-surround'                       " 符号成对修改
Plug 'tpope/vim-repeat'                         " 重复操作
Plug 'gcmt/wildfire.vim'                        " 代码块选择
Plug 'jpo/vim-railscasts-theme'                 " 主题
Plug 'roxma/vim-tmux-clipboard'                 " vim tmux共享剪贴板
Plug 'haya14busa/incsearch.vim'                 " 搜索插件
Plug 'farmergreg/vim-lastplace'                 " 打开文件跳转到最后一次位置
Plug 'voldikss/vim-floaterm'                    " 浮动终端
Plug 'mhinz/vim-startify'                       " 首页
Plug 'ryanoasis/vim-devicons'                   " 文件图标
Plug 'vim-airline/vim-airline'                  " 状态栏
Plug 'vim-airline/vim-airline-themes'           " 状态栏主题
Plug 'easymotion/vim-easymotion'                " 超级跳转
Plug 't9md/vim-choosewin'                       " 窗口选择
Plug 'luochen1990/rainbow'                      " 彩虹括号
Plug 'ybian/smartim'                            " 解决中文输入法无法输入命令
Plug 'lfv89/vim-interestingwords'               " 变量彩色凸显
Plug 'brooth/far.vim'                           " 替换
Plug 'Yggdroot/indentLine'                      " 缩进线
" Plug 'tpope/vim-commentary'                     " 注释
Plug 'scrooloose/nerdcommenter'
Plug 'liuchengxu/vim-which-key', { 'on': ['WhichKey', 'WhichKey!'] }
Plug 'junegunn/vim-easy-align'                  " 文本对齐
" Plug 'yianwillis/vimcdoc'                       " 中文帮助文档
Plug 'neoclide/coc.nvim', {'branch': 'release'} " 补全框架
Plug 'pappasam/coc-jedi', { 'do': 'yarn install --frozen-lockfile && yarn build' } " cocPython插件
Plug 'junegunn/fzf.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'liuchengxu/vista.vim'                     " 大纲
Plug 'bronson/vim-trailing-whitespace'          " 行尾空白
" markdown
Plug 'iamcco/mathjax-support-for-mkdp'
Plug 'iamcco/markdown-preview.vim'
" Git
Plug 'rhysd/git-messenger.vim'                  " git提交查询
Plug 'tpope/vim-fugitive'                       " git更改标识
Plug 'airblade/vim-gitgutter'                   " git命令封装
Plug 'junegunn/gv.vim'                          " git提交树
Plug 'mbbill/undotree'                          " git本地文件树
Plug 'kdheepak/lazygit.nvim', { 'branch': 'nvim-v0.4.3' } "lazygit
Plug 'tveskag/nvim-blame-line'
call plug#end()

nnoremap <Leader><Leader>i :PlugInstall<CR>     " 安装插件
nnoremap <Leader><Leader>u :PlugUpdate<CR>      " 更新插件
nnoremap <Leader><Leader>c :PlugClean<CR>       " 删除插件
nnoremap <Leader><Leader>p :PlugUpgrade<CR>     " 更新插件管理器

"+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
" tveskag/nvim-blame-line
nnoremap <silent> <leader>bl :ToggleBlameLine<CR>
autocmd BufEnter * EnableBlameLine

" francoiscabrol/ranger.vim
nnoremap <silent> <Leader>rg :Ranger<CR>

" scrooloose/nerdcommenter
let g:NERDSpaceDelims=1     "自动加空格

" bronson/vim-trailing-whitespace
nnoremap <leader>fw :FixWhitespace<cr>

" haya14busa/incsearch
nnoremap <Leader><cr> :<C-u>nohlsearch<CR>
map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)

" liuchengxu/vista
nnoremap <Leader>vs :Vista!!<CR>
" 打开vista窗口后移动到它
let g:vista_stay_on_open = 1
let g:vista_sidebar_width = '28'
" 跳转到一个符号时，自动关闭vista窗口.
let g:vista_close_on_jump = 0
let g:vista_icon_indent = ["╰─▸ ", "├─▸ "]
" 优先选择lsp作为标签来源，其次ctags
let g:vista_cpp_executive = 'vim_lsp'
let g:vista_default_executive = 'ctags'
" let g:vista_fzf_preview = ['right:50%']
" let g:vista_echo_cursor_strategy ='floating_win'
let g:vista_sidebar_position = 'vertical topleft'
let g:vista#renderer#enable_icon = 1
let g:vista#renderer#icons = {
\    'func': "\uf794",
\    'function': "\uf794",
\    'functions': "\uf794",
\    'var': "\uf5c0",
\    'variable': "\uf5c0",
\    'variables': "\uf5c0",
\    'const': "\uf8ff",
\    'constant': "\uf8ff",
\    'constructor': "\uf976",
\    'method': "\uf6a6",
\    'package': "\ue612",
\    'packages': "\ue612",
\    'enum': "\uf702",
\    'enummember': "\uf282",
\    'enumerator': "\uf702",
\    'module': "\uf136",
\    'modules': "\uf136",
\    'type': "\uf7fd",
\    'typedef': "\uf7fd",
\    'types': "\uf7fd",
\    'field': "\uf30b",
\    'fields': "\uf30b",
\    'macro': "\uf8a3",
\    'macros': "\uf8a3",
\    'map': "\ufb44",
\    'class': "\uf0e8",
\    'augroup': "\ufb44",
\    'struct': "\uf318",
\    'union': "\ufacd",
\    'member': "\uf02b",
\    'target': "\uf893",
\    'property': "\ufab6",
\    'interface': "\uf7fe",
\    'namespace': "\uf475",
\    'subroutine': "\uf9af",
\    'implementation': "\uf776",
\    'typeParameter': "\uf278",
\    'default': "\uf29c"
\}

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
nnoremap gc :Gcommit -a -v<cr>
nnoremap gb :Gblame<cr>
nnoremap gd :Gvdiff<cr>
nnoremap gs :Gstatus<cr>
nnoremap gm :Gmerge<cr>
nnoremap gu :Gpush<cr>
nnoremap gl :Glog<cr>
nnoremap gv :GV<CR>
" 异步执行git
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
" vim-gitgutter
nmap ]c <Plug>(GitGutterNextHunk)
nmap [c <Plug>(GitGutterPrevHunk)
let g:gitgutter_max_signs = 800     "更改显示标示行数限制
let g:gitgutter_preview_win_floating = 1
" mbbill/undotree
nnoremap <Leader>ut :UndotreeToggle<CR>
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
    set undodir=~/dotfiles/undodir
    set undofile
endif
" kdheepak/lazygit.nvim
nnoremap <silent> <leader>lg :LazyGit<CR>
let g:lazygit_floating_window_winblend = 0 " transparency of floating window
let g:lazygit_floating_window_scaling_factor = 0.9 " scaling factor for floating window
let g:lazygit_floating_window_corner_chars = ['╭', '╮', '╰', '╯'] " customize lazygit popup window corner characters
let g:lazygit_use_neovim_remote = 1 " for neovim-remote support

" lfv89/vim-interestingwords
nnoremap <silent> <Leader>iw :call InterestingWords('n')<CR>
nnoremap <silent> <Leader>IW :call UncolorAllWords()<CR>
nnoremap <silent> <Leader>n :call WordNavigation('forward')<CR>

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
nnoremap <silent> <C-D> :bprevious<CR>:bdelete #<CR>
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
let g:airline_theme = 'jellybeans'           " luna,term,tomorrow,ubaryd,zenburn
let g:airline#extensions#tabline#enabled = 1 " 用顶部tabline

" startify
let g:webdevicons_enable_startify = 1
nnoremap <Leader>si :Startify<CR>
let g:startify_bookmarks = [
  \ {'c': '~/dotfiles/.vimrc' },
  \ {'a': '~/hejie.xyz/_config.yml'}
  \ ]

" ryanoasis/vim-devicons
let g:webdevicons_enable = 1            " 加载插件
let g:webdevicons_enable_nerdtree = 1   " nerdtree支持
let g:webdevicons_enable_startify = 1   " startify支持
let g:webdevicons_enable_airline_tabline = 1    " airline tab支持
let g:webdevicons_enable_airline_statusline = 1 " airline statuslien支持

" neoclide/coc.vim
" 屏蔽乌干达儿童
set shortmess+=c
" set signcolumn=number
" set signcolumn=yes
" 同单词高亮
" autocmd CursorHold * silent call CocActionAsync('highlight')
" tab键补全
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
" 确认补全
if has('nvim')
  inoremap <silent><expr> 'c coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
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
" coc-actions
function! s:cocActionsOpenFromSelected(type) abort
  execute 'CocCommand actions.open ' . a:type
endfunction
xmap 'a  <Plug>(coc-codeaction-selected)
nmap 'aw  <Plug>(coc-codeaction-selected)
" 诊断面板以及跳转
nnoremap <silent> 'd  :<C-u>CocList diagnostics<cr>

nnoremap <silent> 'p  :<C-u>CocList extensions<cr>
nnoremap <silent> 'c  :<C-u>CocList commands<cr>
" coc-extensions
let g:coc_global_extensions = [
  \ 'coc-explorer',
  \ 'coc-vimlsp',
  \ 'coc-fzf-preview',
  \ 'coc-translator',
  \ 'coc-pairs',
  \ 'coc-floaterm',
  \ 'coc-python',
  \ 'coc-diagnostic',
  \ 'coc-highlight',
  \ 'coc-json',
  \ 'coc-actions',
  \ 'coc-spell-checker',
  \ 'coc-marketplace'
  \ ]
" coc-marketplace
nnoremap 'm :CocList marketplace<CR>
" coc-floaterm
nnoremap 'ft :CocList floaterm<CR>
nnoremap 'fn :CocCommand floaterm.new<CR>
nnoremap 'fnn :CocCommand floaterm.next<CR>
nnoremap 'fpp :CocCommand floaterm.prev<CR>
" coc-fzf-preview
nnoremap 'fl :CocCommand fzf-preview.Lines<CR>
" coc-translator
nnoremap 't :CocCommand translator.popup<CR>
nnoremap 'tl :CocCommand translator.exportHistory<CR>
" coc-explorer
nnoremap 'e :CocCommand explorer<cr>

" 基础配置
filetype on                                     " 侦测文件类型
filetype plugin on                              " 侦测类型开启插件
filetype indent on                              " 侦测语言的智能缩
" 窗口显示配色
set t_Co=256                                            " 开启256色支持
set background=dark                                     " 背景色
colorscheme railscasts                                  " 主题
set guifont=Monaco:h16                                  " 默认字体和大小
set showtabline=2                                       " 显示顶部标签栏
set laststatus=2                                        " 显示状态栏
set guioptions-=r                                       " 隐藏右侧滚动条
set guioptions-=L                                       " 隐藏左侧滚动条
set guioptions-=b                                       " 隐藏底部滚动条
set number                                              " 显示行号
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
set numberwidth=3                                       " 默认占据4空间,超过999行时更改
set belloff=all                                         " 所有事件下（包括错按esc，错按backspace）不发出声音
set scrolloff=3                                         " 光标移动到buffer的顶部和底部时保持5行距离
set completeopt=menu,preview                            " 代码补全
" 语法
syntax enable                                           " 开启语法高亮
syntax on                                               " 自动语法高亮
" 其他
set ttimeoutlen=0                                       " <ESC>键响应时间
set magic                                               " 设置魔术
set clipboard=unnamed                                   " 共享粘贴板
set backspace=2                                         " 使用回车键正常处理indent,eol,start等
" 编码
set encoding=utf-8                                      " 新文件的编码为 UTF-8
set termencoding=utf-8                                  " 只影响普通模式 (非图形界面) 下的 Vim
set fileencodings=utf8,ucs-bom,gbk,cp936,gb2312,gb18030 " 自动编码依次尝试
set fileformat=unix                                     " unix的格式保存文件
set updatetime=30                                       " 30毫秒更新
autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | execute "normal! g'\"" | endif
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
set foldmethod=indent                                   " indent方式折叠代码
set nowrap                                              " 长度不够禁止折行
" 搜索
set hlsearch                                            " 高亮显示所有搜索到的内容
set incsearch                                           " 光标立刻跳到搜索内容
set nowrapscan                                          " 搜索到最后匹配的位置后,再次搜索不回到第一个匹配处
" 缓存
set nobackup                                            " 不要备份
set nowritebackup                                       " 不要写入备份
set noswapfile                                          " 禁止生成临时文件交换文件
set autoread                                            " 文件在vim之外修改过，自动重新读入
set autowrite                                           " 设置自动保存
set confirm                                             " 在处理未保存或只读文件的时候，弹出确认

" 快捷键
"" 窗口选择与移动
inoremap fd <esc>
nnoremap H ^
nnoremap L $
" 窗口跳转
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l
nnoremap <Leader>ww <C-w>w
nnoremap <Leader>wc <C-w>c
nnoremap <Leader>ws <C-w>s
nnoremap <Leader>wv <C-w>v
nnoremap <Leader>whh <C-w>=
nnoremap <Leader>wjj <C-w>+
nnoremap <Leader>wkk <C-w>-
" 文件相关
nnoremap fs :w<CR>
nnoremap q :q<CR>
nnoremap qq :qa!<CR>
nnoremap rn :set relativenumber!<CR>
nnoremap ev :edit $MYVIMRC<CR>
nnoremap sm :source $MYVIMRC<CR>
vnoremap <Leader>y "+y
nmap <Leader>p "+p
