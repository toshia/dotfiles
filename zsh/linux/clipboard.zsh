#! /bin/zsh

x-copy-region-as-kill () {
  zle copy-region-as-kill
  print -rn $CUTBUFFER | xclip -i
}
zle -N x-copy-region-as-kill
x-kill-region () {
  zle kill-region
  print -rn $CUTBUFFER | xclip -i
}
zle -N x-kill-region
x-yank () {
  CUTBUFFER=$(xclip -o)
  zle yank
}
zle -N x-yank
bindkey -e '\eW' x-copy-region-as-kill
bindkey -e '^W' x-kill-region
bindkey -e '^Y' x-yank
 
