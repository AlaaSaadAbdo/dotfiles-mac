""" Vim-Plug
call plug#begin()

""" Functionalities
Plug 'prabirshrestha/async.vim'
Plug 'neomake/neomake'
Plug 'tpope/vim-unimpaired'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}
Plug 'antoinemadec/coc-fzf'
Plug 'haya14busa/incsearch.vim'
Plug 'easymotion/vim-easymotion'
Plug 'haya14busa/incsearch-easymotion.vim'
Plug 'psliwka/vim-smoothie'
Plug 'djoshea/vim-autoread'
Plug 'mzlogin/vim-markdown-toc', { 'for': 'markdown' }
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install', 'for': 'markdown'  }
Plug 'qpkorr/vim-bufkill'
Plug 'knubie/vim-kitty-navigator'
Plug 'voldikss/vim-floaterm'
Plug 'dstein64/vim-startuptime', { 'on':  'StartupTime' }
Plug 'tpope/vim-repeat'

""" Git
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'rhysd/conflict-marker.vim'

""" Code
Plug 'dense-analysis/ale'
Plug 'honza/vim-snippets'
Plug 'scrooloose/nerdcommenter'
Plug 'juliosueiras/vim-terraform-completion', { 'for': 'terraform' }
Plug 'alvan/vim-closetag', { 'for': ['html', 'javascript', 'javascriptreact', 'typescript', 'typescriptreact', 'css'] }
Plug 'hashivim/vim-terraform', { 'for': 'terraform' }

""" Text editing
Plug 'junegunn/vim-easy-align'
Plug 'AndrewRadev/splitjoin.vim'
Plug 'machakann/vim-sandwich'
Plug 'dhruvasagar/vim-table-mode', { 'for': ['markdown', 'vimwiki', 'journal'] }
Plug 'reedes/vim-lexical', { 'for': ['markdown', 'vimwiki', 'journal'] }

""" Notes
Plug 'vimwiki/vimwiki'

""" Presentation
Plug 'idbrii/vim-remarkjs', { 'for': ['markdown'] }
Plug 'idbrii/vim-gogo', { 'for': ['markdown'] }

""" Aesthetics
Plug 'sainnhe/gruvbox-material'
Plug 'itchyny/lightline.vim'
Plug 'mengelbrecht/lightline-bufferline'
Plug 'josa42/vim-lightline-coc'
Plug 'sinetoami/lightline-hunks'

Plug 'dominikduda/vim_current_word'
Plug 'junegunn/vim-journal'
Plug 'Yggdroot/indentLine'
Plug 'masukomi/vim-markdown-folding', { 'for': ['markdown'] }

""" Trial
Plug 'junegunn/rainbow_parentheses.vim'

Plug 'Shougo/neco-vim', {'for': ['vim']}
Plug 'neoclide/coc-neco', {'for': ['vim']}

" " lags on type script
" Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  " We recommend updating the parsers on update
" Plug 'nvim-treesitter/nvim-treesitter-textobjects'

call plug#end()

""" Gopass
au BufNewFile,BufRead /private/**/gopass** setlocal noswapfile nobackup noundofile

""" Python3 VirtualEnv
let g:python3_host_prog = expand('/usr/local/bin/python3')
let g:python_host_prog = expand('/usr/bin/python')
let g:perl_host_prog = expand('/usr/local/bin/perl')

" Colorscheme has to be loaded here otherwise it won't respect the options
let g:gruvbox_material_palette = 'mix'
let g:gruvbox_material_background = 'hard'
let g:gruvbox_material_visual = 'green background'
let g:gruvbox_material_transparent_background = 1
let g:gruvbox_material_enable_italic = 1
let g:gruvbox_material_enable_bold = 1
let g:gruvbox_material_current_word = 'bold'
let g:gruvbox_material_menu_selection_background = 'grey'
let g:gruvbox_material_sign_column_background = 'default'
let g:gruvbox_material_diagnostic_line_highlight = 1
let g:gruvbox_material_better_performance = 1
let g:gruvbox_material_statusline_style = 'original'
colorscheme gruvbox-material

set clipboard=unnamedplus
set inccommand=nosplit

set hidden
set incsearch hlsearch infercase ignorecase

set showtabline=2
set cmdheight=2
set updatetime=300
set shortmess+=c
set signcolumn=yes:1
autocmd FileType man,floaterm,fzf,qf setlocal signcolumn=no

" Session config to ignore coc-explorer
set sessionoptions=buffers,curdir,folds,help,options,tabpages,winsize

""" Folding
autocmd FileType vim setlocal foldmethod=marker
set foldlevel=99
set foldmethod=expr
set foldexpr=nvim_treesitter#foldexpr()

""" Coloring
set termguicolors
syntax on
set nocompatible
filetype plugin on
set background=dark
highlight Comment cterm=italic gui=italic
highlight Whitespace ctermfg=3 guifg=3

set cursorline autowrite
set splitright splitbelow
set autoread

" persisten undo
set undodir="~/.undodir/"
set undolevels=1000
set undoreload=10000

""" Other Configurations
set tabstop=2 softtabstop=2 shiftwidth=2 expandtab smarttab autoindent
set backspace=indent,eol,start
set complete-=i
set nrformats-=octal
set ttimeout
set ttimeoutlen=100
set ruler laststatus=2 showcmd noshowmode
set wildmenu
set list listchars=trail:·,tab:»-
set linebreak
set conceallevel=0
set scrolloff=1
set sidescrolloff=5
set display+=lastline
autocmd BufReadPre,FileReadPre * :hi TrailSpace guifg=#b16286
autocmd BufReadPre,FileReadPre * :hi Tab guifg=#b16286
autocmd BufReadPre,FileReadPre * :match Tab "\t"
autocmd BufReadPre,FileReadPre * :match TrailSpace " *$"
set fillchars+=vert:│
set wrap breakindent
set encoding=utf-8
set number
set numberwidth=2
set title
  let &titlestring='%t - nvim'
set viminfo^=!
set tabpagemax=50
set history=1000
set diffopt+=vertical
set formatoptions+=j
set shortmess-=S
set nospell
set endofline
autocmd FileType * setlocal formatoptions-=cro

""" Filetype-Specific Configurations

" HTML, XML, Jinja
autocmd FileType html setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType css setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType xml setlocal shiftwidth=2 tabstop=2 softtabstop=2

" Markdown and Journal
autocmd FileType markdown setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType journal setlocal shiftwidth=2 tabstop=2 softtabstop=2

" Disable netrw
let g:loaded_netrw= 1
let g:netrw_loaded_netrwPlugin= 1

""" Custom Functions

" Trim Whitespaces
function! TrimWhitespace()
  let l:save = winsaveview()
  %s/\\\@<!\s\+$//e
  call winrestview(l:save)
endfunction

function TrimEndLines()
  let l:save = winsaveview()
  silent! %s#\($\n\s*\)\+\%$##
  call winrestview(l:save)
endfunction

""" Custom Mappings
let mapleader=","
nmap <leader>ee :Colors<CR>
nmap <leader>ea :AirlineTheme
nmap <leader>r :so ~/.config/nvim/init.vim<CR>
nmap <leader>ts :call TrimWhitespace()<CR>
nmap <leader>tl :call TrimEndLines()<CR>
nmap <leader>bt :FloatermNew --height=0.4 --wintype=window --autoclose=2<CR>
xmap <leader>a gaip*
nmap <leader>a gaip*
nmap <leader>f :GFiles<CR>
nmap <leader>F :Files<CR>
nmap <leader>c :BD<CR>
nmap <Leader>b :Buffers<CR>
nmap <Leader>H :History<CR>
nmap <Leader>W :Windows<CR>
nmap <leader>h :RainbowParentheses!!<CR>

" fugitive
nnoremap <leader>gs :Gstatus<CR>
nnoremap <leader>gc :Gcommit -v -q<CR>
nnoremap <leader>ga :Gcommit --amend<CR>
nnoremap <leader>gt :Gcommit -v -q %<CR>
nnoremap <leader>gd :Gdiff<CR>
nnoremap <leader>ge :Gedit<CR>
nnoremap <leader>gr :Gread<CR>
nnoremap <leader>gw :Gwrite<CR><CR>
nnoremap <leader>gl :silent! Glog<CR>
nnoremap <leader>gp :Ggrep<Space>
nnoremap <leader>gm :Gmove<Space>
nnoremap <leader>gb :Git branch<Space>
nnoremap <leader>go :Git checkout<Space>
nnoremap <leader>gps :Dispatch! git push<CR>
nnoremap <leader>gpl :Dispatch! git pull<CR>

nnoremap x "_x
vnoremap x "_xa

" replace selected text
vnoremap <C-r> "hy:%s/<C-r>h//gc<left><left><left>

nmap <Tab> :bnext<CR>
nmap <S-Tab> :bprevious<CR>
nmap <leader>wf :Ag<CR>

" split buffer navigation
nnoremap <C-Down> <C-w>j
nnoremap <C-Up> <C-w>k
nnoremap <C-Left> <C-w>h
nnoremap <C-Right> <C-w>l

nnoremap <S-J> <C-w>+
nnoremap <S-K> <C-w>-
nnoremap <S-H> <C-w><
nnoremap <S-L> <C-w>>

" Search current word in google
nnoremap <silent> <leader>sg :!Open "http://google.com/search?q="<cword><cr>

" disable search highlight when pressing <CR> in normal mode
nnoremap <CR> :noh<CR><CR>:<backspace>

""" plugins options
source ~/.config/nvim/plugins.vim

""" Unused but potentially useful

" search for something in the history of the repo
" Glog -Stest -- " search for text in history of git
" Glog -- diff2  " git the history of file diff2

" disabled for pairing
" dynamic hybrid number column (relative outside of insert mode and absolute in insert mode)
" :set number relativenumber
"
" :augroup numbertoggle
" :  autocmd!
" :  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
" :  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
" :augroup END

" Make sure nothing opened in coc-explorer buffer
" autocmd BufEnter * if bufname('#') =~# "\[coc-explorer\]-." && winnr('$') > 1 | b# | endif

" " CoC Explorer Settings
" augroup MyCocExplorer
"   autocmd!
"   autocmd VimEnter * sil! au! F
"   " set window status line
"   " autocmd FileType coc-explorer setl statusline=File-Explorer
"   "quit explorer whein it's the last
"   autocmd BufEnter * if (winnr("$") == 1 && &filetype == 'coc-explorer') | q | endif
"   " Make sure nothing opened in coc-explorer buffer
"   autocmd BufEnter * if bufname('#') =~# "\[coc-explorer\]-." && winnr('$') > 1 | b# | endif
"   " open if directory specified or if buffer empty
"   " autocmd VimEnter * let d = expand('%:p')
"   "   \ | if argc() == 0
"   "     \ | exe 'CocCommand explorer --quit-on-open --position floating --sources buffer+,file+'
"   "   \ | elseif isdirectory(d) || (bufname()=='')
"   "     \ | silent! bd
"   "     \ | exe 'CocCommand explorer --quit-on-open --position floating --sources buffer+,file+ ' . d
"   "     \ | exe 'cd ' . d
"   "   \ | else
"   "     \ | cd %:p:h
"   "   \ | endif
"   " " cd after open
"   " autocmd User CocExplorerOpenPost let dir = getcwd() | call CocActionAsync("runCommand", "explorer.doAction", "closest", {"name": "cd", "args": [dir]})
" augroup END

" " show long file names in coc
" function! s:ShowFilename()
"     let s:node_info = CocAction('runCommand', 'explorer.getNodeInfo', 0)
"     if exists('s:node_info.fullpath')
"       let s:split_path = split(s:node_info.fullpath, "/")
"       echohl Debug | echo s:split_path[len(s:split_path) - 1]
"     endif
"     " redraw | echohl Debug | echom exists('s:node_info.fullpath') ?
"     " \ 'CoC Explorer: ' . s:node_info.fullpath : '' | echohl None
" endfunction
" autocmd CursorMoved \[coc-explorer\]* :call <SID>ShowFilename()
