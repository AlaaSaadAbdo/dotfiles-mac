let g:colorscheme = "gruvbox-material"


let g:gruvbox_material_palette = 'mix'
let g:gruvbox_material_background = 'hard'
let g:gruvbox_material_transparent_background = 1
let g:gruvbox_material_enable_bold = 1
let g:gruvbox_material_current_word = 'bold'
let g:gruvbox_material_menu_selection_background = 'grey'
let g:gruvbox_material_sign_column_background = 'default'
let g:gruvbox_material_better_performance = 1
let g:gruvbox_material_statusline_style = 'original'
let g:gruvbox_material_enable_italic = 1
let g:gruvbox_material_diagnostic_line_highlight = 1
set background=dark

" Neovim Terminal Colors
function! ApplyTerminalColorDefaults()
    " black
    let g:terminal_color_0  = "#222222"
    let g:terminal_color_8  = "#666666"
    " red
    let g:terminal_color_1  = "#e84f4f"
    let g:terminal_color_9  = "#d23d3d"
    " green
    let g:terminal_color_2  = "#b7ce42"
    let g:terminal_color_10 = "#bde077"
    " yellow
    let g:terminal_color_3  = "#fea63c"
    let g:terminal_color_11 = "#ffe863"
    " blue
    let g:terminal_color_4  = "#66a9b9"
    let g:terminal_color_12 = "#aaccbb"
    " magenta
    let g:terminal_color_5  = "#b7416e"
    let g:terminal_color_13 = "#e16a98"
    " cyan
    let g:terminal_color_6  = "#6dc1b6"
    let g:terminal_color_14 = "#42717b"
    " white
    let g:terminal_color_7  = "#cccccc"
    let g:terminal_color_15 = "#ffffff"
endfunction

augroup init_colors
    au!
    au ColorScheme * call ApplyColorTweaks()
augroup END

" A lot of vim colorschemes provide some wild defaults for diff colors. This
" function sets the diff colors to some more sane defaults that at least looks
" quite pleasant in most colorschemes.
function! SaneDiffDefaults()
    hi DiffAdd    ctermfg=234 ctermbg=114 guibg=#26332c guifg=NONE
    hi DiffChange cterm=underline ctermfg=180 guibg=#273842 guifg=NONE
    hi DiffDelete ctermfg=234 ctermbg=168 guibg=#572E33 guifg=NONE
    hi DiffText   ctermfg=234 ctermbg=180 guibg=#314753 guifg=NONE
    hi! link       diffAdded     DiffAdd
    hi! link       diffChanged   DiffChange
    hi! link       diffRemoved   DiffDelete
    hi! link       diffBDiffer   WarningMsg
    hi! link       diffCommon    WarningMsg
    hi! link       diffDiffer    WarningMsg
    hi! link       diffFile      Directory
    hi! link       diffIdentical WarningMsg
    hi! link       diffIndexLine Number
    hi! link       diffIsA       WarningMsg
    hi! link       diffNoEOL     WarningMsg
    hi! link       diffOnly      WarningMsg
endfunction

hi! def GitDirty guifg=#e2c08d
hi! NonText gui=nocombine

" Lsp
hi! link LspReferenceText Visual
hi! link LspReferenceRead Visual
hi! link LspReferenceWrite Visual
" hi! LspDiagnosticsSignHint guifg=#36d0e0
" hi! LspDiagnosticsVirtualTextHint guifg=#36d0e0
" hi! LspDiagnosticsUnderlineHint cterm=underline gui=undercurl guisp=#36d0e0

" Colorscheme tweaks
function! ApplyColorTweaks()
    let g:colorscheme = g:colors_name
    hi CursorLineNr gui=bold guifg=#a9b665
    call SaneDiffDefaults()
endfunction

execute("colorscheme " . g:colorscheme)
