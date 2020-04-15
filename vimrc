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

" vim-sensible
Plug 'tpope/vim-sensible'
" Better file browser
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
" Code commenter
Plug 'tpope/vim-commentary', { 'on': ['<Plug>CommentaryLine', '<Plug>Commentary'] }
" fuzzy search file
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
" Zen coding
Plug 'mattn/emmet-vim', { 'for': ['html', 'htmldjango', 'javascript'] }
" Git integration
Plug 'motemen/git-vim'
" Airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" Color scheme
Plug 'cocopon/iceberg.vim'
" Surround
Plug 'tpope/vim-surround', { 'for': ['html', 'htmldjango', 'javascript'] }
" Indent text object
Plug 'michaeljsmith/vim-indent-object'
" Python mode (indentation, doc, refactor, lints, code checking, motion and
" operators, highlighting, run and ipdb breakpoints)
Plug 'python-mode/python-mode',{'for': 'python', 'branch': 'develop'}
" YouCompleteMe
function! YCMInstall(info)
    "if a:info.status == 'installed' || a:info.force
        let buildparameter="--clangd-completer"
        if executable('go')
            let buildparameter=buildparameter . " --go-completer"
        endif
        if executable('tsc')
            let buildparameter=buildparameter . " --ts-completer"
        endif
        let l:installcmd="!./install.py " . buildparameter
        execute l:installcmd
    "endif
endfunction
Plug 'Valloric/YouCompleteMe',{ 'on':[], 'for':['javascript','c','cpp','python','typescript','sh'], 'do':  function('YCMInstall') }
    Plug 'davidhalter/jedi'
" Snippets manager (SnipMate), dependencies, and snippets repo
Plug 'MarcWeber/vim-addon-mw-utils', { 'for': ['html', 'htmldjango', 'javascript'] }
Plug 'tomtom/tlib_vim', { 'for': ['html', 'htmldjango', 'javascript'] }
Plug 'honza/vim-snippets', { 'for': ['html', 'htmldjango', 'javascript'] }
Plug 'garbas/vim-snipmate', { 'for': ['html', 'htmldjango', 'javascript'] }
" Git Gutter
Plug 'airblade/vim-gitgutter'
" Python and other languages code checker
Plug 'scrooloose/syntastic',{'for': ['python','sh'] }
" Paint css colors with the real color
Plug 'lilydjwg/colorizer',{'for': ['css'] }
" Search results counter
Plug 'vim-scripts/IndexedSearch'
" XML/HTML tags navigation
Plug 'vim-scripts/matchit.zip', { 'for': ['xml', 'html'] }
" Yank history navigation
Plug 'vim-scripts/YankRing.vim'
" Tabular
Plug 'vim-scripts/Tabular', { 'on': ['Tabularize'] }
" DoxygenToolkit.vim
Plug 'vim-scripts/DoxygenToolkit.vim', { 'for' :['c','cpp','python']}
" Auto formater
Plug 'Chiel92/vim-autoformat'
" CCTREE
Plug 'hari-rangarajan/CCTree',{'for':['c']}
Plug 'wesleyche/SrcExpl', { 'for':['c'], 'on': 'SrcExplToggle' }
" rust
Plug 'rust-lang/rust.vim', { 'for': 'rust' }
" tagbar
Plug 'majutsushi/tagbar', { 'for':['c','cpp','python']}
" Undo tree
Plug 'mbbill/undotree'
" Mark
Plug 'Yggdroot/vim-mark', { 'on': '<Plug>MarkSet' }
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
" Markdown Vim Mode
Plug 'junegunn/goyo.vim', { 'for': 'markdown' }
Plug 'junegunn/limelight.vim', { 'for': 'markdown' }
" Typescript support
Plug 'leafgarland/typescript-vim', { 'for':'typescript'}
" auto-pairs
Plug 'jiangmiao/auto-pairs'
" A git wrpper
Plug 'tpope/vim-fugitive', { 'on': ['GitBlame','GitDiff','GitLog','GitAdd'] }
call plug#end()
" ============================================================================
" Install plugins the first time vim runs

if vim_plug_just_installed
    echo "Installing Bundles, please ignore key map error messages"
    :PlugInstall
endif

" ============================================================================
" Vim settings and mappings

" allow plugins by file type (required for plugins!)
filetype plugin on
filetype indent on

" tabs and spaces handling
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4

" Set filetype
augroup filetypedetect
autocmd BufNewFile,BufRead *.css setf css
autocmd BufNewFile,BufRead *.rs setf rust
autocmd BufNewFile,BufRead *.ts   setf Typescript
augroup END

" tab length exceptions on some file types
autocmd FileType html setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType htmldjango setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType javascript setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType markdown setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType json setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType sh setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType typescript setlocal shiftwidth=2 tabstop=2 softtabstop=2

" always show status bar
set ls=2

" highlighted search results
set hlsearch
" Ignore case
set ignorecase
" syntax highlight on
syntax on

" show line numbers
set nu

" set leader
let mapleader=";"
" set enconding
set encoding=utf8
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

map <Up> gk
map <Down> gj
" old autocomplete keyboard shortcut
imap <C-J> <C-X><C-O>

" save as sudo
ca w!! w !sudo tee "%"

" Set color scheme
colo iceberg
let &t_Co = 256

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

"Open file with previous line
if has("autocmd")
    autocmd BufReadPost *
                \ if line("'\"") > 0 && line ("'\"") <= line("$") |
                \   exe "normal g'\"" |
                \ endif
endif

" Show tab with >-
function! ShowTab()
    set list!
    set listchars=tab:>-
endfunction
nmap <leader>t :call ShowTab()<CR>

" ============================================================================
" Plugins settings and mappings
" Edit them as you wish.

" Tagbar -----------------------------
" toggle tagbar display
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

" Tasklist ----------------------------

" show pending tasks list -------------
map <F2> :TaskList<CR>

" Fzf ---------------------------------
nmap ,e :FZF<CR>
nmap ,o :FZF

" YouCompleteMe ----------------------
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_seed_identifiers_with_syntax=1

" nicer colors ------------------------
highlight DiffAdd           cterm=bold ctermbg=none ctermfg=119
highlight DiffDelete        cterm=bold ctermbg=none ctermfg=167
highlight DiffChange        cterm=bold ctermbg=none ctermfg=227
highlight SignifySignAdd    cterm=bold ctermbg=237  ctermfg=119
highlight SignifySignDelete cterm=bold ctermbg=237  ctermfg=167
highlight SignifySignChange cterm=bold ctermbg=237  ctermfg=227

" Airline ------------------------------

let g:airline_powerline_fonts = 1
let g:airline_theme = 'bubblegum'
let g:airline#extensions#whitespace#enabled = 0
let g:airline#extensions#ycm#enabled = 1
let g:airline#extensions#ycm#error_symbol = 'E:'
let g:airline#extensions#ycm#warning_symbol = 'W:'
let g:airline_section_c ="%t%m %#__accent_red#%{airline#util#wrap(airline#parts#readonly(),0)}%#__restore__#"
set tr
"let g:airline#extensions#tabline#fnamemod
let g:airline_highlighting_cache = 1
" Autoformat ---------------------------
let g:formatters_c =['clangformat']
let g:formatdef_clangformat ="'clang-format -lines='.a:firstline.':'.a:lastline.' --assume-filename=\"'.expand('%:p').'\" -style=\"{ AlignTrailingComments: true , BreakBeforeBraces: Allman , ColumnLimit: 100 , IndentWidth: 4 , KeepEmptyLinesAtTheStartOfBlocks: false , ObjCSpaceAfterProperty: true , ObjCSpaceBeforeProtocolList: true , PointerBindsToType: false , SpacesBeforeTrailingComments: 1 , TabWidth: 4 , UseTab: Never , SpaceAfterCStyleCast : true , SpaceBeforeAssignmentOperators : true , SpaceBeforeAssignmentOperators : true}\"'"
let g:formatters_json=['fixjson'] "Json formater
let g:formatdef_jsbeautify_javascript = "'js-beautify -X -s 2 -j'" " Javascript formater
let g:formatters_python=['yapf']
let g:formatter_yapf_style = 'pep8' " Python formater
let g:autoformat_verbosemode = 0
noremap ,af :Autoformat<CR>
map ,af :Autoformat<CR>

" cscope shortcut ---------------------
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
let g:cscope_interested_files = '\.c$\|\.cpp$\|\.h$\|\.hpp'
set cst

" Airline -----------------------------
if !exists('g:airline_symbols')
   let g:airline_symbols = {}
endif
let g:airline_left_sep = '⮀'
let g:airline_left_alt_sep = '⮁'
let g:airline_right_sep = '⮂'
let g:airline_right_alt_sep = '⮃'
let g:airline_symbols.branch = '⭠'
let g:airline_symbols.readonly = '⭤'
let g:airline_symbols.linenr = '⭡'

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

"Set window nevigation
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

"Set YouCompleteMe --------------------
let g:ycm_global_ycm_extra_conf = '~/.vim/plugged/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'
let g:ycm_confirm_extra_conf = 0
let g:ycm_filepath_completion_use_working_dir = 1
nnoremap <leader>gd :YcmCompleter GoToDeclaration<CR>
nnoremap <leader>gf :YcmCompleter GoToDefinition<CR>
nnoremap <leader>gg :YcmCompleter GoToDefinitionElseDeclaration<CR>
let g:ycm_enable_diagnostic_signs=0

" vim-gitgutter -----------------------
" Set vim-gitgutter updatetime
set updatetime=1000
" user rg
let g:gitgutter_grep = 'rg'

" Set vimspell
set spelllang=en_us
nmap <F7> :set spell! spell?<CR>
syntax enable

" Show trailing whitespace and tab
highlight ExtraWhitespace ctermbg=green guibg=darkgreen
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()

" Set Foldenable
set foldenable

" simple recursive grep ---------------
if executable("rg")
let g:ackprg = 'rg --vimgrep'
endif
nmap ,r :Ack
nmap ,wr :Ack <cword><CR>

" Quick Preview window
nnoremap  <leader>sp [I:let nr = input("Which one: ")<Bar>exe "normal " . nr ."[\t"<CR>

" Tabular -----------------------------
if exists(":Tabularize")
    nmap <Leader>a= :Tabularize /=<CR>
    vmap <Leader>a= :Tabularize /=<CR>
    nmap <Leader>a: :Tabularize /:\zs<CR>
    vmap <Leader>a: :Tabularize /:\zs<CR>
endif

" Doxygen -----------------------------
nnoremap <leader>d :Dox<CR>

" vim-fugitive ------------------------
nmap <Leader>gb :GitBlame<CR>
nmap <Leader>gd :GitDiff<CR>
nmap <Leader>gl :GitLog<CR>
nmap <Leader>ga :GitAdd<CR>

" Commentary --------------------------
autocmd! User vim-commentary unmap gcc
autocmd! User vim-commentary unmap gc
nmap <Leader>c<space> <Plug>CommentaryLine
vmap <Leader>c<space> <Plug>Commentary
