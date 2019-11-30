# Installation and Configuration Guied

## What do you need?
You need to install these packages below:

| Package | Description |
|---|---|
| vim-gtk                       | Vi IMproved - enhanced vi editor - with GTK2 GUI |
| tilix                         | Tiling terminal emulator for GNOME |
| git                           | Fast, scalable, distributed revision control system |
| curl                          | Command line tool for transferring data with URL syntax |
| silversearcher-ag             | Very fast grep-like program, alternative to ack-grep |
| exuberant-ctags               | Build tag file indexes of source code definitions |
| agrep                         | Text search tool with support for approximate patterns |
| unzip                         | De-archiver for .zip files |
| jq                            | Lightweight and flexible command-line JSON processor |
| [yarn](https://yarnpkg.com/)  | Fast, reliable, and secure dependency management |
| [nodejs](https://nodejs.org/) | JavaScript runtime built on [Chrome's V8 JavaScript engine](https://v8.dev) |


## Install Ubuntu packages
```
sudo apt install vim-gtk tilix git curl silversearcher-ag exuberant-ctags unzip jq
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

## Coc.nvim Configuration
Include "suggest.noselect": false on the CocConfig
:CocConfig

{
  "suggest.noselect": false
}

## Removin gVim right and Bottom Borders

To figure out which version of GTK you're using, issue the following command:
```
$ gvim --version | grep GTK
```

In my case I'm making use of GTK 2.

#### gVim with GTK 2

Edit the file **~/.gtkrc-2.0**. Then, append the following to the bottom of the file:
```css
style "vimfix" {
  bg[NORMAL] = "#1C1C1C" # theme background color
}
widget "vim-main-window.*GtkForm" style "vimfix"
```

#### gVim with GTK 3
Edit the file **~/.config/gtk-3.0/gtk.css** and add the following to the bottom of the file:
```
#vim-main-window {
  background-color: #1C1C1C; /*: theme background color */
}
```

Reference: [https://thomashunter.name/](https://thomashunter.name/posts/2019-01-20-removing-gvim-border)


# TODO

* Include images
* Explanation why use **tilix** instead **gnome-terminal**
* Explanation about **coc.nvim** configuration



