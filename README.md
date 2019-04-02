# My personal .vimrc and some settings.

## Main Installations
These lines to put into your terminal for ensuring you have the requirements are provided below:

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

curl https://raw.githubusercontent.com/lazarocastro/vimrc/master/vimrc -o ~/.vimrc
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



