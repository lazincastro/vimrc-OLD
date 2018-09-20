#!/usr/bin/env python

import subprocess
import os

def update_and_install():
    update = "sudo apt update"
    install = "sudo apt install curl vim exuberant-ctags git ack-grep python-pip python-fontforge terminator zsh zsh-syntax-highlighting zsh-theme-powerlevel9k powerline fonts-powerline golang tree"
    subprocess.call(update.split())
    subprocess.call(install.split())

def oh_my_zsh_install():
    home_dir = os.environ.get('HOME')
    oh_my_zsh ="curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sh -"
    autosuggestions = "git clone https://github.com/zsh-users/zsh-autosuggestions.git " + home_dir + "/.oh-my-zsh/custom/plugins/zsh-autosuggestions-teste"
    highlighting = "git clone https://github.com/zsh-users/zsh-syntax-highlighting.git " + home_dir + "/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting-teste"
    #zshrc_edit = "vi -c '%s/plugins=(\n \sgit\n)/plugins=(\r git \r zsh-autosuggestions \r zsh-syntax-highlighting \r)/' -c ':x' .zshrc"
    #os.system(oh_my_zsh
    #os.system(autosuggestions)
    #os.system(zshrc_edit)
    #print zshrc_edit
    #print zshrc_edit.split()
    #subprocess.call([zshrc_edit], shell=True)

update_and_install()
oh_my_zsh_install()
