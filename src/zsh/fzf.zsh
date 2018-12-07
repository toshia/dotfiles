#! /bin/zsh

function history-search-fzf() {
    BUFFER=$(history -nr 1 | fzf-tmux --no-sort +m)
    CURSOR=$#BUFFER
}
zle -N history-search-fzf
bindkey '^r' history-search-fzf
