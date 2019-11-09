# Installation and Configuration Guied

## You'll need this packages
sudo apt install vim-gtk tilix git curl silversearcher-ag exuberant-ctags unzip


## Yarn Install
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
sudo apt update && sudo apt install yarn -y

## Nodejs Install
cd Downloads/
tar -xf node-v12.13.0-linux-x64.tar.xz
sudo mv node-v12.13.0-linux-x64 /usr/local/bin/
cd /usr/local/bin/
sudo ln -s node-v12.13.0-linux-x64/bin/node node
sudo ln -s node-v12.13.0-linux-x64/bin/npm npm

yarn --version
npm --version
node --version

vim .vimrc

## Configure tilix theme
mkdir -p ~/.config/tilix/schemes
Go to the [tilix themes](https://github.com/storm119/Tilix-Themes/blob/master/Themes.md) and search for "Thayer Bright"
wget -qO $HOME"/.config/tilix/schemes/thayer-bright.json" https://git.io/v7QVZ

## coc.nvim configuration
Include "suggest.noselect": false on the CocConfig
:CocConfig

{
  "suggest.noselect": false
}

