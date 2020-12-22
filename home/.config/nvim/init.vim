""" Vim-Plug
call plug#begin()

" Functionalities
Plug 'prabirshrestha/async.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}
Plug 'antoinemadec/coc-fzf'
Plug 'AndrewRadev/splitjoin.vim'
Plug 'vimwiki/vimwiki'
Plug 'neomake/neomake'
Plug 'qpkorr/vim-bufkill'
Plug 'haya14busa/incsearch-fuzzy.vim'
Plug 'haya14busa/incsearch.vim'
Plug 'easymotion/vim-easymotion'
Plug 'haya14busa/incsearch-easymotion.vim'
Plug 'brooth/far.vim'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-unimpaired'
Plug 'airblade/vim-gitgutter'
Plug 'machakann/vim-sandwich'
Plug 'will133/vim-dirdiff'
Plug 'scrooloose/nerdcommenter'
Plug 'honza/vim-snippets'
Plug 'heavenshell/vim-pydocstring'
Plug 'roxma/vim-hug-neovim-rpc'
Plug 'tpope/vim-unimpaired'
Plug 'hashivim/vim-terraform'
Plug 'dense-analysis/ale'
Plug 'juliosueiras/vim-terraform-completion'
Plug 'junegunn/vim-easy-align'
Plug 'voldikss/vim-floaterm'
Plug 'knubie/vim-kitty-navigator'
Plug 'psliwka/vim-smoothie'
Plug 'djoshea/vim-autoread'
Plug 'mzlogin/vim-markdown-toc'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install'  }
Plug 'dhruvasagar/vim-table-mode'
Plug 'reedes/vim-lexical'
Plug 'alvan/vim-closetag'
Plug 'dstein64/vim-startuptime'
Plug 'HerringtonDarkholme/yats.vim'

""" Currently not used
" Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
" Plug 'roxma/nvim-yarp'

"" evaluate against coc-docker
Plug 'docker/docker'

" Presentation
Plug 'idbrii/vim-remarkjs'
Plug 'idbrii/vim-gogo'

" Aesthetics - Main
Plug 'sainnhe/gruvbox-material'
Plug 'vim-airline/vim-airline'
Plug 'masukomi/vim-markdown-folding'
Plug 'tpope/vim-markdown'
Plug 'dominikduda/vim_current_word'
Plug 'junegunn/vim-journal'
Plug 'Yggdroot/indentLine'

" Trial
Plug 'junegunn/gv.vim'
Plug 'rhysd/conflict-marker.vim'
Plug 'junegunn/rainbow_parentheses.vim'
Plug 'liuchengxu/vista.vim'
Plug 'Shougo/neco-vim'
Plug 'neoclide/coc-neco'
Plug 'mhinz/vim-startify'

call plug#end()

runtime macros/sandwich/keymap/surround.vim

let g:loaded_netrw= 1
let g:netrw_loaded_netrwPlugin= 1

""" Python3 VirtualEnv
let g:python3_host_prog = expand('/usr/local/bin/python3')
let g:python_host_prog = expand('/usr/bin/python')
let g:perl_host_prog = expand('/usr/local/bin/perl')

colorscheme gruvbox-material
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

let g:conflict_marker_highlight_group = ''
let g:conflict_marker_begin = '^<<<<<<< .*$'
let g:conflict_marker_end   = '^>>>>>>> .*$'
highlight ConflictMarkerBegin guibg=#2f7366
highlight ConflictMarkerOurs guibg=#2e5049
highlight ConflictMarkerTheirs guibg=#344f69
highlight ConflictMarkerEnd guibg=#2f628e
highlight ConflictMarkerCommonAncestorsHunk guibg=#754a81

"use clipboard as default register"
set clipboard=unnamedplus
" live preview
set inccommand=nosplit

"command ignore case"
set ignorecase
set infercase
set wildignorecase
set hidden

" Give more space for displaying messages.
set cmdheight=2
" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300
" Don't pass messages to |ins-completion-menu|.
set shortmess+=c
" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
set signcolumn=yes:1
autocmd FileType man,floaterm,fzf,qf setlocal signcolumn=no

" disabled for pairing
" dynamic hybrid number column (relative outside of insert mode and absolute in insert mode)
" :set number relativenumber
"
" :augroup numbertoggle
" :  autocmd!
" :  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
" :  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
" :augroup END

"This unsets the last search pattern register by hitting return
"nnoremap <CR> :noh<CR><CR>:<backspace>

""" Coloring
set termguicolors
syntax on
set nocompatible
filetype plugin on
set background=dark
" colorscheme gruvbox-material
" colorscheme gruvbox
highlight Comment cterm=italic gui=italic
highlight Whitespace ctermfg=3 guifg=3
" highlight Normal guibg=NONE ctermbg=NONE
" highlight LineNr guibg=NONE ctermbg=NONE

set cursorline " set cursorcolumn
set autowrite  " Automatically save before :next, :make etc.
set splitright " Vertical windows should be split to right
set splitbelow " Horizontal windows should split to bottom
set showcmd    " Show me what I'm typing
set autoread   " Automatically read changed files

" persisten undo without undotree
set undodir="~/.undodir/"
set undolevels=1000
set undoreload=10000

""" Other Configurations
filetype plugin indent on
set tabstop=2 softtabstop=2 shiftwidth=2 expandtab smarttab autoindent
set incsearch ignorecase smartcase hlsearch
set ruler laststatus=2 showcmd noshowmode
set list listchars=trail:·,tab:»-
set linebreak
set conceallevel=0
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
set diffopt+=vertical
" disable auto comment on newline
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
set shortmess-=S
set nospell

""" Filetype-Specific Configurations

" HTML, XML, Jinja
autocmd FileType html setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType css setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType xml setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType htmldjango setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType htmldjango inoremap {{ {{  }}<left><left><left>
autocmd FileType htmldjango inoremap {% {%  %}<left><left><left>
autocmd FileType htmldjango inoremap {# {#  #}<left><left><left>

" Markdown and Journal
autocmd FileType markdown setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType journal setlocal shiftwidth=2 tabstop=2 softtabstop=2

""" Custom Functions

" Trim Whitespaces
function! TrimWhitespace()
   let l:save = winsaveview()
   %s/\\\@<!\s\+$//e
   call winrestview(l:save)
endfunction

""" Custom Mappings

let mapleader=","
nmap <leader>ee :Colors<CR>
nmap <leader>ea :AirlineTheme
nmap <leader>r :so ~/.config/nvim/init.vim<CR>
nmap <leader>t :call TrimWhitespace()<CR>
nmap <leader>bt :FloatermNew --height=0.4 --wintype=window --autoclose=2<CR>
xmap <leader>a gaip*
nmap <leader>a gaip*
" nmap <leader>d <Plug>(pydocstring)
nmap <leader>f :GFiles<CR>
nmap <leader>F :Files<CR>
nmap <leader>C :Codi!!
nmap <leader>u :UndotreeToggle<CR>
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


" search for something in the history of the repo
" Glog -Stest -- " search for text in history of git
" Glog -- diff2  " git the history of file diff2

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

inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
noremap pumvisible() ? "\" : " "

" " vimdiff test
" highlight! link DiffText MatchParen
autocmd FileType javascript,javascriptreact,typescript,typescriptreact setlocal foldmethod=syntax
" set foldcolumn=1 "defines 1 col at window left, to indicate folding
let javaScript_fold=1 "activate folding by JS syntax
set foldmethod=marker
set foldlevel=99

inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

inoremap <expr> <C-n> pumvisible() ? '<C-n>' :
 "\ '<C-n><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'

inoremap <expr> <M-,> pumvisible() ? '<C-n>' :
 "\ '<C-x><C-o><C-n><C-p><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'

" Search current word in google
nnoremap <silent> <leader>sg :!Open "http://google.com/search?q="<cword><cr>

nmap <leader>fd :call fzf#run(fzf#wrap({'source': 'fasd -d -R', 'sink': { line -> execute('cd '.split(line)[-1]) }}))<CR>

""" plugins options
source ~/.config/nvim/plugins.vim
