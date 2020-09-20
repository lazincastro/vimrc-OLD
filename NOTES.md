# NOTES                          

## LIST OF COMMANDS
```
  F8      - Toggle gitgutter
  F9      - Open all Buffer in Vertical Split
  F10     - Open all Buffer in Tab
  CTRL-p  - Search with fzf.vim
  ,f      - Search with grep.vim
  ,r      - Search a word on directory
  ,wr     - Search a cursor word in many files
  ,y      - List commands from history
  ,b      - List buffer
  ,space  - Toggle line numbe and trailing spaces
  ,ev     - Open vimrc file
  ,.      - Set current work directory
  ,sh     - Open terminal
  ,h      - Split horizontal
  ,v      - Split vertical
  Zz      - Zoom split window
  Zo      - Zoom out split window
```

## GLUE THE OUTPUT COMMAND INSIDE VIM
    :.!<BASH-COMMAND>

## COPY AND REPLACE WORD
    yanking a word, then go to replace :%s/
    and press CTRL-r, then press " 

## CLOSE WINDOW
    CTRL-w q

## K8s Commands
### Activate completion (add at .bashrc)
    source <(kubectl completion bash)
    alias k=kubectl
    complete -F __start_kubectl k
### Run pod
    k run --image=nginx nginx
### Get pods
    k get pods
### Create a Pod template
    k run my-nginx --image=nginx --dry-run=client -o yaml > pod-template.yaml
### Create a Deploy template
    k create deployment my-nginx --image=nginx --dry-run=client -o yaml > deployment-template.yaml
### Expose Pod
    k expose pod my-nginx
