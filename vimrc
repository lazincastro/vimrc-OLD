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

"---- ---- ---- ---- Plugins From Github and Vim-scripts ---- ---- ----"
call plug#begin('~/.vim/plugged')     " Active Plugins

" Essential Starter Pack Plugins
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --bin' }
Plug 'junegunn/fzf.vim'               " Fuzzy finder
Plug 'mileszs/ack.vim'                " Ack code search (requires ack installed in the system)
Plug 'vim-scripts/grep.vim'           " Integrates the [a, e and f]grep
Plug 'itchyny/lightline.vim'          " A light statusline/tabline plugin
Plug 'airblade/vim-gitgutter'         " Git diff gutter and stages/undoesks
Plug 'machakann/vim-highlightedyank'  " Make the yanked region apparent!
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
Plug 'neoclide/coc.nvim', {'branch': 'release'} " Intellisense engine for Vim8 & Neovim, full language server protocol support as VSCode 
" Plug 'vim-scripts/AutoComplPop'       " Automatically opens popup menu for completions

" Color Schemes
Plug 'NLKNguyen/papercolor-theme'
Plug 'morhetz/gruvbox'                  " Gruvbox colorscheme
Plug 'rakr/vim-one'                     " Light and dark vim colorscheme, shamelessly stolen from atom 
" Plug 'lazarocastro/spacecamp'         " Vim color for the final frontier
" Plug 'dikiaap/minimalist'             " A Material Color Scheme Darker
" Plug 'dracula/vim', {'as': 'dracula'} " 🧛 Dark theme for Vim

" Tim Pope Section
Plug 'tpope/vim-commentary'           " Use 'gcc' to comment out a line
Plug 'tpope/vim-vinegar'              " Simple file browser
Plug 'tpope/vim-surround'             " Quoting/parenthesizing made simple
Plug 'tpope/vim-fugitive'             " A Git wrapper so awesome, it should be illegal

" Languages
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

call plug#end()                       "Vim-plug finished declaring
"---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- -----"

"---- ---- ---- --- Install Plugins The First Time Vim Runs --- ---- ---- ----"
if vim_plug_just_installed
  echo "Installing Bundles, please ignore key map error messages"
  :PlugInstall
endif

"---- ---- ---- ---- Basic Setup ---- ---- ---- ----"
syntax enable
filetype plugin indent on
set encoding=utf-8
set backspace=indent,eol,start    " Make backspace behave like every other editor
set nocompatible                  " no vi-compatible
let mapleader = ','               " The default leader is \
" set nu rnu                        " Activate line number and relative number
set nowrap                        " Disable long line wrap
set expandtab                     " Tabs and Spaces Handling
set tabstop=2                     " Number of space that <TAB>
set softtabstop=2                 " Number of space that <TAB>
set shiftwidth=2                  " Number of space on (auto)ident
set laststatus=2                  " Always Show Status Bar
set noerrorbells visualbell t_vb= " No damn bells
set clipboard=unnamed,unnamedplus " Copy into system (*, +) register
set tags=tags;                    " Look for a tags file in directories
set noshowmode                    " INSERT is unnecessary (see lightline.vim docs)

"---- ---- ---- ---- Searching ---- ---- ---- ----"
set incsearch        " incremental search
set hlsearch         " highlighted search results
set ignorecase       " Ignore case when searching...
set smartcase        " ...unless we type a capital

"---- ---- ---- ---- Scrolling ---- ---- ---- ----"
set scrolloff=8
set sidescrolloff=15
set sidescroll=1
" set mouse=a        " Uncomment if you like to use mouse to select

"---- ---- ---- ---- Tabs & Trailing Spaces ---- ---- ---- ----"
" Toggle listchars
fun! ToggleLC() 
    if &listchars == ''
        set listchars=''
    else
        set listchars=tab:→\ ,eol:↲,nbsp:␣,trail:•,extends:⟩,precedes:⟨
    endif
endfun  
 
" Toggle colorcolumn
fun! ToggleCC() 
    if &cc == ''
        set cc=80
    else
        set cc=
    endif
endfun

" Use ',' + Space to toggle relative number, colorcolumn, listchars and search highlight
nnoremap <silent> <leader><space> :noh<cr>:call ToggleLC()<cr>:call ToggleCC()<cr>:set nu! rnu!<cr>:set nolist!<cr>:GitGutterToggle<cr>

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

"---- ---- ---- ---- Visual Settings ---- ---- ---- ----"
"" On Terminal 
colorscheme PaperColor     " I love it that colorscheme
set bg=dark                " Background used for highlight color
set t_Co=256               " Enable 256 colors in Vim
set cursorline             " Cursor Line
set cursorcolumn           " Cursor Column
set fillchars+=vert:\      " remove ugly vertical lines on window division
"set colorcolumn=80         " Screen columns that are highlight
set foldcolumn=1
hi Comment cterm=italic
if !has("gui_running")
  hi vertsplit ctermfg=bg ctermbg=bg
endif

"" GVim
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
    set guifont=Monospace\ Regular\ 12
endif

"---- ---- ---- ---- Mappings ---- ---- ---- ----"
"" Make it easy to edit the Vimrc file."
nmap <Leader>ev :tabedit ~/.vim/vimrc<cr>

"" Set working directory
nnoremap <leader>. :lcd %:p:h<CR>

" Escape to the NORMAL mode
inoremap jj <esc>

"" terminal emulation
nnoremap <silent> <leader>sh :below terminal<CR>

"" Move visual block
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

"" Search mappings: These will make it so that going to the next one in a
" search will center on the line it's found in.
nnoremap n nzzzv
nnoremap N Nzzzv

"" Tabs
nnoremap <Tab> gt
nnoremap <S-Tab> gT
nnoremap <silent> <S-t> :tabnew<CR>

"" Split
set splitbelow
set splitright
noremap <Leader>h :<C-u>split<CR>
noremap <Leader>v :<C-u>vsplit<CR>

"" Zoom Window
noremap Zz <c-w>_ \| <c-w>\|
noremap Zo <c-w>=

"" Switching windows
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l
noremap <C-h> <C-w>h

"" Open all Buffer in Vertical Split
map <silent> <F9> :tab sball <bar> :tabdo :close <bar> :vert sball<cr>

"" Open all Buffer in Tab
map <silent> <F10> :tab sball<cr>

"" save as sudo
ca w!! w !sudo tee "%"

"---- ---- ---- ---- Plugins Settings ---- ---- ---- ----"
"" vim-go
" disable vim-go :GoDef short cut (gd)
" this is handled by LanguageClient [LC]
let g:go_def_mapping_enabled = 0

"" lightline
let g:lightline = {
      \ 'colorscheme': 'default',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'cocstatus', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'cocstatus': 'coc#status',
      \   'gitbranch': 'FugitiveHead'
      \ },
      \ }


"" vim-gitgutter
let g:gitgutter_enabled = 0
let g:gitgutter_highlight_lines = 1

"" AutoComplPop
" References
" https://www.youtube.com/watch?v=2f8h45YR494
" https://github.com/nickjj/dotfiles
set complete+=kspell
set completeopt=menuone,longest
set shortmess+=c

"" Vinegar
" Initialize with dot files hidden. Press 'gh' to toggle dot file hiding.
let g:netrw_list_hide = '\(^\|\s\s\)\zs\.\S\+'
" Closes it vinegar buffer after opening the file
let g:netrw_fastbrowse = 0
" Specify user's preference for a viewer
let g:netrw_browsex_viewer="setsid xdg-open"

"" grep.vim
nnoremap <silent> <leader>f :Rgrep<CR>
let Grep_Default_Options = '-IR'
let Grep_Skip_Files = '*.log *.db'
let Grep_Skip_Dirs = '.git node_modules'

"" fzf.vim
set wildmode=list:longest,list:full
set wildignore+=*.o,*.obj,.git,*.rbc,*.pyc,__pycache__
let $FZF_DEFAULT_COMMAND =  "find * -path '*/\.*' -prune -o -path 'node_modules/**' -prune -o -path 'target/**' -prune -o -path 'dist/**' -prune -o  -type f -print -o -type l -print 2> /dev/null"

"" The Silver Searcher
if executable('ag')
  let $FZF_DEFAULT_COMMAND = 'ag --hidden --ignore .git -g ""'
  set grepprg=ag\ --nogroup\ --nocolor
endif

"" ripgrep
if executable('rg')
  let $FZF_DEFAULT_COMMAND = 'rg --files --hidden --follow --glob "!.git/*"'
  set grepprg=rg\ --vimgrep
  command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --hidden --follow --glob "!.git/*" --color "always" '.shellescape(<q-args>).'| tr -d "\017"', 1, <bang>0)
endif

cnoremap <C-P> <C-R>=expand("%:p:h") . "/" <CR>
nnoremap <silent> <leader>b :Buffers<CR>
" nnoremap <silent> <leader>e :FZF -m<CR>
nnoremap <silent> <C-p> :FZF -m<CR>

" Recovery commands from history through FZF
nmap <leader>y :History:<CR>

"" Ack.vim
nmap ,r :Ack!<space>
nmap ,wr :execute ":Ack! " . expand('<cword>')<CR>
let g:ackpreview = 1
let g:ackhighlight = 1

"-------------------------------------------------------------------------------
"" coc
" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
" set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
" <cr> could be remapped by other vim plugin, try `:verbose imap <CR>`.
if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of LS, ex: coc-tsserver
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
" set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>
"---------------------coc-Settings-end------------------------------------------

"---- ---- ---- Auto-Commands ---- ---- ---- ----"
" clear empty spaces at the end of lines on save of python files
autocmd BufWritePre *.py :%s/\s\+$//e

" Automatically source the Vimrc file on save
augroup autosourcing
  autocmd!
  autocmd BufWritePost ~/.vim/vimrc source %
augroup END

" Remember cursor position
augroup vimrc-remember-cursor-position
  autocmd!
  autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
augroup END
