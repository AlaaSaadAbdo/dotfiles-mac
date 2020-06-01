" === mkdx
" mkdx {{{ "
au BufNewFile,BufRead *.md set conceallevel=0
augroup pandoc_syntax
    au! BufNewFile,BufFilePre,BufRead *.md set filetype=markdown
  augroup END
let g:mkdx#settings = {
      \  'image_extension_pattern': 'a\?png\|jpe\?g\|gif',
      \  'restore_visual':          1,
      \  'fold': { 'enable': 1 },
      \  'enter':                   { 'enable': 1, 'malformed': 1, 'o': 1,
      \  'shifto': 1, 'shift': 0 },
      \  'map':                     { 'prefix': '<Leader>', 'enable': 1 },
      \  'tokens':                  { 'enter': ['-', '*', '>'],
      \  'bold': '**', 'italic': '*', 'strike': '',
      \  'list': '-', 'fence': '',
      \  'header': '#' },
      \  'checkbox':                { 'toggles': [' ', '-', 'x'],
      \  'update_tree': 2,
      \  'initial_state': ' ' },
      \  'toc':                     { 'text': "TOC", 'list_token': '-',
      \  'update_on_write': 1,
      \  'position': 0,
      \  'details': {
      \  'enable': 0,
      \  'summary': 'Click to expand {{toc.text}}',
      \  'nesting_level': -1,
      \  'child_count': 5,
      \  'child_summary': 'show {{count}} items'
      \  }
      \  },
      \  'table':                   { 'divider': '|',
      \  'header_divider': '-',
      \  'align': {
      \  'left':    [],
      \  'center':  [],
      \  'right':   [],
      \  'default': 'center'
      \  }
      \  },
      \  'links':                   { 'external': {
      \  'enable': 0, 'timeout': 3, 'host': '', 'relative': 1,
      \  'user_agent':  'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/9001.0.0000.000 vim-mkdx/1.9.1'
      \  },
      \  'fragment': {
      \  'jumplist': 1,
      \  'complete': 1
      \  }
      \  },
      \  'highlight':               { 'enable': 1 },
      \  'auto_update':             { 'enable': 1 }
      \  }
" plugin which unfortunately interferes with mkdx list indentation.
fun! s:MkdxGoToHeader(header)
    " given a line: '  84: # Header'
    " this will match the number 84 and move the cursor to the start of that line
    call cursor(str2nr(get(matchlist(a:header, ' *\([0-9]\+\)'), 1, '')), 1)
endfun

fun! s:MkdxFormatHeader(key, val)
    let text = get(a:val, 'text', '')
    let lnum = get(a:val, 'lnum', '')

    " if the text is empty or no lnum is present, return the empty string
    if (empty(text) || empty(lnum)) | return text | endif

    " We can't jump to it if we dont know the line number so that must be present in the outpt line.
    " We also add extra padding up to 4 digits, so I hope your markdown files don't grow beyond 99.9k lines ;)
    return repeat(' ', 4 - strlen(lnum)) . lnum . ': ' . text
endfun

fun! s:MkdxFzfQuickfixHeaders()
    " passing 0 to mkdx#QuickfixHeaders causes it to return the list instead of opening the quickfix list
    " this allows you to create a 'source' for fzf.
    " first we map each item (formatted for quickfix use) using the function MkdxFormatHeader()
    " then, we strip out any remaining empty headers.
    let headers = filter(map(mkdx#QuickfixHeaders(0), function('<SID>MkdxFormatHeader')), 'v:val != ""')

    " run the fzf function with the formatted data and as a 'sink' (action to execute on selected entry)
    " supply the MkdxGoToHeader() function which will parse the line, extract the line number and move the cursor to it.
    call fzf#run(fzf#wrap(
            \ {'source': headers, 'sink': function('<SID>MkdxGoToHeader') }
          \ ))
endfun

" finally, map it -- in this case, I mapped it to overwrite the default action for toggling quickfix (<PREFIX>I)
nnoremap <silent> <Leader>I :call <SID>MkdxFzfQuickfixHeaders()<Cr>

" }}} mkdx "

"=== coc
" COC {{{1 "
inoremap <silent> <C-right> <C-R>=coc#start({'source': 'snippets'})<CR>
inoremap <silent><expr> <c-space> coc#refresh()
nmap ge :CocCommand explorer<CR>
nmap gE :CocCommand explorer --position=right<CR>
" nmap <space>t :CocCommand explorer --position=tab<CR>

let g:coc_explorer_global_presets = {
\   '.vim': {
\     'root-uri': expand('~/.config/nvim/'),
\   },
\   'sloscomm': {
\     'root-uri': expand('~/porsche/git/sloscomm/'),
\   },
\   'floating': {
\     'position': "floating",
\   },
\   'simplify': {
\     'file-child-template': '[selection | clip | 1] [indent][icon | 1] [filename omitCenter 1]'
\   },
\   'a': {
\     'file-child-template': '[git | 2] [selection | clip | 1] [indent][icon | 1] [filename growRight 1 omitCenter 1][modified]',
\     'file-child-labeling-template': '[fullpath][size][modified][readonly]',
\   },
\   'b': {
\     'file-child-template': '[git | 2] [selection | clip | 1] [indent][icon | 1] [filename growRight 1 omitCenter 1][size]',
\     'file-child-labeling-template': '[fullpath][size][created][modified][accessed][readonly]',
\   }
\ }

nmap <leader>fc :CocCommand explorer --no-toggle<CR>
nmap <leader>v  :CocCommand explorer --width=40 --preset .vim<CR>
nmap <leader>ff :CocCommand explorer --width=40 --preset floating<CR>
nmap <leader>q  :CocCommand explorer --width=40<CR>
nmap <leader>qf :CocCommand explorer --width=40 --preset sloscomm<CR>
" nmap <leader>fl :CocCommand explorer --position=floating --floating-position=left-center --floating-width=50 --floating-height=-10<CR>
" nmap <leader>fr :CocCommand explorer --position=floating --floating-position=right-center --floating-width=50 --floating-height=-10<CR>
" nmap <leader>s  :CocCommand explorer --preset simplify<CR>
" nmap <leader>a  :CocCommand explorer --preset a<CR>
" nmap <leader>b  :CocCommand explorer --preset b<CR>

" nmap <leader>s  :CocAction<CR>

autocmd FileType json syntax match Comment +\/\/.\+$+
" autocmd BufRead,BufNewFile coc-setting.json syntax match Comment +\/\/.\+$+


" autocmd FileType startify :CocCommand explorer --no-toggle
" nnoremap <silent> <leader><space>s  :<C-u>CocList --normal -A snippets<CR>

" nmap <silent> gd <Plug>(coc-definition)
" nmap <silent> gy <Plug>(coc-type-definition)
" nmap <silent> gi <Plug>(coc-implementation)
" nmap <silent> gr <Plug>(coc-references)

" Use <C-j> for both expand and jump (make expand higher priority.)
imap <C-]> <Plug>(coc-snippets-expand-jump)
" 1}}} "

"=== indentline
" indentline {{{ "
let g:indentLine_fileTypeExclude = ['markdown', 'vimwiki', 'tagbar', 'coc-explorer', 'startify', 'man', "fzf", "floaterm"]
" }}} indentline "

"=== peekaboo
" peekaboo {{{ "
" let g:peekaboo_window=50
" }}} peekaboo "

"=== vim-lexical
" vim-lexical {{{ "
augroup lexical
  autocmd!
  autocmd FileType markdown,mkd,vimwiki call lexical#init()
  autocmd FileType textile call lexical#init()
  autocmd FileType text call lexical#init({ 'spell': 0 })
  let g:lexical#spell_key = '<leader>s'
augroup END
" }}} vim-lexical "

"===== markdown
" markdown {{{ "
let g:polyglot_disabled = ['markdown'] " for vim-polyglot users, it loads Plasticboy's markdown
" }}}"
let g:markdown_fenced_languages = ['html', 'python', 'bash=sh']
let g:markdown_syntax_conceal = 0
let g:markdown_minlines = 100

"=== current_word
" current_word {{{1 "
" Twins of word under cursor:
let g:vim_current_word#highlight_twins = 1
" The word under cursor:
let g:vim_current_word#highlight_current_word = 1
let g:vim_current_word#highlight_delay = 3
let g:vim_current_word#enabled = 1
" let g:vim_current_word#highlight_only_in_focused_window = 1
" autocmd BufAdd NERD_tree_*,your_buffer_name.rb,*.js :let b:vim_current_word_disabled_in_this_buffer = 1
hi CurrentWord ctermbg=232 guibg=#444444
hi CurrentWordTwins ctermbg=237 guibg=#3a3a3a
autocmd BufAdd NERD_tree* :let b:vim_current_word_disabled_in_this_buffer = 1
" 1}}} "

" on hold TODO check if needed after a while due to coc-explorer
" "=== devicons
" devicons {{{1 "
" let g:WebDevIconsNerdTreeAfterGlyphPadding = ' '
" let g:WebDevIconsNerdTreeBeforeGlyphPadding = ''
" let g:WebDevIconsNerdTreeGitPluginForceVAlign = v:true
" let g:WebDevIconsUnicodeDecorateFolderNodes = v:true
" let g:DevIconsEnableFoldersOpenClose = 1
" let g:DevIconsDefaultFolderOpenSymbol='' " symbol for open folder (f07c)
" let g:WebDevIconsUnicodeDecorateFolderNodesDefaultSymbol='' " symbol for closed folder (f07b)
" let g:WebDevIconsUnicodeGlyphDoubleWidth = 1
" let g:webdevicons_enable_nerdtree = 1
" autocmd FileType nerdtree setlocal signcolumn=no
" let g:WebDevIconsUnicodeDecorateFolderNodes = v:true
" let g:webdevicons_conceal_nerdtree_brackets = 0
" let g:webdevicons_enable_airline_statusline = 1
" let g:webdevicons_enable_airline_tabline = 1
" let g:WebDevIconsUnicodeDecorateFolderNodes = 1
"
"
" "=== nerdtree-git
" let g:NERDTreeDirArrowExpandable = ''
" let g:NERDTreeDirArrowCollapsible = ''
"
" " let NERDTreeMinimalUI = 1
" let NERDTreeShowHidden = 0
" let g:nerdtree_tabs_focus_on_files = 1
" " let g:NERDTreeGitStatusWithFlags = 1
" let g:NERDTreeIndicatorMapCustom = {
"     \ "Modified"  : "⋆",
"     \ "Staged"    : "•",
"     \ "Untracked" : "∘",
"     \ "Renamed"   : "®",
"     \ "Dirty"     : "⁖",
"     \ "Clean"     : "✔︎",
"     \ "Unmerged"  : "≄",
"     \ "Deleted"   : "♻",
"     \ "Unknown"   : "✗"
"     \ }
"
" " nerdtree with git status Colors
" "NERDThee git indicators
" let g:NERDTreeGitStatusWithFlags = 1
" " let g:NERDTreeIndicatorMapCustom = {
" "     \ "Modified"  : "⋆",
" "     \ "Staged"    : "•",
" "     \ "Untracked" : "∘",
" "     \ "Dirty"     : "⁖",
" "     \ "Clean"     : "✔︎",
" "     \ }
"
" let g:NERDTreeShowIgnoredStatus = 0
" let g:NERDTreeGitStatusNodeColorization = 1
" let g:NERDTreeColorMapCustom = {
"     \ "Modified"  : ["#528AB3", "11", "NONE", "NONE"],
"     \ "Staged"    : ["#538B54", "14", "NONE", "NONE"],
"     \ "Untracked" : ["#BE5849", "1", "NONE", "NONE"],
"     \ "Dirty"     : ["#299999", "13", "NONE", "NONE"],
"     \ "Clean"     : ["#87939A", "15", "NONE", "NONE"],
"     \ "Ignored"   : ["#808080", "8", "NONE", "NONE"]
"     \ }
"
"
" "=== vim-lsp
" " config
" let g:lsp_diagnostics_enabled = 0
" let g:go_def_mapping_enabled = 0
"
" " let coc take care of lsp
" 1}}} "

"=== vim-go
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

"=== Easymotion & incsearch
" easymotion + incsearch {{{1 "
let g:EasyMotion_smartcase = 1
nmap <leader><leader>2 <Plug>(easymotion-s2)

" incsearch with easymotion
map / <Plug>(incsearch-easymotion-/)
" map ? <Plug>(incsearch-easymotion-?)
map g/ <Plug>(incsearch-easymotion-stay)

" incsearch.vim x fuzzy x vim-easymotion
function! s:config_easyfuzzymotion(...) abort
  return extend(copy({
  \   'converters': [incsearch#config#fuzzy#converter()],
  \   'modules': [incsearch#config#easymotion#module()],
  \   'keymap': {"\<CR>": '<Over>(easymotion)'},
  \   'is_expr': 0,
  \   'is_stay': 1
  \ }), get(a:, 1, {}))
endfunction

noremap <silent><expr> <leader>/ incsearch#go(<SID>config_easyfuzzymotion())

let g:incsearch#auto_nohlsearch = 1
map n  <Plug>(incsearch-nohl-n)
map N  <Plug>(incsearch-nohl-N)
map *  <Plug>(incsearch-nohl-*)
map #  <Plug>(incsearch-nohl-#)
map g* <Plug>(incsearch-nohl-g*)
map g# <Plug>(incsearch-nohl-g#)
" i}}} "

"=== Tagbar
" tagbar {{{1 "
let g:tagbar_show_linenumbers = 0
let g:tagbar_width=45
let g:tagbar_type_go = {
      \ 'ctagstype' : 'go',
      \ 'kinds'     : [
          \ 'p:package',
          \ 'i:imports:1',
          \ 'c:constants',
          \ 'v:variables',
          \ 't:types',
          \ 'n:interfaces',
          \ 'w:fields',
          \ 'e:embedded',
          \ 'm:methods',
          \ 'r:constructor',
          \ 'f:functions'
  \ ],
  \ 'sro' : '.',
  \ 'kind2scope' : {
      \ 't' : 'ctype',
      \ 'n' : 'ntype'
  \ },
  \ 'scope2kind' : {
      \ 'ctype' : 't',
      \ 'ntype' : 'n'
  \ },
  \ 'ctagsbin'  : 'gotags',
  \ 'ctagsargs' : '-sort -silent'
\ }
" 1}}} "

" check if needed TODO after sometime evaluate against coc-explorer
"=== nerdtree
" nerdtree {{{1 "
" " let NERDTreeShowHidden=1
" let NERDTreeShowLineNumbers=0
" " let NERDTreeChDirMode = 2 # disabled for vim-rooter
" let NERDTreeShowBookmarks=1
" let g:NERDTreeWinSize=35
" let NERDTreeAutoDeleteBuffer = 1
" let NERDTreeStatusline = "%{ getcwd() }"
" " let NERDTreeQuitOnOpen = 1
" " let NERDTreeMinimalUI = 1
" let NERDTreeDirArrows = 0
" if exists("g:NERDTree") && g:NERDTree.IsOpen()
"   autocmd BufWritePost * NERDTreeFocus | execute 'normal R' | wincmd p
" endif
" autocmd BufAdd NERD_tree* set nocursorcolumn
" "no buffers in nerdtree
" nnoremap <silent> <expr> <Leader><Leader> (expand('%') =~ 'NERD_tree' ? "\<c-w>\<c-w>" : '').":FZF\<cr>"
" autocmd FileType nerdtree let t:nerdtree_winnr = bufwinnr('%')
" autocmd BufWinEnter * call PreventBuffersInNERDTree()
" function! PreventBuffersInNERDTree()
"   if bufname('#') =~ 'NERD_tree' && bufname('%') !~ 'NERD_tree'
"     \ && exists('t:nerdtree_winnr') && bufwinnr('%') == t:nerdtree_winnr
"     \ && &buftype == '' && !exists('g:launching_fzf')
"     let bufnum = bufnr('%')
"     close
"     exe 'b ' . bufnum
"   endif
"   if exists('g:launching_fzf') | unlet g:launching_fzf | endif
" endfunction
" 1}}} "

"=== nerdcommenter
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

" under evaluation vs coc-snippets TODO
" ultisnips {{{1 "
" "=== Ultisnips
" let g:UltiSnipsSnippetDirectories=['/Users/amansour/.config/nvim/plugged/vim-snippets/UltiSnips', '/Users/amansour/.config/nvim/plugged/vim-kubernetes/UltiSnips']
" let g:UltiSnipsExpandTrigger="<C-]>"
" 1}}} "

"=== vim-terraform
" terraform {{{1 "
"Allow vim-terraform to align settings automatically with Tabularize.
let g:terraform_align=1
"Allow vim-terraform to automatically fold (hide until unfolded) sections of terraform code. Defaults to 0 which is off.
" let g:terraform_fold_sections=1
"Allow vim-terraform to automatically format *.tf and *.tfvars files with terraform fmt. You can also do this manually with the :TerraformFmt command.
let g:terraform_fmt_on_save=1
" 1}}} "

"=== ale
" ale {{{1 "
let g:ale_completion_enabled = 0
let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'terraform' : ['terraform'],
\}
let b:ale_fixers = {
\   'markdown': ['remove_trailing_lines'],
\   'terraform' : ['terraform'],
\}
let b:ale_linters ={
\   'markdown': ['mdl'],
\   'terraform' : ['terraform', 'tflint'],
\   'yaml' : [],
\   'yml' : [],
\   'ruby': [],
\ }
let g:ale_linters ={
\   'markdown': ['mdl'],
\   'terraform' : ['terraform', 'tflint'],
\   'yaml' : [],
\   'yml' : [],
\   'ruby': [],
\ }
let g:airline#extensions#ale#enabeled = 1
"let g:ale_cursor_detail = 1
let g:ale_close_preview_on_insert = 1
let g:ale_fix_on_save = 1
let g:ale_lint_on_text_changed = "Always"
let g:ale_markdown_mdl_options = '--rules ~MD009,~MD004,~MD024,~MD005,~MD007,~MD013, MD029=one_or_ordered'
" highlight link ALEErrorLine error
" highlight link ALEWarningLine warn
let g:ale_sign_column_always = 1
" 1}}} "

"=== Airline
" Airline {{{1 "
let g:airline_mode_map = {
      \ '__' : '-',
      \ 'n' : 'N',
      \ 'i' : 'I',
      \ 'R' : 'R',
      \ 'c' : 'C',
      \ 'v' : 'V',
      \ 'V' : 'V',
      \ 's' : 'S',
      \ 'S' : 'S',
      \ }
let g:airline_theme='gruvbox'
let g:airline_powerline_fonts = 1
" let g:airline_section_z = ' %{strftime("%-I:%M %p")}'
let g:airline_section_warning = ''
let g:airline#extensions#tabline#enabled = 1
"no arrow separators
let g:airline_right_alt_sep = ' '
let g:airline_right_sep = ' '
let g:airline_left_alt_sep= ' '
let g:airline_left_sep = ' '
let g:airline#extensions#tabline#left_sep = '|'
let g:airline#extensions#tabline#left_alt_sep = '|'
" 1}}} "

"== Neovim :Terminal
" term {{{1 "
tmap <Esc> <C-\><C-n>
tmap <C-w> <Esc><C-w>
tmap <C-x> <Esc>:q<CR>
autocmd BufWinEnter,WinEnter term://* startinsert
autocmd BufWinEnter,WinEnter term://* set nocursorcolumn
autocmd BufLeave term://* stopinsert
" 1}}} "

"=== fzf-vim
" fzf {{{1 "
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

let g:fzf_layout = { 'down': '~60%' }

noremap <leader>fw :Ag <C-r>=expand('<cword>')<CR>

"""done by default now by :Files
" nnoremap <silent> <leader>e :call Fzf_dev()<CR>
"
" " ripgrep
" if executable('rg')
"   let $FZF_DEFAULT_COMMAND = 'rg --files --hidden --follow --glob "!.git/*"'
"   set grepprg=rg\ --vimgrep
"   command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --hidden --follow --glob "!.git/*" --color "always" '.shellescape(<q-args>).'| tr -d "\017"', 1, <bang>0)
" endif
"
" " Files + devicons
" function! Fzf_dev()
"   let l:fzf_files_options = '--preview "bat --theme="OneHalfDark" --style=numbers,changes --color always {2..-1} | head -'.&lines.'"'
"
"   function! s:files()
"     let l:files = split(system($FZF_DEFAULT_COMMAND), '\n')
"     return s:prepend_icon(l:files)
"   endfunction
"
"   function! s:prepend_icon(candidates)
"     let l:result = []
"     for l:candidate in a:candidates
"       let l:filename = fnamemodify(l:candidate, ':p:t')
"       let l:icon = WebDevIconsGetFileTypeSymbol(l:filename, isdirectory(l:filename))
"       call add(l:result, printf('%s %s', l:icon, l:candidate))
"     endfor
"
"     return l:result
"   endfunction
"
"   function! s:edit_file(item)
"     let l:pos = stridx(a:item, ' ')
"     let l:file_path = a:item[pos+1:-1]
"     execute 'silent e' l:file_path
"   endfunction
"
"   call fzf#run({
"         \ 'source': <sid>files(),
"         \ 'sink':   function('s:edit_file'),
"         \ 'options': '-m ' . l:fzf_files_options,
"         \ 'down':    '60%' })
" endfunction
" 1}}} "

" check vs coc TODO
"=== Deoplete
" Fold description {{{1 "
" call deoplete#custom#option('auto_complete', v:false)
" inoremap <silent><expr> <C-Space> deoplete#manual_complete()
" " Disable documentation window
" "set completeopt-=preview
" set completeopt=menuone,noselect,preview
" " (Optional) Default: 0, enable(1)/disable(0) plugin's keymapping
" let g:terraform_completion_keys = 1
"
" " (Optional) Default: 1, enable(1)/disable(0) terraform module registry completion
" let g:terraform_registry_module_completion = 1
"
" " call deoplete#custom#option('auto_complete', v:false)
" let g:deoplete#omni_patterns = {}
" let g:deoplete#omni_patterns.terraform = '[^ *\t"{=$]\w*'
"
" let g:deoplete#enable_at_startup = 1
" call deoplete#initialize()
"
" " (Optional)Hide Info(Preview) window after completions
" autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
" autocmd InsertLeave * if pumvisible() == 0|pclose|endif
" 1}}} "

"=== Supertab
" supertab {{{1 "
" let g:SuperTabDefaultCompletionType = "context"
" autocmd FileType *
"   \ if &omnifunc != '' |
"   \   call SuperTabChain(&omnifunc, "<c-p>") |
"   \   call SuperTabSetDefaultCompletionType("<c-x><c-u>") |
"   \ endif
" 1}}} "

"=== EasyAlign
" easyalign {{{1 "
" xmap ga <Plug>(EasyAlign)
" nmap ga <Plug>(EasyAlign)
" 1}}} "

"=== undotree
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

"=== notational-vim
" NV {{{1 "
let g:nv_search_paths = [ "~/notes/VimWiki" ]
let g:nv_wrap_preview_text = 1
let g:nv_window_width = '80%'
" 1}}} "

"=== Markdown-preview
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

"""===vimwiki
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

"=== vim-rooter
" vim-rooter {{{1 "
let g:rooter_silent_chdir=0
" 1}}} "

"=== easyalign {{{ "
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)
" }}} == "

"=== ack {{{ "
cnoreabbrev Ack Ack!
nnoremap <Leader>wa :Ack! <C-r>=expand('<cword>')<CR>
let g:ackprg = 'ag --nogroup --nocolor'
if executable('ag')
endif
" }}} a "
