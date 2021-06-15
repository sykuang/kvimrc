" Ken-vim-config
" version: 0.1
" Base on fisa-vim-config
"
"
" ============================================================================
" Vim-plug initialization
" Avoid modify this section, unless you are very sure of what you are doing
"
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" manually load vim-plug the first time
autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \| PlugInstall --sync | source $MYVIMRC
\| endif

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
" Color scheme
Plug 'cocopon/iceberg.vim'
Plug 'gkeep/iceberg-dark'
Plug 'itchyny/lightline.vim'
" Surround
Plug 'tpope/vim-surround', { 'for': ['html', 'htmldjango', 'javascript'] }
" Python mode (indentation, doc, refactor, lints, code checking, motion and
" operators, highlighting, run and ipdb breakpoints)
Plug 'python-mode/python-mode',{'for': 'python', 'branch': 'develop'}

if has('nvim')
Plug 'davidhalter/jedi'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'neoclide/coc-tsserver', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-tabnine', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-python', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-highlight', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-pairs', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-yaml', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-snippets', {'do': 'yarn install --frozen-lockfile'}
Plug 'voldikss/coc-cmake', {'do': 'yarn install --frozen-lockfile'}
" Plug 'clangd/coc-clangd', {'do': 'yarn install --frozen-lockfile'}
Plug 'MaskRay/ccls', {'do': 'yarn install --frozen-lockfile'}
Plug 'josa42/coc-sh', {'do': 'yarn install --frozen-lockfile'}
Plug 'iamcco/coc-vimlsp', {'do': 'yarn install --frozen-lockfile'}
Plug 'microsoft/pyright', {'do': 'yarn install --frozen-lockfile'}
Plug 'jackguo380/vim-lsp-cxx-highlight'
else
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
Plug 'Valloric/YouCompleteMe',{ 'on':[], 'for':['javascript','c','cpp','python','typescript','sh','zsh'], 'do':  function('YCMInstall') }
" auto-pairs
Plug 'jiangmiao/auto-pairs'
endif
" Snippets manager (SnipMate), dependencies, and snippets repo
Plug 'MarcWeber/vim-addon-mw-utils', { 'for': ['html', 'htmldjango', 'javascript'] }
Plug 'tomtom/tlib_vim', { 'for': ['html', 'htmldjango', 'javascript'] }
Plug 'honza/vim-snippets', { 'for': ['html', 'htmldjango', 'javascript'] }
Plug 'garbas/vim-snipmate', { 'for': ['html', 'htmldjango', 'javascript'] }
" Git Gutter
Plug 'airblade/vim-gitgutter'
" Python and other languages code checker
" Plug 'scrooloose/syntastic',{'for': ['python','sh'] }
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
" Markdown Vim Mode
Plug 'junegunn/goyo.vim', { 'for': 'markdown' }
Plug 'junegunn/limelight.vim', { 'for': 'markdown' }
" Typescript support
Plug 'leafgarland/typescript-vim', { 'for':'typescript'}
" A git wrpper
Plug 'tpope/vim-fugitive'
" Local vimrc
Plug 'embear/vim-localvimrc'
" Rainbow Parentheses Improved, shorter code, no level limit, smooth and fast, powerful configuration.
Plug 'luochen1990/rainbow'
" This file contains additional syntax highlighting that I use for C++11/14/17 development in Vim. Compared to the standard syntax highlighting for C++ it adds highlighting of (user defined) functions and the containers and types in the standard library / boost.
" Plug 'octol/vim-cpp-enhanced-highlight', { 'for': ['cpp'] }
Plug 'bogado/file-line'
call plug#end()
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
autocmd FileType c,cpp setlocal shiftwidth=4 tabstop=4 softtabstop=4

" always show status bar
set ls=2

" highlighted search results
set hlsearch
" Ignore case
set ignorecase
" syntax highlight on
syntax on
if has('nvim')
autocmd CursorHold * silent call CocActionAsync('highlight')
endif
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

if has('nvim')
" Set color scheme
colo iceberg
endif
let g:lightline = {
    \ 'colorscheme': 'icebergDark',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ,
      \             ['CurrentFunction']],
      \   'right': [ [ 'lineinfo' ],
      \              [ 'percent' ],
      \              [ 'fileformat', 'fileencoding', 'filetype', 'charvaluehex' ] ]
      \ },
      \ 'component': {
      \   'charvaluehex': '0x%B',
      \ },
      \ 'component_function': {
      \   'gitbranch': 'FugitiveHead',
      \   'CurrentFunction': 'CocCurrentFunction'
      \ },
      \ }
function! CocCurrentFunction()
    return get(b:, 'coc_current_function', '')
endfunction
set noshowmode
"let g:airline_theme='icebergDark'
set t_Co=256
" autocompletion of files and commands behaves like shell
" (complete only the common part, list the options that match)
set wildmode=list:longest

" better backup, swap and undos storage
set directory=~/.vim/dirs/tmp     " directory to place swap files in
set backup                        " make backup files
set backupdir=~/.vim/dirs/backups " where to put backup files
set undofile                      " persistent undos - undo after you re-open the file
set undodir=~/.vim/dirs/undos
if has('nvim')
set viminfo+=n~/.nvim/dirs/viminfo
else
set viminfo+=n~/.vim/dirs/viminfo
endif
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

" Let vsplit in right side
set splitright
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

let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-s': 'vsplit' }

if has('nvim-0.4.0')
    let $FZF_DEFAULT_OPTS = '--layout=reverse'
    let g:fzf_layout = { 'window': 'call OpenFloatingWin()' }
    function! OpenFloatingWin()
        let height = &lines - 3
        let width = float2nr(&columns - (&columns * 2 / 10))
        let col = float2nr((&columns - width) / 2)

        let opts = {
                    \ 'relative': 'editor',
                    \ 'row': height * 0.3,
                    \ 'col': col + 30,
                    \ 'width': width * 2 / 3,
                    \ 'height': height / 2
                    \ }

        let buf = nvim_create_buf(v:false, v:true)
        let win = nvim_open_win(buf, v:true, opts)

        " 设置浮动窗口高亮
        call setwinvar(win, '&winhl', 'Normal:Pmenu')

        setlocal
                    \ buftype=nofile
                    \ nobuflisted
                    \ bufhidden=hide
                    \ nonumber
                    \ norelativenumber
                    \ signcolumn=no
    endfunction
endif

" nicer colors ------------------------
highlight DiffAdd           cterm=bold ctermbg=none ctermfg=119
highlight DiffDelete        cterm=bold ctermbg=none ctermfg=167
highlight DiffChange        cterm=bold ctermbg=none ctermfg=227
highlight SignifySignAdd    cterm=bold ctermbg=237  ctermfg=119
highlight SignifySignDelete cterm=bold ctermbg=237  ctermfg=167
highlight SignifySignChange cterm=bold ctermbg=237  ctermfg=227

" Autoformat ---------------------------
let g:formatters_c =['clangformat']
let g:formatters_json=['fixjson'] "Json formater
let g:formatdef_jsbeautify_javascript = "'js-beautify -X -s 2 -j'" " Javascript formater
let g:formatters_python=['black']
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

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

if has('nvim')
" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
inoremap <silent><expr> <TAB>
      \ pumvisible() ? coc#_select_confirm() :
      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction
let g:coc_snippet_next = '<tab>'
set clipboard+=unnamed 
else
" YouCompleteMe ----------------------
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_seed_identifiers_with_syntax=1
let g:ycm_global_ycm_extra_conf = '~/.vim/plugged/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'
let g:ycm_confirm_extra_conf = 0
let g:ycm_filepath_completion_use_working_dir = 1
nnoremap gd :YcmCompleter GoToDeclaration<CR>
nnoremap gi :YcmCompleter GoToDefinition<CR>
nnoremap gy :YcmCompleter GoToDefinitionElseDeclaration<CR>
let g:ycm_enable_diagnostic_signs=0
endif
" vim-gitgutter -----------------------
" Set vim-gitgutter updatetime
set updatetime=1000
if executable("rg")
let g:gitgutter_grep = 'rg'
endif

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
nmap <Leader>gb :Git blame<CR>
nmap <Leader>gd :Git diff %<CR>
nmap <Leader>gl :Git log %<CR>
nmap <Leader>ga :Git add %<CR>

" Commentary --------------------------
autocmd! User vim-commentary unmap gcc
autocmd! User vim-commentary unmap gc
nmap <Leader>c<space> <Plug>CommentaryLine
vmap <Leader>c<space> <Plug>Commentary

" Local vimrc -------------------------
let g:localvimrc_ask = 0
let g:localvimrc_persistent = 2
let g:localvimrc_sandbox = 0

" rainbow
let g:rainbow_active = 1
let g:rainbow_conf = {
\   'guifgs': ['darkorange3', 'seagreen3', 'royalblue3', 'firebrick'],
\   'ctermfgs': ['lightyellow', 'lightcyan','lightblue', 'lightmagenta'],
\   'operators': '_,_',
\   'parentheses': ['start=/(/ end=/)/ fold', 'start=/\[/ end=/\]/ fold', 'start=/{/ end=/}/ fold'],
\   'separately': {
\       '*': {},
\       'tex': {
\           'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/'],
\       },
\       'lisp': {
\           'guifgs': ['darkorange3', 'seagreen3', 'royalblue3', 'firebrick'],
\       },
\       'vim': {
\           'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/', 'start=/{/ end=/}/ fold', 'start=/(/ end=/)/ containedin=vimFuncBody', 'start=/\[/ end=/\]/ containedin=vimFuncBody', 'start=/{/ end=/}/ fold containedin=vimFuncBody'],
\       },
\       'html': {
\           'parentheses': ['start=/\v\<((area|base|br|col|embed|hr|img|input|keygen|link|menuitem|meta|param|source|track|wbr)[ >])@!\z([-_:a-zA-Z0-9]+)(\s+[-_:a-zA-Z0-9]+(\=("[^"]*"|'."'".'[^'."'".']*'."'".'|[^ '."'".'"><=`]*))?)*\>/ end=#</\z1># fold'],
\       },
\       'css': 0,
\   }
\}
