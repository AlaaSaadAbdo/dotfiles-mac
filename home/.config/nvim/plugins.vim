" COC {{{1 "
let g:coc_global_extensions = [
  \ 'coc-json',
  \ 'coc-git',
  \ 'coc-tsserver',
  \ 'coc-tabnine',
  \ 'coc-styled-components',
  \ 'coc-snippets',
  \ 'coc-prettier',
  \ 'coc-pairs',
  \ 'coc-lists',
  \ 'coc-highlight',
  \ 'coc-git',
  \ 'coc-floaterm',
  \ 'coc-explorer',
  \ 'coc-eslint',
  \ 'coc-cssmodules',
  \ 'coc-yaml',
  \ 'coc-markdownlint',
  \ 'coc-json',
  \ 'coc-html',
  \ 'coc-css',
  \ 'coc-tag',
  \ 'coc-rls'
  \ ]
let g:coc_fzf_preview = 'up:70%:sharp'
inoremap <silent> <C-right> <C-R>=coc#start({'source': 'snippets'})<CR>
inoremap <silent><expr> <c-space> coc#refresh()

let g:coc_explorer_global_presets = {
\   'mine': {
\     'sources': [{'name': 'buffer', 'expand': v:false},{'name': 'file','expand': v:true}],
\     'file-child-template': '[git | 2] [selection | clip | 1] [indent][icon | 1] [diagnosticError & 1][filename omitCenter 1][modified][readonly] [linkIcon & 1][link omitCenter 5]'
\   },
\   'nvim': {
\     'root-uri': expand('~/.config/nvim/'),
\     'file-child-template': '[selection | clip | 1] [indent][icon | 1] [filename omitCenter 1]'
\   },
\   'pos': {
\     'root-uri': expand('~/porsche/git/pos/'),
\   },
\   'cocConfig': {
\      'root-uri': '~/.config/coc',
\   },
\   'floating': {
\     'position': 'floating',
\     'open-action-strategy': 'sourceWindow',
\   },
\   'floatingTop': {
\     'position': 'floating',
\     'floating-position': 'center-top',
\     'open-action-strategy': 'sourceWindow',
\   },
\   'floatingLeftside': {
\     'position': 'floating',
\     'floating-position': 'left-center',
\     'floating-width': 50,
\     'open-action-strategy': 'sourceWindow',
\   },
\   'floatingRightside': {
\     'position': 'floating',
\     'floating-position': 'right-center',
\     'floating-width': 50,
\     'open-action-strategy': 'sourceWindow',
\   },
\   'buffer': {
\     'sources': [{'name': 'buffer', 'expand': v:true}]
\   },
\ }

nmap <leader>fc :CocCommand explorer --no-toggle --focus<CR>
nmap <leader>v  :CocCommand explorer --width=35 --preset nvim<CR>
nmap <leader>pos  :CocCommand explorer --width=35 --preset pos<CR>
nmap <leader>ff :CocCommand explorer --preset floating<CR>
nmap <leader>q  :CocCommand explorer --width=35 --preset mine<CR>

autocmd FileType json syntax match Comment +\/\/.\+$+

" Use <C-]> for both expand and jump (make expand higher priority.)
imap <C-]> <Plug>(coc-snippets-expand-jump)
" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

nmap <leader>rn <Plug>(coc-rename)
nmap <leader>do <Plug>(coc-codeaction)
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)
nnoremap <silent> <space><space> :<C-u>CocFzfList<CR>
nnoremap <silent> <space>a       :<C-u>CocFzfList diagnostics<CR>
nnoremap <silent> <space>b       :<C-u>CocFzfList diagnostics --current-buf<CR>
nnoremap <silent> <space>c       :<C-u>CocFzfList commands<CR>
nnoremap <silent> <space>e       :<C-u>CocFzfList extensions<CR>
nnoremap <silent> <space>l       :<C-u>CocFzfList location<CR>
nnoremap <silent> <space>o       :<C-u>CocFzfList outline<CR>
nnoremap <silent> <space>s       :<C-u>CocFzfList symbols<CR>
nnoremap <silent> <space>r       :<C-u>CocFzfListResume<CR>

nnoremap <silent> <space>p :call CocAction('doHover')<CR>
" Do default action for next item.
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>

" Browse to git repo
nnoremap <silent> <space>gb :<C-u>CocCommand git.browserOpen<CR>


" hide floating windows (in case they are stuck)
nnoremap <space>hh :call coc#float#close_all()<CR>
" 1}}} "

" indentline {{{ "
let g:indentLine_leadingSpaceChar = '·'
let g:indentLine_char = ''
let g:indentLine_first_char = ''
let g:indentLine_showFirstIndentLevel = 1
let g:indentLine_setColors = 0
let g:indentLine_fileTypeExclude = [
      \ 'markdown',
      \ 'vimwiki',
      \ 'tagbar',
      \ 'coc-explorer',
      \ 'startify',
      \ 'man',
      \ "fzf",
      \ "floaterm",
      \ "json",
      \ "help",
      \ "ranger",
      \ "vista",
      \ "dashboard"
      \ ]
" }}} indentline "

" vim-lexical {{{ "
augroup lexical
  autocmd!
  autocmd FileType markdown,mkd,vimwiki call lexical#init()
  autocmd FileType textile call lexical#init()
  autocmd FileType text call lexical#init({ 'spell': 0 })
  let g:lexical#spell_key = '<leader>s'
augroup END
" }}} vim-lexical "

" markdown {{{ "
let g:markdown_fenced_languages = ['html', 'python', 'bash=sh']
let g:markdown_syntax_conceal = 0
let g:markdown_minlines = 100
" }}}"

" current_word {{{1 "
" Twins of word under cursor:
let g:vim_current_word#highlight_twins = 1
" The word under cursor:
let g:vim_current_word#highlight_current_word = 1
let g:vim_current_word#highlight_delay = 3
let g:vim_current_word#enabled = 1
let g:vim_current_word#highlight_only_in_focused_window = 1
hi CurrentWord ctermbg=232 guibg=#444444
hi CurrentWordTwins ctermbg=237 guibg=#3a3a3a
" autocmd FileType coc-explorer :let b:vim_current_word_disabled_in_this_buffer = 1

" vim-lsp
" " config
let g:lsp_diagnostics_enabled = 0
let g:go_def_mapping_enabled = 0
"
" " let coc take care of lsp
" 1}}} "

" vim-go {{{1 "
let g:go_fmt_command = "goimports"
let g:go_autodetect_gopath = 1
let g:go_list_type = "quickfix"

let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_generate_tags = 1

" Open :GoDeclsDir with ctrl-g
nmap <C-g> :GoDeclsDir<cr>
imap <C-g> <esc>:<C-u>GoDeclsDir<cr>


augroup go
  autocmd!
  " Show by default 2 spaces for a tab
  autocmd BufNewFile,BufRead *.go setlocal noexpandtab tabstop=2 shiftwidth=2
  autocmd BufNewFile,BufRead *.go setlocal list listchars=tab:\ \ ,trail:»
  " :GoBuild and :GoTestCompile
  autocmd FileType go nmap <leader>gb :<C-u>call <SID>build_go_files()<CR>
  " :GoTest
  autocmd FileType go nmap <leader>t  <Plug>(go-test)
  " :GoRun
  autocmd FileType go nmap <leader>r  <Plug>(go-run)
  " :GoDoc
  autocmd FileType go nmap <Leader>d <Plug>(go-doc)
  " :GoCoverageToggle
  autocmd FileType go nmap <Leader>c <Plug>(go-coverage-toggle)
  " :GoInfo
  autocmd FileType go nmap <Leader>i <Plug>(go-info)
  " :GoMetaLinter
  autocmd FileType go nmap <Leader>l <Plug>(go-metalinter)
  " :GoDef but opens in a vertical split
  autocmd FileType go nmap <Leader>v <Plug>(go-def-vertical)
  " :GoDef but opens in a horizontal split
  autocmd FileType go nmap <Leader>s <Plug>(go-def-split)
  " :GoAlternate  commands :A, :AV, :AS and :AT
  autocmd Filetype go command! -bang A call go#alternate#Switch(<bang>0, 'edit')
  autocmd Filetype go command! -bang AV call go#alternate#Switch(<bang>0, 'vsplit')
  autocmd Filetype go command! -bang AS call go#alternate#Switch(<bang>0, 'split')
  autocmd Filetype go command! -bang AT call go#alternate#Switch(<bang>0, 'tabe')
augroup END

" build_go_files is a custom function that builds or compiles the test file.
" It calls :GoBuild if its a Go file, or :GoTestCompile if it's a test file
function! s:build_go_files()
  let l:file = expand('%')
  if l:file =~# '^\f\+_test\.go$'
    call go#test#Test(0, 1)
  elseif l:file =~# '^\f\+\.go$'
    call go#cmd#Build(0)
  endif
endfunction
" 1}}} "

" easymotion + incsearch {{{1 "
let g:EasyMotion_smartcase = 1
nmap <leader><leader>2 <Plug>(easymotion-s2)

" incsearch with easymotion
map / <Plug>(incsearch-easymotion-/)
" map ? <Plug>(incsearch-easymotion-?)
map g/ <Plug>(incsearch-easymotion-stay)

let g:incsearch#auto_nohlsearch = 1
map n  <Plug>(incsearch-nohl-n)
map N  <Plug>(incsearch-nohl-N)
map *  <Plug>(incsearch-nohl-*)
map #  <Plug>(incsearch-nohl-#)
map g* <Plug>(incsearch-nohl-g*)
map g# <Plug>(incsearch-nohl-g#)
" i}}} "

" nerdcommenter {{{1 "
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1
" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1
" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'
" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1
" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1
" Enable NERDCommenterToggle to check all selected lines is commented or not
let g:NERDToggleCheckAllLines = 1
let g:NERDCustomDelimiters = { 'helm': { 'left': '#','right': '' }, 'json': { 'left': '//', 'right': '' } }
" 1}}} "

" " terraform {{{1 "
" "Allow vim-terraform to align settings automatically with Tabularize.
let g:terraform_align=1
" "Allow vim-terraform to automatically fold (hide until unfolded) sections of terraform code. Defaults to 0 which is off.
let g:terraform_fold_sections=1
" "Allow vim-terraform to automatically format *.tf and *.tfvars files with terraform fmt. You can also do this manually with the :TerraformFmt command.
let g:terraform_fmt_on_save=1
" " 1}}} "

" rust  {{{ "
let g:rustfmt_autosave = 1
" }}} rust  "

" ale {{{1 "
let g:ale_completion_enabled = 0
let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'rust': ['rustfmt'],
\   'markdown': [],
\   'typescript' : [],
\   'typescriptreact' : [],
\}
let b:ale_fixers = {
\   'terraform' : ['terraform'],
\   'sh' : ['bashate', 'language_server', 'shell', 'shellcheck'],
\   'rust': ['rustfmt'],
\}
let b:ale_linters ={
\   'terraform' : ['terraform', 'tflint'],
\   'sh' : ['bashate', 'language_server', 'shell', 'shellcheck'],
\   'rust': ['rustfmt'],
\   'markdown': [],
\   'typescriptreact' : [],
\   'typescript' : [],
\   'yaml' : [],
\   'yml' : [],
\   'ruby': [],
\ }
let g:ale_disable_lsp = 1
let g:ale_linters_explicit = 1
" let g:ale_sign_error = '✘'
" let g:ale_sign_warning = ''

let g:airline#extensions#ale#enabeled = 1
"let g:ale_cursor_detail = 1
let g:ale_close_preview_on_insert = 1
let g:ale_fix_on_save = 1
let g:ale_lint_on_text_changed = "Always"
" let g:ale_markdown_mdl_options = '--rules ~MD009,~MD004,~MD024,~MD005,~MD007,~MD013, MD029=one_or_ordered'
" highlight link ALEErrorLine error
" highlight link ALEWarningLine warn
let g:ale_sign_column_always = 1
" 1}}} "

" term {{{1 "
tmap <Esc> <C-\><C-n>
tmap <C-w> <Esc><C-w>
tmap <C-x> <Esc>:q<CR>
autocmd BufWinEnter,WinEnter term://* startinsert
autocmd BufWinEnter,WinEnter term://* set nocursorcolumn
autocmd BufLeave term://* stopinsert
" 1}}} "

" vim-fzf {{{1 "
let g:fzf_nvim_statusline = 0 " disable statusline overwriting
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-s': 'split',
  \ 'ctrl-v': 'vsplit' }
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'Type'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Character'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

let g:fzf_layout = { 'down': '~70%' }
let g:fzf_preview_window = ['up:60%:sharp', 'ctrl-/']
let $FZF_DEFAULT_COMMAND = 'fd --hidden --follow --no-ignore --exclude "node_modules" --exclude ".git" --type f'

" find references with fzf
noremap <leader>fw :Ag <C-r>=expand('<cword>')<CR>

" hide statusline in fzf window
autocmd! FileType fzf set laststatus=0 noshowmode noruler
  \| autocmd BufLeave <buffer> set laststatus=2 showmode ruler
" vim-fzf 1}}} "

" undotree {{{1 "
if has("persistent_undo")
    set undodir=~/.undodir/
    set undofile
endif

" if set, let undotree window get focus after being opened, otherwise
" focus will stay in current window.
if !exists('g:undotree_SetFocusWhenToggle')
    let g:undotree_SetFocusWhenToggle = 1
  endif
" 1}}} "

" markdown preview {{{1 "
let g:mkdp_auto_start = 0

" set to 1, the nvim will auto close current preview window when change
" from markdown buffer to another buffer
" default: 1
let g:mkdp_auto_close = 0

" set to 1, the vim will refresh markdown when save the buffer or
" leave from insert mode, default 0 is auto refresh markdown as you edit or
" move the cursor
" default: 0
let g:mkdp_refresh_slow = 0

" set to 1, the MarkdownPreview command can be use for all files,
" by default it can be use in markdown file
" default: 0
let g:mkdp_command_for_global = 0

" set to 1, preview server available to others in your network
" by default, the server listens on localhost (127.0.0.1)
" default: 0
let g:mkdp_open_to_the_world = 0

" use custom IP to open preview page
" useful when you work in remote vim and preview on local browser
" more detail see: https://github.com/iamcco/markdown-preview.nvim/pull/9
" default empty
let g:mkdp_open_ip = ''

" specify browser to open preview page
" default: ''
let g:mkdp_browser = 'Firefox'

" set to 1,echo preview page url in command line when open preview page
" default is 0
let g:mkdp_echo_preview_url = 0

" a custom vim function name to open preview page
" this function will receive url as param
" default is empty
let g:mkdp_browserfunc = ''

" options for markdown render
" mkit: markdown-it options for render
" katex: katex options for math
" uml: markdown-it-plantuml options
" maid: mermaid options
" disable_sync_scroll: if disable sync scroll, default 0
" sync_scroll_type: 'middle', 'top' or 'relative', default value is 'middle'
"   middle: mean the cursor position alway show at the middle of the preview page
"   top: mean the vim top viewport alway show at the top of the preview page
"   relative: mean the cursor position alway show at the relative positon of the preview page
" hide_yaml_meta: if hide yaml metadata, default is 1
" sequence_diagrams: js-sequence-diagrams options
let g:mkdp_preview_options = {
    \ 'mkit': {},
    \ 'katex': {},
    \ 'uml': {},
    \ 'maid': {},
    \ 'disable_sync_scroll': 0,
    \ 'sync_scroll_type': 'middle',
    \ 'hide_yaml_meta': 1,
    \ 'sequence_diagrams': {}
    \ }

" use a custom markdown style must be absolute path
let g:mkdp_markdown_css = ''

" use a custom highlight style must absolute path
let g:mkdp_highlight_css = ''

" use a custom port to start server or random for empty
let g:mkdp_port = ''

" preview page title
" ${name} will be replace with the file name
let g:mkdp_page_title = '「${name}」'
" 1}}} "

" vimwiki {{{1 "
" let g:vimwiki_conceallevel=2
hi VimwikiHeader1 guifg=RED
hi VimwikiHeader2 guifg=Green
hi VimwikiHeader3 guifg=YELLOW
hi VimwikiHeader4 guifg=BLUE
hi VimwikiHeader5 guifg=PURPLE
hi VimwikiHeader6 guifg=GREEN

" Run multiple wikis "
let g:vimwiki_list = [
                        \{'path': '~/notes/VimWiki/prsh.wiki'},
                        \{'path': '~/notes/VimWiki/personal.wiki'}
                   \]
let g:vimwiki_global_ext = 0
au BufRead,BufNewFile *.wiki set filetype=vimwiki
:autocmd FileType vimwiki map <leader>d :VimwikiMakeDiaryNote
function! ToggleCalendar()
  execute ":Calendar"
  if exists("g:calendar_open")
    if g:calendar_open == 1
      execute "q"
      unlet g:calendar_open
    else
      g:calendar_open = 1
    end
  else
    let g:calendar_open = 1
  end
endfunction
" :autocmd FileType vimwiki map <leader>c :call ToggleCalendar()
" :autocmd FileType vimwiki setlocal conceallevel=0
" let g:vimwiki_list = [{'path': '~/vimwiki/',
"                       \ 'syntax': 'markdown', 'ext': '.md'}]
" 1}}} "

" vim-rooter {{{1 "
let g:rooter_silent_chdir=0
" 1}}} "

" easyalign {{{ "
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)
" }}} == "

" vim kitty navigation {{{ "
let g:kitty_navigator_no_mappings = 1
nnoremap <silent> <c-h> :KittyNavigateLeft<cr>
nnoremap <silent> <c-j> :KittyNavigateDown<cr>
nnoremap <silent> <c-k> :KittyNavigateUp<cr>
nnoremap <silent> <c-l> :KittyNavigateRight<cr>
" }}} vim kitty navigation "

" gitgutter {{{ "
nmap <Leader>hq :GitGutterQuickFix\|copen<CR>
set foldtext=gitgutter#fold#foldtext()
" }}} gitgutter "

" Rainbow Paranthesis {{{ "
let g:rainbow#max_level = 16
let g:rainbow#pairs = [['(', ')'], ['[', ']'], ['{','}']]
let g:rainbow#blacklist = [223, 248, 184]
" }}} Rainbow Paranthesis "

" startify {{{ "
let g:startify_bookmarks = [
            \ '~/porsche/git/pos/',
            \ ]
let g:startify_lists = [
      \ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
      \ { 'type': 'dir',       'header': ['   MRU '. getcwd()] },
      \ { 'type': 'files',     'header': ['   MRU']            },
      \ { 'type': 'sessions',  'header': ['   Sessions']       },
      \ { 'type': 'commands',  'header': ['   Commands']       },
      \ ]

let g:startify_session_dir = '~/.config/nvim/sessions'

let g:startify_change_to_dir = 1
let g:startify_change_to_vcs_root = 1
let g:startify_session_persistence = 1
let g:startify_session_autoload = 0
let g:startify_custom_indices = ['p']
let g:startify_files_number = 5
let g:startify_session_delete_buffers = 0
" }}} startify "

" vista {{{ "
" Ensure you have installed some decent font to show these pretty symbols, then you can enable icon for the kind.
let g:vista#renderer#enable_icon = 1

let g:vista_default_executive = 'ctags'

" The default icons can't be suitable for all the filetypes, you can extend it as you wish.
let g:vista#renderer#icons = {
\   "command" : "",
\  }

let g:vista_fzf_preview = ['right:70%']
" }}} vista "

" close-tag {{{ "
" filenames like *.xml, *.html, *.xhtml, ...
" These are the file extensions where this plugin is enabled.
"
let g:closetag_filenames = '*.html,*.xhtml,*.phtml,*.ts,*.tsx'

" filenames like *.xml, *.xhtml, ...
" This will make the list of non-closing tags self-closing in the specified files.
"
let g:closetag_xhtml_filenames = '*.xhtml,*.jsx,*.ts,*.tsx'

" filetypes like xml, html, xhtml, ...
" These are the file types where this plugin is enabled.
"
let g:closetag_filetypes = 'html,xhtml,phtml,*.ts,*.tsx'

" filetypes like xml, xhtml, ...
" This will make the list of non-closing tags self-closing in the specified files.
"
let g:closetag_xhtml_filetypes = 'xhtml,jsx,*.ts,*.tsx'

" integer value [0|1]
" This will make the list of non-closing tags case-sensitive (e.g. `<Link>` will be closed while `<link>` won't.)
"
let g:closetag_emptyTags_caseSensitive = 0

" Shortcut for closing tags, default is '>'
"
let g:closetag_shortcut = '>'

" Add > at current position without closing the current tag, default is ''
"
let g:closetag_close_shortcut = '<leader>>'
" }}} close-tag "

" tree-sitter {{{ "
" lua <<EOF
" require'nvim-treesitter.configs'.setup {
"   ensure_installed = "all",
"   highlight = {
"     enable = true,
"     disable = { "json" },
"   },
"   indent = {
"     enable = true
"   },
"   incremental_selection = {
"     enable = true,
"     keymaps = {
"       init_selection = "gnn",
"       node_incremental = "grn",
"       scope_incremental = "grc",
"       node_decremental = "grm",
"     },
"   },
" }
" EOF
" }}} tree-sitter "

" vim-sandwich {{{ "
runtime macros/sandwich/keymap/surround.vim
" }}} vim-sandwich "

" conflict-marker {{{ "
let g:conflict_marker_highlight_group = ''
let g:conflict_marker_begin = '^<<<<<<< .*$'
let g:conflict_marker_end   = '^>>>>>>> .*$'
highlight ConflictMarkerBegin guibg=#2f7366
highlight ConflictMarkerOurs guibg=#2e5049
highlight ConflictMarkerTheirs guibg=#344f69
highlight ConflictMarkerEnd guibg=#2f628e
highlight ConflictMarkerCommonAncestorsHunk guibg=#754a81
" }}} conflict-marker "

" lightline {{{ "

let g:lightline#coc#indicator_warnings="W:" " Default is •.
let g:lightline#coc#indicator_errors="E:" " Default is ×.
let g:lightline#coc#indicator_info="I:" " Default is ~.
let g:lightline#coc#indicator_hints="H:" " Default is >.
let g:lightline#coc#indicator_ok="✓" " Default is ✓.

let g:lightline#bufferline#read_only="-"
let g:lightline#bufferline#modified="+"

command! LightlineReload call LightlineReload()

function! LightlineReload()
  call lightline#init()
  call lightline#colorscheme()
  call lightline#update()
endfunction

" let g:lightline#hunks#only_branch = 1
let g:lightline#hunks#exclude_filetypes = [ 'startify', 'coc-explorer', 'vista', 'help' ]
function! LightlineReadonly()
  return &readonly && &filetype !~# '\v(help|coc-explorer|startify|vista)' ? 'RO' : ''
endfunction

function! LightlineMode()
  return &filetype ==# 'coc-explorer' ? 'Coc-Explorer' :
        \ &filetype ==# 'help' ? 'Help' :
        \ &filetype ==# 'vista' ? 'vista' :
        \ &filetype ==# 'startify' ? 'Startify' :
        \ &filetype ==# 'list' ? 'List' :
        \ lightline#mode()
endfunction

function! LightlineFileencoding()
  return winwidth(0) > 70 ? &fileencoding : ''
endfunction

function! LightlineFileformat()
  return winwidth(0) > 70 ? &fileformat : ''
endfunction

function! LightlineFiletype()
  return winwidth(0) > 70 ? (&filetype !=# '' ? &filetype : 'no ft') : ''
endfunction

function! LightlineFilename()
  let filename = expand('%:t') !=# '' ? expand('%:F') : '[No Name]'
  if (&ft=='coc-explorer')
    let filename = ''
  elseif (&ft=='vista')
    let filename = ''
  elseif (&ft=='startify')
    let filename = ''
  elseif (&ft=='help')
    let filename = ''
  endif
  let modified = &modified ? '+' : ''
  return filename . modified
endfunction

let g:lightline = {}
let g:lightline.colorscheme = 'gruvbox_material'
let g:lightline.component_function = {
      \   'lightline_hunks': 'lightline#hunks#composer',
      \   'readonly':        'LightlineReadonly',
      \   'mode':            'LightlineMode',
      \   'fileformat':      'LightlineFileformat',
      \   'filetype':        'LightlineFiletype',
      \   'filename':        'LightlineFilename',
      \   'fileencoding':    'LightlineFileencoding',
      \  }
let g:lightline.component_expand = {
      \   'buffers':         'lightline#bufferline#buffers',
      \  }

let g:lightline.component_type = {
      \   'buffers':         'tabsel',
      \ }
let g:lightline.active = {
      \   'left': [
      \     [ 'mode', 'paste' ],
      \     [ 'filename', 'readonly' ],
      \     [ 'lightline_hunks' ],
      \   ],
      \   'right': [
      \     [ 'coc_info', 'coc_hints', 'coc_errors', 'coc_warnings' ],
      \     [ 'lineinfo' ],
      \     [ 'percent' ],
      \     [ 'filetype', 'fileencoding', 'fileformat' ],
      \   ],
      \ }
let g:lightline.inactive = {
      \   'left': [ [ 'mode' ], [ 'filename'] ],
      \   'right': [ [ '' ] ],
      \ }
let g:lightline.tabline = {
      \   'left': [ [ 'buffers' ] ],
      \   'right': [ [ '' ] ]
      \ }
let g:lightline.mode_map = {
      \   'n' : 'N',
      \   'i' : 'I',
      \   'R' : 'R',
      \   'v' : 'V',
      \   'V' : 'VL',
      \   "\<C-v>": 'VB',
      \   'c' : 'C',
      \   's' : 'S',
      \   'S' : 'SL',
      \   "\<C-s>": 'SB',
      \   't': 'T',
      \ }
call lightline#coc#register()
" }}} lightline "

" diffview {{{ "
lua <<EOF
-- Lua
local cb = require'diffview.config'.diffview_callback

require'diffview'.setup {
  diff_binaries = false,    -- Show diffs for binaries
  file_panel = {
    width = 35,
    use_icons = false        -- Requires nvim-web-devicons
  },
  key_bindings = {
    -- The `view` bindings are active in the diff buffers, only when the current
    -- tabpage is a Diffview.
    view = {
      ["<tab>"]     = cb("select_next_entry"),  -- Open the diff for the next file
      ["<s-tab>"]   = cb("select_prev_entry"),  -- Open the diff for the previous file
      ["<leader>e"] = cb("focus_files"),        -- Bring focus to the files panel
      ["<leader>b"] = cb("toggle_files"),       -- Toggle the files panel.
    },
    file_panel = {
      ["j"]         = cb("next_entry"),         -- Bring the cursor to the next file entry
      ["<down>"]    = cb("next_entry"),
      ["k"]         = cb("prev_entry"),         -- Bring the cursor to the previous file entry.
      ["<up>"]      = cb("prev_entry"),
      ["<cr>"]      = cb("select_entry"),       -- Open the diff for the selected entry.
      ["o"]         = cb("select_entry"),
      ["R"]         = cb("refresh_files"),      -- Update stats and entries in the file list.
      ["<tab>"]     = cb("select_next_entry"),
      ["<s-tab>"]   = cb("select_prev_entry"),
      ["<leader>e"] = cb("focus_files"),
      ["<leader>b"] = cb("toggle_files"),
    }
  }
}
EOF
" }}} diffview "
