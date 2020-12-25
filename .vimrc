let mapleader=";"                               "定义Leader键
filetype on                                     "侦测文件类型
filetype plugin on                              "侦测类型开启插件
filetype indent on                              "侦测语言的智能缩

call plug#begin('~/.vim/plugged')
Plug 'tomasiser/vim-code-dark'
Plug 'voldikss/vim-floaterm'                    " 浮动终端
Plug 'nanotech/jellybeans.vim'                  " 主题
Plug 'mhinz/vim-startify'                       " 首页
Plug 'scrooloose/nerdtree'                      " 资源管理树
Plug 'Xuyuanp/nerdtree-git-plugin'
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
" Plug 'jiangmiao/auto-pairs'                     " 自动补全引号、圆括号、花括号等
Plug 'junegunn/vim-easy-align'                  " 文本对齐
Plug 'preservim/tagbar'
Plug 'yianwillis/vimcdoc'
Plug 'Yggdroot/LeaderF', { 'do': './install.sh' }
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'pappasam/coc-jedi', { 'do': 'yarn install --frozen-lockfile && yarn build' }
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'dyng/ctrlsf.vim'
" Git
Plug 'rhysd/git-messenger.vim'                  " git提交查询
Plug 'tpope/vim-fugitive'                       " git命令封装
Plug 'airblade/vim-gitgutter'                   " 显示git更改标示
Plug 'junegunn/gv.vim'                          " git提交树
Plug 'mbbill/undotree'
call plug#end()

nnoremap <Leader><Leader>i :PlugInstall<CR>     " 安装插件
nnoremap <Leader><Leader>u :PlugUpdate<CR>      " 更新插件
nnoremap <Leader><Leader>c :PlugClean<CR>       " 删除插件
nnoremap <Leader><Leader>p :PlugUpgrade<CR>     " 更新插件管理器

"+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

" dyng/ctrlsf.vim
nnoremap ,cf :CtrlSF<Space>
nnoremap ,cfc :CtrlSFClose<CR>
nnoremap ,cfs <Plug>CtrlSFCCwordPath<CR>
let g:ctrlsf_ackprg = 'ag'     " 搜索引擎
let g:ctrlsf_position = "right" " 左右打开Linux用let g:ctrlsf_open_left = 0

" neoclide/coc.vim
set shortmess+=c
" tab键补全
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
" 确认补全
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction
" 显示文档
nnoremap <silent> K :call <SID>show_documentation()<CR>
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
nnoremap <silent> <space>d  :<C-u>CocList diagnostics<cr>
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

nnoremap <silent> <space>p  :<C-u>CocList extensions<cr>
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
nnoremap <silent> <space>e :CocCommand explorer<cr>
" coc-extensions
let g:coc_global_extensions = [
  \ 'coc-todolist',
  \ 'coc-bookmark',
  \ 'coc-explorer',
  \ 'coc-python',
  \ 'coc-vimlsp',
  \ 'coc-fzf-preview',
  \ 'coc-jedi',
  \ 'coc-translator',
  \ 'coc-pairs',
  \ 'coc-diagnostic',
  \ ]
" coc-fzf
nnoremap ,fl :CocCommand fzf-preview.Lines<CR>
nnoremap ,fc :CocCommand fzf-preview.Changes<CR>
" coc-todolist
nnoremap ,cc :CocCommand todolist.create<CR>
nnoremap ,ctu :CocCommand todolist.upload<CR>
nnoremap ,ctd :CocCommand todolist.download<CR>
nnoremap ,cte :CocCommand todolist.export<CR>
nnoremap ,ctc :CocCommand todolist.closeNotice<CR>
nnoremap ,cl :CocCommand todolist.clear<CR>
" coc-translator
nnoremap ,t :CocCommand translator.popup<CR>
nnoremap ,tl :CocCommand translator.exportHistory<CR>

" Yggdroot/LeaderF
" let g:Lf_ReverseOrder = 1   "自下而上显示
" nnoremap ,lf :LeaderfFile<CR>
" nnoremap ,lb :LeaderfBuffer<CR>
" nnoremap ,lm :LeaderfMru<CR>
" nnoremap ,lff :LeaderfFunction<CR>
" nnoremap ,le :LeaderfLine<CR>

" mbbill/undotree
nnoremap ,ut :UndotreeToggle<CR>
if has("persistent_undo")
    set undodir="~/.vim/.undodir"
    set undofile
endif

" Yggdroot/indentLine
let g:indentLine_char = '|'
let g:indentLine_enabled = 1
let g:indentLine_color_term = 238
let g:indentLine_fileTypeExclude = ['startify', 'coc-explorer', 'json']

" voldikss/vim-floaterm
let g:floaterm_position = 'center'
tnoremap <ESC> <C-\><C-n> :q<CR>
nnoremap <silent> fn :FloatermNew<CR>
nnoremap <silent> ft :FloatermToggle<CR>
nnoremap <silent> fnn :FloatermNext<CR>
nnoremap <silent> fpp :FloatermPrev<CR>

" junegunn/vim-easy-align
xmap <Leader>ga <Plug>(EasyAlign)
nmap <Leader>ga <Plug>(EasyAlign)

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
noremap ,si :Startify<CR>
let g:startify_bookmarks = [
  \ {'c': '~/dotfiles/.vimrc' },
  \ ]

" Tagbar 安装依赖 : install ctags
nnoremap tb :TagbarToggle<CR>
let g:tagbar_ctags_bin = 'ctags'        "tagbar依赖ctags插件
let g:tagbar_compact = 1                  "tagbar 子窗口中不显示冗余帮助信息
" let g:tagbar_left = 1                   "让tagbar在页面左侧显示，默认右DTree快捷键
let g:tagbar_width = 25                 "设置tagbar的宽度
let g:tagbar_autofocus = 1              "tagbar一打开，光标即在tagbar页面内
let g:tagbar_sort = 0                   "设置标签不排序，默认排序
let g:tagbar_autoshowtag = 1            "当编辑代码时，在Tagbar自动追踪变量
let g:tagbar_iconchars = ['▸', '▾']     "修改默认剪头'▸', '▾'

" scrooloose/nerdtree
nnoremap nt :NERDTreeToggle<CR>
nnoremap nts :NERDTreeFocus<CR>
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
let g:NERDTreeGitStatusUseNerdFonts = 1
let g:NERDTreeGitStatusShowIgnored = 0
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
" colorscheme jellybeans
colorscheme codedark
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
set completeopt=preview,menu                            " 代码补全
set scrolloff=3                                         " 光标移动到buffer的顶部和底部时保持3行距离
autocmd BufWritePost $MYVIMRC source $MYVIMRC

" 快捷键
"" 窗口选择与移动
inoremap kj <esc>
nnoremap H ^
nnoremap L $
" 窗口跳转
nnoremap <Leader>wh <C-w>h
nnoremap <Leader>wj <C-w>j
nnoremap <Leader>wk <C-w>k
nnoremap <Leader>wl <C-w>l
nnoremap <Leader>ww <C-w>w
nnoremap <Leader>wc <C-w>c
nnoremap <Leader>ws <C-w>s
nnoremap <Leader>wv <C-w>v
nnoremap <Leader>w= <C-w>=
nnoremap <Leader>wjj <C-w>+
nnoremap <Leader>wkk <C-w>-
" 窗口通知
nnoremap <Leader>m :messages<CR>
nnoremap <Leader>t :TabMessage messages<CR>
" 文件相关
nnoremap fs :w<CR>
nnoremap W :wa<CR>
nnoremap q :q<CR>
nnoremap Q :qa!<CR>
nnoremap rn :set relativenumber!<CR>
nnoremap ev :edit $MYVIMRC<CR>
nnoremap sm :source $MYVIMRC<CR>
