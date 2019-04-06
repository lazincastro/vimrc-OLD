# My personal .vimrc and some settings.

## Installation

Use the `install.sh` script:

```sh
bash <(wget -qO- https://raw.githubusercontent.com/lazarocastro/vimrc/master/install.sh)
```

Or **copy** and **paste** these lines into your terminal:

```sh
sudo apt-get update
sudo apt-get install vim # Install if you don't have.
# To work propely, I recomend to you install these programns below:
# OBS.: The first 7 programs are required, the rest of them are cosmetic issue.
sudo apt-get install \
curl \
exuberant-ctags \
git \
ack-grep \
ripgrep \
python-pip \
pylint3 \
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
Then you can install (https://github.com/robbyrussell/oh-my-zsh), (https://github.com/zsh-users/zsh-autosuggestions) and (https://github.com/zsh-users/zsh-syntax-highlighting)

```sh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
git clone https://github.com/zsh-users/zsh-autosuggestions.git $ZSH_CUSTOM/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $ZSH_CUSTOM/plugins/zsh-syntax-highlighting
```

Execute that command `vim +/plugins=\\( ~/.zshrc` to find "plugins=(git)" session and 
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

# List of Plugins used on my `.vimrc`.

| Plugins | Description |
|---|---|
| <a href="https://github.com/jiangmiao/auto-pairs" target="_blank"> auto-pairs</a>                                  | brackets parens quotes in pair | 
| <a href="https://github.com/Yggdroot/indentLine" target="_blank">indentLine</a>                                    | Vertical lines at indentation | 
| <a href="https://github.com/fatih/vim-go" target="_blank"> vim-go</a>                                              | Vim Go Plugin | 
| <a href="https://github.com/MarcWeber/vim-addon-mw-utils" target="_blank"> vim-addon-mw-utils</a>                  | SnipMate dependence | 
| <a href="https://github.com/Shougo/neocomplcache.vim" target="_blank"> neocomplcache.vim</a>                       | Better autocompletion |
| <a href="https://github.com/Townk/vim-autoclose" target="_blank">vim-autoclose</a>                                 | Autoclose |
| <a href="https://github.com/Valloric/MatchTagAlways" target="_blank">MatchTagAlways</a>                            | Always highlight enclosing tags |
| <a href="https://github.com/davidhalter/jedi-vim" target="_blank"> jedi-vim</a>                                    | Python autocompletion |
| <a href="https://github.com/ekalinin/Dockerfile.vim" target="_blank">Dockerfile.vim</a>                            | Dockerfile syntax & snippets |
| <a href="https://github.com/garbas/vim-snipmate" target="_blank">vim-snipmate</a>                                  | SnipMate support snippets |
| <a href="https://github.com/honza/vim-snippets" target="_blank"> vim-snippets</a>                                  | Snippets for many languages. |
| <a href="https://github.com/lilydjwg/colorizer" target="_blank"> colorizer</a>                                     | Paint css colors |
| <a href="https://github.com/majutsushi/tagbar" target="_blank">tagbar</a>                                          | Class / module browser |
| <a href="https://github.com/mattn/emmet-vim" target="_blank">emmet-vim</a>                                         | Zen coding |
| <a href="https://github.com/mhinz/vim-signify" target="_blank">vim-signify</a>                                     | Git diff icons |
| <a href="https://github.com/michaeljsmith/vim-indent-object" target="_blank">vim-indent-object</a>                 | Indent text object |
| <a href="https://github.com/mileszs/ack.vim" target="_blank">ack.vim</a>                                           | Ack code search |
| <a href="https://github.com/morhetz/gruvbox" target="_blank">gruvbox</a>                                           | Gruvbox colorscheme |
| <a href="https://github.com/scrooloose/nerdcommenter" target="_blank"> nerdcommenter</a>                           | Code commenter |
| <a href="https://github.com/scrooloose/nerdtree" target="_blank">nerdtree</a>                                      | Better file browser |
| <a href="https://github.com/scrooloose/syntastic" target="_blank"> syntastic</a>                                   | Languages code checker |
| <a href="https://github.com/tomtom/tlib_vim" target="_blank">tlib_vim</a>                                          | SnipMate dependence |
| <a href="https://github.com/fisadev/FixedTaskList.vim" target="_blank">FixedTaskList.vim</a>                       | Pending tasks list |
| <a href="https://github.com/fisadev/vim-isort" target="_blank">vim-isort</a>                                       | Auto sort python imports |
| <a href="https://github.com/tpope/vim-unimpaired" target="_blank"> vim-unimpaired</a>                              | Pairs of bracket mappings |
| <a href="https://github.com/tpope/vim-surround" target="_blank"> vim-surround</a>                                  | Surround |
| <a href="https://github.com/tpope/vim-vinegar" target="_blank">vim-vinegar</a>                                     | Simple file browser |
| <a href="https://github.com/tpope/vim-fugitive" target="_blank"> vim-fugitive</a>                                  | Git integration |
| <a href="https://github.com/vim-airline/vim-airline" target="_blank">vim-airline</a>                               | Airline |
| <a href="https://github.com/vim-airline/vim-airline-themes" target="_blank"> vim-airline-themes</a>                | Airline themes |
| <a href="https://github.com/vim-scripts/IndexedSearch" target="_blank">IndexedSearch</a>                           | Search results counter |
| <a href="https://github.com/vim-scripts/matchit.zip" target="_blank">matchit.zip</a>                               | XML / HTML tags navigation |
| <a href="https://github.com/junegunn/fzf" target="_blank"> fzf</a>                                                 | Command-line fuzzy finder|
| <a href="https://github.com/junegunn/fzf.vim" target="_blank"> fzf.vim</a>                                         | Fuzzy finder |
| <a href="https://github.com/pignacio/vim-yapf-format" target="_blank"> vim-yapf-format</a>                         | YAPF formatter for Python |


# No longer used.

| Plugins | Description |
|---|---|
| <a href="https://github.com/arielrossanigo/dir-configs-override.vim" target="_blank">dir-configs-override.vim </a> | Override configs by directory |
| <a href="https://github.com/chr4/nginx.vim" target="_blank"> nginx.vim</a>                                         | Improved nginx vim plugin |
| <a href="https://github.com/jeetsukumaran/vim-indentwise" target="_blank"> vim-indentwise</a>                      | Indentation based movements |
| <a href="https://github.com/kien/tabman.vim" target="_blank">tabman.vim</a>                                        | Tab list panel |
| <a href="https://github.com/motemen/git-vim" target="_blank">git-vim</a>                                           | Git integration |
| <a href="https://github.com/rosenfeld/conque-term" target="_blank">conque-term</a>                                 | Consoles as buffers |
| <a href="https://github.com/thiagoalessio/rainbow_levels.vim" target="_blank"> rainbow_levels.vim</a>              | highlights indentation level |
| <a href="https://github.com/fisadev/dragvisuals.vim" target="_blank">dragvisuals.vim</a>                           | Drag visual blocks arround |
| <a href="https://github.com/vim-scripts/YankRing.vim" target="_blank"> YankRing.vim</a>                            | Yank history navigation |
