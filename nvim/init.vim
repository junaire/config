"==============================================
" Basic configuration
" =============================================
set nocompatible
set bs=eol,start,indent
set autoindent
set cindent
set nowrap
set ttimeout
set ttimeoutlen=50
set ruler
set number
set clipboard+=unnamedplus
set cursorline
set ignorecase
set smartcase
set hlsearch
set incsearch
set mouse=a
" Permanent undo
set undodir=~/.vimdid
set undofile
" 总是显示侧边栏（用于显示 mark/gitdiff/诊断信息）
set signcolumn=yes
" 总是显示标签栏
set showtabline=1
" 设置显示制表符等隐藏字符
set list
" 右下角显示命令
set showcmd
" Sane splits
set splitright
set splitbelow
" 显示匹配的括号
set showmatch

" 显示括号匹配的时间
set matchtime=2

" 显示最后一行
set display=lastline

" 允许下方显示目录
set wildmenu

" 延迟绘制（提升性能）
set lazyredraw

" 错误格式
set errorformat+=[%f:%l]\ ->\ %m,[%f:%l]:%m

" 设置分隔符可视
set listchars=tab:\|\ ,trail:.,extends:>,precedes:<

" 如遇Unicode值大于255的文本，不必等到空格再折行
set formatoptions+=m

" 合并两行中文时，不在中间加空格
set formatoptions+=B

" 文件换行符，默认使用 unix 换行符
set ffs=unix,dos,mac

" 设置缩进宽度
set sw=4

" 设置 TAB 宽度
set ts=4

" 禁止展开 tab (noexpandtab)
set noet

set nospell
" 如果后面设置了 expandtab 那么展开 tab 为多少字符
set softtabstop=4
let mapleader = "\<Space>"
"----------------------------------------------------------------------
" 编码设置
"----------------------------------------------------------------------
if has('multi_byte')
	" 内部工作编码
	set encoding=utf-8

	" 文件默认编码
	set fileencoding=utf-8

	" 打开文件时自动尝试下面顺序的编码
	set fileencodings=ucs-bom,utf-8,gbk,gb18030,big5,euc-jp,latin1
endif


"----------------------------------------------------------------------
" 允许 Vim 自带脚本根据文件类型自动设置缩进等
"----------------------------------------------------------------------
if has('autocmd')
	filetype plugin indent on
endif


"----------------------------------------------------------------------
" 语法高亮设置
"----------------------------------------------------------------------
if has('syntax')  
	syntax enable 
	syntax on 
endif

"----------------------------------------------------------------------
" 设置代码折叠
"----------------------------------------------------------------------
if has('folding')
	" 允许代码折叠
	set foldenable

	" 代码折叠默认使用缩进
	set fdm=indent

	" 默认打开所有缩进
	set foldlevel=99
endif



"----------------------------------------------------------------------
" 防止tmux下vim的背景色显示异常
" Refer: http://sunaku.github.io/vim-256color-bce.html
"----------------------------------------------------------------------
if &term =~ '256color' && $TMUX != ''
	" disable Background Color Erase (BCE) so that color schemes
	" render properly when inside 256-color tmux and GNU screen.
	" see also http://snk.tuxfamily.org/log/vim-256color-bce.html
	set t_ut=
endif

" 打开文件时恢复上一次光标所在位置
autocmd BufReadPost *
			\ if line("'\"") > 1 && line("'\"") <= line("$") |
			\	 exe "normal! g`\"" |
			\ endif

"----------------------------------------------------------------------
" 文件搜索和补全时忽略下面扩展名
"----------------------------------------------------------------------
set suffixes=.bak,~,.o,.h,.info,.swp,.obj,.pyc,.pyo,.egg-info,.class

set wildignore=*.o,*.obj,*~,*.exe,*.a,*.pdb,*.lib "stuff to ignore when tab completing
set wildignore+=*.so,*.dll,*.swp,*.egg,*.jar,*.class,*.pyc,*.pyo,*.bin,*.dex
set wildignore+=*.zip,*.7z,*.rar,*.gz,*.tar,*.gzip,*.bz2,*.tgz,*.xz    " MacOSX/Linux
set wildignore+=*DS_Store*,*.ipch
set wildignore+=*.gem
set wildignore+=*.png,*.jpg,*.gif,*.bmp,*.tga,*.pcx,*.ppm,*.img,*.iso
set wildignore+=*.so,*.swp,*.zip,*/.Trash/**,*.pdf,*.dmg,*/.rbenv/**
set wildignore+=*/.nx/**,*.app,*.git,.git
set wildignore+=*.wav,*.mp3,*.ogg,*.pcm
set wildignore+=*.mht,*.suo,*.sdf,*.jnlp
set wildignore+=*.chm,*.epub,*.pdf,*.mobi,*.ttf
set wildignore+=*.mp4,*.avi,*.flv,*.mov,*.mkv,*.swf,*.swc
set wildignore+=*.ppt,*.pptx,*.docx,*.xlt,*.xls,*.xlsx,*.odt,*.wps
set wildignore+=*.msi,*.crx,*.deb,*.vfd,*.apk,*.ipa,*.bin,*.msu
set wildignore+=*.gba,*.sfc,*.078,*.nds,*.smd,*.smc
set wildignore+=*.linux2,*.win32,*.darwin,*.freebsd,*.linux,*.android

" Plugins
call plug#begin()

Plug 'cespare/vim-toml'
Plug 'stephpy/vim-yaml'
Plug 'rhysd/vim-clang-format'
Plug 'plasticboy/vim-markdown'
" Diff 增强，支持 histogram / patience 等更科学的 diff 算法
Plug 'chrisbra/vim-diff-enhanced'
" coc.nvim
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" 展示开始画面，显示最近编辑过的文件
Plug 'mhinz/vim-startify'

" 一次性安装一大堆 colorscheme
Plug 'flazz/vim-colorschemes'

" 支持库，给其他插件用的函数库
Plug 'xolox/vim-misc'

" 用于在侧边符号栏显示 git/svn 的 diff
Plug 'mhinz/vim-signify'

" 配对括号和引号自动补全
Plug 'Raimondi/delimitMate'

" C++ 语法高亮增强，支持 11/14/17 标准
Plug 'bfrg/vim-cpp-modern'

" 额外语法文件
Plug 'justinmk/vim-syntax-extra', { 'for': ['c', 'bison', 'flex', 'cpp'] }

" python 语法文件增强
Plug 'vim-python/python-syntax', { 'for': ['python'] }

Plug 'itchyny/lightline.vim'

Plug 'machakann/vim-highlightedyank'

"fuzzy searching
Plug 'airblade/vim-rooter'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
"----------------------------------------------------------------------
" NERDTree
"----------------------------------------------------------------------
Plug 'scrooloose/nerdtree', {'on': ['NERDTree', 'NERDTreeFocus', 'NERDTreeToggle', 'NERDTreeCWD', 'NERDTreeFind'] }
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

Plug 'tpope/vim-surround'
Plug 'pboettch/vim-cmake-syntax'
Plug 'APZelos/blamer.nvim'

Plug 'lambdalisue/suda.vim'

Plug 'kamykn/spelunker.vim'
Plug 'kamykn/popup-menu.nvim'

Plug 'tyru/open-browser.vim'
call plug#end()

" Just in case hit F1 by mistake
nnoremap <F1> <ESC>
" Jump to start and end of line using the home row keys
map H ^
map L $
noremap <C-h> <left>
noremap <C-j> <down>
noremap <C-k> <up>
noremap <C-l> <right>
inoremap <C-h> <left>
inoremap <C-j> <down>
inoremap <C-k> <up>
inoremap <C-l> <right>
nnoremap <leader>h <c-w>h
nnoremap <leader>j <c-w>j
nnoremap <leader>k <c-w>k
nnoremap <leader>l <c-w>l
nnoremap <leader><leader> :w <cr><c-^>
" Center the cursor vertically when moving to the next word during a search.
nnoremap <silent> n nzz
nnoremap <silent> N Nzz
nnoremap <silent> * *zz
nnoremap <silent> # #zz
nnoremap <silent> g* g*zz

nnoremap ? ?\v
nnoremap / /\v
cnoremap %s/ %sm/

" remove extra spaces
nnoremap <leader>c :%s/\s\+$//<cr>

nnoremap <leader>q :qa! <cr>


" Rg search
if executable('rg')
	set grepprg=rg\ --no-heading\ --vimgrep
	set grepformat=%f:%l:%c:%m
endif

noremap <c-s> :Rg <enter>
let g:fzf_layout = { 'down': '~20%' }
command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always '.shellescape(<q-args>), 1,
  \   <bang>0 ? fzf#vim#with_preview('up:60%')
  \           : fzf#vim#with_preview('right:50%:hidden', '?'),
  \   <bang>0)
function! s:list_cmd()
  let base = fnamemodify(expand('%'), ':h:.:S')
  return base == '.' ? 'fd --type file --follow' : printf('fd --type file --follow | proximity-sort %s', shellescape(expand('%')))
endfunction

command! -bang -nargs=? -complete=dir Files
  \ call fzf#vim#files(<q-args>, {'source': s:list_cmd(),
  \                               'options': '--tiebreak=index'}, <bang>0)

"================================================
" coc.nvim tab completion
" ===============================================
"
" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
			\ pumvisible() ? "\<C-n>" :
			\ <SID>check_back_space() ? "\<TAB>" :
			\ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
function! s:check_back_space() abort
	let col = col('.') - 1
	return !col || getline('.')[col - 1]  =~# '\s'
endfunction

nnoremap <silent> <leader>d :call CocActionAsync("doHover") <cr>

" Lightline
let g:lightline = {
			\ 'active': {
				\   'left': [ [ 'mode', 'paste' ],
				\             [ 'readonly', 'filename', 'modified' ] ],
				\   'right': [ [ 'lineinfo' ],
				\              [ 'percent' ],
				\              [ 'fileencoding', 'filetype' ] ],
				\ },
				\ 'component_function': {
					\   'filename': 'LightlineFilename'
					\ },
					\ }
function! LightlineFilename()
	return expand('%:t') !=# '' ? @% : '[No Name]'
endfunction


" NerdTree
let g:NERDTreeMinimalUI = 1
let g:NERDTreeDirArrows = 1
let g:NERDTreeHijackNetrw = 0
noremap <leader>nn :NERDTree<cr>
noremap <leader>no :NERDTreeFocus<cr>
noremap <leader>nm :NERDTreeMirror<cr>
noremap <leader>nt :NERDTreeToggle<cr>

" signify 调优
let g:signify_vcs_list = ['git', 'svn']
let g:signify_sign_add               = '+'
let g:signify_sign_delete            = '-'
let g:signify_sign_delete_first_line = '_'
let g:signify_sign_change            = '~'
let g:signify_sign_changedelete      = g:signify_sign_change

" git 仓库使用 histogram 算法进行 diff
let g:signify_vcs_cmds = {
			\ 'git': 'git diff --no-color --diff-algorithm=histogram --no-ext-diff -U0 -- %f',
			\}

"clang-format
let g:clang_format#auto_format=1
"coc.nvim for c++
nmap <silent> <leader>gd <Plug>(coc-definition)
nmap <silent> <leader>gr <Plug>(coc-references)

" vim-rooter
let g:rooter_patterns = ['.git', 'Makefile', 'go.mod', "requirements.txt", "LISENCE"]

" blamer.nvim
let g:blamer_enabled = 0
let g:blamer_delay = 500
let g:blamer_template = '<commit-short> <committer> <author-time> <summary>'
nnoremap <leader>b :BlamerToggle <cr>

" Suda.nvim
nnoremap <leader>w :SudaWrite<cr>

" spelunker.vim.
let g:enable_spelunker_vim = 1

" Disable spelunker.vim on readonly files or buffer. (default: 0)
let g:enable_spelunker_vim_on_readonly = 0

" Check spelling for words longer than set characters. (default: 4)
let g:spelunker_target_min_char_len = 4

" Max amount of word suggestions. (default: 15)
let g:spelunker_max_suggest_words = 15

" Max amount of highlighted words in buffer. (default: 100)
let g:spelunker_max_hi_words_each_buf = 100

" Spellcheck type: (default: 1)
" 1: File is checked for spelling mistakes when opening and saving. This
" may take a bit of time on large files.
" 2: Spellcheck displayed words in buffer. Fast and dynamic. The waiting time
" depends on the setting of CursorHold `set updatetime=1000`.
let g:spelunker_check_type = 1

" Highlight type: (default: 1)
" 1: Highlight all types (SpellBad, SpellCap, SpellRare, SpellLocal).
" 2: Highlight only SpellBad.
" FYI: https://vim-jp.org/vimdoc-en/spell.html#spell-quickstart
let g:spelunker_highlight_type = 1

" Option to disable word checking.
" Disable URI checking. (default: 0)
let g:spelunker_disable_uri_checking = 1

" Disable email-like words checking. (default: 0)
let g:spelunker_disable_email_checking = 1

" Disable account name checking, e.g. @foobar, foobar@. (default: 0)
" NOTE: Spell checking is also disabled for JAVA annotations.
let g:spelunker_disable_account_name_checking = 1

" Disable acronym checking. (default: 0)
let g:spelunker_disable_acronym_checking = 1

" Disable checking words in backtick/backquote. (default: 0)
let g:spelunker_disable_backquoted_checking = 1

" Disable default autogroup. (default: 0)
let g:spelunker_disable_auto_group = 1

" Create own custom autogroup to enable spelunker.vim for specific filetypes.
augroup spelunker
  autocmd!
  " Setting for g:spelunker_check_type = 1:
  autocmd BufWinEnter,BufWritePost *.vim,*.js,*.jsx,*.json,*.md call spelunker#check()

  " Setting for g:spelunker_check_type = 2:
  autocmd CursorHold *.vim,*.js,*.jsx,*.json,*.md call spelunker#check_displayed_words()
augroup END

" Override highlight group name of incorrectly spelled words. (default:
" 'SpelunkerSpellBad')
let g:spelunker_spell_bad_group = 'SpelunkerSpellBad'

" Override highlight group name of complex or compound words. (default:
" 'SpelunkerComplexOrCompoundWord')
let g:spelunker_complex_or_compound_word_group = 'SpelunkerComplexOrCompoundWord'

" Override highlight setting.
highlight SpelunkerSpellBad cterm=underline ctermfg=247 gui=underline guifg=#9e9e9e
highlight SpelunkerComplexOrCompoundWord cterm=underline ctermfg=NONE gui=underline guifg=NONE

" open browser

nmap <leader>s <Plug>(openbrowser-smart-search)
vmap <leader>s <Plug>(openbrowser-smart-search)

""----------------------------------------------------------------------
" 更改样式
"----------------------------------------------------------------------

colorscheme gruvbox

" 更清晰的错误标注：默认一片红色背景，语法高亮都被搞没了
" 只显示红色或者蓝色下划线或者波浪线
hi! clear SpellBad
hi! clear SpellCap
hi! clear SpellRare
hi! clear SpellLocal
if has('gui_running')
	hi! SpellBad gui=undercurl guisp=red
	hi! SpellCap gui=undercurl guisp=blue
	hi! SpellRare gui=undercurl guisp=magenta
	hi! SpellRare gui=undercurl guisp=cyan
else
	hi! SpellBad term=standout ctermfg=1 term=underline cterm=underline
	hi! SpellCap term=underline cterm=underline
	hi! SpellRare term=underline cterm=underline
	hi! SpellLocal term=underline cterm=underline
endif

" 去掉 sign column 的白色背景
hi! SignColumn guibg=NONE ctermbg=NONE

" 修改行号为浅灰色，默认主题的黄色行号很难看，换主题可以仿照修改
highlight LineNr term=bold cterm=NONE ctermfg=DarkGrey ctermbg=NONE 
	\ gui=NONE guifg=DarkGrey guibg=NONE

