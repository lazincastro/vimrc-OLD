# Installation and Configuration Guied

## What do you need?
You need to install these packages below:

* vim-gtk\*
* tilix\*\*
* git 
* curl 
* silversearcher-ag 
* exuberant-ctags 
* agrep
* unzip
* [yarn](https://yarnpkg.com/)
* [nodejs](https://nodejs.org/)

> \*
>
> \*\*

## Install Ubuntu packages
```
sudo apt install vim-gtk tilix git curl silversearcher-ag exuberant-ctags unzip
```

## Yarn Install
Follow [ Yarn documentation ]( https://yarnpkg.com/en/docs/install#debian-stable )
```
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
sudo apt update && sudo apt install yarn -y
```

## Nodejs Install
Download the latest [Nodejs LTS Version](https://nodejs.org/), then extract and copy the content to **/usr/local/bin** and create a symbolic link:
```
tar -xf node-v12.13.0-linux-x64.tar.xz
sudo mv node-v12.13.0-linux-x64 /usr/local/bin/
cd /usr/local/bin/
sudo ln -s node-v12.13.0-linux-x64/bin/node node
sudo ln -s node-v12.13.0-linux-x64/bin/npm npm
```

## Configure tilix theme
Create **schemes** folder and download [Thayer Bright Tilix Themes](https://github.com/storm119/Tilix-Themes/blob/master/Themes.md).
```
mkdir -p ~/.config/tilix/schemes
wget -qO $HOME"/.config/tilix/schemes/thayer-bright.json" https://git.io/v7QVZ
```

## Download [vimrc](https://raw.githubusercontent.com/lazarocastro/vimrc/master/vimrc)
```
curl https://raw.githubusercontent.com/lazarocastro/vimrc/master/vimrc -o vimrc
```

## coc.nvim configuration
Include "suggest.noselect": false on the CocConfig
:CocConfig

{
  "suggest.noselect": false
}

# TODO

* Include images
* Explanation why use **tilix** instead **gnome-terminal**
* Explanation about **coc.nvim** configuration



