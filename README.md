# Installation and Configuration Guied
This is my personal **vimrc** configuration, below you'll have instructions to install and configure for the correct way.

## Straight to The Point
```
sudo apt install vim-gtk tilix git curl silversearcher-ag exuberant-ctags agrep unzip jq  ack-grep python3-pip
sudo pip3 install pynvim flake8 pylint isort
git clone https://github.com/lazarocastro/vimrc.git ~/.vim
```

## What did you install?
Descriptions of packages installed:

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
| ack-grep                      | Grep-like text findes |
| python3-pip                   | A tool for installing and managing Python packages |

## Below, I show you how I use my **Vim** setting on terminal, and some issues about **Gvim**.

## I prefer to use tilix terminal with [Thayer Bright Tilix Theme](https://github.com/storm119/Tilix-Themes/blob/master/Themes.md)
```
mkdir -p ~/.config/tilix/schemes
wget -qO $HOME"/.config/tilix/schemes/thayer-bright.json" https://git.io/v7QVZ
```

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

* Include images (One day I'll do that. ;-) )
