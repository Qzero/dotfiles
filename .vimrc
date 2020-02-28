let mapleader=";"                               "定义Leader键
filetype on                                     "侦测文件类型
filetype plugin on                              "侦测类型开启插件
filetype indent on                              "侦测语言的智能缩
nnoremap <Leader><Leader>i :PlugInstall<CR>     "安装插件
nnoremap <Leader><Leader>u :PlugUpdate<CR>      "更新插件
nnoremap <Leader><Leader>c :PlugClean<CR>       "删除插件
nnoremap <Leader><Leader>pu :PlugUpgrade<CR>    "更新插件管理器

call plug#begin('~/.vim/plugged')
Plug 'voldikss/vim-floaterm'
Plug 'levelone/tequila-sunrise.vim'             " 主题
Plug 'nanotech/jellybeans.vim'
Plug 'mhinz/vim-startify'                       " 首页
Plug 'majutsushi/tagbar'                        " 文件大纲工具
Plug 'scrooloose/nerdtree'                      " 资源管理树
Plug 'vim-airline/vim-airline'                  " 状态栏
Plug 'vim-airline/vim-airline-themes'           " 状态栏主题
" 效率
Plug 'easymotion/vim-easymotion'                " 超级跳转
Plug 't9md/vim-choosewin'                       " 窗口选择
Plug 'luochen1990/rainbow'                      " 彩虹括号
Plug 'ybian/smartim'                            " 解决中文输入法无法输入命令
Plug 'lfv89/vim-interestingwords'               " 变量彩色凸显
Plug 'brooth/far.vim'                           " 替换
Plug 'Yggdroot/indentLine'
Plug 'tpope/vim-commentary'                     " 注释
Plug 'jiangmiao/auto-pairs'                     " 自动补全引号、圆括号、花括号等
Plug 'itchyny/vim-cursorword'                   " 变量下划线
Plug 'neoclide/coc.nvim', {'branch': 'release'} " 补全工具
Plug 'davidhalter/jedi-vim'                     " python补全工具
Plug 'junegunn/vim-easy-align'                  " 文本对齐
Plug 'sillybun/vim-repl'
" 文件搜索
Plug 'dyng/ctrlsf.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
" Plug 'Yggdroot/LeaderF', { 'do': './install.sh'  }
Plug 'voldikss/vim-translator'                  " 翻译插件
Plug 'liuchengxu/vista.vim'
Plug 'voldikss/vim-browser-search'              "搜索插件
" Git
Plug 'simnalamburt/vim-mundo', {'on': 'MundoToggle'}
Plug 'rhysd/git-messenger'
Plug 'tpope/vim-fugitive'                       " git命令封装
Plug 'airblade/vim-gitgutter'                   " 显示git更改标示
Plug 'junegunn/gv.vim'                          " git提交树
call plug#end()

"+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
" voldikss/vim-browser-search
nmap <silent> <Leader>sw <Plug>SearchNormal
vmap <silent> <Leader>sw <Plug>SearchVisual

" Plug 'liuchengxu/vista.vim'
let g:vista_icon_indent = ["╰─▸ ", "├─▸ "]
let g:vista_default_executive = 'ctags'
let g:vista_executive_for = {
  \ '.vimrc': 'vim_lsp',
  \ 'php': 'vim_lsp',
  \ }
function! NearestMethodOrFunction() abort
  return get(b:, 'vista_nearest_method_or_function', '')
endfunction
set statusline+=%{NearestMethodOrFunction()}
autocmd VimEnter * call vista#RunForNearestMethodOrFunction()
let g:vista_ctags_cmd = {
      \ 'haskell': 'hasktags -x -o - -c',
      \ }
let g:vista_fzf_preview = ['right:50%']
let g:vista#renderer#enable_icon = 1
let g:vista#renderer#icons = {
\   "function": "\uf794",
\   "variable": "\uf71b",
\  }

" simnalamburt/vim-mundo
set undofile
set undodir=~/.vim/undo
let g:mundo_width              = 30
let g:mundo_preview_height     = 10
let g:mundo_right              = 0
let g:mundo_preview_bottom     = 1
let g:mundo_auto_preview_delay = 10

"rhysd/git-messenger
noremap <silent> <Leader>gm :GitMessenger<CR>

" voldikss/vim-translator
let g:translator_history_enable = 1
let g:translator_default_engines = ['google', 'ciba', 'youdao']
nmap <silent>    ,t        <Plug>Translate
vmap <silent>    ,t        <Plug>TranslateV 
nmap <silent>    ,w        <Plug>TranslateW
vmap <silent>    ,w        <Plug>TranslateWV
nmap <silent>    ,r        <Plug>TranslateR
vmap <silent>    ,r        <Plug>TranslateRV

" Yggdroot/indentLine
let g:indentLine_char = '│'
let g:indentLine_enabled = 1
let g:indentLine_color_term = 238
let g:indentLine_fileTypeExclude = ['startify', 'vista', 'json', 'codi', 'vtm', 'jsonc', 'coc-explorer']

" voldikss/vim-floaterm
let g:floaterm_position = 'center'
hi FloatermNF guibg=black
hi FloatermBorderNF guibg=red guifg=cyan
tnoremap <ESC> <C-\><C-n> :q<CR>
nnoremap <Leader>fn :FloatermNew<CR>
nnoremap <Leader>ft :FloatermToggle<CR>
nnoremap <Leader>fnn :FloatermNext<CR>
nnoremap <Leader>fpp :FloatermPrev<CR>

" neoclide/coc.nvim
"  安装依赖
"  curl -sL install-node.now.sh | sh
"  curl --compressed -o- -L https://yarnpkg.com/install.sh | bash
set hidden         " 如果没有设置，TextEdit可能失效
set cmdheight=2    " 更好显示消息
set shortmess+=c   " 不要完成菜单消息
set signcolumn=yes " 始终显示信号
" coc-bookmark
nmap <silent> ,b <Plug>(coc-bookmark-toggle)
nmap <silent> ,a <Plug>(coc-bookmark-annotate)
nmap <silent> gh <Plug>(coc-bookmark-prev)
nmap <silent> gl <Plug>(coc-bookmark-next)
" coc-explorer
augroup coc-explorer-settings
  autocmd!
  autocmd FileType coc-explorer setlocal relativenumber
augroup END
" coc-extensions
let g:coc_global_extensions = [
  \ 'coc-bookmark',
  \ 'coc-browser',
  \ 'coc-clock',
  \ 'coc-css',
  \ 'coc-diagnostic',
  \ 'coc-dictionary',
  \ 'coc-emoji',
  \ 'coc-emmet',
  \ 'coc-eslint',
  \ 'coc-explorer',
  \ 'coc-highlight',
  \ 'coc-html',
  \ 'coc-lists',
  \ 'coc-json',
  \ 'coc-kite',
  \ 'coc-marketplace',
  \ 'coc-pairs',
  \ 'coc-post',
  \ 'coc-prettier',
  \ 'coc-python',
  \ 'coc-rls',
  \ 'coc-snippets',
  \ 'coc-spell-checker',
  \ 'coc-syntax',
  \ 'coc-tag',
  \ 'coc-todolist',
  \ 'coc-template',
  \ 'coc-translator',
  \ 'coc-tslint-plugin',
  \ 'coc-tsserver',
  \ 'coc-vimtex',
  \ 'coc-vimlsp',
  \ 'coc-yank',
  \ 'coc-zi'
  \ ]
nnoremap <silent> K :call <SID>show_documentation()<CR>
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
nnoremap <silent> <space>p  :<C-u>CocList extensions<cr>
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
nnoremap <silent> <space>e :CocCommand explorer<CR>

" junegunn/vim-easy-align
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

" junegunn/fzf
nnoremap <Leader>fl :Files<CR>
nnoremap <Leader>fb :Buffers<CR>
nnoremap <Leader>fe :Lines<Space>

" dyng/ctrlsf  #install -y ack-grep 依赖ack/ag/pt/rg之一
nnoremap <Leader>cf :CtrlSF<Space>
nnoremap <Leader>cfc :CtrlSFClose<CR>
nmap <silent><leader>cfs <Plug>CtrlSFCCwordPath<CR>
let g:ctrlsf_ackprg = 'ack'     " 搜索引擎
let g:ctrlsf_position = "right" " 左右打开Linux用let g:ctrlsf_open_left = 0

" ------ Git相关
" vim-fugitive
nnoremap <silent><leader>gw :Gwrite<cr>
nnoremap <silent><leader>gc :Gcommit<cr>
nnoremap <silent><leader>gb :Gblame<cr>
nnoremap <silent><leader>gd :Gvdiff<cr>
nnoremap <silent><leader>gs :Gstatus<cr>
nnoremap <silent><leader>gm :Gmerge<cr>
nnoremap <silent><leader>gu :Gpush<cr>
nnoremap <silent><leader>gl :Glog<cr>
nnoremap <Leader>gv :GV<CR>
" vim-gitgutter
let g:gitgutter_max_signs = 800     "更改显示标示行数限制

" lfv89/vim-interestingwords
nnoremap <silent> <leader>kw :call InterestingWords('n')<CR>
nnoremap <silent> <leader>KW :call UncolorAllWords()<CR>
nnoremap <silent> n :call WordNavigation('forward')<CR>
nnoremap <silent> N :call WordNavigation('backward')<CR>

" t9md/vim-choosewin
nmap <Leader>vv <Plug>(choosewin)
let g:choosewin_overlay_enable = 0

" vim-easymotion 
let g:EasyMotion_smartcase = 1      "忽略大小写
map ss <Plug>(easymotion-s2)
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)
map <leader>h <Plug>(easymotion-linebackward)
map <leader>l <Plug>(easymotion-lineforward)
map <leader>r <Plug>(easymotion-repeat)

" luohen199/rainbow
let g:rainbow_active = 1

" vim-airline/vim-airline
nnoremap <C-D> :bprevious<CR>:bdelete #<CR>
nnoremap <C-N> :bn<CR>
nnoremap <C-P> :bp<CR>
map <Leader>te :tabedit<CR>
let g:airline_powerline_fonts = 1                 " 这个是安装字体后必须设置此项
let g:airline_theme='ubaryd'                      " luna,term,tomorrow,ubaryd,zenburn
let g:airline#extensions#tabline#enabled=1        " 用顶部tabline
let g:airline#extensions#tabline#buffer_nr_show=0 " 显示buffer编号

" Tagbar 安装依赖 : install ctags
nnoremap <Leader>tb :TagbarToggle<CR>
let g:tagbar_ctags_bin = 'ctags'        "tagbar依赖ctags插件
let g:tagbar_compact = 1                  "tagbar 子窗口中不显示冗余帮助信息
" let g:tagbar_left = 1                   "让tagbar在页面左侧显示，默认右DTree快捷键
let g:tagbar_width = 25                 "设置tagbar的宽度
let g:tagbar_autofocus = 1              "tagbar一打开，光标即在tagbar页面内
let g:tagbar_sort = 0                   "设置标签不排序，默认排序
let g:tagbar_autoshowtag = 1            "当编辑代码时，在Tagbar自动追踪变量
let g:tagbar_iconchars = ['▸', '▾']     "修改默认剪头'▸', '▾'

" startify
let g:webdevicons_enable_startify = 1
noremap <Leader>si :Startify<CR>
let g:startify_bookmarks = [
  \ {'c': '~/dotfiles/.vimrc'},
  \ ]
let g:startify_custom_header = [
  \ '                           ___       ___       ___       ___       ___       ___ ',
  \ '                                                                                 ',
  \ '                            N         E         R         V         E         R  ',
  \ '                           ___       ___       ___       ___       ___       ___ ']

" scrooloose/nerdtree
nnoremap <Leader>nt :NERDTreeToggle<CR>
nnoremap <Leader>ntf :NERDTreeFind<CR>
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
" colorscheme tequila-sunrise                             " 主题
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
autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | execute "normal! g'\"" | endif

" 快捷键
"" 窗口选择与移动
imap kj <esc>
noremap H ^
noremap L $
" 插入模式下移动
inoremap <S-k> <Up>
inoremap <S-j> <Down>
snoremap <S-j> <Down>
inoremap <S-h> <Left>
inoremap <S-l> <Right>
" 窗口跳转
noremap <Leader>cc <C-w>c
noremap <Leader>hh <C-w>h
noremap <Leader>jj <C-w>j
noremap <Leader>kk <C-w>k
noremap <Leader>ll <C-w>l
noremap <Leader>ww <C-w>w
" 窗口分屏
map sl :set splitright<CR>:vsplit<CR>
map sj :set splitbelow<CR>:split<CR>
map svs <C-w>t<C-w>H                                  
map svh <C-w>t<C-w>K
" 窗口通知
nnoremap <silent> <Leader>m :messages<CR>
nnoremap <silent> <Leader>t :TabMessage messages<CR>
" 命令模式移动
cnoremap <C-a> <Home>
cnoremap <C-e> <End>
cnoremap <C-p> <Up>
cnoremap <C-n> <Down>
cnoremap <C-b> <S-Left>
cnoremap <C-f> <S-Right>
cnoremap <C-h> <Left>
cnoremap <C-l> <Right>
"" 文件相关
nnoremap <silent> <Leader>w :w<CR>
nnoremap <silent> <Leader>W :wa<CR>
nnoremap <silent> <Leader>q :q<CR>
nnoremap <silent> <Leader>Q :qa!<CR>
nnoremap <silent> Q         :qa!<CR>
nnoremap <Leader>rn :set relativenumber!<CR>                    "显示相对行号
nnoremap <Leader>ev :edit $MYVIMRC<CR>                          "编辑vimrc文件
map <Leader>s :source $MYVIMRC<CR>                         "重新加载vimrc文件
