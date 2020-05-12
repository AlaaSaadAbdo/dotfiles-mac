""" Vim-Plug
call plug#begin()

" Presentation
Plug 'idbrii/vim-remarkjs'
Plug 'idbrii/vim-gogo'

" Aesthetics - Main
Plug 'masukomi/vim-markdown-folding'
Plug 'mzlogin/vim-markdown-toc'
Plug 'tpope/vim-markdown'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install'  }
Plug 'clarke/vim-renumber'
Plug 'rafi/awesome-vim-colorschemes'
Plug 'dominikduda/vim_current_word'
Plug 'dhruvasagar/vim-table-mode'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'junegunn/vim-journal'
Plug 'Yggdroot/indentLine'
Plug 'dstein64/vim-startuptime'
Plug 'ryanoasis/vim-devicons'
Plug 'airblade/vim-gitgutter'
Plug 'reedes/vim-lexical'
Plug 'arzg/vim-colors-xcode'

" Onhold
Plug 'voldikss/vim-floaterm'

" TODO Remove if not needed
" Plug 'mhinz/vim-startify'
" Plug 'junegunn/rainbow_parentheses.vim'
" Plug 'morhetz/gruvbox'
" Plug 'junegunn/vim-peekaboo'

" Functionalities
Plug 'prabirshrestha/async.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'SidOfc/mkdx'
Plug 'towolf/vim-helm'
Plug 'AndrewRadev/splitjoin.vim'
Plug 'tbabej/taskwiki'
Plug 'vimwiki/vimwiki'
Plug 'alok/notational-fzf-vim'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'neomake/neomake'
Plug 'rizzatti/dash.vim'
Plug 'qpkorr/vim-bufkill'
Plug 'haya14busa/incsearch-fuzzy.vim'
Plug 'haya14busa/incsearch.vim'
Plug 'easymotion/vim-easymotion'
Plug 'haya14busa/incsearch-easymotion.vim'
Plug 'brooth/far.vim'
Plug 'docker/docker'
Plug 'mbbill/undotree'
Plug 'iamcco/mathjax-support-for-mkdp'
Plug 'tpope/vim-rhubarb'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'will133/vim-dirdiff'
Plug 'majutsushi/tagbar'
Plug 'scrooloose/nerdcommenter'
Plug 'honza/vim-snippets'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'sheerun/vim-polyglot'
Plug 'chrisbra/Colorizer'
Plug 'heavenshell/vim-pydocstring'
Plug 'metakirby5/codi.vim'
Plug 'roxma/nvim-yarp'
Plug 'roxma/vim-hug-neovim-rpc'
Plug 'hashivim/vim-terraform'
Plug 'dense-analysis/ale'
Plug 'juliosueiras/vim-terraform-completion'
Plug 'airblade/vim-rooter'
Plug 'junegunn/vim-easy-align'
Plug 'alvan/vim-closetag', { 'for': 'HTML' }

" TODO remove after keeping in hold
" Plug 'prabirshrestha/vim-lsp'
" Plug 'mattn/vim-lsp-settings'
" Plug 'ekalinin/Dockerfile.vim'
" Plug 'scrooloose/nerdtree'
" Plug 'SirVer/ultisnips'
" Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
" Plug 'zchee/deoplete-jedi'
" Plug 'lighttiger2505/deoplete-vim-lsp'
" Plug 'jiangmiao/auto-pairs'
" Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
" Plug 'tsony-tsonev/nerdtree-git-plugin', { 'on': 'NERDTreeToggle'}
" Plug 'alex-tu-cc/vim-UltiSnips'
" Plug 'elzr/vim-json'
" Plug 'vim-scripts/loremipsum'
" Plug 'chrisbra/sudoedit.vim'
" Plug 'ervandew/supertab'

call plug#end()

" let g:loaded_netrw= 1
" let g:netrw_loaded_netrwPlugin= 1

""" Python3 VirtualEnv
let g:python3_host_prog = expand('/usr/local/bin/python3')
let g:python_host_prog = expand('/usr/bin/python')

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
set signcolumn=yes
autocmd FileType tagbar,man setlocal signcolumn=no

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
" color gruvbox
colorscheme gruvbox
let g:gruvbox_contrast_dark = 'hard'
highlight Comment cterm=italic gui=italic
highlight Whitespace ctermfg=3 guifg=3
highlight Normal guibg=NONE ctermbg=NONE
highlight LineNr guibg=NONE ctermbg=NONE

" set cursorcolumn
set cursorline

" set autowrite                   " Automatically save before :next, :make etc.
set splitright                  " Vertical windows should be split to right
set splitbelow                  " Horizontal windows should split to bottom
set showcmd                     " Show me what I'm typing
set autoread                    " Automatically read changed files
" Enter automatically into the files directory
" autocmd BufEnter * silent! lcd %:p:h


""" Other Configurations
filetype plugin indent on
set tabstop=2 softtabstop=2 shiftwidth=2 expandtab smarttab autoindent
set incsearch ignorecase smartcase hlsearch
set ruler laststatus=2 showcmd noshowmode
set list listchars=trail:»,tab:»-
set linebreak
set conceallevel=0
autocmd BufReadPre,FileReadPre * :hi TrailSpace guifg=#b16286
autocmd BufReadPre,FileReadPre * :hi Tab guifg=#b16286
autocmd BufReadPre,FileReadPre * :match Tab "\t"
autocmd BufReadPre,FileReadPre * :match TrailSpace " *$"
set fillchars+=vert:\
set wrap breakindent
set encoding=utf-8
set number
set title
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
nmap <leader>w :TagbarToggle<CR>
nmap <leader>ft :TagbarOpen fj<CR>
nmap <leader>ee :Colors<CR>
nmap <leader>ea :AirlineTheme
nmap <leader>r :so ~/.config/nvim/init.vim<CR>
nmap <leader>t :call TrimWhitespace()<CR>
xmap <leader>a gaip*
nmap <leader>a gaip*
nmap <leader>d <Plug>(pydocstring)
nmap <leader>f :GFiles<CR>
nmap <leader>F :Files<CR>
nmap <leader>C :Codi!!
nmap <leader>j :set filetype=journal<CR>
nmap <leader>k :ColorToggle<CR>
nmap <leader>u :UndotreeToggle<CR>
nmap <leader>c :BD<CR>
nmap <leader>Z :Dash<CR>
nmap <leader>NV :NV<CR>
" nmap <Leader>b :Buffers<CR>
" nmap <Leader>H :History<CR>
" nmap <Leader>z :NERDTreeFocus<cr>R<c-w><c-p>
" nmap <leader>q :NERDTreeToggle<CR>
" nmap <leader>fn :NERDTreeFocus<CR>
" nmap <Leader>fc :NERDTreeFind<CR>
" nmap \ <leader>q <leader>w
" nmap <leader>hs <C-w>s<C-w>j:terminal<CR>
" nmap <leader>vs <C-w>v<C-w>l:terminal<CR>
" nmap <leader>h :RainbowParentheses!!<CR>

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
vnoremap x "_x

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

" vimdiff test
" highlight! link DiffText MatchParen

set foldmethod=marker
set foldlevel=99


" Search current word in google
nnoremap <silent> <leader>sg :!Open "http://google.com/search?q="<cword><cr>

""" plugins options
source ~/.config/nvim/plugins.vim
