" Ken-vim-config
" version: 0.1
" Base on fisa-vim-config
"
"
" ============================================================================
" Vim-plug initialization
" Avoid modify this section, unless you are very sure of what you are doing
"
let vim_plug_just_installed = 0
let vim_plug_path = expand('~/.vim/autoload/plug.vim')
if !filereadable(vim_plug_path)
    echo "Installing Vim-plug..."
    echo ""
    silent !mkdir -p ~/.vim/autoload
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    let vim_plug_just_installed = 1
endif

" manually load vim-plug the first time
if vim_plug_just_installed
    :execute 'source '.fnameescape(vim_plug_path)
endif

" Obscure hacks done, you can now modify the rest of the .vimrc as you wish :)

" ============================================================================

" Active plugins
" You can disable or add new ones here:
call plug#begin('~/.vim/plugged')
" Plugins from github repos:

" Python and PHP Debugger
Plug 'fisadev/vim-debug.vim', { 'for': ['py', 'php'] }
" Better file browser
Plug 'scrooloose/nerdtree'
" Code commenter
Plug 'scrooloose/nerdcommenter'
" Code and files fuzzy finder
Plug 'kien/ctrlp.vim'
" Extension to ctrlp, for fuzzy command finder
Plug 'fisadev/vim-ctrlp-cmdpalette'
" Zen coding
Plug 'mattn/emmet-vim', { 'for': ['html', 'htmldjango', 'javascript'] }
" Git integration
Plug 'motemen/git-vim'
" Airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" Terminal Vim with 256 colors colorscheme
Plug 'fisadev/fisa-vim-colorscheme'
" Consoles as buffers
Plug 'rosenfeld/conque-term'
" Pending tasks list
Plug 'fisadev/FixedTaskList.vim'
" Surround
Plug 'tpope/vim-surround', { 'for': ['html', 'htmldjango', 'javascript'] }
" Autoclose
"Plug 'Townk/vim-autoclose'
" Indent text object
Plug 'michaeljsmith/vim-indent-object'
" Python mode (indentation, doc, refactor, lints, code checking, motion and
" operators, highlighting, run and ipdb breakpoints)
Plug 'python-mode/python-mode',{'for': ['python'] }
" YouCompleteMe
if v:version > 704 || (v:version == 704 && has('patch143'))
    function! YCMInstall(info)
        if a:info.status == 'installed'
            !./install.sh --all
        endif
    endfunction
    Plug 'Valloric/YouCompleteMe',{ 'on': [], 'do':  function('YCMInstall') }
    Plug 'davidhalter/jedi'
    Plug 'sykuang/YCM-Generator',{'branch':'stable'}
    "Better autocompletion
    Plug 'Shougo/neocomplcache.vim',{'for': ['sh']}
else
    Plug 'Shougo/neocomplcache.vim'
endif
" Snippets manager (SnipMate), dependencies, and snippets repo
Plug 'MarcWeber/vim-addon-mw-utils', { 'for': ['html', 'htmldjango', 'javascript'] }
Plug 'tomtom/tlib_vim', { 'for': ['html', 'htmldjango', 'javascript'] }
Plug 'honza/vim-snippets', { 'for': ['html', 'htmldjango', 'javascript'] }
Plug 'garbas/vim-snipmate', { 'for': ['html', 'htmldjango', 'javascript'] }
" Git Gutter
Plug 'airblade/vim-gitgutter'
" Automatically sort python imports
Plug 'fisadev/vim-isort',{'for': 'python'}
" Drag visual blocks arround
Plug 'fisadev/dragvisuals.vim'
" Window chooser
Plug 't9md/vim-choosewin'
" Python and other languages code checker
Plug 'scrooloose/syntastic',{'for': ['python','sh'] }
" Paint css colors with the real color
Plug 'lilydjwg/colorizer',{'for': ['css'] }
" Relative numbering of lines (0 is the current line)
" (disabled by default because is very intrusive and can't be easily toggled
" on/off. When the plugin is present, will always activate the relative
" numbering every time you go to normal mode. Author refuses to add a setting
" to avoid that)
" Plug 'myusuf3/numbers.vim'

" Plugins from vim-scripts repos:

" Search results counter
Plug 'vim-scripts/IndexedSearch'
" XML/HTML tags navigation
Plug 'vim-scripts/matchit.zip', { 'for': ['xml', 'html'] }
" Gvim colorscheme
Plug 'vim-scripts/Wombat'
" Yank history navigation
Plug 'vim-scripts/YankRing.vim'
" vimspell
Plug 'vim-scripts/vimspell'
" Tabular
Plug 'vim-scripts/Tabular'
" DoxygenToolkit.vim
Plug 'vim-scripts/DoxygenToolkit.vim', { 'for' :['c','cpp','python']}
" Auto formater
Plug 'Chiel92/vim-autoformat'
" CCTREE
Plug 'hari-rangarajan/CCTree',{'for':['c','cpp']}
Plug 'wesleyche/Trinity'
Plug 'wesleyche/SrcExpl', { 'on': 'SrcExplToggle' }
" rust
Plug 'rust-lang/rust.vim', { 'for': 'rust' }
" tagbar
Plug 'majutsushi/tagbar'
" Undo tree
Plug 'mbbill/undotree'
" Mark
Plug 'Yggdroot/vim-mark'
" Ack code search (requires ack installed in the system)
Plug 'mileszs/ack.vim'
" True Sublime Text style multiple selections for Vim
Plug 'terryma/vim-multiple-cursors'
" Tabline - Configure tabs within Terminal Vim
Plug 'mkitt/tabline.vim'
" A vim plugin to help you to create/update cscope database and connect to existing proper database automatically.
Plug 'brookhong/cscope.vim', { 'for': ['c','cpp']}
" A vim plugin to display the indention levels with thin vertical lines
Plug 'Yggdroot/indentLine'
" Speed up Vim by updating folds only when called-for.
Plug 'Konfekt/FastFold'
" No-BS Python code folding for Vim
Plug 'tmhedberg/SimpylFold', { 'for': 'python' }
" Markdown Vim Mode
Plug 'plasticboy/vim-markdown', { 'for': 'markdown'}

call plug#end()
" ============================================================================
" Install plugins the first time vim runs

if vim_plug_just_installed
    echo "Installing Bundles, please ignore key map error messages"
    :PlugInstall
endif

" ============================================================================
" Vim settings and mappings

" Let backspace can move from current line
"  reference http://vim.wikia.com/wiki/Backspace_and_delete_problems
set backspace=indent,eol,start

" no vi-compatible
set nocompatible

" allow plugins by file type (required for plugins!)
filetype plugin on
filetype indent on

" tabs and spaces handling
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4

" tab length exceptions on some file types
autocmd FileType html setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType htmldjango setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType javascript setlocal shiftwidth=2 tabstop=2 softtabstop=2

" always show status bar
set ls=2

" incremental search
set incsearch
" highlighted search results
set hlsearch
" ignore search case
set ignorecase
" syntax highlight on
syntax on

" show line numbers
set nu

" set leader
let mapleader=";"

" tab navigation mappings
map tn :tabn<CR>
map tp :tabp<CR>
map [1;5C :tabn<CR>
imap [1;5C <ESC>:tabn<CR>
map [1;5D :tabp<CR>
imap [1;5D <ESC>:tabp<CR>
map tm :tabm
map tt :tabnew
map ts :tab split<CR>
map <C-S-Right> :tabn<CR>
imap <C-S-Right> <ESC>:tabn<CR>
map <C-S-Left> :tabp<CR>
imap <C-S-Left> <ESC>:tabp<CR>

" navigate windows with meta+arrows
map <M-Right> <c-w>l
map <M-Left> <c-w>h
map <M-Up> <c-w>k
map <M-Down> <c-w>j
imap <M-Right> <ESC><c-w>l
imap <M-Left> <ESC><c-w>h
imap <M-Up> <ESC><c-w>k
imap <M-Down> <ESC><c-w>j

map <Up> gk
map <Down> gj
" old autocomplete keyboard shortcut
imap <C-J> <C-X><C-O>

" save as sudo
ca w!! w !sudo tee "%"

" simple recursive grep
" both recursive grep commands with internal or external (fast) grep
command! -nargs=1 RecurGrep lvimgrep /<args>/gj ./**/*.* | lopen | set nowrap
command! -nargs=1 RecurGrepFast silent exec 'lgrep! <q-args> ./**/*.*' | lopen
" mappings to call them
nmap ,R :RecurGrep
nmap ,r :RecurGrepFast
" mappings to call them with the default word as search text
nmap ,wR :RecurGrep <cword><CR>
nmap ,wr :RecurGrepFast <cword><CR>

" use 256 colors when possible
if (&term =~? 'mlterm\|xterm\|xterm-256\|screen-256') || has('nvim')
    let &t_Co = 256
    colorscheme fisa
else
    colorscheme delek
endif

" colors for gvim
if has('gui_running')
    colorscheme wombat
endif

" when scrolling, keep cursor 3 lines away from screen border
set scrolloff=3

" autocompletion of files and commands behaves like shell
" (complete only the common part, list the options that match)
set wildmode=list:longest

" better backup, swap and undos storage
set directory=~/.vim/dirs/tmp     " directory to place swap files in
set backup                        " make backup files
set backupdir=~/.vim/dirs/backups " where to put backup files
set undofile                      " persistent undos - undo after you re-open the file
set undodir=~/.vim/dirs/undos
set viminfo+=n~/.vim/dirs/viminfo
" store yankring history file there too
let g:yankring_history_dir = '~/.vim/dirs/'

" create needed directories if they don't exist
if !isdirectory(&backupdir)
    call mkdir(&backupdir, "p")
endif
if !isdirectory(&directory)
    call mkdir(&directory, "p")
endif
if !isdirectory(&undodir)
    call mkdir(&undodir, "p")
endif

" ============================================================================
" Plugins settings and mappings
" Edit them as you wish.

" Taglist -----------------------------
"let Tlist_Use_Right_Window = 1
let Tlist_Exit_OnlyWindow = 1
let Tlist_Show_One_File = 1
let Tlist_Sort_Type = "order"
"let Tlist_GainFocus_On_ToggleOpen=10
" toggle taglist display
map <F4> :TagbarToggle<CR>
map [30~ :Tagbaroggle<CR>

" autofocus on tagbar open
let g:tagbar_autofocus = 1
let g:airline#extensions#tagbar#enabled = 1
let g:tagbar_left = 1
" NERDTree -----------------------------

" toggle nerdtree display
map <F3> :NERDTreeToggle<CR>
map [25~ :NERDTreeToggle<CR>
" don;t show these file types
let NERDTreeIgnore = ['\.pyc$', '\.pyo$']

" Tasklist ------------------------------

" show pending tasks list
map <F2> :TaskList<CR>

" Vim-debug ------------------------------

" disable default mappings, have a lot of conflicts with other plugins
let g:vim_debug_disable_mappings = 1
" add some useful mappings
"map <F5> :Dbg over<CR>
"map <F6> :Dbg into<CR>
"map <F7> :Dbg out<CR>
"map <F8> :Dbg here<CR>
"map <F9> :Dbg break<CR>
"map <F10> :Dbg watch<CR>
"map <F11> :Dbg down<CR>
"map <F12> :Dbg up<CR>

" CtrlP ------------------------------

" file finder mapping
let g:ctrlp_map = ',e'
" tags (symbols) in current file finder mapping
nmap ,g :CtrlPBufTag<CR>
" tags (symbols) in all files finder mapping
nmap ,G :CtrlPBufTagAll<CR>
" general code finder in all files mapping
nmap ,f :CtrlPLine<CR>
" recent files finder mapping
nmap ,m :CtrlPMRUFiles<CR>
" commands finder mapping
nmap ,c :CtrlPCmdPalette<CR>
" to be able to call CtrlP with default search text
function! CtrlPWithSearchText(search_text, ctrlp_command_end)
    execute ':CtrlP' . a:ctrlp_command_end
    call feedkeys(a:search_text)
endfunction
" same as previous mappings, but calling with current word as default text
nmap ,wg :call CtrlPWithSearchText(expand('<cword>'), 'BufTag')<CR>
nmap ,wG :call CtrlPWithSearchText(expand('<cword>'), 'BufTagAll')<CR>
nmap ,wf :call CtrlPWithSearchText(expand('<cword>'), 'Line')<CR>
nmap ,we :call CtrlPWithSearchText(expand('<cword>'), '')<CR>
nmap ,pe :call CtrlPWithSearchText(expand('<cfile>'), '')<CR>
nmap ,wm :call CtrlPWithSearchText(expand('<cword>'), 'MRUFiles')<CR>
nmap ,wc :call CtrlPWithSearchText(expand('<cword>'), 'CmdPalette')<CR>
" don't change working directory
let g:ctrlp_working_path_mode = 'ra'
" ignore these files and folders on file finder
let g:ctrlp_custom_ignore = {
            \ 'dir':  '\v[\/](\.git|\.hg|\.svn|node_modules)$',
            \ 'file': '\v\.(pyc|pyo|o|out|files|doc|xls|mk|txt|xlsx|Kconfig|tmp)$|tags',
            \ }
let g:ctrlp_use_caching = 1
let g:ctrlp_max_files = 30000
let g:ctrlp_root_markers = ['.ctrlp']
" Syntastic ------------------------------

" show list of errors and warnings on the current file
"nmap <leader>e :Errors<CR>
" check also when just opened the file
"let g:syntastic_check_on_open = 1
" don't put icons on the sign column (it hides the vcs status icons of signify)
"let g:syntastic_enable_signs = 0
" custom icons (enable them if you use a patched font, and enable the previous
" setting)
"let g:syntastic_error_symbol = '✗'
"let g:syntastic_warning_symbol = '⚠'
"let g:syntastic_style_error_symbol = '✗'
"let g:syntastic_style_warning_symbol = '⚠'
"let g:Syntastic_cpp_remove_include_errors = 1
" Python-mode ------------------------------

" don't use linter, we use syntastic for that
"let g:pymode_lint_on_write = 0
"let g:pymode_lint_signs = 0
" don't fold python code on open
"let g:pymode_folding = 0
" don't load rope by default. Change to 1 to use rope
let g:pymode_rope = 0
" open definitions on same window, and custom mappings for definitions and
" occurrences
"let g:pymode_rope_goto_definition_bind = ',d'
"let g:pymode_rope_goto_definition_cmd = 'e'
"nmap ,D :tab split<CR>:PymodePython rope.goto()<CR>
"nmap ,o :RopeFindOccurrences<CR>

" NeoComplCache ------------------------------

" most of them not documented because I'm not sure how they work
" (docs aren't good, had to do a lot of trial and error to make
" it play nice)
let g:neocomplcache_enable_at_startup = 1
let g:neocomplcache_enable_ignore_case = 1
let g:neocomplcache_enable_smart_case = 1
"let g:neocomplcache_enable_auto_select = 1
let g:neocomplcache_enable_fuzzy_completion = 1
"let g:neocomplcache_enable_camel_case_completion = 1
"let g:neocomplcache_enable_underbar_completion = 1
"let g:neocomplcache_fuzzy_completion_start_length = 1
"let g:neocomplcache_auto_completion_start_length = 1
"let g:neocomplcache_manual_completion_start_length = 1
let g:neocomplcache_min_keyword_length = 1
let g:neocomplcache_min_syntax_length = 1
"complete with workds from any opened file
"let g:neocomplcache_same_filetype_lists = {}
"let g:neocomplcache_same_filetype_lists._ = '_'

" YouCompleteMe
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_seed_identifiers_with_syntax=1

" DragVisuals ------------------------------

" mappings to move blocks in 4 directions
vmap <expr> <S-M-LEFT> DVB_Drag('left')
vmap <expr> <S-M-RIGHT> DVB_Drag('right')
vmap <expr> <S-M-DOWN> DVB_Drag('down')
vmap <expr> <S-M-UP> DVB_Drag('up')
" mapping to duplicate block
vmap <expr> D DVB_Duplicate()

" Signify ------------------------------

" this first setting decides in which order try to guess your current vcs
" UPDATE it to reflect your preferences, it will speed up opening files
let g:signify_vcs_list = [ 'git', 'hg' ]
" mappings to jump to changed blocks
nmap <leader>gj <plug>(signify-next-hunk)
nmap <leader>gk <plug>(signify-prev-hunk)
" nicer colors
highlight DiffAdd           cterm=bold ctermbg=none ctermfg=119
highlight DiffDelete        cterm=bold ctermbg=none ctermfg=167
highlight DiffChange        cterm=bold ctermbg=none ctermfg=227
highlight SignifySignAdd    cterm=bold ctermbg=237  ctermfg=119
highlight SignifySignDelete cterm=bold ctermbg=237  ctermfg=167
highlight SignifySignChange cterm=bold ctermbg=237  ctermfg=227

" Window Chooser ------------------------------

" mapping
nmap  -  <Plug>(choosewin)
" show big letters
let g:choosewin_overlay_enable = 1

" Airline ------------------------------

let g:airline_powerline_fonts = 0
let g:airline_theme = 'bubblegum'
let g:airline#extensions#whitespace#enabled = 0
let g:airline#extensions#ycm#enabled = 1
let g:airline#extensions#ycm#error_symbol = 'E:'
let g:airline#extensions#ycm#warning_symbol = 'W:'
let g:airline_section_c ="%t%m %#__accent_red#%{airline#util#wrap(airline#parts#readonly(),0)}%#__restore__#"
set tr
"let g:airline#extensions#tabline#fnamemod
" Autoformat
"let g:formatdef_astyle_c = '"astyle --mode=c --style=allman --convert-tabs --indent=spaces=4 --break-blocks --add-brackets --lineend=linux --pad-oper"'
let g:formatters_c =['clangformat']
let g:formatdef_clangformat ="'clang-format -lines='.a:firstline.':'.a:lastline.' --assume-filename=\"'.expand('%:p').'\" -style=\"{ AlignTrailingComments: true , BreakBeforeBraces: Allman , ColumnLimit: 100 , IndentWidth: 4 , KeepEmptyLinesAtTheStartOfBlocks: false , ObjCSpaceAfterProperty: true , ObjCSpaceBeforeProtocolList: true , PointerBindsToType: false , SpacesBeforeTrailingComments: 1 , TabWidth: 4 , UseTab: Never , SpaceAfterCStyleCast : true , SpaceBeforeAssignmentOperators : true , SpaceBeforeAssignmentOperators : true}\"'"

let g:formatdef_jsbeautify_javascript = "'js-beautify -X -s 4 -j'"
let g:autoformat_verbosemode = 1
let g:formatdef_autopep8 = "'autopep8 - --range '.a:firstline.' '.a:lastline"
noremap ,af :Autoformat<CR>
map ,af :Autoformat<CR>

" cscope shortcut
nnoremap <leader>fa :call CscopeFindInteractive(expand('<cword>'))<CR>
nnoremap <leader>l :call ToggleLocationList()<CR>
" s: Find this C symbol
nnoremap  <leader>fs :call CscopeFind('s', expand('<cword>'))<CR>
" g: Find this definition
nnoremap  <leader>fg :call CscopeFind('g', expand('<cword>'))<CR>
" d: Find functions called by this function
nnoremap  <leader>fd :call CscopeFind('d', expand('<cword>'))<CR>
" c: Find functions calling this function
nnoremap  <leader>fc :call CscopeFind('c', expand('<cword>'))<CR>
" t: Find this text string
nnoremap  <leader>ft :call CscopeFind('t', expand('<cword>'))<CR>
" e: Find this egrep pattern
nnoremap  <leader>fe :call CscopeFind('e', expand('<cword>'))<CR>
" f: Find this file
nnoremap  <leader>ff :call CscopeFind('f', expand('<cword>'))<CR>
" i: Find files #including this file
nnoremap  <leader>fi :call CscopeFind('i', expand('<cword>'))<CR>
" set g:cscope_silent
let g:cscope_silent=1
nmap cn :cnext<CR>
nmap cp :cprevious<CR>
set cst
" to use fancy symbols for airline, uncomment the following lines and use a
" patched font (more info on the README.rst)
"if !exists('g:airline_symbols')
"   let g:airline_symbols = {}
"endif
"let g:airline_left_sep = '⮀'
"let g:airline_left_alt_sep = '⮁'
"let g:airline_right_sep = '⮂'
"let g:airline_right_alt_sep = '⮃'
"let g:airline_symbols.branch = '⭠'
"let g:airline_symbols.readonly = '⭤'
"let g:airline_symbols.linenr = '⭡'

nmap <C-F11> :TrinityToggleNERDTree<CR>

" Use rust autoformat
let g:rustfmt_autosave = 1


" Trinity settings --------------
" // The switch of the Source Explorer
nmap <F8> :SrcExplToggle<CR>

" // Set the height of Source Explorer window
let g:SrcExpl_winHeight = 8

" // Set 100 ms for refreshing the Source Explorer
let g:SrcExpl_refreshTime = 1000

" // Set "Enter" key to jump into the exact definition context
let g:SrcExpl_jumpKey = "<ENTER>"

" // Set "Space" key for back from the definition context
let g:SrcExpl_gobackKey = "<SPACE>"

" // In order to avoid conflicts, the Source Explorer should know whatplugins
" // except itself are using buffers. And you need add their buffer names into
" // below listaccording to the command ":buffers!"
let g:SrcExpl_pluginList = [
            \ "__Tag_List__",
            \ "_NERD_tree_"
            \ ]

" // Enable/Disable the local definition searching, and note that this is not
" // guaranteed to work, the Source Explorer doesn't check the syntax for now.
" // It only searches for a match with the keyword according to command 'gd'
let g:SrcExpl_searchLocalDef = 0

" // Do not let the Source Explorer update the tags file when opening
let g:SrcExpl_isUpdateTags = 0

" // Use 'Exuberant Ctags' with '--sort=foldcase -R .' or '-L cscope.files' to
" // create/update the tags file
"let g:SrcExpl_updateTagsCmd = "ctags -L ./tags,./../tags,./../../tags,./../../../tags,tags"

" // Set "<F12>" key for updating the tags file artificially
let g:SrcExpl_updateTagsKey = "<F12>"

" // Set "<F3>" key for displaying the previous definition in the jump list
"let g:SrcExpl_prevDefKey = "<F3>"

" // Set "<F4>" key for displaying the next definition in the jump list
"let g:SrcExpl_nextDefKey = "<F4>"


" Turn on spell checking
nn <C-F7> :setlocal spell! spell?<CR>
nn [31~ :setlocal spell! spell?<CR>

"Set window nevigation
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
"Set YouCompleteMe
function! Load_ycm()
    if (&ft=='c' || &ft=='cpp' || &ft=='python' || &ft=='javascript')
        call plug#load('YouCompleteMe')
        if exists('g:loaded_youcompleteme')
            call youcompleteme#Enable()
        endif
    endif
endfunction
let g:ycm_global_ycm_extra_conf = '~/.vim/plugged/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'
let g:ycm_confirm_extra_conf = 0
let g:ycm_filepath_completion_use_working_dir = 1
nnoremap <leader>gd :YcmCompleter GoToDeclaration<CR>
nnoremap <leader>gf :YcmCompleter GoToDefinition<CR>
nnoremap <leader>gg :YcmCompleter GoToDefinitionElseDeclaration<CR>
let g:ycm_enable_diagnostic_signs=0
"let g:ycm_python_binary_path = '/usr/bin/python'
"let g:ycm_path_to_python_interpreter="/usr/bin/python"
nmap <leader>ly :call Load_ycm()<CR>
" Set vim-gitgutter updatetime
set updatetime=1000

" Set local vimrc
let g:localvimrc_ask=0
let g:localvimrc_sandbox=0

" Set vimspell
set spelllang=en_us
"set spell
syntax enable

" Show trailing whitespace and tab
highlight ExtraWhitespace ctermbg=green guibg=darkgreen
match ExtraWhitespace /\s\+$/
autocmd FileType c,cpp set list!
autocmd FileType c,cpp set listchars=tab:>-
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()

" Set Foldenable
set foldenable

" check one time after 4s of inactivity in normal mode
set autoread"
au CursorHold * checktime

" Set filetype
autocmd BufNewFile,BufRead *.css setf css
autocmd BufNewFile,BufRead *.rs setf rust


" simple recursive grep
let g:ackprg = 'ag --nogroup --nocolor --column'
nmap ,r :Ack
nmap ,wr :Ack <cword><CR>

" nerdcommenter
let g:NERDAltDelims_c = 1

" Quick Preview window
nnoremap  <leader>sp [I:let nr = input("Which one: ")<Bar>exe "normal " . nr ."[\t"<CR>

" FastFold
let g:tex_fold_enabled=1
"let g:vimsyn_folding='af'
let g:xml_syntax_folding = 1
let g:php_folding = 1
let g:perl_fold = 1
let g:fastfold_fold_command_suffixes = []
set nofoldenable
" Tabular
if exists(":Tabularize")
    nmap <Leader>a= :Tabularize /=<CR>
    vmap <Leader>a= :Tabularize /=<CR>
    nmap <Leader>a: :Tabularize /:\zs<CR>
    vmap <Leader>a: :Tabularize /:\zs<CR>
endif

" Doxygen
nnoremap <leader>d :Dox<CR>

"Open file with previous line
if has("autocmd")
    autocmd BufReadPost *
                \ if line("'\"") > 0 && line ("'\"") <= line("$") |
                \   exe "normal g'\"" |
                \ endif
endif

