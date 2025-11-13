set nocompatible    " 禁用 Vi 兼容模式
syntax on           " 自动语法高亮
syntax enable       " 开启语法高亮
filetype plugin indent on
let mapleader = ";" " 定义Leader键

call plug#begin('~/.vim/plugged')
" 美化插件
Plug 'mhinz/vim-startify'                       " 首页
Plug 'ryanoasis/vim-devicons'                   " 文件图标
Plug 'jpo/vim-railscasts-theme'                 " 主题
Plug 'nanotech/jellybeans.vim'
Plug 'scrooloose/nerdtree'                      " 资源管理树
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'vim-airline/vim-airline'                  " 状态栏
Plug 'vim-airline/vim-airline-themes'           " 状态栏主题
Plug 'voldikss/vim-browser-search'              " web搜索

" 文本操作
Plug 'tpope/vim-surround'                       " 符号成对修改
Plug 'tpope/vim-repeat'                         " 重复操作
" Plug 'windwp/nvim-autopairs'                    " 括号配对插件
Plug 'luochen1990/rainbow'                      " 彩虹括号
Plug 'gcmt/wildfire.vim'                        " 代码块选择
Plug 'junegunn/vim-easy-align'                  " 文本对齐
Plug 'easymotion/vim-easymotion'                " 超级跳转
Plug 'terryma/vim-multiple-cursors'             " 多行文本操作
Plug 'Chiel92/vim-autoformat'                   " 自动格式化文档

" 功能插件
" Plug 't9md/vim-choosewin'                       " 窗口选择
Plug 'Yggdroot/indentLine'             " 缩进线
Plug 'scrooloose/nerdcommenter'        " 注释
Plug 'lfv89/vim-interestingwords'      " 单词彩色凸显
Plug 'liuchengxu/vista.vim'            " 大纲
Plug 'voldikss/vim-floaterm'           " 浮动终端
Plug 'bronson/vim-trailing-whitespace' " 去除行尾空白
Plug 'roxma/vim-tmux-clipboard'        " vim tmux共享剪贴板
Plug 'ybian/smartim'                   " 中文输入法输入命令

" 检查调试报错
Plug 'dense-analysis/ale'       " 语法检查
Plug 'skywind3000/asyncrun.vim' " 异步执行

" 补全搜索
"Plug 'neoclide/coc.nvim', {'branch': 'release'} " 补全框架
Plug 'neoclide/coc.nvim', {'branch': 'master', 'do': 'npm ci'}
Plug 'junegunn/fzf.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'yuki-yano/fzf-preview.vim', { 'branch': 'release/rpc' }
Plug 'liuchengxu/vim-clap', { 'do': ':Clap install-binary!' } "模糊搜索

" Git
Plug 'rhysd/git-messenger.vim'                  " git提交查询
Plug 'tpope/vim-fugitive'                       " git更改标识
Plug 'junegunn/gv.vim'                          " git提交树

Plug 'mbbill/undotree'                          " 本地回溯

call plug#end()

nnoremap <Leader><Leader>i :PlugInstall<CR>     " 安装插件
nnoremap <Leader><Leader>u :PlugUpdate<CR>      " 更新插件
nnoremap <Leader><Leader>c :PlugClean<CR>       " 删除插件
nnoremap <Leader><Leader>p :PlugUpgrade<CR>     " 更新插件管理器
nnoremap <Leader><Leader>s :PlugStatus<CR>

"+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

" --- iamcco/markdown-preview.nvim
nnoremap <Leader>mkp :MarkdownPreview<CR>
nnoremap <Leader>mks :MarkdownPreviewStop<CR>
nnoremap <Leader>mkt :MarkdownPreviewTroggle<CR>
let g:mkdp_auto_start = 0               " 打开文件后自动弹出, 0 为否
let g:mkdp_auto_close = 1               " 关闭文件后自动关闭预览窗口, 1 为是
let g:mkdp_refresh_slow = 1             " 慢速预览, 修改后退出 insert 模式后方会刷新视图, 1 为是
let g:mkdp_open_to_the_world = 0        " 开启公网链接, 0 为否
let g:mkdp_browser = ''                 " 指定浏览器, 默认会跟随系统浏览器
let g:mkdp_port = ''                    " 指定端口, 默认随机端口
let g:mkdp_page_title = ' **${name}** ' " 指定浏览器窗口标题, 默认为 Markdown 文件名

" --- vim-multiple-cursors
let g:multi_cursor_use_default_mapping=0
let g:multi_cursor_start_word_key      = '<C-n>'
let g:multi_cursor_select_all_word_key = '<A-n>'
let g:multi_cursor_start_key           = 'g<C-n>'
let g:multi_cursor_select_all_key      = 'g<A-n>'
let g:multi_cursor_next_key            = '<C-n>'
let g:multi_cursor_prev_key            = '<C-p>'
let g:multi_cursor_skip_key            = '<C-x>'
let g:multi_cursor_quit_key            = '<Esc>'

" --- jiangmiao/auto-pairs
let g:AutoPairsMapCR = 0

" --- vim-autoformat
let g:autoformat_verbosemode=0
let g:autoformat_autoindent = 0
let g:autoformat_retab = 1
let g:autoformat_remove_trailing_spaces = 1
let g:formatdef_hl_js='"js-beautify"'
let g:formatdef_hl_c='"clang-format -style=\"{BasedOnStyle: LLVM, UseTab: Never, IndentWidth: 4, PointerAlignment: Right, ColumnLimit: 150, SpacesBeforeTrailingComments: 1}\""' "指定格式化的方式, 使用配置参数
let g:formatters_cpp = ['hl_c']
let g:formatters_json = ['hl_js']
let g:formatters_js = ["hl_js"]
"保存时自动格式化指定文件类型代码
"au BufWrite *:Autoformat
"autocmd BufWrite *.sql,*.c,*.py,*.java,*.js:Autoformat "设置发生保存事件时执行格式化


" --- tpope/vim-surround
let g:loaded_surround=1
" ds: 删除包围符号
" cs: 改变包围符号
" yss): 整行添加包围符号 ()
" ysiw): 为当前光标下单词添加包围符号 ()
" ⌃-s: Insert 模式下插入包围符号
" S": Visual 模式下对选中区域添加包围符号 "

" --- dense-analysis/ale
nnoremap <Leader>en <Plug>(ale_next)
nnoremap <Leader>ep <Plug>(ale_previous)
let b:ale_fixers = ['prettier', 'eslint']
let g:ale_fixers = {
    \   '*': ['remove_trailing_lines','trim_whitespace' ],
    \   'python': ['autopep8']
    \}
let g:ale_set_highlights = 0
"let g:ale_fix_on_save = 1 "auto Sava
let g:ale_echo_msg_format = '[#%linter%#] %s [%severity%]'
let g:ale_sign_column_always = 1 "始终开启标志列
let g:ale_sign_error = '•'
let g:ale_sign_warning = '•'
let g:ale_echo_msg_error_str = ''
let g:ale_echo_msg_warning_str = ''
let g:ale_completion_delay = 500
let g:ale_echo_delay = 20
let g:ale_lint_delay = 500
let g:ale_linters_explicit = 1
let g:ale_lint_on_text_changed = 'normal'
let g:ale_lint_on_insert_leave = 1
let g:airline#extensions#ale#enabled = 1
let g:ale_c_gcc_options = '-Wall -O2 -std=c99'
let g:ale_cpp_gcc_options = '-Wall -O2 -std=c++14'
let g:ale_c_cppcheck_options = ''
let g:ale_cpp_cppcheck_options = ''
" brew install markdownlint-cli 语法检查工具
" 搭配ale插件使用
let g:ale_linters = {
    \   'c': ['clangd'],
    \   'swift': ['swiftlint'],
    \   'markdown': ['markdownlint'],
    \   'sh': ['shellcheck'],
    \   'json': ['jsonlint'],
    \   'zsh': ['shellcheck']
    \}
let g:ale_list_window_size = 5
let g:ale_statusline_format = ['E•%d', 'W•%d', 'OK']

" --- junegunn/fzf.vim
nnoremap <Leader>ff :Files<CR>
nnoremap <Leader>fh :History:<CR>
nnoremap <Leader>fcl :Colors<CR>
" 当前文件缓冲区查找
nnoremap <Leader>fbl :BLines<CR>
" 搭配fugitive.vim使用
nnoremap <Leader>fc :Commits<CR>
nnoremap <Leader>fb :BCommits<CR>
" 强制启用预览窗口，并将其定位在 右侧 (right)，占据 FZF 窗口总宽度的 60%
let g:fzf_preview_window = 'right:60%'
" 针对 :Buffers 命令。如果设置为 1，当您选择一个 Buffer 时，FZF 会尝试跳转到已打开该 Buffer 的窗口
let g:fzf_buffers_jump = 1
" 针对 :Commits 和 :BCommits 命令。它覆盖了 FZF 用于获取 Git 历史记录的 git log 命令。您使用了详细的格式参数，如 --graph (显示分支图)、%h (短哈希)、%s (提交信息) 和 %cr (相对时间)，使提交历史在 FZF 列表中更具可读性。
let g:fzf_commits_log_options = '--graph --color=always --format="%C(auto)%h%d %s %C(black)%C(bold)%cr"'
" 定义了 FZF 应该执行哪个命令来生成用于跳转的标签文件
let g:fzf_tags_command = 'ctags -R'
" FZF 在执行 :Commands 列表中的命令时，可以识别并接受 Alt-Enter 和 Ctrl-X 作为特殊的执行键
let g:fzf_commands_expect = 'alt-enter,ctrl-x'
" FZF 界面中，按下不同组合键时，文件或 Buffer 应以何种方式打开
let g:fzf_action = {
    \ 'ctrl-t': 'tab split',
    \ 'ctrl-x': 'split',
    \ 'ctrl-v': 'vsplit'
    \}
" " FZF 启动时,它会以一个弹出窗口的形式从底部出现占据屏幕高度的约60%
let g:fzf_layout = { 'up': '~60%' }

" --- mhinz/vim-startify
nnoremap <Leader>si :Startify<CR>
" autocmd vimenter * Startify
autocmd VimEnter * Startify | wincmd p
let g:webdevicons_enable_startify = 1
let g:startify_bookmarks = [
  \ {'a': '~/hejie.xyz/_config.yml'},
  \ {'b': '~/python/00.py'},
  \ {'c': '~/dotfiles/.vimrc' }
  \ ]
let g:startify_files_number = 9

" --- scrooloose/nerdtree
autocmd VimEnter * NERDTreeToggle
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

" --- liuchengxu/vim-clap
nnoremap <Leader>cf :Clap files<CR>
" nnoremap <leader>cb :Clap buffers<CR>

" scrooloose/nerdcommenter
" ;c加注释 ;cu解开注释
" 注释的时候自动加个空格, 强迫症必配
let g:NERDSpaceDelims=1

" --- voldikss/vim-browser-search
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

" --- voldikss/vim-floaterm
nnoremap <Leader>fn :FloatermNew<CR>
nnoremap <Leader>ft :FloatermToggle<CR>
nnoremap <Leader>fg :FloatermNew lazygit<CR>
let g:floaterm_autoclose = 2 " 任务完成自动关闭窗口
let g:floaterm_width = 0.8   " 窗口宽度
let g:floaterm_height = 0.8  " 窗口高度
" 1. 定义一个函数，包含您所有的自定义高亮设置
function! Floaterm_Set_Custom_Colors()
  " 设置浮动终端的主体背景为黑色
  " guibg: GUI/Neovim颜色，ctermbg: 256色终端颜色
  hi Floaterm guibg=black ctermbg=0
  " 设置浮动终端边框颜色：背景为橙色，前景/边框线为青色
  hi FloatermBorder guibg=orange guifg=cyan ctermbg=166 ctermfg=6
endfunction

" 2. 使用 autocmd 确保在每次配色方案加载后都重新设置颜色
augroup FloatermColors
  " 清除旧的自动命令，避免重复执行
  autocmd!
  " 每当配色方案 (ColorScheme) 改变或加载时，执行我们的函数
  autocmd ColorScheme * call Floaterm_Set_Custom_Colors()
augroup end

" --- scrooloose/nerdcommente
let g:NERDSpaceDelims = 1     " 注释中加空格

" --- bronson/vm-trailing-whitespace
nnoremap <leader>fw :FixWhitespace<CR>

" --- liuchengxu/vista.vim
autocmd vimenter * Vista
autocmd VimEnter * wincmd p
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
" let g:vista#renderer#icons = {
      " \ 'func': 'ƒ','function': 'ƒ', 'functions': 'ƒ',
      " \ 'var': 'ν','variable': 'ν','variables': 'ν',
      " \ }
let g:vista#renderer#icons = {
    \ 'func': 'ƒ', 'function': 'ƒ', 'functions': 'ƒ',
    \ 'var': 'ν', 'variable': 'ν', 'variables': 'ν',
    \ 'class': '',
    \ 'struct': '',
    \ 'module': '',
    \ 'method': 'λ',
    \ 'interface': '',
    \ 'field': '',
    \ 'enum': 'ε',
    \ 'member': '•',
    \ 'constant': 'π',
    \ 'namespace': 'Ω',
    \ 'package': '',
    \ 'typedef': '',
    \ }
" 配置不同文件的解释器
let g:vista_executive_for = {
    \ 'cpp': 'vim_lsp',
    \ 'php': 'vim_lsp',
    \ '.vimrc': 'vim_lsp',
    \ }

" --- vim-easymotion
let g:EasyMotion_smartcase = 1      "忽略大小写
map <Leader>ss <Plug>(easymotion-s2)
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)
map <leader>h <Plug>(easymotion-linebackward)
map <leader>l <Plug>(easymotion-lineforward)
map <leader>r <Plug>(easymotion-repeat)

" --- Git相关
" vim-fugitive
nnoremap gw :Gwrite<CR>
" nnoremap gc :Gcommit -a -v<CR>
nnoremap gc :Git commit<CR>
" 横分屏比较
" nnoremap gd :Gdiffsplit<CR>
nnoremap gd :Gvdiffsplit<CR>
nnoremap gs :Gstatus<CR>
nnoremap gm :Gmerge<CR>
" nnoremap gl :Glog<CR>
nnoremap gl :Git log<CR>
" rhysd/git-messenger
nnoremap gm :GitMessenger<CR>
" junegunn/gv.vim
nnoremap gv :GV<CR>
" nnoremap gu :Gpush<CR>
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

" --- mbbill/undotree
nnoremap <Leader>ut :UndotreeToggle<CR>
let g:undotree_DiffAutoOpen = 1
let g:undotree_SetFocusWhenToggle = 1
let g:undotree_ShortIndicators = 1
let g:undotree_WindowLayout = 4
let g:undotree_CustomUndotreeCmd = 'vertical 32 new'
function g:Undotree_CustomMap()
    nmap <buffer> J <plug>UndotreeNextState
    nmap <buffer> K <plug>UndotreePreviousState
endfunc
" 保存路径
if has("persistent_undo")
    set undofile
    set undodir=~/undodir
    set undolevels=1000
    set undoreload=10000
endif

" --- lfv89/vim-interestingwords
nnoremap <Leader>iw :call InterestingWords('n')<CR>
nnoremap <Leader>IW :call UncolorAllWords()<CR>
nnoremap <Leader>n :call WordNavigation('forward')<CR>

" --- Yggdroot/indentLine
let g:indentLine_char = '┊'
let g:indentLine_enabled = 1
let g:indentLine_color_term = 238
" let g:indentLine_char_list = ['|', '¦', '┆', '┊']
let g:indentLine_fileTypeExclude = ['startify', 'coc-explorer', 'fzf']

" --- junegunn/vim-easy-align
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

" --- t9md/vim-choosewin
nmap - <Plug>(choosewin)
let g:choosewin_overlay_enable = 0

" --- luohen199/rainbow
let g:rainbow_active = 1

" --- vim-airline/vim-airline
noremap <leader>b :bd<CR>
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

" --- ryanoasis/vim-devicons
" 需要安装特殊字体Hack或者FiraCode 网站https://www.nerdfonts.com/font-downloads
let g:webdevicons_enable = 1                    " 加载插件
let g:webdevicons_enable_nerdtree = 1           " nerdtree支持
let g:webdevicons_enable_startify = 1           " startify支持

" --- neoclide/coc.vim
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
" inoremap <silent><expr> <Tab>
      " \ coc#pum#visible() ? coc#pum#next(1) :
      " \ CheckBackspace() ? "\<Tab>" :
      " \ coc#refresh()
" inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
" inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

inoremap <silent><expr> <TAB> coc#pum#visible() ? coc#pum#next(1) : CheckBackspace() ? "\<Tab>" : coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"
" 回车确认,u取消
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

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

" 在光标悬停时高亮显示符号及其引用
autocmd CursorHold * silent call CocActionAsync('highlight')

" 格式化选中代码
xmap 'f  <Plug>(coc-format-selected)
nmap 'f  <Plug>(coc-format-selected)
augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s)
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
augroup end

" 诊断面板以及跳转
nnoremap 'd  :<C-u>CocList diagnostics<CR>
nmap [g <Plug>(coc-diagnostic-prev)
nmap ]g <Plug>(coc-diagnostic-next)
" GoTo code navigation.
nmap <silent> 'gd <Plug>(coc-definition)
nmap <silent> 'gy <Plug>(coc-type-definition)
nmap <silent> 'gi <Plug>(coc-implementation)
nmap <silent> 'gr <Plug>(coc-references)

" 其他
nnoremap 'p  :<C-u>CocList extensions<CR>
nnoremap 'c  :<C-u>CocList commands<CR>
" coc-extensions 插件
let g:coc_global_extensions = [
    \ 'coc-explorer',
    \ 'coc-fzf-preview',
    \ 'coc-diagnostic',
    \ 'coc-pyright',
    \ 'coc-spell-checker',
    \ 'coc-git',
    \ 'coc-marketplace',
    \ 'coc-tsserver',
    \ 'coc-highlight',
    \ 'coc-pairs'
    \ ]
" coc-marketplace
nnoremap 'm :CocList marketplace<CR>

" coc-fzf-preview
nnoremap // :CocCommand fzf-preview.Lines<CR>
nnoremap 'fc :CocCommand fzf-preview.Changes<CR>

" coc-explorer
nnoremap 'e :CocCommand explorer<CR>
" autocmd vimenter * CocCommand explorer

" coc-git
nmap 'gp <Plug>(coc-git-prevchunk)
nmap 'gn <Plug>(coc-git-nextchunk)
nmap 'gi <Plug>(coc-git-chunkinfo)
nmap 'gu <Plug>(coc-git-chunkUndo)
nmap 'gb :CocCommand git.browserOpen<CR>

" --- 基本功能与兼容性
set magic                                               " 设置魔术
" set backspace=2                                         " 使用回车键正常处理indent,eol,start等
set backspace=indent,eol,start                          " 字符串形式
set ttimeoutlen=0                                       " <ESC>键响应时间
set whichwrap+=<,>,h,l                                  " 光标键跨行
set virtualedit=block,onemore                           " 允许光标出现在最后一个字符的后面
set t_ti= t_te=                                         " 退出vim后，内容显示在终端屏幕"
" 重新打开文件时自动跳转到上次位置
autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" --- 界面与窗口布局
set number                                              " 显示行号
set numberwidth=4                                       " 行号默认占据4空间,超过999行时更改
set ruler                                               " 显示光标位置
set laststatus=2                                        " 显示状态栏
set showcmd                                             " 显示没有完成命令
set cmdheight=1                                         " 命令行的高度
set sidescroll=1                                        " 向右滚动字符数
set scrolloff=3                                         " 光标移动到buffer的顶部和底部时保持5行距离
set splitbelow                                          " 允许在下部分割布局
set splitright                                          " 允许在右侧分隔布局
set showtabline=2                                       " 显示顶部标签栏
set list                                                " 显示尾部空白
" set listchars=tab:»-⋮,eol:¶
set listchars=tab:»■,trail:■
  
" set noeb                                                " 关闭错误的提示
set belloff=all                                         " noeb增强，所有事件下（包括错按esc，错按backspace）不发出声音
set completeopt=menu,preview                            " 代码补全

" --- 颜色与视觉辅助
set t_Co=256                                            " 开启256色支持
set background=dark                                     " 背景色
" colorscheme railscasts                                  " 主题
colorscheme jellybeans
set showmatch                                           " 高亮显示匹配括号
set matchtime=1                                         " 匹配括号高亮的时间（单位是十分之一秒）
set fillchars=eob:\                                     " 去除～符号
set cursorline                                          " 高亮行
" autocmd InsertEnter,InsertLeave * set cursorline       " 插入模式下取消高亮行
" --- GUI有用
set guifont=Monaco:h26                                  " 默认字体和大小
set guioptions-=r/L/b
" set guioptions-=r                                       " 隐藏右侧滚动条
" set guioptions-=L                                       " 隐藏左侧滚动条
" set guioptions-=b                                       " 隐藏底部滚动条

" --- 编码与文件格式
set fileformat=unix                                     " unix的格式保存文件
set encoding=UTF-8                                      " 新文件的编码为 UTF-8
set fileencoding=UTF-8                                  " 文件输入编码
" set termencoding=utf-8                                  " 只影响普通模式 (非图形界面) 下的 Vim
set fileencodings=utf8,ucs-bom,gbk,cp936,gb2312,gb18030 " 自动编码依次尝试

" --- 搜索设置
" set hlsearch                高亮显示搜索结果
" set incsearch               增量搜索，边输入边跳转
" nnoremap <silent> / :noh<CR>
" nnoremap <silent> <Leader>/ :nohlsearch<CR>

" --- 缩进排版
" 空格缩进
set expandtab                                           " 将制表符扩展为空格
set tabstop=4                                           " 编辑时制表符占用空格数
set shiftwidth=4                                        " 格式化时制表符占用空格数
" TAB缩进
" set noexpandtab
" set tabstop=4
" set shiftwidth=4

set smartindent                                         " 智能的选择对齐方式
" set autoindent                                          " 自动缩进,被smartindent包含无需重复设置
set smarttab                                            " 在行和段使用制表符
set softtabstop=4                                       " 设置4个空格为制表符

" ---  折叠
set nofoldenable                                        " 禁用折叠代码
set foldlevelstart=99                                   " 默认不折叠代码
set foldmethod=indent                                   " 缩进级别方式折叠代码
set nowrap                                              " 单行显示长度不够禁止折行

" --- 保存更新缓存
set nobackup                                            " 不要备份
set nowritebackup                                       " 不要写入备份
set noswapfile                                          " 禁止生成临时文件交换文件
set autoread                                            " 文件在vim之外修改过，自动重新读入
set autowrite                                           " 设置自动保存
set confirm                                             " 在处理未保存或只读文件的时候，弹出确认
set updatetime=300                                      " 30毫秒更新
set clipboard=unnamed                                   " 共享粘贴板

" --- 快捷键
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
" 使用 Leader-t-v 创建一个垂直分割的临时文件
nnoremap <Leader>vn :vnew<CR>

" 调试python
autocmd FileType python map <buffer> <F9> :w<CR>:exec '!python3' shellescape(@%, 1)<CR>
autocmd FileType python imap <buffer> <F9> <esc>:w<CR>:exec '!python3' shellescape(@%, 1)<CR>
