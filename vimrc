" ==================================== "
" Lazaro's .vimrc config 2019          "
" http://github.com/lazarocastro/vimrc "
" ==================================== "

"-------------Vim-Plug Initialization-------------"
" Avoid modify this section, unless you are very sure of what you are doing
let vim_plug_just_installed = 0
let vim_plug_path = expand('~/.vim/autoload/plug.vim')
if !filereadable(vim_plug_path)
    echo "Installing Vim-plug..."
    echo ""
    silent !mkdir -p ~/.vim/autoload
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    let vim_plug_just_installed = 1
endif

"-------------Manually Load Vim-Plug The First Time-------------"
if vim_plug_just_installed
    :execute 'source '.fnameescape(vim_plug_path)
endif
" Obscure hacks done, you can now modify the rest of the .vimrc as you wish :)

"-------------Plugins From Github and Vim-scripts Repos-------------"
call plug#begin('~/.vim/plugged')               "Active Plugins
Plug 'fatih/vim-go'                             "Vim Go Plugin
Plug 'MarcWeber/vim-addon-mw-utils'             "SnipMate dependence
Plug 'Shougo/neocomplcache.vim'                 "Better autocompletion
Plug 'Townk/vim-autoclose'                      "Autoclose
Plug 'Valloric/MatchTagAlways'                  "Always highlight enclosing tags
Plug 'arielrossanigo/dir-configs-override.vim'  "Override configs by directory
Plug 'chr4/nginx.vim'                           "Improved nginx vim plugin
Plug 'ctrlpvim/ctrlp.vim'                       "Code and files fuzzy finder
Plug 'davidhalter/jedi-vim'                     "Python autocompletion, go to definition.
Plug 'ekalinin/Dockerfile.vim'                  "Dockerfile syntax file & snippets
Plug 'fisadev/FixedTaskList.vim'                "Pending tasks list
Plug 'fisadev/dragvisuals.vim'                  "Drag visual blocks arround
Plug 'fisadev/vim-ctrlp-cmdpalette'             "Extension to ctrlp, for fuzzy command finder
Plug 'fisadev/vim-isort'                        "Automatically sort python imports
Plug 'garbas/vim-snipmate'                      "SnipMate aims to provide support for textual snippets
Plug 'honza/vim-snippets'                       "Snippets files for various programming languages.
Plug 'jeetsukumaran/vim-indentwise'             "Indentation based movements
Plug 'kien/tabman.vim'                          "Tab list panel
Plug 'lilydjwg/colorizer'                       "Paint css colors with the real color
Plug 'majutsushi/tagbar'                        "Class/module browser
Plug 'mattn/emmet-vim'                          "Zen coding
Plug 'mhinz/vim-signify'                        "Git/mercurial/others diff icons of the file lines
Plug 'michaeljsmith/vim-indent-object'          "Indent text object
Plug 'mileszs/ack.vim'                          "Ack code search (requires ack was installed in the OS)
Plug 'morhetz/gruvbox'                          "Gruvbox colorscheme
Plug 'motemen/git-vim'                          "Git integration
Plug 'rosenfeld/conque-term'                    "Consoles as buffers
Plug 'scrooloose/nerdcommenter'                 "Code commenter
Plug 'scrooloose/nerdtree'                      "Better file browser
Plug 'scrooloose/syntastic'                     "Python and other languages code checker
Plug 'thiagoalessio/rainbow_levels.vim'         "highlights code by indentation level
Plug 'tomtom/tlib_vim'                          "SnipMate dependence
Plug 'tpope/vim-surround'                       "Surround
Plug 'tpope/vim-vinegar'                        "Simple file browser
Plug 'vim-airline/vim-airline'                  "Airline
Plug 'vim-airline/vim-airline-themes'           "Airline themes
Plug 'vim-scripts/IndexedSearch'                "Search results counter
Plug 'vim-scripts/YankRing.vim'                 "Yank history navigation
Plug 'vim-scripts/matchit.zip'                  "XML/HTML tags navigation
if has('python')
    Plug 'pignacio/vim-yapf-format'             "YAPF formatter for Python
endif
call plug#end()                                 "Tell vim-plug we finished declaring plugins

"-------------Install Plugins The First Time Vim Runs-------------"
if vim_plug_just_installed
    echo "Installing Bundles, please ignore key map error messages"
    :PlugInstall
endif

"-------------Basic Settings-------------"
"This makes vim act like all other editors, buffers can exist in the background without being in a
"window. http://items.sjbach.com/319/configuring-vim-right
set nocompatible                "We want the latest Vim settings/options.
syntax enable                   "Syntax Highlight On
filetype plugin indent on       "Allow Plugins By File Type (required for plugins!)
set backspace=indent,eol,start  "Make backspace behave like every other editor.
let mapleader = ','             "The default leader is \, but a comma is much better.
set hidden                      "Allow Vim to manage multiple buffers effectively
set number                      "Let's activate line numbers.
set relativenumber              "Show Relative Numbers
set laststatus=2                "Always Show Status Bar
set tabstop=2                   "Number of space that <TAB>
set shiftwidth=2                "Number of space on (auto)ident
set softtabstop=2               "Number of space that <TAB>
set expandtab                   "Tabs and Spaces Handling
set nowrap                      "Disable long line wrap
set title                       "Let vim set the title

"-------------Search-------------"
set incsearch           "incremental search
set hlsearch            "highlighted search results
set ignorecase          "Ignore case when searching...
set smartcase           " ...unless we type a capital

"-------------Tab Length Exceptions On Some File Types-------------"
autocmd FileType python,doctest set ai ts=4 sw=4 sts=4 et
autocmd FileType html setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType html syntax sync fromstart
autocmd FileType htmldjango setlocal shiftwidth=4 tabstop=4 softtabstop=4
autocmd FileType javascript setlocal shiftwidth=4 tabstop=4 softtabstop=4
autocmd FileType shellscript setlocal shiftwidth=4 tabstop=4 softtabstop=4
autocmd FileType yaml setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType ruby setlocal shiftwidth=2 tabstop=2 softtabstop=2

"-------------Better Backup, Swap and Undos Storage-------------"
set directory=~/.vim/dirs/tmp               "directory to place swap files in
set backup                                  "make backup files
set backupdir=~/.vim/dirs/backups           "where to put backup files
set undofile                                "persistent undos
set undodir=~/.vim/dirs/undos               "undo after you re-open the file
set viminfo+=n~/.vim/dirs/viminfo
let g:yankring_history_dir = '~/.vim/dirs/' "store yankring history file

"-------------Create Needed Directories if They Don't Exist-------------"
if !isdirectory(&backupdir)
    call mkdir(&backupdir, "p")
endif
if !isdirectory(&directory)
    call mkdir(&directory, "p")
endif
if !isdirectory(&undodir)
    call mkdir(&undodir, "p")
endif

"-------------Visuals-------------"
colorscheme gruvbox
set bg=dark           "background used for highlight color
set t_Co=256          "Enable 256 colors in Vim
set guioptions-=l     "Disable left-hand scrollbar
set guioptions-=L     "Disable left-hand scrollbar vertically
set guioptions-=r     "Disable right-hand scrollbar
set guioptions-=R     "Disable right-hand scrollbar vertically
set cursorline        "Cursor Line
set cursorcolumn      "Cursor Column
set colorcolumn=100   "Screen columns that are highlight

"-------------Tabs & Trailing Spaces-------------"
"set showbreak=↪\
set list listchars=tab:→\ ,eol:↲,nbsp:␣,trail:•,extends:⟩,precedes:⟨
"set listchars=tab:>-,trail:·,eol:$
"set list listchars=tab:»·,trail:·,eol:$
nmap <silent> <leader>s :set nolist!<CR>

"-------------Airline-------------"
let g:airline_powerline_fonts = 0
let g:airline_theme = 'gruvbox'
let g:airline#extensions#whitespace#enabled = 0
if !exists('g:airline_symbols')
   let g:airline_symbols = {}
endif
let g:airline_left_sep = '⮀'
let g:airline_left_alt_sep = '⮁'
let g:airline_right_sep = '⮂'
let g:airline_symbols.branch = '⭠'
let g:airline_symbols.readonly = '⭤'
let g:airline_symbols.linenr = '⭡'

"-------------Aliases-------------"
cab W w
cab Q q
cab Wq wq
cab wQ wq
cab WQ wq
cab t tab drop
cab T tab drop
cab tabe tab drop
cab Tabe tab drop
cab E e

"-------------Scrolling-------------"
set scrolloff=8 
set sidescrolloff=15
set sidescroll=1
set mouse=a

"-------------GVim-------------"
set guioptions-=m   "Disable menu bar
set guioptions-=T   "Disable toolbar
set guioptions-=r   "Disable right-hand scroll bar
set guioptions-=L   "Disable left-hand scroll bar
set guioptions-=e   "Disable gui tabs

"-------------Split Management-------------"
set splitbelow
set splitright
nmap <C-J> <C-W><C-J>
nmap <C-K> <C-W><C-K>
nmap <C-H> <C-W><C-H>
nmap <C-L> <C-W><C-L>

"-------------Mappings-------------"
"Open all Buffer in Tab
map <F10> :tab sball<cr>
"Make it easy to edit the Vimrc file."
nmap <Leader>ev :tabedit ~/.vimrc<cr>
"Add simple highlight removal.
nmap <leader><space> :nohlsearch<cr>
"Make NERDTree easier to toggle.
nmap <F3> :NERDTreeToggle<cr>
let NERDTreeHijackNetrw = 0
"Save As Sudo
ca w!! w !sudo tee "%"

"-------------Auto-Commands-------------"
"Automatically source the Vimrc file on save."
augroup autosourcing
  autocmd!
  autocmd BufWritePost .vimrc source %
augroup END

"-------------Jenkinsfile VIM syntax highlighting-------------"
au BufNewFile,BufRead Jenkinsfile setf groovy

"-------------MatchTagAlways-------------"
"This option holds all the filetypes for which this plugin will try to find and highlight enclosing
"tags. You can find out what the current file's filetype is in Vim with :set ft?. Don't forget that
"question mark at the end!
let g:mta_filetypes = {
    \ 'html' : 1,
    \ 'xhtml' : 1,
    \ 'xml' : 1,
    \ 'jinja' : 1,
    \ 'php' : 1,
    \}
"Jumps to the enclosing tag if the tag is visible.
nnoremap <leader>% :MtaJumpToOtherTag<cr>

"-------------NeoComplCache-------------"
"most of them not documented because I'm not sure how they work (docs aren't good, had to do a lot
"of trial and error to make it play nice)
let g:neocomplcache_enable_at_startup = 1
let g:neocomplcache_enable_ignore_case = 1
let g:neocomplcache_enable_smart_case = 1
let g:neocomplcache_enable_auto_select = 1
let g:neocomplcache_enable_fuzzy_completion = 1
let g:neocomplcache_enable_camel_case_completion = 1
let g:neocomplcache_enable_underbar_completion = 1
let g:neocomplcache_fuzzy_completion_start_length = 1
let g:neocomplcache_auto_completion_start_length = 1
let g:neocomplcache_manual_completion_start_length = 1
let g:neocomplcache_min_keyword_length = 1
let g:neocomplcache_min_syntax_length = 1
"complete with workds from any opened file
let g:neocomplcache_same_filetype_lists = {}
let g:neocomplcache_same_filetype_lists._ = '_'

"-------------Tasklist-------------"
"show pending tasks list
map <F2> :TaskList<CR>

"-------------Tagbar-------------"
"toggle tagbar display
map <F4> :TagbarToggle<CR>
"autofocus on tagbar open
let g:tagbar_autofocus = 1

"-------------Autocompletion-------------"
"Files and Commands Behaves Like Shell (complete only the common part, list the options that match)
set wildmode=list:longest

"-------------Simple Recursive Grep-------------"
nmap ,r :Ack<space>
nmap ,wr :Ack <cword><CR>

"-------------CtrlP-------------"
"file finder mapping
let g:ctrlp_map = ',e'
"tags (symbols) in current file finder mapping
nmap ,g :CtrlPBufTag<CR>
"tags (symbols) in all files finder mapping
nmap ,G :CtrlPBufTagAll<CR>
"general code finder in all files mapping
nmap ,f :CtrlPLine<CR>
"recent files finder mapping
nmap ,m :CtrlPMRUFiles<CR>
"commands finder mapping
nmap ,c :CtrlPCmdPalette<CR>
"to be able to call CtrlP with default search text
function! CtrlPWithSearchText(search_text, ctrlp_command_end)
    execute ':CtrlP' . a:ctrlp_command_end
    call feedkeys(a:search_text)
endfunction
"Open search on a new tab
"let g:ctrlp_prompt_mappings = {
"    \ 'AcceptSelection("e")': ['<2-LeftMouse>'],
"    \ 'AcceptSelection("t")': ['<cr>'],
"    \ }
"same as previous mappings, but calling with current word as default text
nmap ,wg :call CtrlPWithSearchText(expand('<cword>'), 'BufTag')<CR>
nmap ,wG :call CtrlPWithSearchText(expand('<cword>'), 'BufTagAll')<CR>
nmap ,wf :call CtrlPWithSearchText(expand('<cword>'), 'Line')<CR>
nmap ,we :call CtrlPWithSearchText(expand('<cword>'), '')<CR>
nmap ,pe :call CtrlPWithSearchText(expand('<cfile>'), '')<CR>
nmap ,wm :call CtrlPWithSearchText(expand('<cword>'), 'MRUFiles')<CR>
nmap ,wc :call CtrlPWithSearchText(expand('<cword>'), 'CmdPalette')<CR>
"don't change working directory
let g:ctrlp_working_path_mode = 0
"ignore these files and folders on file finder
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/](\.git|\.hg|\.svn|node_modules)$',
  \ 'file': '\.pyc$\|\.pyo$',
  \ }

"-------------Syntastic-------------"
"show list of errors and warnings on the current file
"nmap <leader>e :Errors<CR>
"check also when just opened the file
let g:syntastic_check_on_open = 1
"don't put icons on the sign column (it hides the vcs status icons of signify)
let g:syntastic_enable_signs = 0
"custom icons (enable them if you use a patched font, and enable the previous setting)
let g:syntastic_error_symbol = '✗'
let g:syntastic_warning_symbol = '⚠'
let g:syntastic_style_error_symbol = '✗'
let g:syntastic_style_warning_symbol = '⚠'

"-------------Jedi-Vim-------------"
let g:jedi#goto_command = ',d'
"Find ocurrences
let g:jedi#usages_command = ',o'
"Find assignments
let g:jedi#goto_assignments_command = ',a'
"Go to definition in new tab
nmap ,D :tab split<CR>:call jedi#goto()<CR>

"-------------Signify-------------"
"This first setting decides in which order try to guess your current vcs UPDATE it to reflect your
"preferences, it will speed up opening files
let g:signify_vcs_list = [ 'git', 'hg' ]
"mappings to jump to changed blocks
nmap <leader>sn <plug>(signify-next-hunk)
nmap <leader>sp <plug>(signify-prev-hunk)
"nicer colors
highlight DiffAdd           cterm=bold ctermbg=none ctermfg=119
highlight DiffDelete        cterm=bold ctermbg=none ctermfg=167
highlight DiffChange        cterm=bold ctermbg=none ctermfg=227
highlight SignifySignAdd    cterm=bold ctermbg=237  ctermfg=119
highlight SignifySignDelete cterm=bold ctermbg=237  ctermfg=167
highlight SignifySignChange cterm=bold ctermbg=237  ctermfg=227
