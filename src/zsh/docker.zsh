#! /bin/zsh

function docker-containers(){
    docker ps --format "{{.Names}}"
}

alias de="docker exec -it \$(docker-containers | fzf-tmux)"
alias da="docker attach \$(docker-containers | fzf-tmux)"
alias dk="docker kill \$(docker-containers | fzf-tmux)"
