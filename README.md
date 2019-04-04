# My personal .vimrc and some settings.

## Installation

Use the **install.sh** script:

```sh
bash <(wget -qO- https://raw.githubusercontent.com/lazarocastro/vimrc/master/install.sh)
```

Or **copy** and **paste** these lines into your terminal:

```sh
sudo apt-get update
sudo apt-get install vim # Install if you don't have.
# To work propely, I recomend to you install these programns below:
# OBS.: The first 6 programs are required, the rest of them are cosmetic issue.
sudo apt-get install \
curl \
exuberant-ctags \
git \
ack-grep \
ripgrep \
python-pip \
tree \
terminator \
python-fontforge \
zsh \
zsh-syntax-highlighting \
zsh-theme-powerlevel9k \
powerline \
fonts-powerline
# You'll need of these to work with python scripts/programns.
sudo pip install pep8 flake8 pyflakes isort yapf
# Download vimrc
curl https://raw.githubusercontent.com/lazarocastro/vimrc/master/vimrc -o ~/.vimrc
vim +qa
clear
```

# Installation and Configuration of Oh My Zsh
## Oh My Zsh, Autosuggestions and Syntax-Highlighting
Then you can install [oh my zsh](https://github.com/robbyrussell/oh-my-zsh), [autosuggestions](https://github.com/zsh-users/zsh-autosuggestions) and [syntax-highlighting](https://github.com/zsh-users/zsh-syntax-highlighting)

```sh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
git clone https://github.com/zsh-users/zsh-autosuggestions.git $ZSH_CUSTOM/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $ZSH_CUSTOM/plugins/zsh-syntax-highlighting
```

Execute that command "**vim +/plugins=\\( ~/.zshrc**" to find "plugins=(git)" session and 
append **zsh-autosuggestions** & **zsh-syntax-highlighting** to plugins() like that:
```
plugins=(git zsh-autosuggestions zsh-syntax-highlighting)
```

## Powerline Fonts
You can copy and paste these commands to your terminal. Comments are fine too.
```
# clone
git clone https://github.com/powerline/fonts.git --depth=1
# install
cd fonts
./install.sh
# clean-up a bit
cd ..
rm -rf fonts
```
## If you had a trouble to donfigure I recommend to access the link below:
[How can I install and use powerline plugin?](https://askubuntu.com/questions/283908/how-can-i-install-and-use-powerline-plugin)

# List of Plugins use on my Vim.

| Plugins | Description |
|---|---|
| [auto-pairs](https://github.com/jiangmiao/auto-pairs) | brackets parens quotes in pair | 
| [indentLine](https://github.com/Yggdroot/indentLine) | Vertical lines at indentation | 
| [vim-go](https://github.com/fatih/vim-go) | Vim Go Plugin | 
| [vim-addon-mw-utils](https://github.com/MarcWeber/vim-addon-mw-utils) | SnipMate dependence | 
| [neocomplcache.vim](https://github.com/Shougo/neocomplcache.vim) | Better autocompletion |
| [vim-autoclose](https://github.com/Townk/vim-autoclose) | Autoclose |
| [MatchTagAlways](https://github.com/Valloric/MatchTagAlways) | Always highlight enclosing tags |
| [dir-configs-override.vim ](https://github.com/arielrossanigo/dir-configs-override.vim ) | Override configs by directory |
| [nginx.vim](https://github.com/chr4/nginx.vim) | Improved nginx vim plugin |
| [jedi-vim](https://github.com/davidhalter/jedi-vim) | Python autocompletion |
| [Dockerfile.vim](https://github.com/ekalinin/Dockerfile.vim) | Dockerfile syntax & snippets |
| [vim-snipmate](https://github.com/garbas/vim-snipmate) | SnipMate support snippets |
| [vim-snippets](https://github.com/honza/vim-snippets) | Snippets for many languages. |
| [vim-indentwise](https://github.com/jeetsukumaran/vim-indentwise) | Indentation based movements |
| [tabman.vim](https://github.com/kien/tabman.vim) | Tab list panel |
| [colorizer](https://github.com/lilydjwg/colorizer) | Paint css colors |
| [tagbar](https://github.com/majutsushi/tagbar) | Class / module browser |
| [emmet-vim](https://github.com/mattn/emmet-vim) | Zen coding |
| [vim-signify](https://github.com/mhinz/vim-signify) | Git diff icons |
| [vim-indent-object](https://github.com/michaeljsmith/vim-indent-object) | Indent text object |
| [ack.vim](https://github.com/mileszs/ack.vim) | Ack code search |
| [gruvbox](https://github.com/morhetz/gruvbox) | Gruvbox colorscheme |
| [git-vim](https://github.com/motemen/git-vim) | Git integration |
| [conque-term](https://github.com/rosenfeld/conque-term) | Consoles as buffers |
| [nerdcommenter](https://github.com/scrooloose/nerdcommenter) | Code commenter |
| [nerdtree](https://github.com/scrooloose/nerdtree) | Better file browser |
| [syntastic](https://github.com/scrooloose/syntastic) | Languages code checker |
| [rainbow_levels.vim](https://github.com/thiagoalessio/rainbow_levels.vim) | highlights indentation level |
| [tlib_vim](https://github.com/tomtom/tlib_vim) | SnipMate dependence |
| [FixedTaskList.vim](https://github.com/fisadev/FixedTaskList.vim) | Pending tasks list |
| [dragvisuals.vim](https://github.com/fisadev/dragvisuals.vim) | Drag visual blocks arround |
| [vim-isort](https://github.com/fisadev/vim-isort) | Auto sort python imports |
| [vim-unimpaired](https://github.com/tpope/vim-unimpaired) | Pairs of bracket mappings |
| [vim-surround](https://github.com/tpope/vim-surround) | Surround |
| [vim-vinegar](https://github.com/tpope/vim-vinegar) | Simple file browser |
| [vim-fugitive](https://github.com/tpope/vim-fugitive) | Git integration |
| [vim-airline](https://github.com/vim-airline/vim-airline) | Airline |
| [vim-airline-themes](https://github.com/vim-airline/vim-airline-themes) | Airline themes |
| [IndexedSearch](https://github.com/vim-scripts/IndexedSearch) | Search results counter |
| [YankRing.vim](https://github.com/vim-scripts/YankRing.vim) | Yank history navigation |
| [matchit.zip](https://github.com/vim-scripts/matchit.zip) | XML / HTML tags navigation |
| [fzf](https://github.com/junegunn/fzf) |command-line fuzzy finder|
| [fzf.vim](https://github.com/junegunn/fzf.vim) | Fuzzy finder |
| [vim-yapf-format](https://github.com/pignacio/vim-yapf-format) | YAPF formatter for Python |


