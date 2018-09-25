# Vimrc for Python

## Main Installations
The lines to put into your terminal for ensuring you have the requirements are provided below:

```sh
sudo apt-get update
sudo apt-get install vim
sudo apt-get install curl vim exuberant-ctags git ack-grep python-pip python-fontforge terminator zsh zsh-syntax-highlighting zsh-theme-powerlevel9k powerline fonts-powerline golang tree"
sudo pip install pep8 flake8 pyflakes isort yapf
```
## Oh My Zsh, Autosuggestions and Syntax-Highlighting
Then you can install [oh my zsh](https://github.com/robbyrussell/oh-my-zsh), [autosuggestions](https://github.com/zsh-users/zsh-autosuggestions) and [syntax-highlighting](https://github.com/zsh-users/zsh-syntax-highlighting)

```sh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
git clone https://github.com/zsh-users/zsh-autosuggestions.git $ZSH_CUSTOM/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $ZSH_CUSTOM/plugins/zsh-syntax-highlighting
```

nano ~/.zshrc find plugins=(git)
Append zsh-autosuggestions & zsh-syntax-highlighting to plugins() like this
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



