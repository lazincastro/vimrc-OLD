" ==================================== " Lazaro's .vimrc config 2019      "
" http://github.com/lazarocastro/vimrc "
" ==================================== "

"---- ---- ---- ---- ---- ---- Vim-Plug Initialization ---- ---- ---- ---- ---"
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
" Manually Load Vim-Plug The First Time
if vim_plug_just_installed
    :execute 'source '.fnameescape(vim_plug_path)
endif
" Obscure hacks done, you can now modify the rest of the .vimrc as you wish :)
"---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- --"

"---- ---- ---- ---- Plugins From Github and Vim-scripts ---- ---- ----"
call plug#begin('~/.vim/plugged')     " Active Plugins
" Essential Starter Pack Plugins
Plug 'jaredgorski/spacecamp'          " Vim color for the final frontier
Plug 'tpope/vim-commentary'           " Use 'gcc' to comment out a line
Plug 'tpope/vim-vinegar'              " Simple file browser
Plug 'vim-scripts/grep.vim'           " Integrates the grep, fgrep, egrep, and agrep
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --bin' }
Plug 'junegunn/fzf.vim'               " Fuzzy finder
Plug 'itchyny/lightline.vim'          " A light and configurable statusline/tabline plugin
Plug 'airblade/vim-gitgutter'         " A Vim plugin which shows a git diff in the gutter and stages/undoesks

" " Color Schemes
" Plug 'dikiaap/minimalist'             " A Material Color Scheme Darker
" Plug 'morhetz/gruvbox'                " Gruvbox colorscheme

" " HTML&CSS Section
" Plug 'Valloric/MatchTagAlways'        " Highlights the enclosing html/xml tags
" Plug 'mattn/emmet-vim'                " The essential toolkit for web-developers
" Plug 'ap/vim-css-color'               " Preview colours in source code while editign
" Plug 'jiangmiao/auto-pairs'           " Brackets, parentheses and quotes in pair

" " Javascript Section
" Plug 'HerringtonDarkholme/yats.vim'   " The most advanced TypeScript Syntax Highlighting in Vim
" Plug 'pangloss/vim-javascript'        " Vastly improved Javascript indentation and syntax support
" Plug 'mxw/vim-jsx'                    " React JSX syntax highlight and indenting

" " Tim Pope Section
" Plug 'tpope/vim-rails'                " Ruby on Rails power tools
" Plug 'tpope/vim-endwise'              " Add 'end' in ruby endfunction/endif/more
" Plug 'tpope/vim-surround'             " Quoting/parenthesizing made simple
" Plug 'tpope/vim-fugitive'             " A Git wrapper so awesome, it should be illegal

" " Snippets Section
" Plug 'MarcWeber/vim-addon-mw-utils'   " SnipMate dependence
" Plug 'tomtom/tlib_vim'                " SnipMate dependence
" Plug 'garbas/vim-snipmate'            " Some of TextMate's snippets
" Plug 'honza/vim-snippets'             " Vim-snipmate default snippets 

" " Syntax Section
" Plug 'sheerun/vim-polyglot'           " A solid language pack
" Plug 'dense-analysis/ale'             " Check syntax in Vim asynchronously and fix files, with Language Server Protocol (LSP)

" " Autocomplete section
" Plug 'neoclide/coc.nvim', {'branch': 'release'}
" let g:coc_global_extensions = [
"                     \ 'coc-json',
"                     \ 'coc-tsserver',
"                     \ 'coc-emmet',
"                     \ 'coc-tslint',
"                     \ 'coc-prettier',
"                     \ 'coc-snippets',
"                     \ 'coc-html',
"                     \ 'coc-css'
"                     \ ]
call plug#end()                       "Vim-plug finished declaring
"---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- -----"

"---- ---- ---- ---- Install Plugins The First Time Vim Runs ---- ---- ---- ----"
if vim_plug_just_installed
  echo "Installing Bundles, please ignore key map error messages"
  :PlugInstall
endif

"---- ---- ---- ---- Basic Setup ---- ---- ---- ----"
syntax on
filetype plugin indent on
let mapleader = ','               " The default leader is \
set nu rnu                        " Activate line number and relative number
set nowrap                        " Disable long line wrap
set laststatus=2                  " Always Show Status Bar
set tabstop=2                     " Number of space that <TAB>
set shiftwidth=2                  " Number of space on (auto)ident
set softtabstop=2                 " Number of space that <TAB>
set expandtab                     " Tabs and Spaces Handling
set noerrorbells visualbell t_vb= " No damn bells
set clipboard=unnamed,unnamedplus " Copy into system (*, +) register
set tags=tags;                    " Look for a tags file in directories
set noshowmode                    " INSERT is unnecessary anymore because the mode information is displayed in the statusline
" set foldmethod=indent
set title
set titleold="Terminal"
set titlestring=%F

"---- ---- ---- ---- Searching ---- ---- ---- ----"
set incsearch        " incremental search
set hlsearch         " highlighted search results
set ignorecase       " Ignore case when searching...
set smartcase        " ...unless we type a capital

"---- ---- ---- ---- Scrolling ---- ---- ---- ----"
set scrolloff=8
set sidescrolloff=15
set sidescroll=1
set mouse=a

"---- ---- ---- ---- Visual Settings ---- ---- ---- ----"
" On Terminal 
colorscheme spacecamp_lite   " I love it that colorscheme
set bg=dark                  " Background used for highlight color
set t_Co=256                 " Enable 256 colors in Vim
set cursorline               " Cursor Line
set cursorcolumn             " Cursor Column
" set colorcolumn=80           " Screen columns that are highlight
hi Comment cterm=italic
hi vertsplit ctermfg=bg ctermbg=bg

" GVim
set guioptions-=m   " Disable menu bar
set guioptions-=T   " Disable toolbar
set guioptions-=l   " Disable left-hand scrollbar
set guioptions-=L   " Disable left-hand scrollbar vertically
set guioptions-=r   " Disable right-hand scrollbar
set guioptions-=R   " Disable right-hand scrollbar vertically
set guioptions-=e   " Disable gui tabs
hi vertsplit guifg=bg guibg=bg
if has("autocmd") && has("gui")
    au GUIEnter * set vb t_vb=
endif

" Lightline.vim
let g:lightline = {
      \ 'colorscheme': 'default',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'fugitive#head'
      \ },
      \ }
"---- ---- ---- ---- Tabs & Trailing Spaces ---- ---- ---- ----"
set list listchars=tab:→\ ,eol:↲,nbsp:␣,trail:•,extends:⟩,precedes:⟨

"---- ---- ---- ---- Better Backup, Swap and Undos Storage ---- ---- ---- ----"
set directory=~/.vim/dirs/tmp               " directory to place swap files in
set backup                                  " make backup files
set backupdir=~/.vim/dirs/backups           " where to put backup files
set undofile                                " persistent undos
set undodir=~/.vim/dirs/undos               " undo after you re-open the file
set viminfo+=n~/.vim/dirs/viminfo
let g:yankring_history_dir = '~/.vim/dirs/' " store yankring history file

" Create Needed Directories if They Don't Exist
if !isdirectory(&backupdir)
  call mkdir(&backupdir, "p")
endif
if !isdirectory(&directory)
  call mkdir(&directory, "p")
endif
if !isdirectory(&undodir)
  call mkdir(&undodir, "p")
endif

"---- ---- ---- ---- Mappings ---- ---- ---- ----"
" Insert ';' to the end on line
inoremap <leader>; <C-o>A;

" Insert ',' to the end on line
inoremap <leader>, <C-o>A,

" Search mappings: These will make it so that going to the next one in a
" search will center on the line it's found in.
nnoremap n nzzzv
nnoremap N Nzzzv

"" Zoom Window
noremap Zz <c-w>_ \| <c-w>\|
noremap Zo <c-w>=

"" terminal emulation
nnoremap <silent> <leader>sh :below terminal<CR>

"" Move visual block
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

"" Tabs
nnoremap <Tab> gt
nnoremap <S-Tab> gT
nnoremap <silent> <S-t> :tabnew<CR>

"" Split
set splitbelow
set splitright
noremap <Leader>h :<C-u>split<CR>
noremap <Leader>v :<C-u>vsplit<CR>

"" Switching windows
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l
noremap <C-h> <C-w>h

"" Git
noremap <Leader>ga :Gwrite<CR>
noremap <Leader>gc :Gcommit<CR>
noremap <Leader>gsh :Gpush<CR>
noremap <Leader>gll :Gpull<CR>
noremap <Leader>gs :Gstatus<CR>
noremap <Leader>gb :Gblame<CR>
noremap <Leader>gd :Gvdiff<CR>
noremap <Leader>gr :Gremove<CR>

"" Abbreviations
cnoreabbrev W! w!
cnoreabbrev Q! q!
cnoreabbrev Qall! qall!
cnoreabbrev Wq wq
cnoreabbrev Wa wa
cnoreabbrev wQ wq
cnoreabbrev WQ wq
cnoreabbrev W w
cnoreabbrev Q q
cnoreabbrev Qall qall

"" terminal emulation
nnoremap <silent> <leader>sh :below terminal<CR>

"" Open all Buffer in Vertical Split
map <silent> <F9> :tab sball <bar> :tabdo :close <bar> :vert sball<cr>

"" Open all Buffer in Tab
map <F10> :tab sball<cr>

"" Make it easy to edit the Vimrc file."
nmap <Leader>ev :tabedit ~/.vimrc<cr>

"" Close vimrc buffer when you quit the file
autocmd! FileType vim :cnoreabbrev <buffer> q bw

"" Escape to the NORMAL mode
inoremap jj <esc>

"" Clean search (highlight), tabs and traling spaces
nnoremap <silent> <leader><space> :noh<cr>:set nolist!<cr>

"" Set working directory
nnoremap <leader>. :lcd %:p:h<CR>

"---- ---- ---- ---- Plugins Settings ---- ---- ---- ----"
" Vinegar
" Initialize with dot files hidden. Press 'gh' to toggle dot file hiding.
let g:netrw_list_hide = '\(^\|\s\s\)\zs\.\S\+'
" Closes it vinegar buffer after opening the file
let g:netrw_fastbrowse = 0

" grep.vim
nnoremap <silent> <leader>f :Rgrep<CR>
let Grep_Default_Options = '-IR'
let Grep_Skip_Files = '*.log *.db'
let Grep_Skip_Dirs = '.git node_modules'

"" fzf.vim
set wildmode=list:longest,list:full
set wildignore+=*.o,*.obj,.git,*.rbc,*.pyc,__pycache__
let $FZF_DEFAULT_COMMAND =  "find * -path '*/\.*' -prune -o -path 'node_modules/**' -prune -o -path 'target/**' -prune -o -path 'dist/**' -prune -o  -type f -print -o -type l -print 2> /dev/null"

" The Silver Searcher
if executable('ag')
  let $FZF_DEFAULT_COMMAND = 'ag --hidden --ignore .git -g ""'
  set grepprg=ag\ --nogroup\ --nocolor
endif

" ripgrep
if executable('rg')
  let $FZF_DEFAULT_COMMAND = 'rg --files --hidden --follow --glob "!.git/*"'
  set grepprg=rg\ --vimgrep
  command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --hidden --follow --glob "!.git/*" --color "always" '.shellescape(<q-args>).'| tr -d "\017"', 1, <bang>0)
endif

cnoremap <C-P> <C-R>=expand("%:p:h") . "/" <CR>
nnoremap <silent> <leader>b :Buffers<CR>
nnoremap <silent> <leader>e :FZF -m<CR>

"Recovery commands from history through FZF
nmap <leader>y :History:<CR>

"---- ---- ---- Auto-Commands ---- ---- ---- ----"
""Automatically source the Vimrc file on save
augroup autosourcing
  autocmd!
  autocmd BufWritePost .vimrc source %
augroup END

"" Remember cursor position
augroup vimrc-remember-cursor-position
  autocmd!
  autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
augroup END

set autoread
